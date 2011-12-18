# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def client_name
    @proposal.client.name
  end

  def proposal_name
    @proposal.name
  end

  def proposal_send_date
    @proposal.send_date.to_s
  end

  def proposal_user_name
    @proposal.user_name
  end

  def client_company
    @proposal.client.company
  end

  def client_website
    @proposal.client.website
  end

  def section_header(proposal_section_id)
    Rails.logger.info("-------#{proposal_section_id.inspect}-----")
    @proposal.proposal_sections[proposal_section_id].name
  end

  def section_content(proposal_section_id)
    @proposal.proposal_sections[proposal_section_id].description
  end
end
