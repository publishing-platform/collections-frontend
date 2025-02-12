class ApplicationController < ActionController::Base
  before_action :set_expiry

private

  def set_expiry(duration = 5.minutes, public_cache: true)
    unless Rails.env.development?
      expires_in(duration, public: public_cache)
    end
  end

  def error_403
    error 403
  end

  def error_404
    error 404
  end

  def error_410
    error 410
  end

  def error_503(exception)
    error(503, exception)
  end

  def error(status_code, exception = nil)
    PublishingPlatformError.notify(exception) if exception
    render status: status_code, plain: "#{status_code} error"
  end
end
