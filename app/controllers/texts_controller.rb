class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  def translator
    @text = Text.new
    @primary = "'stop_id','stop_name','stop_lat','stop_lon'
'1','Long Island City','40.74128','-73.95639'
'2','Hunterspoint Avenue','40.74238','-73.94679'
'9','Woodside','40.74584','-73.90297'
'8','Penn Station','40.75058','-73.99358'
'10','Forest Hills','40.71957','-73.84481'
'11','Kew Gardens','40.70964','-73.83089'
'14','East New York','40.6758','-73.90281'
'12','Atlantic Terminal','40.684901','-73.97768'
'13','Nostrand Avenue','40.67838','-73.94822'
'15','Jamaica','40.6996','-73.80853'
'17','Mets-Willets Point','40.75239','-73.8437'
'18','Flushing Main Street','40.75789','-73.83135'"
    @foreign = "'trip_id','arrival_time','departure_time','stop_id','stop_sequence'
'GO204_172','00:01:00','00:01:00','8','1'
'GO204_172','00:13:00','00:13:00','9','2'
'GO204_172','00:18:00','00:18:00','10','3'
'GO204_172','00:20:00','00:20:00','11','4'
'GO204_172','00:24:00','00:26:00','15','5'
'GO204_172','00:41:00','00:41:00','106','6'"
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
    puts params[:text][:foreign]
    # These loop through the column names and find the location of the matching key value pairs
    params[:text][:primary].split(/\r\n/).first.split(',').each_with_index do |primary_column_name, index1|
      params[:text][:foreign].split(/\r\n/).first.split(/, |,/).each_with_index do |foriegn_column_name, index2|
        if foriegn_column_name == primary_column_name
          primary_key_location = index1
          foriegn_key_location = index2
        end
      end
    end
    @primary = params[:text][:primary]
    @foreign = params[:text][:foriegn]

    # This will organize the primary keys to be put into chronological order
    orderindex = 1
    organized = params[:text][:primary].split(/\r\n/)[1..-1].sort do |x,y|
      x.split(',')[primary_key_location].gsub('\'', '').to_i <=> y.split(',')[primary_key_location].gsub('\'', '').to_i
    end
    puts 'holla'
    puts params[:text][:foriegn]
    organized.map.with_index do |x, i|
      x_index = x.split(',')[primary_key_location].gsub('\'', '').to_i
      if (i+1) != x_index
        # params[:text][:foriegn].split(/\r\n/).map do |y|
        #   if y.split(',')[foriegn_key_location] == x_index
        #     puts (y.split(',')[0] = ('\''+(i+1).to_s+'\'')+ params[:text][:primary][params[:text][:primary].split(',')[0].length..-1])  
        #   end
        # end
        (x.split(',')[0] = ('\''+(i+1).to_s+'\'')+ x[x.split(',')[0].length..-1])
      else
        x
      end
    end
    # puts params[:text][:primary]
    puts organized.class



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