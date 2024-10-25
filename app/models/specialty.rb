class Specialty < ApplicationRecord
    # Une spécialité peut concerner plusieurs docteurs, et un docteur peut avoir plusieurs spécialités
    has_and_belongs_to_many :doctors 
    #permet de définir une relation N-N entre les spécialités et les docteurs,
# à l'aide d'une table de jointure.
#Cela signifie qu'un enregistrement du modèle actuel (Specialty) peut être associé 
#à plusieurs enregistrements d'un autre modèle (Doctor), et inversement.

    # Validation pour garantir que le nom de la spécialité est présent
    validates :name, presence: true
end



