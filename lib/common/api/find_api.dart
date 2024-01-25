

import '../services/http_service.dart';

class FindApi{
  static Future getCate()async{
    var res = await HttpService.to.post('/api/affiche/getCate');
    return res;
  }

  static Future getCateList()async{
    var res = await HttpService.to.post('api/affiche/getList');
    return res;
  }

  static Future getNewsCate()async{
    var res = await HttpService.to.post('api/article/news/getCate');
    return res;
  }

  static Future getNewsList()async{
    var res = await HttpService.to.post('api/article/news/getNewsList');
    return res;
  }

  static Future getNewsDetail()async{
    var res = await HttpService.to.post('api/article/news/getDetail/');
    return res;
  }

  static Future getRumorList()async{
    var res = await HttpService.to.post('api/forum/rumor/getRumorList');
    return res;
  }

  static Future rumorAdd()async{
    var res = await HttpService.to.post('api/forum/rumor/rumorAdd');
    return res;
  }

  static Future getRumorDetail()async{
    var res = await HttpService.to.post('api/forum/rumor/getRumorDetail');
    return res;
  }

}