import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/Utils.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              getImgPath('bg_login_appbar'),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text(
                      '《城堡世界》用户协议',
                      style:
                          TextStyle(color: Color(0xff333333), fontSize: 17.sp),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w,bottom: 30.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '''加入和使用《城堡世界》表明您已经阅读并同意本协议您的会员活动会遵从本协议。鉴于《城堡世界》并非是关乎国计民生或者垄断的行业及企业，因此您对本使用协议不认同的，完全可以选择不加入和使用《城堡世界》\n本协议由您与浙江宝成网络科技有限公司共同缔结，具有合同效力。本协议中协议双方合称协议方，浙江宝成网络科技有限公司在协议中亦称为“《城堡世界》”，位于浙江省金华市金义都市新区广渠街1号10号楼。''',
                            style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w600,height: 1.5,fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            '一、协议内容及签署',
                            style: TextStyle(
                                color: Color(0xff333333), height: 1.2, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '''1、本协议内容包括协议正文及所有《城堡世界》已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。除另行明确声明外，任何《城堡世界》及其关联公司提供的服务均受本协议约束。但法律法规另有强制性规定的，依其规定。\n\n 2、您在注册《城堡世界》账户时点击提交“我已阅读并且同意《城堡世界》的使用协议”即视为您接受本协议及各类规则，并同意受其约束。您应当在使用《城堡世界》服务之前认真阅读全部协议内容并确保完全理解协议内容，如您对协议有任何疑问的，应向《城堡世界》咨询。但无论您事实上是否在使用《城堡世界》服务之前认真阅读了本协议内容，只要您注册、正在或者继续使用《城堡世界》服务，则视为接受本协议。\n\n 3、您承诺接受并遵守本协议的约定。如果您不同意本协议的约定，您应立即停止注册程序或停止使用《城堡世界》服务。\n\n 4、《城堡世界》有权根据需要不时地制订、修改本协议及/或各类规则，并以平台公示的方式进行公告。变更后的协议和规则一经在平台公布后，立即自动生效。《城堡世界》的最新的协议和规则以及平台公告可供您随时登录查阅，您也应当经常性的登录查阅最新的协议和规则以及平台公告以了解《城堡世界》最新动态。如您不同意相关变更，应当立即停止使用《城堡世界》服务。您继续使用服务的，即表示您接受经修订的协议和规则。本协议和规则（及其各自的不时修订）条款具有可分割性，任一条款被视为违法、无效、被撤销、变更或因任何理由不可执行，并不影响其他条款的合法性、有效性和可执行性''',
                            style: TextStyle(
                                color: Color(0xFF737373), fontSize: 14.sp, height: 2),
                          ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        ' 二、账户管理',
                        style: TextStyle(
                            color: Color(0xff333333), height: 1.2, fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('''1、申请资格
您应当是具备完全民事权利能力和完全民事行为能力的自然人。若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且《城堡世界》有权注销（永久冻结） 您的《城堡世界》账户，并向您及您的监护人索偿或者追偿。若您不具备前述主体资格，则需要监护人同意您方可注册成为《城堡世界》会员，否则您和您的监护人应承担因此而导致的一切后果，且《城堡世界》有权注销（永久冻结）您的《城堡世界》账户，并向您及您的监护人索偿或者追偿。
《城堡世界》并无能力对您的民事权利能力和民事行为能力进行实质性审查，因此一旦您进行了注册，《城堡世界》可以视为您具备完全民事权利能力和完全民事行为能力。''',
                      style: TextStyle(
                          color: Color(0xFF737373), fontSize: 14.sp, height: 2),
                    ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
