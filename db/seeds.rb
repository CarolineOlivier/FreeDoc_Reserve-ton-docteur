# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#traduction : 
# Ce fichier doit garantir l'existence des enregistrements nécessaires pour exécuter l'application dans tous les environnements (production,
# développement, test). Le code ici doit être idempotent afin qu'il puisse être exécuté à tout moment dans chaque environnement.
# Les données peuvent ensuite être chargées avec la commande bin/rails db:seed (ou créées en même temps que la base de données avec db:setup).
#
# Exemple :
#
#   ["Action", "Comédie", "Drame", "Horreur"].each do |nom_genre|
#     MovieGenre.find_or_create_by!(name: nom_genre)

# db/seeds.rb

# Création des villes
cities = City.create!([
  { name: 'Perpignan', zip_code: '66000' },
  { name: 'Clermont-Ferrand', zip_code: '63000' }
])

# Création des spécialités
specialties = Specialty.create!([
  { name: 'Généraliste' },
  { name: 'Génétique' },
  { name: 'Médecine physique et de réadaptation (MPR)' }
])

# Création des docteurs avec les villes associées
doctors = Doctor.create!([
  { first_name: 'Naussicaa', last_name: 'Imbert', city: cities.first },
  { first_name: 'Bénédicte', last_name: 'Pontier', city: cities.last }
])

# Association des spécialités aux docteurs
doctors.first.specialties << specialties.first # Naussicaa Imbert : Généraliste
doctors.last.specialties << specialties[1] # Bénédicte Pontier : Génétique
doctors.last.specialties << specialties[2] # Bénédicte Pontier : Médecine physique et de réadaptation (MPR)

# Création des patients avec les villes associées
patients = Patient.create!([
  { first_name: 'Caroline', last_name: 'Olivier', city: cities.first },
  { first_name: 'Céline', last_name: 'Victor', city: cities.last }
])

# Création des rendez-vous en les associant aux villes et aux spécialités
Appointment.create!([
  { date: DateTime.now, doctor: doctors.first, patient: patients.first, city: cities.first, specialty: specialties.first },
  { date: DateTime.now + 1.day, doctor: doctors.last, patient: patients.last, city: cities.last, specialty: specialties[1] }
])
