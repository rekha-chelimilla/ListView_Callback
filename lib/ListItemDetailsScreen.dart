import 'package:flutter/material.dart';

class EmployeeDetails {
  String? name;
  String? email;
  String? technology;

  EmployeeDetails({this.name, this.email, this.technology});
}

class ListItemDetails extends StatefulWidget {
  const ListItemDetails({Key? key}) : super(key: key);

  @override
  ListItem createState() => ListItem();
}

class ListItem extends State<ListItemDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController technologyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Item Add"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Name'),
                  controller: nameController,
                  validator: (value) {
                    final v = value ?? "";
                    if (v.isEmpty) {
                      //value!.isEmpty
                      return "Please Enter Name";
                    }
                    return null;
                  }),
            ),
            //email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'email'),
                  controller: emailController,
                  validator: (value) {
                    final v = value ?? "";
                    if (v.isEmpty) {
                      //value!.isEmpty
                      return "Please Enter Email";
                    } else if (!isValidEmail(v)) {
                      return "Please Enter Valid Email Address";
                    }
                    return null;
                  }),
            ),

            //technology
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Technology'),
                  controller: technologyController,
                  validator: (value) {
                    final v = value ?? "";
                    if (v.isEmpty) {
                      //value!.isEmpty
                      return "Please Enter technology";
                    }
                    return null;
                  }),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(
                    context,
                    EmployeeDetails(
                        name: nameController.text,
                        email: emailController.text,
                        technology: technologyController.text),
                  );
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }
}
