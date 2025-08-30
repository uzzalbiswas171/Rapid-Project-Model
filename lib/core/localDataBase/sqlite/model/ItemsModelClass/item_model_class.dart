// class ItemModelClass {
//   final String? id;
//   final String? purchaseGroupId;
//   final String? purchaseCategoryId;
//   final String? purchaseSubCategoryId;
//   final String? unitId;
//   final String? fullName;
//   final String? name;
//   final String? arabicName;
//   final String? description;
//   final String? costPrice;
//   final String? price;
//   final String? offerPrice;
//   final String? startDate;
//   final String? endDate;
//   final String? code;
//   final String? barcode;
//   final String? brandId;
//   final String? qtyIn;
//   final String? qtyOut;
//   final String? qtyCurrent;
//   final String? stock;
//   final String? sizeId;
//   final String? colorId;
//   final String? image;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? imageUrl;
//   final String? finalPrice;
//
//   ItemModelClass({
//     this.id,
//     this.purchaseGroupId,
//     this.purchaseCategoryId,
//     this.purchaseSubCategoryId,
//     this.unitId,
//     this.fullName,
//     this.name,
//     this.arabicName,
//     this.description,
//     this.costPrice,
//     this.price,
//     this.offerPrice,
//     this.startDate,
//     this.endDate,
//     this.code,
//     this.barcode,
//     this.brandId,
//     this.qtyIn,
//     this.qtyOut,
//     this.qtyCurrent,
//     this.stock,
//     this.sizeId,
//     this.colorId,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.imageUrl,
//     this.finalPrice,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'purchaseGroupId': purchaseGroupId,
//       'purchaseCategoryId': purchaseCategoryId,
//       'purchaseSubCategoryId': purchaseSubCategoryId,
//       'unitId': unitId,
//       'fullName': fullName,
//       'name': name,
//       'arabicName': arabicName,
//       'description': description,
//       'costPrice': costPrice,
//       'price': price,
//       'offerPrice': offerPrice,
//       'startDate': startDate,
//       'endDate': endDate,
//       'code': code,
//       'barcode': barcode,
//       'brandId': brandId,
//       'qtyIn': qtyIn,
//       'qtyOut': qtyOut,
//       'qtyCurrent': qtyCurrent,
//       'stock': stock,
//       'sizeId': sizeId,
//       'colorId': colorId,
//       'image': image,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'imageUrl': imageUrl,
//       'finalPrice': finalPrice,
//     };
//   }
//
//   factory ItemModelClass.fromMap(Map<String, dynamic> map) {
//     return ItemModelClass(
//       id: map['id'],
//       purchaseGroupId: map['purchaseGroupId'],
//       purchaseCategoryId: map['purchaseCategoryId'],
//       purchaseSubCategoryId: map['purchaseSubCategoryId'],
//       unitId: map['unitId'],
//       fullName: map['fullName'],
//       name: map['name'],
//       arabicName: map['arabicName'],
//       description: map['description'],
//       costPrice: map['costPrice'],
//       price: map['price'],
//       offerPrice: map['offerPrice'],
//       startDate: map['startDate'],
//       endDate: map['endDate'],
//       code: map['code'],
//       barcode: map['barcode'],
//       brandId: map['brandId'],
//       qtyIn: map['qtyIn'],
//       qtyOut: map['qtyOut'],
//       qtyCurrent: map['qtyCurrent'],
//       stock: map['stock'],
//       sizeId: map['sizeId'],
//       colorId: map['colorId'],
//       image: map['image'],
//       createdAt: map['createdAt'],
//       updatedAt: map['updatedAt'],
//       imageUrl: map['imageUrl'],
//       finalPrice: map['finalPrice'],
//     );
//   }
// }
//
//
// /// ------------------------- -------------- ///