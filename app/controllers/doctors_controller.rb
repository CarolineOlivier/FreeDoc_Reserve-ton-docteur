class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.distinct # Récupère tous les docteurs de manière unique pour éviter les doublons
  end

  def show
    @doctor = Doctor.find(params[:id]) # Récupère un docteur spécifique par son ID
    @specialties = @doctor.specialties # Récupère les spécialités associées à ce docteur
  end
end


