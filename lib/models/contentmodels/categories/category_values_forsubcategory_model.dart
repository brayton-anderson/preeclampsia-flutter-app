import 'categories_forsubcategories_model.dart';

class CategoryValuesForSubCategory {
  CategoriesForSubCategories? attributes;
  String? id;

  CategoryValuesForSubCategory({this.attributes, this.id});

  CategoryValuesForSubCategory.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null ? CategoriesForSubCategories.fromJson(json['attributes']) : null;
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