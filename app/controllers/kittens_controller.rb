class KittensController < ApplicationController

  def index
  @kitten = Kitten.all
  respond_to do |format|
  format.html
  format.json { render json: @kitten }
  end
end

  def new
   @kitten = Kitten.new
  end

def create
  @kitten = Kitten.new(kitten_params)
  if @kitten.save
     flash[:success] = "Kitten has been created"
    redirect_to @kitten
  else
    flash[:success] = "Kitten could not be saved"
    render 'new'
  end
end

def show
  @kitten = Kitten.find(params[:id])
  respond_to do |format|
  format.html
  format.json { render json: @kitten }
  end
end



  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
@kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
       flash[:success] = "Kitten has been sucessfully updated"
			redirect_to @kitten
		else
      flash[:success] = "Kitten could not be updated"
			render 'edit'
	  end

  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten was sucessfully deleted"
  		redirect_to root_path
  end


  private


  	def kitten_params
  		params.require(:kitten).permit(:name, :age, :cuteness,:softness)
  	end



end
