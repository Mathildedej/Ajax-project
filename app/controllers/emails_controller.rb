class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def create
    @email = Email.create(object: Faker::Marketing.buzzwords ,body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false))
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
