import 'categories_data.dart';

class CategoryDataValue {
  List<CategoryValues>? data;

  CategoryDataValue({this.data});

  CategoryDataValue.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
			data = <CategoryValues>[];
			json['data'].forEach((v) { data!.add(CategoryValues.fromJson(v)); });
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