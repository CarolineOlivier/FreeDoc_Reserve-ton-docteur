# app/controllers/appointments_controller.rb
class AppointmentsController < ApplicationController
  def new
    # Recherche du docteur avec l'ID fourni dans les paramètres
    @doctor = Doctor.find_by(id: params[:doctor_id])
    # Recherche de la spécialité avec l'ID fourni dans les paramètres
    @specialty = Specialty.find_by(id: params[:specialty_id])

    # Vérification si le docteur ou la spécialité n'existent pas
    if @doctor.nil? || @specialty.nil?
      # Redirige vers la liste des docteurs avec un message d'alerte
      redirect_to doctors_path, alert: "Le docteur ou la spécialité sélectionnée n'existe pas."
      return # Arrête l'exécution du reste de l'action
    end

    # Initialise un nouvel objet de rendez-vous
    @appointment = Appointment.new
  end

  def create
    # Récupère le docteur et la spécialité avant d'initialiser le rendez-vous
    @doctor = Doctor.find_by(id: params[:doctor_id])
    @specialty = Specialty.find_by(id: params[:specialty_id])
  
    # Crée un nouvel objet Appointment avec les paramètres fournis par le formulaire
    @appointment = Appointment.new(appointment_params)
  
    # Associe l'ID du docteur au rendez-vous
    @appointment.doctor_id = params[:doctor_id]
  
    # Associe l'ID de la spécialité au rendez-vous
    @appointment.specialty_id = params[:specialty_id]
  
    # Associe l'ID de la ville du rendez-vous à celle du docteur
    @appointment.city_id = @doctor.city_id if @doctor
  
    # Tente de sauvegarder le rendez-vous dans la base de données
    if @appointment.save
      # Si la sauvegarde réussit, redirige l'utilisateur vers la page du docteur et affiche un message de confirmation
      redirect_to doctor_path(@appointment.doctor), notice: "Rendez-vous validé."
    else
      # Si la sauvegarde échoue, réaffiche le formulaire
      render :new
    end
  end
  

  private

  # Méthode pour filtrer les paramètres du rendez-vous, seuls les champs spécifiés sont autorisés
  def appointment_params
    params.require(:appointment).permit(:date, :patient_id)
  end
end
