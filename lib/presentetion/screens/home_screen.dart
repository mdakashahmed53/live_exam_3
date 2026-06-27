import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liveexam3/models/student_model.dart';
import 'package:liveexam3/presentetion/screens/add_student_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Student'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('student_list').snapshots(),
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasError){
            return Center(child: Text(snapshot.hasError.toString()),);
          }

          List<StudentModel> students = [];

          for(DocumentSnapshot doc in snapshot.data!.docs){
            students.add(StudentModel.fromJson(doc.id, doc.data() as Map<String, dynamic>));
          }

          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index){
                  final student = students[index];
              return Card(

                child: ListTile(
                  title: Text('Student Name :${student.studentName}'),
                  subtitle: Text('Roll: ${student.studentRoll}'),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  ),
                ),
              );
            }),
          );
        }
      ),
      
      
      floatingActionButton: FloatingActionButton(onPressed: _onTapStudentAddScreen, child: Icon(Icons.add),),
    );
  }

  void _onTapStudentAddScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudentScreen()));
  }

  

}
