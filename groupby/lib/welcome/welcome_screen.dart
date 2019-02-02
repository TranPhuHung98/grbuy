import 'package:flutter/material.dart';
import 'package:bigdeals2/welcome/walkthrough.dart';
import 'package:bigdeals2/main.dart';

class WelcomeScreen extends StatefulWidget{

  @override
  WelcomeScreenState createState() {
    return WelcomeScreenState();
  }
}
class WelcomeScreenState extends State<WelcomeScreen>{
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 6,
            child: PageView(
              children: <Widget>[
                WalkThrough(
                  title: "page1",
                  content: "Trang 1",
                  imageIcon: Icons.search,
                ),
                WalkThrough(
                  title: "page2",
                  content: "Trang 2",
                  imageIcon: Icons.shopping_cart,
                ),
                WalkThrough(
                  title: "page3",
                  content: "Trang 3",
                  imageIcon: Icons.smoke_free,
                ),
                WalkThrough(
                  title: "page4",
                  content: "Trang 4",
                  imageIcon: Icons.style,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text(lastPage ? "" : "SKIP",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                      onPressed: () =>
                      lastPage ? null : Navigator.of(context).pushReplacementNamed('/'),
                    ),
                    FlatButton(
                      child: Text(lastPage ? "GOT IT" : "NEXT",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0)),
                      onPressed: () => lastPage ? Navigator.of(context).pushReplacementNamed('/') : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                    )
                  ]
              )
          )
        ],
      ),
    );
  }

}