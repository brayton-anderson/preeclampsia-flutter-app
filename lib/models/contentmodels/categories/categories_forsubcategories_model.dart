class CategoriesForSubCategories {
	String? categorieName;
	String? categoryIcon;
	bool? categorieActive;
	String? categorieDetails;
	String? categorieUid;
	String? createdAt;
	String? updatedAt;
	//CategorieMedia? categorieMedia;

	CategoriesForSubCategories({this.categorieName, this.categoryIcon, this.categorieActive, this.categorieDetails, this.categorieUid, this.createdAt, this.updatedAt});

	CategoriesForSubCategories.fromJson(Map<String, dynamic> json) {
		categorieName = json['categorie_name'];
		categoryIcon = json['category_icon'];
		categorieActive = json['categorie_active'];
		categorieDetails = json['categorie_details'];
		categorieUid = json['categorie_uid'];
		createdAt = json['createdAt'];
		updatedAt = json['updatedAt'];
		//categorieMedia = json['categorie_media'] != null ? CategorieMedia.fromJson(json['categorie_media']) : null;
		//subcategories = json['subcategories'] != null ? SubcategoriesValueForCategories.fromJson(json['subcategories']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['categorie_name'] = categorieName;
		data['category_icon'] = categoryIcon;
		data['categorie_active'] = categorieActive;
		data['categorie_details'] = categorieDetails;
		data['categorie_uid'] = categorieUid;
		data['createdAt'] = createdAt;
		data['updatedAt'] = updatedAt;
		// if (categorieMedia != null) {
    //   data['categorie_media'] = categorieMedia!.toJson();
    // }
		return data;
	}
}