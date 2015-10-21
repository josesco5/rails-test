class MainController < ApplicationController
  def index
    # WebUrl.create(url: "www.google.com")
    @urls = WebUrl.all.order(created_at: :desc)
  end

  def sync
    params[:data].each_with_index do |data, index|
      WebUrl.create(url: data)
    end

    render json: {status: 'OK'}
  end
end
