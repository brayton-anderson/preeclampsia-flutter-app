import 'subcategory_model.dart';

class SubcategoriesData {
	Subcategories? attributes;
  String? id;

	SubcategoriesData({this.attributes, this.id});

	SubcategoriesData.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null ? Subcategories.fromJson(json['attributes']) : null;
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