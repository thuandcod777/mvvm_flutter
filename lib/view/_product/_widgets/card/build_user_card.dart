import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/model/house_model.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';

class BuildUserCard extends StatelessWidget {
  final HouseModel model;

  final isLike;
  final Function(String id)? onPressLikeId;

  const BuildUserCard(
      {Key? key, required this.model, this.onPressLikeId, this.isLike = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(model.image!),
          ),
          title: Text(model.user!.name!),
          subtitle: Text(model.user!.date!),
          trailing: buildIconButton(),
        ),
        Text(
          model.title!,
          style: context.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        buildWrap(context)
      ],
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      icon: Icon(Icons.favorite, color: isLike ? Colors.pink : Colors.white),
      onPressed: () {
        if (onPressLikeId != null) {
          onPressLikeId!(model.id!);
        }
      },
    );
  }

  Wrap buildWrap(BuildContext context) {
    return Wrap(
      children: [
        AutoSizeText(
          model.title!,
          style: context.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w500),
          maxLines: 1,
        ),
        Text(model.description!)
      ],
    );
  }
}
