import 'subcategorie_data_model.dart';

class SubcategoriesValue {
	List<SubcategoriesData>? data;

	SubcategoriesValue({this.data});

	SubcategoriesValue.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = <SubcategoriesData>[];
			json['data'].forEach((v) { data!.add(SubcategoriesData.fromJson(v)); });
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