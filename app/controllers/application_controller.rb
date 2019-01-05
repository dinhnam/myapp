class ApplicationController < ActionController::Base
  include SessionsHelper
  include CommentsHelper
  before_action :set_locale
  before_action :set_categories
  before_action :set_notices
  before_action :set_countries
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_categories
    @categories = Category.all
  end

  def set_notices
    @notices = Notice.all
  end

  def set_countries
    @countries = Country.all
  end

end
