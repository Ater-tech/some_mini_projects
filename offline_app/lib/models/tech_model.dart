class TechModel {
  String? name;
  String? price;
  bool? isAviable;
  String? currency;

  TechModel({
    this.name,
    this.price,
    this.isAviable,
    this.currency,
  });

  factory TechModel.fromJson(Map<String, dynamic> json) 
  { 
    return TechModel(
    name: json['name'],
    price: json['price'],
    isAviable: json['is_avaible'],
    currency: json['currency'],
  );}
}