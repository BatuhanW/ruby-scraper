module V1
  # Indexes given URL and lists indexes.
  class IndexesController < ApplicationController
    before_action :set_params, only: [:create]

    def index
      render json: Index.all
    end

    def create
      @index = Index.new(@index_params)

      if @index.save
        render json: @index, status: :created
      else
        render json: @index, status: :unprocessable_entity
      end
    end

    private

    def set_params
      @index_params = params.permit(:url)
    end
  end
end
