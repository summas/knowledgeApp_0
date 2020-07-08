module Auth
  VIEW = '1'.freeze
  EDIT = '3'.freeze
  ADMIN = '9'.freeze

  MATRIX = {
    '1' => '閲覧のみ',
    '3' => '編集',
    '9' => '管理者'
  }.freeze
end

module AuthSelect
  ADMIN = {
    '閲覧のみ' => '1',
    '編集' => '3',
    '管理者' => '9'
  }.freeze

  EDIT = {
    '閲覧のみ' => '1',
    '編集' => '3'
  }.freeze
end

module DisclosureRangeList
  PUBLIC = '1'.freeze
  PRIVATE = '2'.freeze
  ADMIN = '3'.freeze
end

module DelFlg
  STOP = 1
  USE = 0

  MATRIX = {
    1 => '使用停止',
    0 => '使用中'
  }.freeze
end

