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

    # Crée un nouvel objet de rendez-vous avec les paramètres fournis
    @appointment = Appointment.new(appointment_params)
    # Associe le rendez-vous au docteur sélectionné
    @appointment.doctor_id = @doctor.id
    # Associe le rendez-vous à la spécialité sélectionnée
    @appointment.specialty_id = @specialty.id

    # Sauvegarde le rendez-vous en base de données
    if @appointment.save
      # Si la sauvegarde réussit, redirige vers la page du docteur avec un message de confirmation
      redirect_to doctor_path(@appointment.doctor), notice: "Rendez-vous validé."
    else
      # Si la sauvegarde échoue, réaffiche le formulaire de création
      render :new
    end
  end

  private

  # Méthode pour filtrer les paramètres du rendez-vous, seuls les champs spécifiés sont autorisés
  def appointment_params
    params.require(:appointment).permit(:date, :patient_id)
  end
end


