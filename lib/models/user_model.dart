import 'package:grocery_onlineapp/models/address_model.dart';

class UserModel {
  String name, email, uid, phoneNumber, photoUrl, officePhoneNumber;
  double moneySaved, moneySpent;
  List<AddressModel> address;
  int orders;

  UserModel(
      {this.name,
      this.officePhoneNumber,
      this.email,
      this.address,
      this.uid,
      this.phoneNumber,
      this.photoUrl,
      this.orders,
      this.moneySaved,
      this.moneySpent});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
    officePhoneNumber = json['office_phone_number'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
    if (json['address'] != null) {
      address = [];
    }
    json['address'].forEach((v) {
      address.add(v);
    });
    moneySpent = json['money_spent'];
    moneySaved = json['money_saved'];
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['uid'] = this.uid;
    data['phone_number'] = this.phoneNumber;
    data['office_phone_number'] = this.officePhoneNumber;
    data['photo_url'] = this.photoUrl;
    data['money_spent'] = this.moneySpent;
    data["address"] = this.address;
    data['money_saved'] = this.moneySaved;
    data['orders'] = this.orders;
    return data;
  }
}
