class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :destroy]

  def index
    @prototypes = Prototype.order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'    
    end
  end

  def destroy
    @prototype.destroy if @prototype.user_id == current_user.id
    redirect_to :root, notice: 'Prototype was successfully deleted.'
    # .alert.alert-success
  # %a.close{"data-dismiss" => "alert"} ×
  # Prototype was successfully deleted.


  #   .alert.alert-success
  # %a.close{"data-dismiss" => "alert"} ×   data-dismiss="alert"
  
  end

  def show
  end

  def edit
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status],
      tags_attributes: [:tag_list],
      view_tags_attributes: [:prototype_id, :tag_id]
    )
  end
end
