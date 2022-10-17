import '../categories_data_value_forsubcategories_model.dart';
import 'susubcategories/subcategories_subs_model.dart';

class Subcategories {
	String? subcategorieName;
	String? subcategoryIcon;
	String? subcategorieDetails;
	String? categorieId;
	String? categorieIdName;
	bool? subcategorieActive;
	String? subcategorieUid;
	String? createdAt;
	String? updatedAt;
	String? publishedAt;
  CategoryDataValueForSubCategories? category;
  Subcategoriesubs? subcategoriesubs;

	Subcategories({this.subcategorieName, this.subcategoryIcon, this.subcategorieDetails, this.categorieId, this.categorieIdName, this.subcategorieActive, this.subcategorieUid, this.createdAt, this.updatedAt, this.publishedAt, this.category, this.subcategoriesubs});

	Subcategories.fromJson(Map<String, dynamic> json) {
		subcategorieName = json['subcategorie_name'];
		subcategoryIcon = json['subcategory_icon'];
		subcategorieDetails = json['subcategorie_details'];
		categorieId = json['categorie_id'];
		categorieIdName = json['categorie_id_name'];
		subcategorieActive = json['subcategorie_active'];
		subcategorieUid = json['subcategorie_uid'];
		createdAt = json['createdAt'];
		updatedAt = json['updatedAt'];
		publishedAt = json['publishedAt'];
    category =
        json['category'] != null ? CategoryDataValueForSubCategories.fromJson(json['category']) : null;
    subcategoriesubs = json['subcategoriesubs'] != null
        ? Subcategoriesubs.fromJson(json['subcategoriesubs'])
        : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['subcategorie_name'] = subcategorieName;
		data['subcategory_icon'] = subcategoryIcon;
		data['subcategorie_details'] = subcategorieDetails;
		data['categorie_id'] = categorieId;
		data['categorie_id_name'] = categorieIdName;
		data['subcategorie_active'] = subcategorieActive;
		data['subcategorie_uid'] = subcategorieUid;
		data['createdAt'] = createdAt;
		data['updatedAt'] = updatedAt;
		data['publishedAt'] = publishedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subcategoriesubs != null) {
      data['subcategoriesubs'] = subcategoriesubs!.toJson();
    }
		return data;
	}
}