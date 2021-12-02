class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  def index
    @groups = Group.where(user_id: current_user.id)
    @user = current_user
    @expenses = @user.expenses_sum_user   
  end

  def show; end

  def new
    @group = Group.new     
    @icons = ['House', 'Food', 'Investment']   
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: "Category created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :icon, :user_id)
    end
end
