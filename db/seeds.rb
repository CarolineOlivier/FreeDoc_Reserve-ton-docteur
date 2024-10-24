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

# Créer quelques docteurs
doctors = Doctor.create([
  { first_name: 'Naussicaa', last_name: 'Imbert', specialty: 'généraliste', zip_code: '75001' },
  { first_name: 'Bénédicte', last_name: 'Pontier', specialty: 'généticienne', zip_code: '69001' }
])

# Créer quelques patients
patients = Patient.create([
  { first_name: 'caroline', last_name: 'Olivier' },
  { first_name: 'céline', last_name: 'victor' }
])

# Créer quelques rendez-vous
Appointment.create([
  { date: DateTime.now, doctor: doctors.first, patient: patients.first },
  { date: DateTime.now + 1.day, doctor: doctors.last, patient: patients.last }
])

