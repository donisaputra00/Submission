import 'package:flutter/material.dart';
import 'package:submission/preferences/preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    List<DataItem> dataItem = [
      const DataItem(
        title: 'Schedule',
        desc:
            'Easily schedule event/games  then find like minded players for battle. You up for it?',
        image: AssetPath.illOnboard1,
      ),
      const DataItem(
        title: 'Statistics',
        desc: 'All data from previous and upcoming games can be found here ',
        image: AssetPath.illOnboard2,
      ),
      const DataItem(
        title: 'Discover  Combats',
        desc:
            'Find out what’s new and compete among players with new challenges and earn cash with game points',
        image: AssetPath.illHome3,
      ),
      const DataItem(
        title: 'Message Players',
        desc:
            'Found the profile of a player that interests you? Start a conversation',
        image: AssetPath.illHome4,
      ),
      const DataItem(
        title: 'Schedule',
        desc:
            'Easily schedule event/games  then find like minded players for battle. You up for it?',
        image: AssetPath.illOnboard1,
      ),
      const DataItem(
        title: 'Statistics',
        desc: 'All data from previous and upcoming games can be found here ',
        image: AssetPath.illOnboard2,
      ),
      const DataItem(
        title: 'Discover  Combats',
        desc:
            'Find out what’s new and compete among players with new challenges and earn cash with game points',
        image: AssetPath.illHome3,
      ),
      const DataItem(
        title: 'Message Players',
        desc:
            'Found the profile of a player that interests you? Start a conversation',
        image: AssetPath.illHome4,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightColor,
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    AssetPath.avatar,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: AppTexStyle.subTitle.copyWith(
                color: AppColors.darkColor,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(
                  Icons.logout,
                  color: AppColors.darkColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return itemList(context, dataItem);
          } else {
            return itemGrid(context, dataItem);
          }
        },
      ),
    );
  }

  Widget itemList(BuildContext context, List<DataItem> dataItem) {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: dataItem
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: AppTexStyle.subTitle.copyWith(color: AppColors.lightColor),
                            ),
                            Text(
                              e.desc,
                              style: AppTexStyle.desc.copyWith(color: AppColors.lightColor),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.lightColor,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        e.image,
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget itemGrid(BuildContext context, List<DataItem> dataItem) {
    return GridView.count(
      primary: true,
      childAspectRatio: 2.7,
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: dataItem.map((data) {
        return Card(
          color: AppColors.primaryColor,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: AppTexStyle.subTitle
                            .copyWith(color: AppColors.lightColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.desc,
                        style: AppTexStyle.desc.copyWith(
                          color: AppColors.lightColor,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.lightColor,
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                data.image,
                height: 120,
                fit: BoxFit.cover,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class DataItem {
  final String title;
  final String desc;
  final String image;

  const DataItem({
    required this.title,
    required this.desc,
    required this.image,
  });
}
