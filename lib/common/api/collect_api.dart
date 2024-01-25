import '../model/collect/collect.dart';
import '../services/http_service.dart';

class CollectApi {
  //卡牌列表
  static Future collectGetList(
      {required int limit, required int page, required int type}) async {
    var res = await HttpService.to.get('/api/pool/getList',params: {
      'limit':limit,
      'page' : page,
      'type' : Type
    });
    List<CollectModel> categories = [];
    for (var item in res['list']) {
      categories.add(CollectModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.id!.compareTo(b.id as int));
    return categories;
  }

  //卡牌详情
  static Future collectGetDetail({required int id}) async{
   var res = HttpService.to.post('api/pool/getDetail');
   return res;
  }
  //卡牌下单
  static Future collectBuy({required int id}) async{
    var res = HttpService.to.post('api/pool/buy');
    return res;
  }

  //卡牌下单
  static Future collectGetGroup({required int id}) async{
    var res = HttpService.to.post('api/pool/getGroup');
    return res;
  }
  //热门卡牌
  static Future collectGetHot({required int id}) async{
    var res = HttpService.to.post('api/pool/getHot');
    return res;
  }
  //获取支付方式
  static Future collectPaylist({required int id}) async{
    var res = HttpService.to.post('api/payment/getList');
    return res;
  }
  //批量查询订单
  static Future collectGetOrderAll({required int id}) async{
    var res = HttpService.to.post('api/mark/getOrderAll');
    return res;
  }
  //我的卡牌
  static Future collectSaleGetMyList({required int id}) async{
    var res = HttpService.to.post('api/pool/getMyList');
    return res;
  }
  //卡牌转赠
  static Future collectGiv({required int id}) async{
    var res = HttpService.to.post('api/pool/giv');
    return res;
  }
  //查询转赠结果
  static Future collectGetTransferEnd({required int id}) async{
    var res = HttpService.to.post('api/pool/getTransferEnd');
    return res;
  }

  //订单列表
  static Future collectOrderList({required int id}) async{
    var res = HttpService.to.post('api/order/getList');
    return res;
  }
  //取消订单
  static Future collectOrderCannel({required int id}) async{
    var res = HttpService.to.post('api/order/cannel');
    return res;
  }
  //订单详情
  static Future collectOrderDetail({required int id}) async{
    var res = HttpService.to.post('api/order/getDetail');
    return res;
  }

}
