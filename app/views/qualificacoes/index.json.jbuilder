json.array!(@qualificacoes) do |qualificacao|
  json.extract! qualificacao, :id, :cliente_id, :restaurante_id, :nota, :
  json.url qualificacao_url(qualificacao, format: :json)
end
