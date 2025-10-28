# frozen_string_literal: true

module App
  class EventsController < AppController
    before_action :find_event, only: %i[ show edit update ]

    def index
      @events = Event.all
    end

    def show
      @record = @event
      @layout = @event.page_layout
    end

    def new
      @event = Event.new
      render CreateUpdateModalComponent.new(record: @event, url: app_new_event_path)
    end

    def edit; end

    def create
      @event = Event.new(event_params)
      @event.created_by = current_user

      if @event.save
        flash[:notice] = "Evenement : #{@event.title}, créé avec succès."
        redirect_to app_event_path(@event)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @event.update(event_params)
        flash[:notice] = "Evenement : #{@event.title}, modifié avec succès."
        redirect_to app_event_path(@event)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.expect(event: %i[ title description date address latitude longitude ])
    end
  end
end
