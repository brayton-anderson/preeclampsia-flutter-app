import 'susubcategories_values_model.dart';

class Subcategoriesubs {
  List<SusubCategoriesValues>? data;

  Subcategoriesubs({this.data});

  Subcategoriesubs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SusubCategoriesValues>[];
      json['data'].forEach((v) {
        data!.add(SusubCategoriesValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}