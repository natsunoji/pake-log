class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = current_user.items.ransack(params[:q])
    @items = @q.result(distinct: true)
                # 修正箇所：item_images ではなく images_attachments と images_blobs を読み込む
                .includes(:category, images_attachments: :blob)
                .order(created_at: :desc)
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def new
    @item = current_user.items.build
  end

  def create
      @item = current_user.items.build(item_params)

      if @item.save
        # 保存成功！
        # redirect_to ではなく render を使う場合は、
        # respond_to で「HTMLでもTurboでもこの画面を出して」と明示するのが一番確実です。
        respond_to do |format|
          format.all { render :create, status: :created, formats: :html }
        end
      else
        # 失敗時は今のままで100点満点です！
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.turbo_stream {
            render turbo_stream: turbo_stream.replace("item_error_messages",
                  partial: "shared/error_messages", locals: { model: @item })
          }
        end
      end
    end

  private

  def item_params
    # item_images_attributes を削除し、images: [] を追加
    params.require(:item).permit(
      :name,
      :category_id,
      :memo,
      images: []
    )
  end
end
