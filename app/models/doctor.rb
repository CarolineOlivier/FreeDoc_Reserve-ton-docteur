class Doctor < ApplicationRecord
    # Un docteur peut avoir plusieurs rendez-vous
    has_many :appointments
    
    # Un docteur peut avoir plusieurs rendez-vous planifiés avec différents patients
    has_many :patients, through: :appointments 
    #L'option through: :appointments permet d'accéder aux données associées via le modèle Appointment.
    #Cela établit une relation indirecte entre docteurs et patients 
    #et permet de récupérer les patients associés au docteur via les rendez-vous.

    belongs_to :city # associe chaque docteur à une ville. (avec une clé étrangère city_id).

    # Un docteur peut avoir plusieurs spécialités, et une spécialité peut concerner plusieurs docteurs
    has_and_belongs_to_many :specialties 
    #permet de définir une relation N-N entre les docteurs et les spécialités.

    # Validation pour s'assurer que les champs suivants ne sont pas vides
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :city_id, presence: true
end
