class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  def translator
    @text = Text.new
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @translate
    @uploaded_text = ''
    translation_map = []
  end
  
  def translate
    primary_key_location = 0
    foriegn_key_location = 0
    # These loop through the column names and find the location of the matching key value pairs
    params[:text][:primary].split(/\r\n/).first.split(',').each_with_index do |primary_column_name, index1|
      params[:text][:foreign].split(/\r\n/).first.split(/, |,/).each_with_index do |foriegn_column_name, index2|
        puts foriegn_column_name.length
        puts foriegn_column_name
        if foriegn_column_name == primary_column_name
          primary_key_location = index1
          foriegn_key_location = index2
        end
      end
    end

    puts primary_key_location
    puts foriegn_key_location
    puts params[:text][:primary][0]

    # Need to order the primary text so it is easier to change it up
    params[:text][:primary].each_line do |p_line|
      params[:text][:foreign].each_line do |f_line|

      end
      
      puts p_line
    end
    @primary = params[:text][:primary]
    @foreign = params[:text][:foriegn]
    orderindex = 1
    params[:text][:primary].split(/, |,/).sort do |x,y|
      if (orderindex != 1)
        puts 'yo'
        # x.split(',')[primary_key_location] <=> y.split(',')[primary_key_location]}
      else
        orderindex += 1
      end
    end
    puts 'printing a'
    puts a
    puts 'translasdsadate'
  end
    
  # GET /texts/new
  def new
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to texts_url, notice: 'Text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:title, :content, :description)
    end
end