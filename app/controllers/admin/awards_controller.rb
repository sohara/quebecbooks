class Admin::AwardsController < AdminAreaController
  
  auto_complete_for :award, :award
    
  def index
    list
    render :action => 'list'
  end

  def list
    @award_pages, @awards = paginate :award, :per_page => 10
  end

  def show
    @award = Award.find(params[:id])
  end

  def new
    @award = Award.new
  end

  def create
    @award = Award.new(params[:award])
    if @award.save
      flash[:notice] = 'Award was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @award = Award.find(params[:id])
  end

  def update
    @award = Award.find(params[:id])
    if @award.update_attributes(params[:award])
      flash[:notice] = 'Award was successfully updated.'
      redirect_to :action => 'show', :id => @award
    else
      render :action => 'edit'
    end
  end

  def destroy
    Award.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
