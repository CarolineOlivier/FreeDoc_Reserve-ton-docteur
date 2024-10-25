class City < ApplicationRecord
    # Une ville peut avoir plusieurs docteurs
    has_many :doctors

    # Une ville peut avoir plusieurs patients
    has_many :patients

    # Une ville peut avoir plusieurs rendez-vous
    has_many :appointments

    # Validation pour garantir que le nom et le code postal sont présents
    validates :name, presence: true
    validates :zip_code, presence: true
end
