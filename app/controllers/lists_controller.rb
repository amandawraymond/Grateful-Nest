class ListsController < ApplicationController
  respond_to :json
  
  def create
    @list = List.new    
    @list.save!
    respond_with @list
  end

  def show
    @list = List.find(params[:id])
    respond_with @list
  end

  def index
    @lists = List.with_items.recent_order
    respond_with @lists
  end

  def update
    @list = List.find(params[:list_id])
    @list.items.build(original_text: params[:original_text] )
    @list.save!
    respond_with @list
  end
end
