class FlowsController < ApplicationController
  layout "flows"

  def results
    attendee_results = Attendee.search(term_params).includes(:tickets)
    ticket_results = Ticket.search(term_params)

    attendee_ticket_ids = attendee_results.map { |a| a.ticket_ids }.flatten if attendee_results
    ticket_ids = (attendee_ticket_ids + ticket_results.map(&:id)).compact.uniq

    ticket_ids.empty? ? @tickets = [] : @tickets = Ticket.find(ticket_ids)
  end

  def confirmation
    @ticket = Ticket.find(params[:ticket_id])
  end

  def register
    @ticket = Ticket.find(params[:ticket_id])

    unless @ticket.registered?
      flash[:notice] = "#{@ticket.first_name} #{@ticket.last_name} has been registered."
      @ticket.register!
      redirect_to flows_path
    else
      flash[:notice] = "#{@ticket.first_name} #{@ticket.last_name} was already registered."
      redirect_to flows_path
    end
  end
  
  private
  
  def term_params
    params.require(:term) unless params[:term].empty?
  end

end
