class RecipeInfoModel {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<MissedIngredients>? missedIngredients;
  List<UsedIngredients>? usedIngredients;

  int? likes;

  RecipeInfoModel(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.usedIngredientCount,
      this.missedIngredientCount,
      this.missedIngredients,
      this.usedIngredients,
      this.likes});

  static List<RecipeInfoModel> fromJsonList(List<dynamic> jsonList) {
    List<RecipeInfoModel> _data = [];
    for (var v in jsonList) {
      _data.add(RecipeInfoModel.fromJson(v));
    }
    return _data;
  }

  RecipeInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    usedIngredientCount = json['usedIngredientCount'];
    missedIngredientCount = json['missedIngredientCount'];
    if (json['missedIngredients'] != null) {
      missedIngredients = <MissedIngredients>[];
      json['missedIngredients'].forEach((v) {
        missedIngredients!.add(new MissedIngredients.fromJson(v));
      });
    }
    if (json['usedIngredients'] != null) {
      usedIngredients = <UsedIngredients>[];
      json['usedIngredients'].forEach((v) {
        usedIngredients!.add(new UsedIngredients.fromJson(v));
      });
    }

    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['usedIngredientCount'] = this.usedIngredientCount;
    data['missedIngredientCount'] = this.missedIngredientCount;
    if (this.missedIngredients != null) {
      data['missedIngredients'] =
          this.missedIngredients!.map((v) => v.toJson()).toList();
    }
    if (this.usedIngredients != null) {
      data['usedIngredients'] =
          this.usedIngredients!.map((v) => v.toJson()).toList();
    }

    data['likes'] = this.likes;
    return data;
  }
}

class MissedIngredients {
  dynamic id;
  dynamic amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? image;
  String? extendedName;

  MissedIngredients(
      {this.id,
      this.amount,
      this.unit,
      this.unitLong,
      this.unitShort,
      this.aisle,
      this.name,
      this.original,
      this.originalName,
      this.meta,
      this.image,
      this.extendedName});

  MissedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    meta = json['meta'].cast<String>();
    image = json['image'];
    extendedName = json['extendedName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['unitLong'] = this.unitLong;
    data['unitShort'] = this.unitShort;
    data['aisle'] = this.aisle;
    data['name'] = this.name;
    data['original'] = this.original;
    data['originalName'] = this.originalName;
    data['meta'] = this.meta;
    data['image'] = this.image;
    data['extendedName'] = this.extendedName;
    return data;
  }
}

class UsedIngredients {
  dynamic id;
  dynamic amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;

  String? image;

  UsedIngredients(
      {this.id,
      this.amount,
      this.unit,
      this.unitLong,
      this.unitShort,
      this.aisle,
      this.name,
      this.original,
      this.originalName,
      this.image});

  UsedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];

    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['unitLong'] = this.unitLong;
    data['unitShort'] = this.unitShort;
    data['aisle'] = this.aisle;
    data['name'] = this.name;
    data['original'] = this.original;
    data['originalName'] = this.originalName;

    data['image'] = this.image;
    return data;
  }
}
