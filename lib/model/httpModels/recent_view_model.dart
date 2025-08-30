

class RecentViewItemList {
  int? _id;
  int? _customerId;
  int? _purchaseItemId;
  String? _createdAt;

  RecentViewItemList({int? id, int? customerId, int? purchaseItemId, String? createdAt}) {
    if (id != null) {
      this._id = id;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (purchaseItemId != null) {
      this._purchaseItemId = purchaseItemId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  int? get purchaseItemId => _purchaseItemId;
  set purchaseItemId(int? purchaseItemId) => _purchaseItemId = purchaseItemId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  RecentViewItemList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _purchaseItemId = json['purchase_item_id'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customer_id'] = this._customerId;
    data['purchase_item_id'] = this._purchaseItemId;
    data['created_at'] = this._createdAt;
    return data;
  }
}
