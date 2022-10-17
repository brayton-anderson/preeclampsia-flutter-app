import 'categories_model.dart';

class CategoryValues {
  Categories? attributes;
  String? id;

  CategoryValues({this.attributes, this.id});

  CategoryValues.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null ? Categories.fromJson(json['attributes']) : null;
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
       data['id'] = id!;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}