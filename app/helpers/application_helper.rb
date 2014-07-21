module ApplicationHelper
  def valor_formatado(number)
    number_to_currency number,
    unit: "R$",
    separator: ",",
    delimiter: "."
  end

  def novo_comentario(comentavel)
    render partial: "comentarios/novo_comentario",
          locals: {comentavel: comentavel}
  end

  def comentarios(comentavel)
    render partial: "comentarios/comentarios",
     locals: {comentarios: comentavel.comentarios}
  end

  def menu_principal(controllers)
    render partial: "layouts/menu_principal", locals: {opcoes: controllers}
  end
end
