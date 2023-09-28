import 'package:flutter/material.dart';
import 'package:hackthon/scan/domain/model/dwe.dart';

class MedicineTile extends StatelessWidget {
  final Medicine post;

  const MedicineTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(post.image),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.name),
              Text(
                '${post.id} mins ago',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
