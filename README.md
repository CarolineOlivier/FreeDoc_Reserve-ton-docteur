# FreeDoc_Reserve-ton-docteur

Ce projet est une application Ruby on Rails qui permet de gérer les rendez-vous entre des docteurs et des patients. L'objectif est de simuler une version simplifiée de Doctolib.

## Prérequis

- Ruby 3.2.2
- Rails 7.2.1.2
- SQLite3 (utilisé pour la base de données en développement)

## Installation

1. Clonez le dépôt GitHub :

   ```bash
   git clone https://github.com/VOTRE_NOM_UTILISATEUR/FreeDoc_Reserve-ton-docteur.git
   ```

2. Allez dans le dossier du projet :

   ```bash
   cd FreeDoc_Reserve-ton-docteur
   ```

3. Installez les gemmes nécessaires :

   ```bash
   bundle install
   ```

4. Exécutez les migrations pour créer la base de données :

   ```bash
   rails db:migrate
   ```

5. Remplissez la base de données avec les données initiales :

   ```bash
   rails db:seed
   ```

## Fonctionnalités

- Gestion des docteurs, patients et rendez-vous.
- Association des docteurs et patients avec des villes.
- Possibilité pour un docteur d'avoir plusieurs spécialités.
- Chaque rendez-vous est lié à un docteur, un patient et une ville.

## Modèles et relations

- **Doctor** : associé à une ou plusieurs spécialités, à une ville, et à plusieurs rendez-vous.
- **Patient** : associé à une ville et à plusieurs rendez-vous.
- **Appointment** : relie un docteur, un patient et une ville.
- **City** : contient les informations sur les villes et est lié aux docteurs, patients et rendez-vous.
- **Specialty** : représente les spécialités médicales et peut être associée à plusieurs docteurs.

## Utilisation

1. Lancer le serveur de développement :

   ```bash
   rails server
   ```

2. Accédez à l'application dans votre navigateur à l'adresse `http://localhost:3000`.

## Tests

Vous pouvez tester les associations en utilisant la console Rails :

   ```bash
   rails console
   ```

Et vérifiez les associations avec des commandes comme :

   ```ruby
   city = City.first
   puts "Ville : #{city.name}"
   city.doctors.each { |doctor| puts "Docteur : #{doctor.first_name} #{doctor.last_name}" }
   ```

## Contribution

Les contributions sont les bienvenues ! Veuillez suivre les étapes suivantes :

1. Forker le projet
2. Créer une branche pour vos modifications (`git checkout -b ma-nouvelle-fonctionnalite`)
3. Committez vos modifications (`git commit -am 'Ajout d'une nouvelle fonctionnalité'`)
4. Pushez votre branche (`git push origin ma-nouvelle-fonctionnalite`)
5. Créez une Pull Request

## Licence

Ce projet est sous licence MIT.
