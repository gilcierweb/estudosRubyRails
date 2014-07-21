#require "prawn"
class TesteController < ApplicationController
  def index
    @files = Dir.glob('*')
  end

  def form
    @dados = params[:q]
  end
  
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    100.times {
      response.stream.write "hello world\n"
      sleep 1
    }
  ensure
    response.stream.close
    end

  # Generates a PDF document with information on the client and
  # returns it. The user will get the PDF as a file download.
  def download_pdf
    @client = Restaurante.find(params[:id])
    send_data generate_pdf(client),
              filename: "#{client.nome}.pdf",
              type: "application/pdf"
  end

  private

  def generate_pdf(client)
    Prawn::Document.new do
      text client.nome, align: :center
      text "Address: #{client.endereco}"
      text "Email: #{client.especialidade}"
    end.render
  end
end
