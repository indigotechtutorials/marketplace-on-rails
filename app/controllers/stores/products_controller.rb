module Stores
  class ProductsController < ApplicationController
    before_action :set_store
    before_action :set_product, only: %i[ show edit update destroy ]

    # GET /products or /products.json
    def index
      @products = @store.products.all
    end

    # GET /products/1 or /products/1.json
    def show
    end

    # GET /products/new
    def new
      @product = @store.products.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products or /products.json
    def create
      @product = @store.products.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: "Product was successfully updated." }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1 or /products/1.json
    def destroy
      @product.destroy!

      respond_to do |format|
        format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_store
        @store = Current.user.stores.find(params[:store_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = @store.products.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.expect(product: [ :name, :description, :price, images: [] ])
      end
  end
end