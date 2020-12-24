import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/Person.dart';

class SelectPersonCard extends StatelessWidget {
  final Person person;
  final Color selectedColor;
  final bool tapped;
  SelectPersonCard({this.person, this.selectedColor, this.tapped});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
      child: Container(
        width: UIConstants.fitToWidth(300, context),
        decoration: BoxDecoration(
            color: tapped ? selectedColor : Color(0xff494949),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, -2),
                  blurRadius: 2,
                  color: Colors.white.withOpacity(0.25)),
              BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.white.withOpacity(0.25))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${person.name}',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 16))),
              Text('${person.age}',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white, fontSize: 14))),
            ],
          ),
        ),
      ),
    );
  }
}
