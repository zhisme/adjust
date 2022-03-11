# frozen_string_literal: true

class RepositoriesController < ApplicationController
  attr_reader :repositories
  helper_method :repositories

  def index
    @repositories = []

    @repositories = Repositories::Repository.new(params).all if params[:q].present?
  end
end
