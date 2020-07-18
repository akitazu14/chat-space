class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new             # @groupに空のインスタンスを代入. form_withで使用するため.
    @group.users << current_user   # グループを新規作成する時はログイン中のユーザーを必ず含めたいためあらかじめ追加
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end

