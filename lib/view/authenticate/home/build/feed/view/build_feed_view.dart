import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/view/_product/_widgets/card/build_user_card.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/model/house_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/viewmodel/build_feed_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) =>
          Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(),
        body: DefaultTabController(
            length: 4,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenter()
                  : viewModel.houseModel == null ||
                          viewModel.houseModel!.isEmpty
                      ? Center(child: Text("No Found"))
                      : buildListView(
                          context,
                          viewModel,
                        );
            })),
      ),
    );
  }

  ListView buildListView(BuildContext context, BuildFeedViewModel viewModel) {
    return ListView(
      children: [
        buildTabBar(viewModel),
        SizedBox(
          height: 300.0,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.95),
            itemBuilder: (context, index) =>
                buildStack(context, viewModel.sliderHouse, viewModel),
            itemCount: 3,
          ),
        ),
        buildTextHomeBuildSubtitle(context),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => SizedBox(
            height: context.dynamicHeight(0.22),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child:
                          Image.network(viewModel.houseModel![index].image!)),
                  Expanded(
                    flex: 9,
                    child: BuildUserCard(
                        model: viewModel.houseModel![index],
                        isLike: viewModel.listItem
                            .contains(viewModel.houseModel![index].id)),
                  )
                ],
              ),
            ),
          ),
          itemCount: 3,
          shrinkWrap: true,
        )
      ],
    );
  }

  TabBar buildTabBar(BuildFeedViewModel viewModel) {
    return TabBar(
      indicator: viewModel.helper.circleDecoration,
      indicatorSize: TabBarIndicatorSize.label,
      //isScrollable: true,
      tabs: [
        Tab(
          text: LocaleKeys.home_build_tabbar_tab1.tr(),
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab2.tr(),
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab3.tr(),
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab4.tr(),
        )
      ],
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());

  Text buildTextHomeBuildSubtitle(BuildContext context) {
    return Text(
      LocaleKeys.home_build_subTitle.tr(),
      style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget buildStack(
      BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Stack(
        children: [
          Positioned.fill(bottom: 100.0, child: Image.network(model.image!)),
          Positioned.fill(
            top: 150.0,
            right: 10.0,
            left: 10.0,
            child: Container(
              color: Colors.red[400],
              child: Padding(
                padding: context.paddingLow,
                child: BuildUserCard(
                  model: model,
                  isLike: viewModel.listItem.contains(model.id),
                  onPressLikeId: (id) {
                    viewModel.onLikeItemPressed(id);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.format_align_left),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }
}
