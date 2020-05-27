class EmailsController < ApplicationController
  def index
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(word_count: 3),body: Faker::Lorem.sentence )
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
