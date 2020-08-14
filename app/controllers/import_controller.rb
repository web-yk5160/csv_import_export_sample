class ImportController < ApplicationController
  def create
    # クラスメソッド import_csv を呼び出す形式に変更
    User.import_csv(file: params[:file]) if params[:file].present?
    redirect_to users_path
  end
end
