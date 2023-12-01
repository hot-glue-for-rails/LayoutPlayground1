class ThingsController < ApplicationController
  # regenerate this controller with
  # bin/rails generate hot_glue:scaffold Thing --gd

  helper :hot_glue
  include HotGlue::ControllerHelper

  
  before_action :load_thing, only: [:show, :edit, :update, :destroy]
  after_action -> { flash.discard }, if: -> { request.format.symbol == :turbo_stream }
  
  
  def load_thing
    @thing = Thing.find(params[:id])
  end
  
  def load_all_things 
    @things = Thing.includes(:user).page(params[:page])
    
  end

  def index
    load_all_things
  end

  def new
    @thing = Thing.new(user: current_user)
    
  end

  def create
    modified_params = modify_date_inputs_on_params(thing_params.dup, nil, [:concieved_of_at, :eee]) 
    modified_params = modified_params.merge(user: current_user) 

      
    
    @thing = Thing.new(modified_params)
    
    

    if @thing.save
      flash[:notice] = "Successfully created #{@thing.name}"
      
      load_all_things
      render :create
    else
      flash[:alert] = "Oops, your thing could not be created. #{@hawk_alarm}"
      @action = "new"
      render :create, status: :unprocessable_entity
    end
  end



  def show
    redirect_to edit_thing_path(@thing)
  end

  def edit
    @action = "edit"
    render :edit
  end

  def update
    flash[:notice] = +''
    flash[:alert] = nil
    

    modified_params = modify_date_inputs_on_params(update_thing_params.dup, nil, [:concieved_of_at, :eee]) 
    modified_params = modified_params.merge(user: current_user) 
    

    
      
    
    if @thing.update(modified_params)
    
      
      flash[:notice] << "Saved #{@thing.name}"
      flash[:alert] = @hawk_alarm if @hawk_alarm
      render :update
    else
      flash[:alert] = "Thing could not be saved. #{@hawk_alarm}"
      @action = "edit"
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    
    begin
      @thing.destroy
      flash[:notice] = 'Thing successfully deleted'
    rescue StandardError => e
      flash[:alert] = 'Thing could not be deleted'
    end 
    load_all_things
  end



  def thing_params
    params.require(:thing).permit(:name, :description, :executed_on, :concieved_of_at, :will_be_at, :persona, :forecast, :user_id, :when_at, :background_details, :expected_result, :will_call, :amount, :aaa, :bbb, :ccc, :ddd, :eee)
  end

  def update_thing_params
    params.require(:thing).permit(:name, :description, :executed_on, :concieved_of_at, :will_be_at, :persona, :forecast, :user_id, :when_at, :background_details, :expected_result, :will_call, :amount, :aaa, :bbb, :ccc, :ddd, :eee)
  end

  def namespace
    
  end
end


