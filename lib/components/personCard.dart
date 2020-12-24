import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/Person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  PersonCard({this.person});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 8, 15),
      child: Container(
        width: UIConstants.fitToWidth(300, context),
        decoration: BoxDecoration(
            color: Color(0xff494949),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${person.name}',
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16))),
                  Text('Age: ${person.age}',
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 12)))
                ],
              ),
              SizedBox(
                height: UIConstants.fitToHeight(24, context),
              ),
              Text('Affected with: ${person.medicalCondition.name}',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white, fontSize: 16)))
            ],
          ),
        ),
      ),
    );
  }
}
