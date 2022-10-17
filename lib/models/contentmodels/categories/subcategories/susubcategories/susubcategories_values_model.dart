import 'susubcategories_model.dart';

class SusubCategoriesValues {
  SusubCategories? attributes;
  String? id;

  SusubCategoriesValues({this.attributes, this.id});

  SusubCategoriesValues.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null ? SusubCategories.fromJson(json['attributes']) : null;
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
