import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';
import 'package:flutter_tech_task/core/resources/media_res.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/comment/comment_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/view/widget/comment_widget.dart';
import 'package:lottie/lottie.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postId});

  final int? postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  void getComments() {
    context.read<CommentCubit>().getCommentListData(id: widget.postId!);
  }

  @override
  void initState() {
    super.initState();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.blackTextColor),
        ),
        title: const CustomText(
          text: 'List of Comments',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state is LoadingComment) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MediaRes.loading, height: 40, width: 50),
                  const SizedBox(height: 5),
                  const CustomText(text: 'Processing', fontSize: 14),
                ],
              ),
            );
          }
          if (state is LoadedComments) {
            if (state.comments.isEmpty){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(MediaRes.emptylogo, height: 100, width: 100),
                      const SizedBox(height: 10),
                      const CustomText(text: 'No Comments Yet', fontSize: 14),
                    ],
                  ),
                );
            }
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                return CommentWidget(comment: state.comments[index],);
              }
            );
          }
          return Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(MediaRes.pageUnderConstruction),
            ),
          );
        },
      ),
    );
  }
}
