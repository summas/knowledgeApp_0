class Util

  def get_category_hash(categories)
    matrix = []
    categories.each do |category|
      matrix.push([category.name, category.id.to_s])
    end
    matrix
  end

  def get_group_hash(groups)
    matrix = {}
    groups.each do |group|
     # matrix.[group.id.to_s] = group.name
     matrix.store(group.id.to_s, group.name)
    end
    matrix
  end
end