class ProdutosController < ApplicationController

  before_action :set_produto, only: [:edit, :update, :destroy]

  def index
    @produtos_por_nome = Produto.order(:nome).limit 5
    @produtos_por_preco = Produto.order(:preco).limit 2
  end

  def show_all
    @produtos = Produto.all
  end

  def new
    @produto = Produto.new
    renderiza :new
  end

  def search
    @nome_a_buscar = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
  end

  def create
    @produto = Produto.new produto_params

    if @produto.save
      flash[:notice] = "Produto #{@nome} castrado com sucesso"
      redirect_to all_produtos_path
    else
      renderiza :new
    end
  end

  def edit
    renderiza :edit
  end

  def update
    if @produto.update produto_params
      flash[:notice] = "Produto #{@nome} atualizado com sucesso"
      redirect_to all_produtos_path
    else
      renderiza :new
    end
  end


  def destroy
    @produto.destroy
    redirect_to all_produtos_path
  end

  private

    def renderiza view
      @departamentos = Departamento.all
      render view
    end

    def set_produto
      @produto = Produto.find params[:id]
    end

    def produto_params
      params.require(:produto)
          .permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
    end

end
