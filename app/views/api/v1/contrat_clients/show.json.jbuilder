json.extract! @contrat_client, :id, :numero, :date_de_debut, :date_de_fin
json.options @contrat_client.contrat.options do |option|
  json.extract! option, :id, :identifiant, :categorie
end
