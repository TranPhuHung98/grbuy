class Address {
  String receiver ;
  String location ;
  String phone_number;
  Address({this.receiver,this.location,this.phone_number});
  factory Address.internalFromJson(Map jsonMap) {
    return Address(
      receiver: jsonMap["receiver"] as String ,
      location : jsonMap["location"] as String ,
      phone_number:  jsonMap["phone_number"] as String 
     );
  }
}