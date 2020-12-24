import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/models/Person.dart';

class CheckListScreen extends StatefulWidget {
  final List<Person> persons;
  final String disaster;
  CheckListScreen({this.persons, this.disaster});
  @override
  _CheckListScreenState createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  List<Person> persons;
  String disaster;

  @override
  void initState() {
    super.initState();
    persons = widget.persons;
    disaster = widget.disaster;
    print(persons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Items',
          style: TextStyle(color: Color(0xffF37335)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: UIConstants.fitToHeight(640, context),
        width: UIConstants.fitToWidth(360, context),
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: UIConstants.fitToHeight(20, context)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Items you you',
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: Color(0xffF37335), fontSize: 16)),
                ),
              ),
              SizedBox(height: UIConstants.fitToHeight(48, context)),
              Text('Basic',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xffF37335),
                          fontSize: 18,
                          fontWeight: FontWeight.w700))),
              Divider(thickness: 2, color: Color(0xff494949)),
              DataTable(
                columnSpacing: UIConstants.fitToHeight(170, context),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Item',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Qty',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        'Water',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        'Biscuit',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        'Batteries',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '5',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(
                        'Torch',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: UIConstants.fitToHeight(16, context)),
              Text('Medical',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xffF37335),
                          fontSize: 18,
                          fontWeight: FontWeight.w700))),
              Divider(thickness: 2, color: Color(0xff494949)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text('Item', style: TextStyle(color: Colors.white)),
                    Text('Description', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: persons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('${persons[index].medicalCondition.name}',
                              style: TextStyle(color: Colors.white));
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: persons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                              '${persons[index].medicalCondition.description[0]}',
                              style: TextStyle(color: Colors.white));
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
