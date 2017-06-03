class TextsController < ApplicationController
  require 'pry'
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  def translator
    puts Text.new
    @text = Text.new
    @target_key
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @translate
    @uploaded_text = ''
    translation_map = []
  end
  
  def translate
    foreign_key_location = 0
    primary_key_location = 0

    @originalx = params[:text][:original]
    # @foreign = params[:text][:foreign]
    @target  = params[:target_key] 

    # These loop through the column names and find the location of the matching key value pairs
    @originalx.split(/\r\n/).first.split(',').each_with_index do |x, index|
      if x.gsub('\'', '').gsub('"', '') == @target
        primary_key_location = index
      end
    end

    @foreign.split(/\r\n/).first.split(',').each_with_index do |x, index|
      if x.gsub('\'', '').gsub('"', '') == @target
        foreign_key_location = index
      end
    end

    # This will organize the primary keys to be put into chronological order
    @originalx = @originalx[0..1] + @originalx.split(/\r\n/)[1..-1].sort do |x,y|
      x.split(',')[primary_key_location].gsub('\'', '').to_i <=> y.split(',')[primary_key_location].gsub('\'', '').to_i
    end

    @originalx = @originalx.map.with_index do |p_line, primary_index|
      x_index = p_line.split(',')[primary_key_location].gsub('\'', '').to_i
      if (primary_index+1) != x_index
        @foreign = @foreign.split(/\r?\n/).map.with_index{ |f_line, foreign_index|
          if f_line.split(',')[foreign_key_location].gsub('\'', '').to_i == x_index
            f_line = f_line.split(',').map.with_index(0){ |a,b| 
              if b == foreign_key_location
                primary_index+1
              else
                a
              end
            }.join(',')
            f_line
          else
            f_line
          end
        }.join("\n")
        p_line = p_line.split(',').map.with_index{ |a,b|
          if b == primary_key_location
            '\'' + (primary_index + 1).to_s + '\''
          else
            a
          end
        }.join(',')
      else
        p_line
      end
    end
    puts "End result: ================================"
    puts @originalx
    puts @foreign

  end

  def some
    render html: "<strong>Not Found</strong>".html_safe
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