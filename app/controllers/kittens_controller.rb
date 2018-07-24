class KittensController < ApplicationController

  def index
  @kitten = Kitten.all
  end

  def new
   @kitten = Kitten.new
  end

def create
  if @kitten.new(kitten_params)
    redirect_to @kitten
  else
    render 'new'
  end
end

def show
  @kitten = Kitten.find(params[:id])
end



  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update

    if @kitten.update(kitten_params)
			redirect_to @kitten
		else
			render 'edit'
	   end

  end

  def destroy
    @kitten.destroy
  		redirect_to root_path
  end


  private


  	def kitten_params
  		params.require(:kitten).permit(:name, :age, :cuteness,:softness)
  	end



end
