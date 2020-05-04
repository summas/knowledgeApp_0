class Util

  def get_category_hash(categories)
    matrix = []
    categories.each do |category|
      matrix.push([category.name, category.id.to_s])
    end
    matrix
  end

end