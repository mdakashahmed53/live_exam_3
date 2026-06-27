import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liveexam3/models/student_model.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  bool isStudentAddProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 13,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Student Name',
                labelText: 'Enter your name'
              ),
            ),

            TextFormField(
              controller: rollController,
              decoration: InputDecoration(
                  hintText: 'Student Roll',
                  labelText: 'Enter your Roll'
              ),
            ),
            
            ElevatedButton(onPressed: _onTapAddStudent, child: Text('Add Student'))

          ],
        ),
      ),
    );
  }

  void _onTapAddStudent()async{
    StudentModel student = StudentModel(studentName: nameController.text, studentRoll: int.parse(rollController.text));

    try{
      setState(() {
        isStudentAddProgress = true;
      });
      await FirebaseFirestore.instance.collection('student_list').add(student.toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Student Added')));
      Navigator.pop(context);
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));

    } finally{
      setState(() {
        isStudentAddProgress = false;
      });
    }
  }
}
