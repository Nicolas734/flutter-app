abstract class ListItem {
  int get id;
  String get nome;
  String get descricao;
  double get preco;
  int get qtd;
  CustomImageInfo  get image;
}
 
class UserItem implements ListItem {
  final int id;
  final String descricao = '';
  final double preco = 0.00;
  final int qtd = 0;
  final String nome;
  final String email;
  final String cpf;
  final CustomImageInfo image;
  

  UserItem({
    required this.id,
    required this.nome,
    required this.email,
    required this.image,
    required this.cpf,
  });
}

class CustomImageInfo  {
  final bool details;
  final String url;

  CustomImageInfo ({
    required this.details,
    required this.url,
  });
}

class ProductItem implements ListItem {
  final int id;
  final String nome;
  final String descricao;
  final double preco;
  final int qtd;
  final CustomImageInfo  image;

  ProductItem({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.qtd,
    required this.image,
  });
}
