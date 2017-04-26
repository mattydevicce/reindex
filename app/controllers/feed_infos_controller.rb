class FeedInfosController < ApplicationController
  before_action :set_feed_info, only: [:show, :edit, :update, :destroy]

  # GET /feed_infos
  # GET /feed_infos.json
  def index
    @feed_infos = FeedInfo.all
  end

  # GET /feed_infos/1
  # GET /feed_infos/1.json
  def show
  end

  # GET /feed_infos/new
  def new
    @feed_info = FeedInfo.new
  end

  # GET /feed_infos/1/edit
  def edit
  end

  # POST /feed_infos
  # POST /feed_infos.json
  def create
    @feed_info = FeedInfo.new(feed_info_params)

    respond_to do |format|
      if @feed_info.save
        format.html { redirect_to @feed_info, notice: 'Feed info was successfully created.' }
        format.json { render :show, status: :created, location: @feed_info }
      else
        format.html { render :new }
        format.json { render json: @feed_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_infos/1
  # PATCH/PUT /feed_infos/1.json
  def update
    respond_to do |format|
      if @feed_info.update(feed_info_params)
        format.html { redirect_to @feed_info, notice: 'Feed info was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed_info }
      else
        format.html { render :edit }
        format.json { render json: @feed_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_infos/1
  # DELETE /feed_infos/1.json
  def destroy
    @feed_info.destroy
    respond_to do |format|
      format.html { redirect_to feed_infos_url, notice: 'Feed info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_info
      @feed_info = FeedInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_info_params
      params.require(:feed_info).permit(:feed_publisher_name, :feed_publisher_url, :feed_timezone, :feed_lang, :feed_version)
    end
end
