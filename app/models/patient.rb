class Patient < ApplicationRecord
    # Un patient peut avoir plusieurs rendez-vous
    has_many :appointments
    
    
    # Un patient peut avoir plusieurs rendez-vous avec différents docteurs
    has_many :doctors, through: :appointments
    # on accède aux docteurs associés à un patient via les rendez-vous qu'il a
    #L'option through: :appointments dans les relations entre docteur et patient permet d'accéder 
    #aux données associées via le modèle Appointment. Cela établit une relation indirecte entre docteurs et patients.

    # Un patient appartient à une ville
    belongs_to :city # associe chaque patient à une ville.

    # Autres associations et validations...
    def full_name
        "#{first_name} #{last_name}"
        end

    # Validation pour garantir que les champs ne sont pas vides
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :city_id, presence: true
end


