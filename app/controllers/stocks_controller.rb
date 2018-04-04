class StocksController < ApplicationController

    def search
        if params[:stock].blank?
            flash.now[:danger] = "You have entered an empty search string"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            # Om den inte hittar stock skrivs nedan felmeddelande.
            flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
        end
        # Renderar partials vid alla tre cases.
        respond_to do |format|
            format.js { render partial: 'users/result' }
        end
    end

end