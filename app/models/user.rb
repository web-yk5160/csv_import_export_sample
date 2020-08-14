class User < ApplicationRecord
  # 受け取るパラメータを指定
  CSV_COLUMNS = %w[name age height].freeze

  # # クラスメソッド import_csv を作成
  # def self.import_csv(file:)
  #   # トランザクション（CSVインポートの途中でエラーが出た場合はロールバック）
  #   User.transaction do
  #     CSV.foreach(file.path, headers: true) do |row|
  #       # インポートするカラムを制限
  #       create!(row.to_h.slice(*CSV_COLUMNS))
  #     end
  #   end
  # end

  def self.import_csv(file:)
    list = []
    CSV.foreach(file.path, headers: true) do |row|
      list << row.to_h.slice(*CSV_COLUMNS)
    end
    User.import!(list)
  end

  # Rails 6 のinsert_all を利用
  # def self.import_csv(file:)
  #   now = Time.current
  #   timestamp_attributes = { created_at: now, updated_at: now }

  #   list = []
  #   CSV.foreach(file.path, headers: true) do |row|
  #     list << row.to_h.slice(*CSV_COLUMNS).merge(timestamp_attributes)
  #   end
  #   User.insert_all(list)
  # end
end
