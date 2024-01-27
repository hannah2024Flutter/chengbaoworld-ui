import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/pages/app_home/app_home.dart';
import 'package:castleworld/pages/login/login.dart';
import 'package:castleworld/pages/login/prv_agreement.dart';
import 'package:castleworld/pages/login/view.dart';
import 'package:castleworld/pages/mine/mine_store.dart';
import 'package:get/get.dart';

class AppPages {
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
    _pageBuilder(name: AppRoutes.main, page: () => AppHome()),
    _pageBuilder(name: AppRoutes.login, page: () => LoginPage()),
    _pageBuilder(name: AppRoutes.prvAgreemeet, page: () => PrvAgreement()),
    _pageBuilder(name: AppRoutes.mineStore, page: () => const MineStore()),
  ];
}
