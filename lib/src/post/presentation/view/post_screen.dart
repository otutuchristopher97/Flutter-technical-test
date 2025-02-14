import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/resources/media_res.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/offline_post/offline_post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/post/post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/view/widget/post_widget.dart';
import 'package:lottie/lottie.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? dataType;

  void getPosts() {
    context.read<PostCubit>().getPostListData();
  }

  @override
  void initState() {
    super.initState();
    dataType = 'online';
    final postState = context.read<PostCubit>().state;
    if (postState is! LoadedPosts) {
      getPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const CustomText(
          text: 'List of Posts',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<PostCubit>().getPostListData();
                  setState(() {
                    dataType = 'online';
                  });
                },
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color:
                        dataType == 'online'
                            ? AppColors.successColorSwatch.shade700
                            : AppColors.transparentColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.primaryColorSwatch.shade200,
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Original Post',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color:
                          dataType == 'online'
                              ? AppColors.whiteTextColor
                              : AppColors.blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  context.read<OfflinePostCubit>().fetchOfflinePosts();
                  setState(() {
                    dataType = 'offline';
                  });
                },
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color:
                        dataType == 'offline'
                            ? AppColors.successColorSwatch.shade700
                            : AppColors.transparentColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.primaryColorSwatch.shade200,
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Offline Post',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color:
                          dataType == 'offline'
                              ? AppColors.whiteTextColor
                              : AppColors.blackTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if(dataType == 'online')
          BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is LoadingPost) {
                return Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MediaRes.loading, height: 40, width: 50),
                        const SizedBox(height: 5),
                        const CustomText(text: 'Processing', fontSize: 14),
                      ],
                    ),
                  ),
                );
              }
              if (state is LoadedPosts) {
                if (state.posts.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MediaRes.emptylogo,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(text: 'No Post Yet', fontSize: 14),
                        ],
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(post: state.posts[index]);
                    },
                    padding: const EdgeInsets.all(10),
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
          if(dataType == 'offline')
          BlocBuilder<OfflinePostCubit, OfflinePostState>(
            builder: (context, state) {
              if (state is LoadingPost) {
                return Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MediaRes.loading, height: 40, width: 50),
                        const SizedBox(height: 5),
                        const CustomText(text: 'Processing', fontSize: 14),
                      ],
                    ),
                  ),
                );
              }
              if (state is LoadedOfflinePosts) {
                if (state.posts.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MediaRes.emptylogo,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(text: 'No Post Yet', fontSize: 14),
                        ],
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return PostWidget(post: state.posts[index]);
                    },
                    padding: const EdgeInsets.all(10),
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
        ],
      ),
    );
  }
}
