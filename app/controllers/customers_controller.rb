class CustomersController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = params[:page].to_i
    @customers =
      if params[:keywords].present?
        @keywords = params[:keywords]
        search_term = CustomerSearchTerm.new(@keywords)
        Customer.where(search_term.where_clause, search_term.where_args)
                .order(search_term.order)
                .offset(PAGE_SIZE * @page)
                .limit(PAGE_SIZE)
      else
        []
      end
  end
end
