import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';

class NasaPage extends StatefulWidget {
  @override
  _NasaPageState createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {
  Widget gridView(context) {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 50,
      crossAxisSpacing: 50,
      crossAxisCount: 2,
      children: [
        menuBlock('assets/images/earthquake.png', 'Earthquake', onTap: () {}),
        menuBlock('assets/images/tsunami.png', 'Tsunami', onTap: () {}),
        menuBlock('assets/images/landslide.png', 'Landslide', onTap: () {}),
        menuBlock('assets/images/flood.png', 'Flood', onTap: () {})
      ],
    );
  }

  Widget menuBlock(String asset, String title, {VoidCallback onTap}) {
    onTap ??= () {};
    return Container(
      height: UIConstants.fitToHeight(125, context),
      width: UIConstants.fitToWidth(125, context),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Color(0xff707070)),
          gradient: LinearGradient(
            colors: <Color>[Color(0xffFDC830), Color(0xffF37335)],
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          splashColor: Color(0xffFDC830),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('$asset'),
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: UIConstants.fitToHeight(640, context),
          width: UIConstants.fitToWidth(360, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: UIConstants.fitToHeight(50, context)),
                child: Text('SELECT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffF47216),
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: UIConstants.fitToHeight(60.0, context),
                    left: UIConstants.fitToWidth(30, context),
                    right: UIConstants.fitToWidth(30, context)),
                child: gridView(context),
              )
            ],
          )),
    );
  }
}
