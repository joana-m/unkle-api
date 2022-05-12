json.array! @contrat_clients do |contrat|
  json.extract! contrat, :id, :numero, :statut, :date_de_debut, :date_de_fin do
    json.options contrat.options do |option|
      json.extract! option, :id, :categorie
    end
  end
end
