import 'package:flutter_tunein_attempt3/components/bottomPanel.dart';
import 'package:flutter_tunein_attempt3/components/playing.dart';
import 'package:flutter_tunein_attempt3/globals.dart';
import 'package:flutter_tunein_attempt3/plugins/nano.dart';
import 'package:flutter_tunein_attempt3/root.dart';
import 'package:flutter_tunein_attempt3/services/layout.dart';
import 'package:flutter_tunein_attempt3/services/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'services/locator.dart';
import 'services/languageService.dart';

Nano nano = Nano();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  PermissionStatus permission = await Permission.storage.request();
  print(permission);
  setupLocator();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  //final LanguageService = locator<languageService>();
  @override
  Widget build(BuildContext context) {
    //LanguageService.flutterI18nDelegate.load(null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tune In Music Player",
      localizationsDelegates: [
        //LanguageService.flutterI18nDelegate,
      ],
      home: Wrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Root(),
            ),
            Container(
              height: 60,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;

  final layoutService = locator<LayoutService>();

  Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel:
          NowPlayingScreen(controller: layoutService.albumPlayerPageController),
      controller: layoutService.globalPanelController,
      minHeight: 60,
      maxHeight: MediaQuery.of(context).size.height,
      backdropEnabled: true,
      backdropOpacity: 0.5,
      parallaxEnabled: true,
      onPanelClosed: () {
        layoutService.albumPlayerPageController.jumpToPage(1);
      },
      onPanelSlide: (value) {
        if (value >= 0.3) {
          layoutService.onPanelOpen(value);
        }
      },
      collapsed: Material(
        child: BottomPanel(),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tune In Music Player",
        color: MyTheme.darkRed,
        home: child,
      ),
    );
  }
}
