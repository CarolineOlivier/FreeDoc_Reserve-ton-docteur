class Doctor < ApplicationRecord
    # Un docteur peut avoir plusieurs rendez-vous
    has_many :appointments
    
    # Un docteur peut avoir plusieurs rendez-vous planifiés avec différents patients
    has_many :patients, through: :appointments 
    #L'option through: :appointments permet d'accéder aux données associées via le modèle Appointment.
    #Cela établit une relation indirecte entre docteurs et patients.
    # Cela signifie donc qu'on accède aux patients liés à un docteur via les rendez-vous qu'il a
  end
  