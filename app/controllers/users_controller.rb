class UsersController < ApplicationController

    def my_portfolio
        # För authenticering och kunna hantera en användares stocks.
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def my_friends

    end

end