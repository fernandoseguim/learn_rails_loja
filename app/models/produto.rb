class Produto < ApplicationRecord

  belongs_to :departamento

  validates :nome, :descricao, :preco, :quantidade, :departamento, presence: true
  validates :nome, length: {minimum: 10}

end
