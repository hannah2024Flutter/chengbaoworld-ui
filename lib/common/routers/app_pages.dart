import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/pages/app_home/app_home.dart';
import 'package:get/get.dart';

class AppPages{
  static _pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
    bool preventDuplicates = true,
  }) =>
      GetPage(
        name: name,
        page: page,
        binding: binding,
        preventDuplicates: preventDuplicates,
        transition: Transition.cupertino,
        popGesture: true,
      );
  static final routes = <GetPage>[
    _pageBuilder(name: AppRoutes.main, page: ()=>AppHome())
  ];
}