class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_layout
  
    protected
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :auth, :organization, :aicon])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :auth, :organization, :aicon])
      end

      def set_layout
        @auths = Auth::MATRIX
        @articleconfig = SiteConfig.find 1
        @categories = Category.all
      end

      def article_no_category(disclosure_ranges, groups)
        Article.where(disclosureRange_id: disclosure_ranges)
               .where(group_id: groups)
               .or(Article.where(disclosureRange_id: DisclosureRangeList::PUBLIC)) # ログインアカウントに所属しないグループの外部公開の記事は表示させる（編集は不可）
               .order('created_at desc')
               .with_rich_text_content
      end

      def article_category_0(disclosure_ranges, groups)
        Article.where(disclosureRange_id: disclosure_ranges)
               .where(group_id: groups)
               .order('created_at desc')
               .with_rich_text_content
      end

      def article_with_category(disclosure_ranges, groups, category_id)
        Article.where(disclosureRange_id: disclosure_ranges)
               .where(group_id: groups)
               .where(category_id: category_id)
               .order('created_at desc')
               .with_rich_text_content
      end

      def get_disclosure_ranges_groups(group_id)
        disclosure_ranges = DisclosureRangeList::PUBLIC
        groups = group_id if group_id
        if account_signed_in?
          re_obj = get_disclosure_ranges_groups_fung(group_id)
          disclosure_ranges = re_obj[0]
          groups = re_obj[1]
          # if current_account.auth == Auth::ADMIN
          #   disclosure_ranges = DisclosureRange.pluck('id')
          #   groups = Group.all.pluck('id') unless group_id
          # else
          #   disclosure_ranges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN).pluck('id')
          #   groups = GroupRelation.where(account_id: current_account.id)
          #                         .pluck('group_id') unless group_id
          # end
          # session[:account_groups] = groups
        else
          groups = Group.all.pluck('id') unless group_id
        end
        [disclosure_ranges, groups]
      end

      def get_disclosure_ranges_groups_fung(group_id)
        if current_account.auth == Auth::ADMIN
          disclosure_ranges = DisclosureRange.pluck('id')
          groups = Group.all.pluck('id') unless group_id
        else
          disclosure_ranges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN).pluck('id')
          groups = GroupRelation.where(account_id: current_account.id).pluck('group_id') unless group_id
        end
        [disclosure_ranges, groups]
      end
end
