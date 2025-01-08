import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'like_cubit.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LikeCubit, bool>(
          builder: (context, isLiked){
            return IconButton(
                onPressed: () {
                  context.read<LikeCubit>().toggleLike();
                },
                icon:   Icon(isLiked ?
                  Icons.favorite : Icons.favorite_border));
          },

        ),
      ),
    );
  }
}
