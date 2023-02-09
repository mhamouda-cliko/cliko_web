import 'package:cliko_web/firebase/firebase_utils.dart';
import 'package:cliko_web/models/user.dart';
import 'package:cliko_web/ui/dashboard/table.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class UsersSection extends StatefulWidget {
  const UsersSection({Key? key}) : super(key: key);

  @override
  State<UsersSection> createState() => _UsersSectionState();
}

class _UsersSectionState extends State<UsersSection> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Users 6",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(37, 56, 89, 1.0)),
                    onPressed: () {
                      MyUserAdmin myUserAdmin = MyUserAdmin(
                          name: "MOhamed $counter",
                          role: "Admin",
                          email: "mhamouda@cliko.store",
                          activity: DateTime.now().millisecondsSinceEpoch);
                      FirebaseUtils.addUserToFirestore(myUserAdmin);
                      counter++;
                    },
                    child: Row(
                      children: [Icon(Icons.add), Text("Add User")],
                    ))
              ],
            ),
            Text(
              "View,Filter and Manage your sites users",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            StreamBuilder<QuerySnapshot<MyUserAdmin>>(
              stream: FirebaseUtils.getUserFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                var userData =
                    snapshot.data?.docs.map((e) => e.data()).toList();
                return DataTable(
                    headingRowColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Color.fromRGBO(37, 56, 89, 1.0);
                    }),
                    checkboxHorizontalMargin: 30,
                    showCheckboxColumn: true,
                    clipBehavior: Clip.antiAlias,
                    headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    headingRowHeight: 30,
                    showBottomBorder: true,
                    columns: [
                      DataColumn2(label: Text('Name'), size: ColumnSize.L),
                      DataColumn(
                        label: Text('Role'),
                      ),
                      DataColumn(
                        label: Text('Email'),
                      ),

                      DataColumn(
                        label: Text('Activity'),
                      ),
                      DataColumn(
                        label: Text('Actions'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        userData?.length ?? 0,
                        (index) => DataRow(cells: [
                              DataCell(Text(userData![index].name)),
                              DataCell(Text(userData[index].role)),
                              DataCell(Text(userData[index].email)),

                              DataCell(
                                  Text((changeDate(userData[index].activity)))),
                          DataCell(ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(37, 56, 89, 1.0)
                            ),
                            onPressed: () {
                              FirebaseUtils.deleteUserFromFirebase(userData[index].id);
                            }, child: Text("Delete",style: TextStyle(
                            color: Colors.white
                          ),),)),
                            ])));
              },
            )
          ],
        ),
      ),
    );
  }

  String changeDate(int number) {
    var millis = number;
    var dt = DateTime.fromMillisecondsSinceEpoch(millis);

// 12 Hour format:
    var d12 =
        DateFormat('MM/dd/yyyy, hh:mm a').format(dt); // 12/31/2000, 10:00 PM

// 24 Hour format:
    var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
    return d24;
  }
}
