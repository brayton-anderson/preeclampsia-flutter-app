class SubcategoriesForCategories {
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

	SubcategoriesForCategories({this.subcategorieName, this.subcategoryIcon, this.subcategorieDetails, this.categorieId, this.categorieIdName, this.subcategorieActive, this.subcategorieUid, this.createdAt, this.updatedAt, this.publishedAt});

	SubcategoriesForCategories.fromJson(Map<String, dynamic> json) {
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
		return data;
	}
}