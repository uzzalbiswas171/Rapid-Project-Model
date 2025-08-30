
class popularProductModel {
  String? _id;
  String? _purchaseGroupId;
  String? _purchaseCategoryId;
  String? _purchaseSubCategoryId;
  String? _unitId;
  String? _fullName;
  String? _name;
  String? _arabicName;
  String? _description;
  String? _costPrice;
  String? _price;
  String? _offerPrice;
  String? _startDate;
  String? _endDate;
  String? _code;
  String? _barcode;
  String? _brandId;
  String? _qtyIn;
  String? _qtyOut;
  String? _qtyCurrent;
  String? _stock;
  String? _sizeId;
  String? _colorId;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;
  String? _finalPrice;
  String? _qty;

  popularProductModel(
      {
        String? id,
        String? purchaseGroupId,
        String? purchaseCategoryId,
        String? purchaseSubCategoryId,
        String? unitId,
        String? fullName,
        String? name,
        String? arabicName,
        String? description,
        String? costPrice,
        String? price,
        String? offerPrice,
        String? startDate,
        String? endDate,
        String? code,
        String? barcode,
        String? brandId,
        String? qtyIn,
        String? qtyOut,
        String? qtyCurrent,
        String? stock,
        String? sizeId,
        String? colorId,
        String? image,
        String? createdAt,
        String? updatedAt,
        String? imageUrl,
        String? finalPrice,
        String? qty
      }) {
    if (id != null) {
      this._id = id;
    }
    if (purchaseGroupId != null) {
      this._purchaseGroupId = purchaseGroupId;
    }
    if (purchaseCategoryId != null) {
      this._purchaseCategoryId = purchaseCategoryId;
    }
    if (purchaseSubCategoryId != null) {
      this._purchaseSubCategoryId = purchaseSubCategoryId;
    }
    if (unitId != null) {
      this._unitId = unitId;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (name != null) {
      this._name = name;
    }
    if (arabicName != null) {
      this._arabicName = arabicName;
    }
    if (description != null) {
      this._description = description;
    }
    if (costPrice != null) {
      this._costPrice = costPrice;
    }
    if (price != null) {
      this._price = price;
    }
    if (offerPrice != null) {
      this._offerPrice = offerPrice;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
    if (code != null) {
      this._code = code;
    }
    if (barcode != null) {
      this._barcode = barcode;
    }
    if (brandId != null) {
      this._brandId = brandId;
    }
    if (qtyIn != null) {
      this._qtyIn = qtyIn;
    }
    if (qtyOut != null) {
      this._qtyOut = qtyOut;
    }
    if (qtyCurrent != null) {
      this._qtyCurrent = qtyCurrent;
    }
    if (stock != null) {
      this._stock = stock;
    }
    if (sizeId != null) {
      this._sizeId = sizeId;
    }
    if (colorId != null) {
      this._colorId = colorId;
    }
    if (image != null) {
      this._image = image;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (imageUrl != null) {
      this._imageUrl = imageUrl;
    }
    if (finalPrice != null) {
      this._finalPrice = finalPrice;
    }
    if (qty != null) {
      this._qty = qty;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get purchaseGroupId => _purchaseGroupId;
  set purchaseGroupId(String? purchaseGroupId) =>
      _purchaseGroupId = purchaseGroupId;
  String? get purchaseCategoryId => _purchaseCategoryId;
  set purchaseCategoryId(String? purchaseCategoryId) =>
      _purchaseCategoryId = purchaseCategoryId;
  String? get purchaseSubCategoryId => _purchaseSubCategoryId;
  set purchaseSubCategoryId(String? purchaseSubCategoryId) =>
      _purchaseSubCategoryId = purchaseSubCategoryId;
  String? get unitId => _unitId;
  set unitId(String? unitId) => _unitId = unitId;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get arabicName => _arabicName;
  set arabicName(String? arabicName) => _arabicName = arabicName;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get costPrice => _costPrice;
  set costPrice(String? costPrice) => _costPrice = costPrice;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get offerPrice => _offerPrice;
  set offerPrice(String? offerPrice) => _offerPrice = offerPrice;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get code => _code;
  set code(String? code) => _code = code;
  String? get barcode => _barcode;
  set barcode(String? barcode) => _barcode = barcode;
  String? get brandId => _brandId;
  set brandId(String? brandId) => _brandId = brandId;
  String? get qtyIn => _qtyIn;
  set qtyIn(String? qtyIn) => _qtyIn = qtyIn;
  String? get qtyOut => _qtyOut;
  set qtyOut(String? qtyOut) => _qtyOut = qtyOut;
  String? get qtyCurrent => _qtyCurrent;
  set qtyCurrent(String? qtyCurrent) => _qtyCurrent = qtyCurrent;
  String? get stock => _stock;
  set stock(String? stock) => _stock = stock;
  String? get sizeId => _sizeId;
  set sizeId(String? sizeId) => _sizeId = sizeId;
  String? get colorId => _colorId;
  set colorId(String? colorId) => _colorId = colorId;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  String? get finalPrice => _finalPrice;
  set finalPrice(String? finalPrice) => _finalPrice = finalPrice;

  String? get qty => _qty;
  set qty(String? qty) => _qty = qty;

  popularProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _purchaseGroupId = json['purchase_group_id'].toString();
    _purchaseCategoryId = json['purchase_category_id'].toString();
    _purchaseSubCategoryId = json['purchase_sub_category_id'].toString();
    _unitId = json['unit_id'].toString();
    _fullName = json['full_name'].toString();
    _name = json['name'].toString();
    _arabicName = json['arabic_name'].toString();
    _description = json['description'].toString();
    _costPrice = json['cost_price'].toString();
    _price = json['price'].toString();
    _offerPrice = json['offer_price'].toString();
    _startDate = json['start_date'].toString();
    _endDate = json['end_date'].toString();
    _code = json['code'].toString();
    _barcode = json['barcode'].toString();
    _brandId = json['brand_id'].toString();
    _qtyIn = json['qty_in'].toString();
    _qtyOut = json['qty_out'].toString();
    _qtyCurrent = json['qty_current'].toString();
    _stock = json['stock'].toString();
    _sizeId = json['size_id'].toString();
    _colorId = json['color_id'].toString();
    _image = json['image'].toString();
    _createdAt = json['created_at'].toString();
    _updatedAt = json['updated_at'].toString();
    _imageUrl = json['image_url'].toString();
    _finalPrice = json['final_price'].toString();
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'purchaseGroupId': purchaseGroupId,
      'purchaseCategoryId': purchaseCategoryId,
      'purchaseSubCategoryId': purchaseSubCategoryId,
      'unitId': unitId,
      'fullName': fullName,
      'name': name,
      'arabicName': arabicName,
      'description': description,
      'costPrice': costPrice,
      'price': price,
      'offerPrice': offerPrice,
      'startDate': startDate,
      'endDate': endDate,
      'code': code,
      'barcode': barcode,
      'brandId': brandId,
      'qtyIn': qtyIn,
      'qtyOut': qtyOut,
      'qtyCurrent': qtyCurrent,
      'stock': stock,
      'sizeId': sizeId,
      'colorId': colorId,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'imageUrl': imageUrl,
      'finalPrice': finalPrice,
      'qty': qty='1',
    };
  }

  factory popularProductModel.fromMap(Map<String, dynamic> map) {
    return popularProductModel(
      id: map['id'],
      purchaseGroupId: map['purchaseGroupId'],
      purchaseCategoryId: map['purchaseCategoryId'],
      purchaseSubCategoryId: map['purchaseSubCategoryId'],
      unitId: map['unitId'],
      fullName: map['fullName'],
      name: map['name'],
      arabicName: map['arabicName'],
      description: map['description'],
      costPrice: map['costPrice'],
      price: map['price'],
      offerPrice: map['offerPrice'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      code: map['code'],
      barcode: map['barcode'],
      brandId: map['brandId'],
      qtyIn: map['qtyIn'],
      qtyOut: map['qtyOut'],
      qtyCurrent: map['qtyCurrent'],
      stock: map['stock'],
      sizeId: map['sizeId'],
      colorId: map['colorId'],
      image: map['image'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      imageUrl: map['imageUrl'],
      finalPrice: map['finalPrice'],
      qty: map['qty']??'1',
    );
  }
}






