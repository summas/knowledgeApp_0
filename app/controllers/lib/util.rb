class Util

  #modelのidとnameでselectタグで使える形の配列を作る。
  def get_model_hash(models)
    matrix = []
    models.each do |model|
      matrix.push([model.name, model.id])
    end
    matrix
  end

  #未使用、使わないのなら削除
  def get_group_hash(groups)
    matrix = {}
    groups.each do |group|
     # matrix.[group.id.to_s] = group.name
     matrix.store(group.id.to_s, group.name)
    end
    matrix
  end
end