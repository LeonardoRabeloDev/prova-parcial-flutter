class Produto {
  String nome;
  double preco;
  int quantidade;
  bool comprado = false;

  Produto(this.nome, this.preco, this.quantidade) {
    this.setPreco(preco);
  }

  getNome() {
    return this.nome;
  }

  getPreco() {
    return this.preco;
  }

  getQuantidade() {
    return this.quantidade;
  }

  isComprado() {
    return comprado;
  }

  setNome(String nome) {
    this.nome = nome;
  }

  setPreco(double preco) {
    String s = preco.toString();
    var ls = s.split(".");
    ls[1] = ls[1].length > 2 ? "${ls[1][0]}${ls[1][1]}" : ls[1];

    this.preco = double.parse("${ls[0]}.${ls[1]}");
  }

  setQuantidade(int quantidade) {
    this.quantidade = quantidade;
  }

  String getPrecoMoeda() {
    String s = getPreco().toString();
    var ls = s.split(".");
    ls[1] = ls[1].length == 1 ? "${ls[1]}0" : ls[1];

    return "${ls[0]},${ls[1]}";
  }

  setComprado() {
    this.comprado = !comprado;
  }
}
