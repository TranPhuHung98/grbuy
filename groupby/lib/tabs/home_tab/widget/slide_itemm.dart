import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class SliderImage extends StatefulWidget {
  FetchSlide slide = FetchSlide();
  _SliderImageState createState() => new _SliderImageState();
}

class _SliderImageState extends State<SliderImage>
    with SingleTickerProviderStateMixin {
  List<Slide> _slide = List();
  _loadSlide() async {
    var nextSlide = await widget.slide.fetchUiSlide();
    setState(() {
      _slide.addAll(nextSlide);
    });
  }

  initState() {
    super.initState();
    _loadSlide();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = new Carousel(
      dotSize: 5.0,
      dotSpacing: 10.0,
      dotBgColor: Colors.white.withOpacity(0.0),
      overlayShadow: false,
      boxFit: BoxFit.cover,
      images: _slide.map((url) => NetworkImage(url.source)).toList(),
    );
    return new Container(
      height: 175.0,
      child: carousel,
    );
  }

  dispose() {
    super.dispose();
  }
}
