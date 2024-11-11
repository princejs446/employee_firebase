import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_firebase/database.dart';
import 'package:employee_firebase/employee.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   TextEditingController namecontroller=TextEditingController();
  TextEditingController agecontroller=TextEditingController();
  TextEditingController locationcontroller=TextEditingController();

  Stream<QuerySnapshot>? EmployeeStream;

  getontheload() async {
    // Assuming Database.getEmployeeDetails() returns a Stream<QuerySnapshot>
    EmployeeStream = await Database.getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder<QuerySnapshot>(
      stream: EmployeeStream, // stream here cannot be null anymore
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No employee data available.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                       
                        children: [
                          Text(
                            "Name: " + (ds['Name'] ?? 'N/A'), // Null-aware operator
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                             namecontroller.text=ds["Name"];
                              agecontroller.text=ds["Age"];
                              locationcontroller.text=ds["location"];
                              EditEmployeeDetails(ds["Id"]);
                            },
                            child:Icon(Icons.edit,color:Colors.orange)),
                            SizedBox(width:5),
                            GestureDetector(
                              onTap: ()async{
                              await Database.deleteEmployeeDetails(ds["Id"]);

                              },
                              child: Icon(Icons.delete,color:Colors.red,)),
                        ],
                      ),
                      Text(
                        "Age: " + (ds['Age'] ?? 'N/A').toString(), // Ensure non-null
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Location: " + (ds['location'] ?? 'N/A'), // Null-aware operator
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter firebase"),),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetails()), // Displays the employee details stream
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>EmployeeForm()));
      },
      child: Text("+"),),
    );

  }

  Future EditEmployeeDetails(String id)=>showDialog(context: context, builder: (context)=>AlertDialog(
content:Container(
  child: Column(
    children: [
      Row(
        children: [
          
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel)),
            SizedBox(width:60),
            Text("Edit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text("Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange)),
          ],

      ),
      Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height:8),
          SizedBox(
            height:50,
            width:300,
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))),)),
             SizedBox(height:8),
            Text("Age",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height:8),
          SizedBox(
            height:50,
            width:300,
            child: TextField(
              controller:agecontroller,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))),)),

             SizedBox(height:8),
              Text("Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height:8),
          SizedBox(
            height:50,
            width:300,
            child: TextField(
              controller: locationcontroller,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))),)),
  SizedBox(height:65),
  ElevatedButton(onPressed: () async {
    Map<String,dynamic> updateInfo={
      "Name":namecontroller.text,
      "Age":agecontroller.text,
      "Id":id,
      "location":locationcontroller.text,

    };
    await Database.updateEmployeeDetails(id, updateInfo).then((value){
      Navigator.pop(context);
    });
  }, child: Text("Update")),
    ],
  ),
),
  ));

}
