import 'subcategories_data_forcategories_model.dart';

class SubcategoriesValueForCategories {
	List<SubcategoriesDataForCategories>? data;

	SubcategoriesValueForCategories({this.data});

	SubcategoriesValueForCategories.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = <SubcategoriesDataForCategories>[];
			json['data'].forEach((v) { data!.add(SubcategoriesDataForCategories.fromJson(v)); });
		}
	}

  //SubcategoriesForCategories

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}