import 'category_values_forsubcategory_model.dart';

class CategoryDataValueForSubCategories {
  CategoryValuesForSubCategory? data;

  CategoryDataValueForSubCategories({this.data});

  CategoryDataValueForSubCategories.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CategoryValuesForSubCategory.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}