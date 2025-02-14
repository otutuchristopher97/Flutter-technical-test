import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment? comment;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: widget.comment?.name ?? '',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: widget.comment?.email ?? '',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            text: widget.comment?.body ?? '',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          Container(height: 10),
          const Divider(thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
