class ShortenController < ApplicationController
  def show
    @link = Link.find_by_id(Link.expand_hash(params[:id]))
    if @link.nil? || (@link.present? && !@link.active)
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
