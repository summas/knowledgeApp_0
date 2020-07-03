# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SiteConfig.create(id: 1, title: 'ナレッジサイト', subtitle: '情報共有システム', style: 'gray')
Category.create(id: 1, name: '技術情報')
DisclosureRange.create(id: 1, name: '外部公開')
DisclosureRange.create(id: 2, name: '非公開')
DisclosureRange.create(id: 3, name: '管理者のみ')
