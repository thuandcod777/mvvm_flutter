import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/view/_product/_widgets/animation/social_card_animation.dart';
import 'package:mvvm_flutter/view/_product/_widgets/list_title/friend_card.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/viewmodel/social_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) =>
          Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextFindFriend(context),
            buildTextFieldFindFriend(context, viewModel),
            Spacer(flex: 2),
            Expanded(
              flex: 90,
              child: Observer(
                builder: (_) => buildListView(viewModel),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView buildListView(SocialViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.socialUserList.length,
        itemBuilder: (context, index) {
          viewModel.fetchAllUserLoading(index);
          return OpenContainerWrapper(
            socialUser: viewModel.socialUserList[index],
            closedBuilder: (context, action) => FriendCard(
              user: viewModel.socialUserList[index],
              onPressed: action,
            ),
          );
        });
  }

  TextField buildTextFieldFindFriend(
      BuildContext context, SocialViewModel viewModel) {
    return TextField(
      onChanged: (value) {
        viewModel.fetchAllSearchQuery(value);
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
        Icons.search,
        color: context.colors.onSecondary.withOpacity(0.5),
      )),
    );
  }

  Text buildTextFindFriend(BuildContext context) {
    return Text(
      LocaleKeys.home_social_findFriends.tr(),
      style: context.textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.onBackground),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: FlatButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Text(LocaleKeys.home_social_cancel.tr()),
      ),
      actions: [
        FlatButton(
            onPressed: () {}, child: Text(LocaleKeys.home_social_next.tr()))
      ],
    );
  }
}
