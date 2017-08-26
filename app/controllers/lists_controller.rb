class ListsController < ApplicationController
  respond_to :json
  
  def create
    @list = List.new    
    success = @list.save
    
    if success
      respond_with @list, status: :ok  
    else
      respond_with @list, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    respond_with @list
  end

  def index
    @lists = List.with_items
    respond_with @lists
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    if @list.deleted?
      respond_with @list, status: :ok  
    else
      respond_with @list, status: :unprocessable_entity
    end
  end
end
