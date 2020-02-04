class ShopsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @shop = Shop.new
  end

	def create
		@shop = Shop.new(shop_params)
		if @shop.save
			redirect_to shops_path(@shop), notice: "「#{@shop.name}」を登録しました。"
		else
			render :new
		end
  end

  def edit
	end

	private

	def shop_params
		params.require(:shop).permit(:name, :address, :map, :image_1, :image_2, :image_3)
	end
end
