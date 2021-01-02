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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: UIConstants.fitToHeight(20, context)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'List of Items for you',
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(color: Color(0xffFFFFFFF), fontSize: 16)),
                ),
              ),
              SizedBox(height: UIConstants.fitToHeight(32, context)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Basic',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xffF37335),
                            fontSize: 18,
                            fontWeight: FontWeight.w700))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 2, color: Color(0xff494949)),
              ),
              DataTable(
                columnSpacing: UIConstants.fitToHeight(170, context),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Item',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Qty',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Medical',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xffF37335),
                            fontSize: 18,
                            fontWeight: FontWeight.w700))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 2, color: Color(0xff494949)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Item ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text('Description',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: persons.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, bottom: 16),
                                  child: Text(
                                    '${persons[index].medicalCondition.name}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      //height: UIConstants.fitToHeight(500, context),
                      width: UIConstants.fitToWidth(75, context),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: persons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16, right: 20),
                                    child: Text(
                                      '${persons[index].medicalCondition.description[0]}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    )
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
