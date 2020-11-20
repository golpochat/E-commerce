class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:stockview, :add_stock, :destroy, :create, :edit, :new, :update]
  before_action :admin_user, only: [:stockview, :add_stock, :destroy, :create, :edit, :new, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :add_stock]
  before_action :set_category, only: [:index, :search]
  
  
  # GET /items
  # GET /items.json
  def index
    #Checks if there is a category to filter by to decide whether to filter
    if params[:category_filter].nil? || params[:category_filter] == "All"
      @items = Item.all.paginate(:page => params[:page], per_page: 9)
    else
      @filter = params[:category_filter]
      @items = Item.all.where(category: @filter).paginate(:page => params[:page], per_page: 9)
    end
    #Depending on the order type it called and sorts by the type
    if params[:sortype] == "expensive"
      expensive
    elsif params[:sortype] == "cheapest"
      cheapest
    elsif params[:sortype] == "bestrated"
      bestrated
    elsif params[:sortype] == "lowestrated"
      lowestrated
    end
  end
  
  #Renders the stock view with paginations
  def stockview
    @items = Item.all.paginate(:page => params[:page], per_page: 10)
    render action: :stock
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @review = Review.new
    @review.item_id = @item.id
  end
  
  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end
  
  #Adds stock to current stock and refreshs current page
  def add_stock
    @item.stock += params[:stock].to_i
    @item.save
    flash[:success] = "Stock updated"
    redirect_back(fallback_location: root_path)
  end

  # POST /items
  # POST /items.json
  #Creates an item with the inputted values
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  #Updates the item (book) with given values
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Following four methods use methods definded in the model to sort the books
  def expensive
    @items = @items.expensive
  end

  def cheapest
    @items = @items.cheapest
  end

  def bestrated
    @items = @items.bestrated
  end

  def lowestrated
    @items = @items.lowestrated
  end

  # DELETE /items/1
  # DELETE /items/1.json
  # Deletes the select item
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #Searches & Displays items in the database with titles containing letters passed
  def search
    @search_criteria =""
    if params[:q].eql? ""
      @search_criteria ="All"
      @items = Item.all.paginate(:page => params[:page], per_page: 9)
    else
      @st = "%#{params[:q]}%"
      @search_criteria = params[:q]
      @items = Item.where("LOWER(title) LIKE ?", @st.downcase).paginate(:page => params[:page], per_page: 9)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
    
    def set_category
      @categories = Category.all
    end
    
    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :author, :description, :price, :image_url, :category, :stock)
    end
    
    # Checks that the user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Checks if the user to an admin or redirects to home page
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
