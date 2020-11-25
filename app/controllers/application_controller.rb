class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def record_not_unique(message)
    render json: {
      'errors': [
        {
          'status': '400',
          'title': message
        }
      ]
    }, status: 400
  end

  def verify_author
    unless Article.find(params[:id]).user_id == current_user.id
      render json: {
      'errors': [
        {
          'status': '403',
          'message': 'Interdit de toucher aux articles des autres !'
        }
      ]
    }, status: 403
    end
  end

end
