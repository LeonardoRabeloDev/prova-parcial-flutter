class Produto {
  final String nome;
  double preco;
  final int quantidade;

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

  void setPreco(double preco) {
    String s = preco.toString();
    var ls = s.split(".");
    ls[1] = ls[1].length > 2 ? "${ls[1][0]}${ls[1][1]}" : ls[1];

    this.preco = double.parse("${ls[0]}.${ls[1]}");
  }

  String getPrecoMoeda() {
    String s = getPreco().toString();
    var ls = s.split(".");
    ls[1] = ls[1].length == 1 ? "${ls[1]}0" : ls[1];

    return "${ls[0]},${ls[1]}";
  }
}
