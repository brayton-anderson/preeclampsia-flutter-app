class SusubCategories {
  String? susubcategory;
  String? susubcategoryIcon;
  String? subcategoryId;
  String? subcategoryIds;
  bool? susubcategorieActive;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  SusubCategories(
      {this.susubcategory,
      this.susubcategoryIcon,
      this.subcategoryId,
      this.subcategoryIds,
      this.susubcategorieActive,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  SusubCategories.fromJson(Map<String, dynamic> json) {
    susubcategory = json['susubcategory'];
    susubcategoryIcon = json['susubcategory_icon'];
    subcategoryId = json['subcategory_id'];
    subcategoryIds = json['subcategory_ids'];
    susubcategorieActive = json['susubcategorie_active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['susubcategory'] = susubcategory;
    data['susubcategory_icon'] = susubcategoryIcon;
    data['subcategory_id'] = subcategoryId;
    data['subcategory_ids'] = subcategoryIds;
    data['susubcategorie_active'] = susubcategorieActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    return data;
  }
}