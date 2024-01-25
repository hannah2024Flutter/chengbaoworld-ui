class CollectListModel {
  int? count;
  List<Collect>? list;

  CollectListModel({this.count, this.list});

  CollectListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      list as List<dynamic>;
      json['list'].forEach((v) {
        list!.add(new Collect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collect {
  int? personCount;
  int? id;
  String? title;
  int? fileId;
  int? price;
  String? remark;
  int? virtual;
  int? getType;
  Cover? cover;

  Collect(
      {this.personCount,
        this.id,
        this.title,
        this.fileId,
        this.price,
        this.remark,
        this.virtual,
        this.getType,
        this.cover});

  Collect.fromJson(Map<String, dynamic> json) {
    personCount = json['personCount'];
    id = json['id'];
    title = json['title'];
    fileId = json['file_id'];
    price = json['price'];
    remark = json['remark'];
    virtual = json['virtual'];
    getType = json['get_type'];
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personCount'] = this.personCount;
    data['id'] = this.id;
    data['title'] = this.title;
    data['file_id'] = this.fileId;
    data['price'] = this.price;
    data['remark'] = this.remark;
    data['virtual'] = this.virtual;
    data['get_type'] = this.getType;
    if (this.cover != null) {
      data['cover'] = this.cover!.toJson();
    }
    return data;
  }
}

class Cover {
  int? id;
  String? showSrc;
  int? width;
  int? height;

  Cover({this.id, this.showSrc, this.width, this.height});

  Cover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    showSrc = json['show_src'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['show_src'] = this.showSrc;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
