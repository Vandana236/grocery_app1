import 'package:get/get.dart';
import 'package:grocery_onlineapp/constants/image_constants.dart';
import 'package:grocery_onlineapp/models/address_model.dart';
import 'package:grocery_onlineapp/models/user_model.dart';

class UserProfileController extends GetxController {
  // dummy user
  // TODO: Make current user info observable
  UserModel currentUser = UserModel(
      name: "Md. Rahat Hussain Khan",
      phoneNumber: "+88 1744569665",
      photoUrl: ImageConstants.DUMMY_PROFILE_PICTURE_URL,
      uid: "abcd1234",
      orders: 0,
      moneySaved: 0,
      moneySpent: 0,
      address: [
        AddressModel(
          houseNumber: "Luminous Tower, Flat E2",
          city: "Sheikhghat",
          state: "Sylhet",
          pinCode: "110018",
        ),
        AddressModel(
          houseNumber: "Jhorna Complex",
          city: "Kumarpara",
          state: "Sylhet",
          pinCode: "110018",
        ),
      ],
      email: "mdrahat95@gmail.com",
      officePhoneNumber: "01741 519972");

  void deleteAddress(int index) {
    currentUser.address.removeAt(index);
    update();
  }
}
