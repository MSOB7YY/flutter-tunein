import 'package:flutter_tunein_attempt3/components/pagenavheaderitem.dart';
import 'package:flutter_tunein_attempt3/globals.dart';
import 'package:flutter_tunein_attempt3/services/layout.dart';
import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter_tunein_attempt3/values/lists.dart';
import 'package:flutter/material.dart';

class PageNavHeader extends StatefulWidget {
  final int pageIndex;

  PageNavHeader({super.key, required this.pageIndex});

  _PageNavHeaderState createState() => _PageNavHeaderState();
}

class _PageNavHeaderState extends State<PageNavHeader> {
  final layoutService = locator<LayoutService>();

  @override
  PageNavHeader get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.darkBlack,
      height: 50,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 53),
          ),
          Expanded(
            child: ListView.builder(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width),
              physics: NeverScrollableScrollPhysics(),
              controller:
                  layoutService.pageServices[widget.pageIndex].headerController,
              scrollDirection: Axis.horizontal,
              itemCount: headerItems[widget.pageIndex]!.length,
              itemBuilder: (context, int index) {
                var items = headerItems[widget.pageIndex];
                // if (index == items.length) {
                //   return Container(
                //     width: 2000,
                //   );
                // }
                return PageTitle(
                  pageIndex: widget.pageIndex,
                  index: index,
                  key: items![index].value,
                  title: items[index].key.toUpperCase(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
