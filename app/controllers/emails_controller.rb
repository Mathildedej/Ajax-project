class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.read = true;
    puts" $"*20;
    puts @email.read;
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def create
    @email = Email.new(object: Faker::Marketing.buzzwords ,body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), read: false)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      redirect_to root_path, flash: { error: 'Email not saved'}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.toggle(:read).save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

end
