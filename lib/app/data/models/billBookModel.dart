import 'dart:convert';

BillBookModel billBookModelFromJson(String str) =>
    BillBookModel.fromJson(json.decode(str));

String billBookModelToJson(BillBookModel data) => json.encode(data.toJson());

class BillBookModel {
  bool? status;
  String? message;
  Data? data;

  BillBookModel({
    this.status,
    this.message,
    this.data,
  });

  BillBookModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      BillBookModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BillBookModel.fromJson(Map<String, dynamic> json) => BillBookModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? totalItems;
  List<Datum>? data;
  int? totalPages;
  int? currentPage;
  String? nextPage;

  Data({
    this.totalItems,
    this.data,
    this.totalPages,
    this.currentPage,
    this.nextPage,
  });

  Data copyWith({
    int? totalItems,
    List<Datum>? data,
    int? totalPages,
    int? currentPage,
    String? nextPage,
  }) =>
      Data(
        totalItems: totalItems ?? this.totalItems,
        data: data ?? this.data,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        nextPage: nextPage ?? this.nextPage,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalItems: json["totalItems"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
        "nextPage": nextPage,
      };
}

class Datum {
  int? id;
  String? name;
  String? description;
  String? productImage;
  int? productCategoryId;
  dynamic status;
  int? mrp;
  int? price;
  int? unit;
  String? unitId;
  String? taxRate;
  dynamic taxRateId;
  String? hsnCode;
  bool? haveVariant;
  String? storeId;
  int? sortOrder;
  bool? isOutOfStock;
  bool? sampleProduct;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  double? currentStockCount;
  ProductCategory? productCategory;
  UnitDetail? unitDetail;
  dynamic gst;
  List<Variant>? variants;

