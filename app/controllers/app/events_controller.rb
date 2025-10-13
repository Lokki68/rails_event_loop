# frozen_string_literal: true

module App
  class EventsController < AppController
    before_action :find_event, only: %i[ show ]

    def index
      @events = Event.all
    end

    def show; end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)

      if @event.save
        redirect_to app_event_path(@event)
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.expect(Event => [ :title, :description, :date, :created_by ])
    end
  end
end
