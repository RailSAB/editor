import 'package:editor/UI/Requests/widgets/request_widget.dart';
import 'package:editor/providers/request_provider.dart';
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  final List<RequestViewModel> requests;

  RequestList({super.key, required this.requests});

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea (
      top: true,
      child: ListView.builder(
        itemCount: widget.requests.length,
        itemBuilder: (context, index) {
          return RequestWidget(request: widget.requests[index]);
        },
    )
    );
  }

}