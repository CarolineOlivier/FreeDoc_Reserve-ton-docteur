class Patient < ApplicationRecord
    # Un patient peut avoir plusieurs rendez-vous
    has_many :appointments
    
    
    # Un patient peut avoir plusieurs rendez-vous avec différents docteurs
    has_many :doctors, through: :appointments
    # Cela signifie qu'on accède aux docteurs associés à un patient via les rendez-vous qu'il a
    #L'option through: :appointments dans les relations entre docteur et patient permet d'accéder 
    #aux données associées via le modèle Appointment. Cela établit une relation indirecte entre docteurs et patients.
  end
  