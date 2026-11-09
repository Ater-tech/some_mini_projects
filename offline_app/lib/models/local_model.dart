import 'package:hive_flutter/hive_flutter.dart';
part 'local_model.g.dart';

@HiveType(typeId: 0)
class LocalModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? price;
  @HiveField(2)
  bool? isAviable;
  @HiveField(3)
  String? currency;

  LocalModel({
    this.name,
    this.price,
    this.isAviable,
    this.currency,
  });

  factory LocalModel.fromJson(Map<String, dynamic> json) 
  { 
    return LocalModel(
    name: json['name'],
    price: json['price'],
    isAviable: json['is_avaible'],
    currency: json['currency'],
  );}
}