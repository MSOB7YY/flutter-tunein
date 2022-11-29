import 'package:flutter_tunein_attempt3/plugins/NotificationControlService.dart';
import 'package:flutter_tunein_attempt3/services/castService.dart';
import 'package:flutter_tunein_attempt3/services/fileService.dart';
import 'package:flutter_tunein_attempt3/services/http/httpRequests.dart';
import 'package:flutter_tunein_attempt3/services/http/requests.dart';
import 'package:flutter_tunein_attempt3/services/http/utilsRequests.dart';
import 'package:flutter_tunein_attempt3/services/languageService.dart';
import 'package:flutter_tunein_attempt3/services/layout.dart';
import 'package:flutter_tunein_attempt3/services/memoryCacheService.dart';
import 'package:flutter_tunein_attempt3/services/musicMetricsService.dart';
import 'package:flutter_tunein_attempt3/services/musicService.dart';
import 'package:flutter_tunein_attempt3/services/isolates/musicServiceIsolate.dart';
import 'package:flutter_tunein_attempt3/services/platformService.dart';
import 'package:flutter_tunein_attempt3/services/queueService.dart';
import 'package:flutter_tunein_attempt3/services/settingService.dart';
import 'package:flutter_tunein_attempt3/services/sideDrawerService.dart';
import 'package:flutter_tunein_attempt3/services/themeService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = new GetIt();

void setupLocator() {
  locator.registerSingleton(MemoryCacheService());
  locator.registerSingleton(fileService());
  locator.registerSingleton(PlatformService());
  locator.registerSingleton(musicServiceIsolate());
  locator.registerSingleton(notificationControlService());
  locator.registerSingleton(settingService());
  locator.registerSingleton(CastService());
  locator.registerSingleton(MusicMetricsService());
  locator.registerSingleton(ThemeService());
  locator.registerSingleton(QueueService());
  locator.registerSingleton(MusicService());

  locator.registerSingleton(LayoutService());
  locator.registerSingleton(SideDrawerService());

  locator.registerSingleton(languageService());
  locator.registerSingleton(httpRequests());
  locator.registerSingleton(Requests());
  locator.registerSingleton(UtilsRequests());
}
