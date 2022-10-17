import 'subcategories_for_categories_model.dart';

class SubcategoriesDataForCategories {
	SubcategoriesForCategories? attributes;
  String? id;

	SubcategoriesDataForCategories({this.attributes, this.id});

	SubcategoriesDataForCategories.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null ? SubcategoriesForCategories.fromJson(json['attributes']) : null;
		id = json['id'].toString();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (attributes != null) {
      data['subcategories'] = attributes!.toJson();
    }
		data['id'] = id;
		return data;
	}
}