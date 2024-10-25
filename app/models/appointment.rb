class Appointment < ApplicationRecord
  # Chaque rendez-vous est lié (appartient) à un seul docteur
  belongs_to :doctor
  # Cela ajoute une clé étrangère 'doctor_id' dans la table des rendez-vous

  # Chaque rendez-vous est lié (appartient) à un seul patient
  belongs_to :patient
  # Cela ajoute également une clé étrangère 'patient_id' dans la table des rendez-vous

  # Un rendez-vous appartient à une ville
  belongs_to :city, optional: true
  # La ville est optionnelle pour permettre l'enregistrement sans qu'une ville soit spécifiée manuellement

  # Un rendez-vous est associé à une spécialité
  belongs_to :specialty
  # Cela ajoute une clé étrangère 'specialty_id' dans la table des rendez-vous,
  # indiquant à quelle spécialité le rendez-vous est lié.

  # Validation pour s'assurer que les champs ne sont pas vides
  validates :date, presence: true
  # Vérifie que la date est présente

  validates :doctor_id, presence: true
  # Vérifie que le docteur est présent

  validates :patient_id, presence: true
  # Vérifie que le patient est présent

  validates :specialty_id, presence: true
  # Vérifie que la spécialité est présente
end
