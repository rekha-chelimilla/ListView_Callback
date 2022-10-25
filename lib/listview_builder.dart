import 'package:flutter/material.dart';
import 'AddDetailsScreen.dart';

class Employee extends StatelessWidget {
  const Employee(
      {super.key, required this.employeeDetails, required this.callBackValue});
  final EmployeeDetails employeeDetails;
  final Function(EmployeeDetails employeeDetails) callBackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackValue(employeeDetails);
      },
      child: ListTile(
        title: Text("${employeeDetails.name}"),
        subtitle: Text("${employeeDetails.email}"),
        trailing: Text("${employeeDetails.technology}"),
      ),
    );
  }
}
