require 'httparty'
class CurrenciesController < ApplicationController
  # include HTTParty
  def curr
    currency_api
    render json: @res
  end
  def index
    currency_api
    countries
  end

  def currency_api
    response = HTTParty.get("https://currencyapi.net/api/v1/rates?key=demo")

    data=JSON.parse response.body
    @results = data["rates"]


    end
    # @res=results.map do |result|
    #   {
    #       currency: result
    #
    #   }
    #
    #
    #
    #  end
    # render json: @res
  # end

  def countries
    @res = []
    @results.map do |key,val|
      case key
      when "AED"
        key = "United Arab Emirates Dirham"
        @res<<{country: key,
               curr: val
        }
      when "AFN"
        key = "Afghanistan Afghani"
        @res<<{
            country: key,
            curr: val
        }
      end
    end
      end
  end


