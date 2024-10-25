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
cities = [
  { name: 'Perpignan', zip_code: '66000' },
  { name: 'Clermont-Ferrand', zip_code: '63000' }
].map { |city| City.find_or_create_by!(city) }

# Création des spécialités
specialties = [
  { name: 'Généraliste' },
  { name: 'Génétique' },
  { name: 'Médecine physique et de réadaptation (MPR)' }
].map { |specialty| Specialty.find_or_create_by!(specialty) }

# Création des docteurs avec les villes associées
doctors = [
  { first_name: 'Naussicaa', last_name: 'Imbert', city: cities[0] },
  { first_name: 'Bénédicte', last_name: 'Pontier', city: cities[1] }
].map { |doctor| Doctor.find_or_create_by!(doctor) }

# Association des spécialités aux docteurs
doctors[0].specialties << specialties[0] unless doctors[0].specialties.include?(specialties[0])
doctors[1].specialties << specialties[1] unless doctors[1].specialties.include?(specialties[1])
doctors[1].specialties << specialties[2] unless doctors[1].specialties.include?(specialties[2])

# Création des patients avec les villes associées
patients = [
  { first_name: 'Caroline', last_name: 'Olivier', city: cities[0] },
  { first_name: 'Céline', last_name: 'Victor', city: cities[1] }
].map { |patient| Patient.find_or_create_by!(patient) }

# Création des rendez-vous en les associant aux villes et aux spécialités
appointments = [
  { date: DateTime.now, doctor: doctors[0], patient: patients[0], city: cities[0], specialty: specialties[0] },
  { date: DateTime.now + 1.day, doctor: doctors[1], patient: patients[1], city: cities[1], specialty: specialties[1] }
].each { |appointment| Appointment.find_or_create_by!(appointment) }