  Datum({
    this.id,
    this.name,
    this.description,
    this.productImage,
    this.productCategoryId,
    this.status,
    this.mrp,
    this.price,
    this.unit,
    this.unitId,
    this.taxRate,
    this.taxRateId,
    this.hsnCode,
    this.haveVariant,
    this.storeId,
    this.sortOrder,
    this.isOutOfStock,
    this.sampleProduct,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.currentStockCount,
    this.productCategory,
    this.unitDetail,
    this.gst,
    this.variants,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? description,
    String? productImage,
    int? productCategoryId,
    dynamic status,
    int? mrp,
    int? price,
    int? unit,
    String? unitId,
    String? taxRate,
    dynamic taxRateId,
    String? hsnCode,
    bool? haveVariant,
    String? storeId,
    int? sortOrder,
    bool? isOutOfStock,
    bool? sampleProduct,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    double? currentStockCount,
    ProductCategory? productCategory,
    UnitDetail? unitDetail,
    dynamic gst,
    List<Variant>? variants,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        productImage: productImage ?? this.productImage,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        status: status ?? this.status,
        mrp: mrp ?? this.mrp,
        price: price ?? this.price,
        unit: unit ?? this.unit,
        unitId: unitId ?? this.unitId,
        taxRate: taxRate ?? this.taxRate,
        taxRateId: taxRateId ?? this.taxRateId,
        hsnCode: hsnCode ?? this.hsnCode,
        haveVariant: haveVariant ?? this.haveVariant,
        storeId: storeId ?? this.storeId,
        sortOrder: sortOrder ?? this.sortOrder,
        isOutOfStock: isOutOfStock ?? this.isOutOfStock,
        sampleProduct: sampleProduct ?? this.sampleProduct,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        currentStockCount: currentStockCount ?? this.currentStockCount,
        productCategory: productCategory ?? this.productCategory,
        unitDetail: unitDetail ?? this.unitDetail,
        gst: gst ?? this.gst,
        variants: variants ?? this.variants,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        productImage: json["productImage"],
        productCategoryId: json["productCategoryId"],
        status: json["status"],
        mrp: json["mrp"],
        price: json["price"],
        unit: json["unit"],
        unitId: json["unitId"],
        taxRate: json["taxRate"],
        taxRateId: json["taxRateId"],
        hsnCode: json["hsnCode"],
        haveVariant: json["haveVariant"],
        storeId: json["storeId"],
        sortOrder: json["sortOrder"],
        isOutOfStock: json["isOutOfStock"],
        sampleProduct: json["sampleProduct"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        currentStockCount: json["currentStockCount"]?.toDouble(),
        productCategory: json["productCategory"] == null
            ? null
            : ProductCategory.fromJson(json["productCategory"]),
        unitDetail: json["unitDetail"] == null
            ? null
            : UnitDetail.fromJson(json["unitDetail"]),
        gst: json["gst"],
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "productImage": productImage,
        "productCategoryId": productCategoryId,
        "status": status,
        "mrp": mrp,
        "price": price,
        "unit": unit,
        "unitId": unitId,
        "taxRate": taxRate,
        "taxRateId": taxRateId,
        "hsnCode": hsnCode,
        "haveVariant": haveVariant,
        "storeId": storeId,
        "sortOrder": sortOrder,
        "isOutOfStock": isOutOfStock,
        "sampleProduct": sampleProduct,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "currentStockCount": currentStockCount,
        "productCategory": productCategory?.toJson(),
        "unitDetail": unitDetail?.toJson(),
        "gst": gst,
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class ProductCategory {
  int? id;
  String? name;
  dynamic image;
  String? storeId;
  int? sortOrder;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  ProductCategory({
    this.id,
    this.name,
    this.image,
    this.storeId,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  ProductCategory copyWith({
    int? id,
    String? name,
    dynamic image,
    String? storeId,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      ProductCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        storeId: storeId ?? this.storeId,
        sortOrder: sortOrder ?? this.sortOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        storeId: json["storeId"],
        sortOrder: json["sortOrder"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "storeId": storeId,
        "sortOrder": sortOrder,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class UnitDetail {
  String? id;
  String? unitName;
  dynamic storeId;
  int? unit;
  DateTime? createdAt;
  String? updatedAt;

  UnitDetail({
    this.id,
    this.unitName,
    this.storeId,
    this.unit,
    this.createdAt,
    this.updatedAt,
  });

  UnitDetail copyWith({
    String? id,
    String? unitName,
    dynamic storeId,
    int? unit,
    DateTime? createdAt,
    String? updatedAt,
  }) =>
      UnitDetail(
        id: id ?? this.id,
        unitName: unitName ?? this.unitName,
        storeId: storeId ?? this.storeId,
        unit: unit ?? this.unit,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UnitDetail.fromJson(Map<String, dynamic> json) => UnitDetail(
        id: json["id"],
        unitName: json["unit_name"],
        storeId: json["storeId"],
        unit: json["unit"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit_name": unitName,
        "storeId": storeId,
        "unit": unit,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt,
      };
}

class Variant {
  int? id;
  String? name;
  dynamic description;
  int? productId;
  dynamic status;
  int? price;
  int? mrp;
  double? unit;
  dynamic unitId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic unitDetail;

  Variant({
    this.id,
    this.name,
    this.description,
    this.productId,
    this.status,
    this.price,
    this.mrp,
    this.unit,
    this.unitId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.unitDetail,
  });

  Variant copyWith({
    int? id,
    String? name,
    dynamic description,
    int? productId,
    dynamic status,
    int? price,
    int? mrp,
    double? unit,
    dynamic unitId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    dynamic unitDetail,
  }) =>
      Variant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        productId: productId ?? this.productId,
        status: status ?? this.status,
        price: price ?? this.price,
        mrp: mrp ?? this.mrp,
        unit: unit ?? this.unit,
        unitId: unitId ?? this.unitId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        unitDetail: unitDetail ?? this.unitDetail,
      );

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        productId: json["productId"],
        status: json["status"],
        price: json["price"],
        mrp: json["mrp"],
        unit: json["unit"]?.toDouble(),
        unitId: json["unitId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        unitDetail: json["unitDetail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "productId": productId,
        "status": status,
        "price": price,
        "mrp": mrp,
        "unit": unit,
        "unitId": unitId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "unitDetail": unitDetail,
      };
}
