class SpeechesController < ApplicationController
    before_action :set_speech, only: [:show, :destroy]

  def index
    @speeches = Speech.all
  end

  def show
  end

  def new
    @speech = Speech.new
  end

  def create
    @speech = Speech.new(params_speech)
    @speech.user = current_user
    if @speech.save
      redirect_to speech_path(@speech)
    else
      render 'new'
    end
  end

  private

  def set_speech
    @speech = Speech.find(params[:id])
  end

  def params_speech
    params.require(:speech).permit(:description, :length_max, :url)
  end
end