class DAOProductos{
  int idproducto;
  String nomproducto;
  num costo;
  num precio;
  int existencia;
  int reorden;
  int comprometidas;
  bool vigente;
  String imagen;

  DAOProductos({this.idproducto,this.nomproducto,this.costo,this.precio,this.existencia,this.reorden,this.comprometidas,this.vigente,this.imagen});

  factory DAOProductos.fromJson(Map<String, dynamic> json) {
    return DAOProductos(
      idproducto: json['idproducto'] as int,
      nomproducto: json['nomproducto'] as String,
      costo: json['costo'] as num,
      precio: json['precio'] as num,
      existencia: json['existencia'] as int,
      reorden: json['reorden'] as int,
      comprometidas: json['comprometidas'] as int,
      vigente: json['vigente'] as bool,
      imagen: json['imagen'] as String
    );
  }
}