class Sso::PingoneController < ApplicationController
  
  def create
    if Rails.env.development?
      if pingone && partner && sso_user
        sign_in(sso_user.user)
        redirect_to root_path
      else
        redirect_to sso_pingone_error_path
      end
    else
      redirect_to sso_pingone_error_path
    end
  rescue Exception => ex
    logger.error(ex.message, ex.backtrace)
    notify_honeybadger(ex) if defined? Honeybadger
    redirect_to sso_pingone_error_path
  end
 
  def error
  end
 
  private
 
  def pingone
    @pingone ||= SSO::PingoneWebservice.new(params[:tokenid])
  end
 
  def partner
    @partner ||= Partner.find_by_private_key_and_sso_enabled(pingone.idp_id, true)
  end
 
  def sso_user
    @sso_user ||= SsoUser.where(partner_id: partner.id, sso_identifier: pingone.sso_id).first
  end
 
end