class Api::V1::ShortenController < Api::BaseController
  include Api::Interfaces::ShortenInterface


  private

  def link_params
    params.require(:link).permit(:title, :description, :active, :expires_on)
  end
end
  