# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Contrat.destroy_all
Option.destroy_all

joana = User.create(email: 'joana@gmail.com', password: '123456', admin: true, authentication_token: "FFaXt_etA37V4WrzKoEZ")
john = User.create(email: 'john@gmail.com', password: '123456', admin: false, authentication_token: "TZzRFA_LoNkxv-jJwfNC")
chris = User.create(email: 'chris@gmail.com', password: '123456', admin: false)
dan = User.create(email: 'dan@gmail.com', password: '123456', admin: false)

contrat1 = Contrat.create
contrat2 = Contrat.create
contrat3 = Contrat.create
contrat4 = Contrat.create

option1 = Option.create(categorie: "Tous risques", description: "Assurance tous risques pour personnes de plus de 20 ans.", identifiant: "TR909878")
option2 = Option.create(categorie: "Vols", description: "Assurance pour tous types de vols, en semaine et le week-end.", identifiant: "VOLS909876")
option3 = Option.create(categorie: "Incendie", description: "Assurance incendie habitation.", identifiant: "IC901287")
option4 = Option.create(categorie: "Cambriolage en semaine", description: "Assurance cambriolage, en semaine uniquement.", identifiant: "CSEM009128")
option5 = Option.create(categorie: "Cambriolage le week-end", description: "Assurance cambriolage, le week-end uniquement.", identifiant: "CWE098989")

contrat_options1 = ContratOption.create(option_id: option1.id, contrat_id: contrat1.id)
contrat_options2 = ContratOption.create(option_id: option2.id, contrat_id: contrat2.id)
contrat_options3 = ContratOption.create(option_id: option3.id, contrat_id: contrat2.id)
contrat_options4 = ContratOption.create(option_id: option4.id, contrat_id: contrat3.id)
contrat_options5 = ContratOption.create(option_id: option5.id, contrat_id: contrat4.id)

contrat_client1 = ContratClient.create(user_id: chris.id, contrat_id: contrat1.id, date_de_debut: Date.today, date_de_fin: Date.parse("10/07/2022"), numero: "1EFR3456")
contrat_client2 = ContratClient.create(user_id: john.id, contrat_id: contrat1.id, date_de_debut: Date.today, date_de_fin: Date.tomorrow, numero: "1EFR3456")
contrat_client3 = ContratClient.create(user_id: dan.id, contrat_id: contrat2.id, date_de_debut: Date.today, date_de_fin: Date.parse("10/07/2023"), numero: "1EFR3456")
