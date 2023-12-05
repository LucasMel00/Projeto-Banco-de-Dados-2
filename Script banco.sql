-- Tabela de Categorias
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY IDENTITY(1, 1),
    Nome VARCHAR(255) NOT NULL
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY IDENTITY(1, 1),
    Nome VARCHAR(255) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY IDENTITY(1, 1),
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    CategoriaID INT,
    FornecedorID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias (CategoriaID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores (FornecedorID)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1, 1),
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY IDENTITY(1, 1),
    ClienteID INT,
    DataPedido DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID)
);

-- Tabela de Detalhes do Pedido
CREATE TABLE DetalhesPedido (
    DetalheID INT PRIMARY KEY IDENTITY(1, 1),
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos (PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID)
);
