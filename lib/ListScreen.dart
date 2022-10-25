import 'package:flutter/material.dart';
import 'AddDetailsScreen.dart';
import 'listview_builder.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  List<EmployeeDetails> empDetailsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: empDetailsList.length,
        itemBuilder: (context, index) {
          final empData = empDetailsList[index];

          return Employee(
            employeeDetails: empData,
            callBackValue: (empData) {
              showAlert(empData);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddDetailsScreen()),
          );

          setState(() {
            empDetailsList.add(result);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  showAlert(EmployeeDetails employeeDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${employeeDetails.email} ${employeeDetails.technology}"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              )
            ],
          );
        }); 
  }
}
