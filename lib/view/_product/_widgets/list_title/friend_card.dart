import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:easy_localization/easy_localization.dart';

class FriendCard extends StatelessWidget {
  final SocialUser? user;
  final VoidCallback? onPressed;
  const FriendCard({Key? key, this.user, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user!.image!),
      ),
      title: Text(user!.name!),
      subtitle: Text(user!.company!),
      trailing: RaisedButton(
        child: Text(
          LocaleKeys.home_social_search.tr(),
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        textColor: context.colors.background,
        color: context.colors.onError,
      ),
    );
  }
}
