class CustomersController < ApplicationController
  def index
    @customers =
      if params[:keywords].present?
        @keywords = params[:keywords]
        search_term = CustomerSearchTerm.new(@keywords)
        Customer.where(search_term.where_clause, search_term.where_args)
                .order(search_term.order)
      else
        []
      end
  end
end
