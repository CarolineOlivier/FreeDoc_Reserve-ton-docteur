class Appointment < ApplicationRecord
  # chaque rendez-vous est lié (appartient) à un seul docteur
  belongs_to :doctor
  # Cela ajoute une clé étrangère 'doctor_id' dans la table des rendez-vous
  
  # Chaque rendez-vous est lié (appartient) à un seul patient
 belongs_to :patient
   # Cela ajoute également une clé étrangère 'patient_id' dans la table des rendez-vous

 #Les clés étrangères (doctor_id et patient_id) dans la table appointments permettent d'établir ces relations.

 #rappel : 
 #Une clé étrangère est un concept utilisé dans les bases de données relationnelles pr établir un lien entre 2 tables. 
 #Elle permet de relier les données de deux tables différentes en utilisant une colonne spécifique.
end
