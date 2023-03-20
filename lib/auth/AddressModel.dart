class AddressModel {
  String address="";
  String state="";
  String city="";
  String district="";
  String pinCode="";

  @override
  String toString() {
    return "$address, $city, $district, $state, $pinCode";
  }
}