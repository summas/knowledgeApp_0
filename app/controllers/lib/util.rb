class Util

  #modelのidとnameでselectタグに設定する配列を作成する。
  def get_model_hash(models)
    matrix = []
    models.each do |model|
      matrix.push([model.name, model.id])
    end
    matrix
  end
end