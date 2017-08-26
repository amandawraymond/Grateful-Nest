class ListItemsController < ApplicationController

  before_filter :load_item
  before_filter :load_list, only: [:create]

  
  def create 
    ListItem.transaction do 
        item = ListItem.new()
        @item = item
        item.original_text = params[:item][:original_text]
        item.save!
    end

    respond_with @item do |format|
        format.json {render json: @item.to_json}
    end
  end

  def show
    respond_with @item do |format|
      format.json {render :json => @item.to_json}
    end
  end

  def destroy
    @item.destroy
    if @item.deleted?
      respond_with @item, status: :ok  
    else
      respond_with @item, status: :unprocessable_entity
    end
  end

  def update
    @item.original_text = params[:item][:original_text]      
    success = @item.save
    
    if success
      respond_with @item, status: :ok  
    else
      respond_with @item, status: :unprocessable_entity
    end
  end

    private

    def load_item
        @item = ListItem.find(params[:id])
    end

    def load_list
        @list = List.find(params[:list_id])
    end
end
