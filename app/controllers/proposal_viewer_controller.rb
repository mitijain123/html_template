class ProposalViewerController < ApplicationController
  include TestAppTemplateData

  before_filter :get_proposal

  def show
    contents = replace_tag("proposal-template/index.html")
    render :text => contents.html_safe
  end

  def get_proposal
    @proposal = Proposal.find(params[:id])
  end
  
end
