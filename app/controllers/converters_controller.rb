class ConvertersController < ApplicationController
  def index
    @converted = Converter.convert(params[:number])
  end
end