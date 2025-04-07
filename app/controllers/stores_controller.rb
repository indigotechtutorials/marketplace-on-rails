class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores or /stores.json
  def index
    @stores = Current.user.stores
  end

  # GET /stores/1 or /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Current.user.stores.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores or /stores.json
  def create
    @store = Current.user.stores.new(store_params)

    respond_to do |format|
      if @store.save
        redirect_to @store, notice: "Store was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        redirect_to @store, notice: "Store was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy!

    respond_to do |format|
      format.html { redirect_to stores_path, status: :see_other, notice: "Store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Current.user.stores.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.expect(store: [ :name, :description, :banner_image ])
    end
end
