import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/common/widget/custom_elevated_button.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';
import 'package:flutter_tech_task/core/resources/media_res.dart';
import 'package:flutter_tech_task/core/routing/router.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/offline_post/offline_post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/postdetail/post_detail_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.postId});

  final int? postId;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  void getPost() {
    context.read<PostDetailCubit>().getPostDetailData(id: widget.postId!);
  }

  @override
  void initState() {
    super.initState();
    getPost();
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
          text: 'Post details',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocBuilder<PostDetailCubit, PostDetailState>(
        builder: (context, state) {
          if (state is LoadingPostDetail) {
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
          if (state is LoadedPostDetail) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.post.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.post.body,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    height: 50,
                    onPressed: () {
                      context.read<OfflinePostCubit>().addOfflinePost(
                        post: state.post,
                      );
                      Fluttertoast.showToast(
                        msg: "Post added to local db successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.successColor,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    buttonColor: AppColors.successColor,
                    label: 'Save Comment',
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    height: 50,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteConstants.commentscreen,
                        arguments: {'id': state.post.id},
                      );
                    },
                    buttonColor: AppColors.errorColor,
                    label: 'View Comments',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
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
