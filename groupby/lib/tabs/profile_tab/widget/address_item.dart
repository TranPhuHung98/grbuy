import 'package:bigdeals2/tabs/tabs.dart';

class AddressItem extends StatefulWidget {
  Address address;
  AddressItem(this.address);
  @override
  AddressItemState createState() {
    // TODO: implement createState
    return AddressItemState();
  }
}

class AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: ListTile(
        title:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Receiver : ${widget.address.receiver}',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
              Text('Phone number : ${widget.address.phone_number}',style: TextStyle(fontSize: 13),),
              Text('Location : ${widget.address.location}',style: TextStyle(fontSize: 13),),
              Divider()
            ],
          ),
      ),
      // child: Card(
      //   child: InkWell(
      //     onTap: null,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Text('Receiver : ${widget.address.receiver}',
      //             style: TextStyle(fontWeight: FontWeight.bold)),
      //         Text('Phone number : ${widget.address.phone_number}'),
      //         Text('Location : ${widget.address.location}'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
