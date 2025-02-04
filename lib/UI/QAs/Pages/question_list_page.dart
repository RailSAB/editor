import 'package:editor/UI/QAs/Pages/Widgets/question_list.dart';
import 'package:editor/providers/qna_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({super.key});

  @override
  _QuestionListPageState createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {


  @override
  void initState() {
    super.initState();
    Provider.of<QuestionListViewModel>(context, listen: false).fetchQuestions();
  }

  Widget _buildUI(List<QuestionViewModel> questions) {
    if(questions.isEmpty){
    return const Center(child: Text('No questions found'));
  }else{
    return QuestionList(questions: questions);
  }
  }


  Widget _buildButton(){
    return FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 206, 72, 10),
        onPressed: () {
          Navigator.pushNamed(context, '/question_creation');
        },
        child: const Icon(Icons.add),
      );
  }


  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 206, 72, 10),
        title: const Text(
          'Questions', 
          style: TextStyle(
            fontSize: 22, 
            fontWeight: FontWeight.bold, 
            color: Colors.white)
        ),
        centerTitle: true,
        elevation: 2,
      );
  }


  @override
  Widget build(BuildContext context) {
    var questions = context.watch<QuestionListViewModel>().questions;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildUI(questions),
      floatingActionButton: _buildButton(),
    );
  }
  
  
}
