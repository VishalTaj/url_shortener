module Api::Interfaces::ShortenInterface
  extend ActiveSupport::Concern

  def create 
    link = @authorize_token.links.find_or_create_by!(url: params[:long_url])
    render json: link, status: 200
  end

  def show
    link = @authorize_token.links.find_by_id(Link.expand_hash(params[:id]))
    if link.present? 
      render json: link, status: 200
    else
      raise ActiveRecord::RecordNotFound, "URL not found."
    end
  end

  def update
    link = @authorize_token.links.find_by_id(Link.expand_hash(params[:id]))
    if link.present?
      if link.update_attributes(link_params)
        render json: link, status: 200
      else
        render json: {errors: link.errors.full_messages}, status: 422
      end
    else
      raise ActiveRecord::RecordNotFound, "URL not found."
    end
  end
end  