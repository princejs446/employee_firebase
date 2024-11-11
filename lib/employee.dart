import 'package:employee_firebase/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {

  TextEditingController namecontroller=TextEditingController();
    TextEditingController agecontroller=TextEditingController();
      TextEditingController locationcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Form"),),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
               Text("Age"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: agecontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),
              SizedBox(height:10),
               Text("Location"),
            SizedBox(height:10),
            SizedBox(
              height:40,
              width:300,
              child: TextField(
                controller: locationcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),)),

              SizedBox(height:45),
              SizedBox(
                height: 40,
                width:400,
                child: ElevatedButton(
      style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: ()async {
        String Id=randomAlphaNumeric(10);
        Map<String,dynamic> employeeInfoMap={
          "Name":namecontroller.text,
          "Age":agecontroller.text,
          "Id":Id,
          "location":locationcontroller.text,

        };
        await Database.addEmployeeDetails(employeeInfoMap,Id);
       showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text("Employee details added successfully"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('OK'),
        ),
      ],
    );
  },
);

      }, child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),),),

          ],
        ),
      )
    );
  }
}