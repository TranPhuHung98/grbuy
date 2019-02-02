import 'package:bigdeals2/tabs/tabs.dart';
class ListAddress{
  List<Address> listAddress = List<Address>();
  void addAddress(Address address){
    listAddress.add(address);
  }
  List<Address> getList(){
    return listAddress;
  }
  }