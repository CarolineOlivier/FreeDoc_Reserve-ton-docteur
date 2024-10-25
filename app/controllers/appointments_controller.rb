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
    # Crée un nouvel objet Appointment avec les paramètres fournis par le formulaire
    @appointment = Appointment.new(appointment_params)

    # Associe l'ID du docteur au rendez-vous, en récupérant la valeur passée dans les paramètres de la requête
    @appointment.doctor_id = params[:doctor_id]

    # Associe l'ID de la spécialité au rendez-vous, en récupérant la valeur passée dans les paramètres de la requête
    @appointment.specialty_id = params[:specialty_id]

    # Tente de sauvegarder le rendez-vous dans la base de données
    if @appointment.save
      # Si la sauvegarde réussit, redirige l'utilisateur vers la page du docteur et affiche un message de confirmation
      redirect_to doctor_path(@appointment.doctor), notice: "Rendez-vous validé."
    else
      # Si la sauvegarde échoue, récupère à nouveau les informations sur le docteur et la spécialité
      @doctor = Doctor.find_by(id: params[:doctor_id])
      @specialty = Specialty.find_by(id: params[:specialty_id])

      # Affiche à nouveau le formulaire de création de rendez-vous pour que l'utilisateur puisse corriger les erreurs
      render :new
    end
  end

  private

  # Méthode pour filtrer les paramètres du rendez-vous, seuls les champs spécifiés sont autorisés
  def appointment_params
    params.require(:appointment).permit(:date, :patient_id)
  end
end
