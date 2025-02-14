import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.post, this.onTap});

  final Post? post;
  final VoidCallback? onTap;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: widget.post?.title ?? '',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: widget.post?.body ?? '',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            Container(height: 10),
            const Divider(thickness: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
