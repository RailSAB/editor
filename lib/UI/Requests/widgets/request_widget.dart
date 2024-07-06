import 'package:editor/providers/request_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestWidget extends StatefulWidget {
  final RequestViewModel request;

  RequestWidget({super.key, required this.request});

  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.request.text),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/request_answering', arguments: widget.request);
            }, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {
              closeRequest(widget.request.id, context);
            }, icon: Icon(Icons.close)),
          ],
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 16, 31, 24),
        ),
      ],
    );
  }


  void closeRequest(String id, BuildContext context) async {
    try{
      await context.read<RequestListViewModel>().removeRequest(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request closed successfully!')),
      );
    }catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to close question')),
      );
    }
  }
}