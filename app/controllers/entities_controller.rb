class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :set_group, only: %i[new edit create index]

  def index
    @entities = @group.entities.order(created_at: :desc)
    @expenses_group = @group.entities.sum(:amount)
  end

  def show; end

  def new
    @entity = Entity.new
  end

  def edit; end

  def create
    @entity = @group.entities.create(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_entities_path, notice: 'Transaction created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to group_entities_path, notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to group_entities_path, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount).merge(user_id: current_user.id)
  end
end
