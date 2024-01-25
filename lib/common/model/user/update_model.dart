class UpdateModel {
  Andior? andior;
  Andior? ios;
  Update? update;

  UpdateModel({this.andior, this.ios, this.update});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    andior =
    json['andior'] != null ? new Andior.fromJson(json['andior']) : null;
    ios = json['ios'] != null ? new Andior.fromJson(json['ios']) : null;
    update =
    json['update'] != null ? new Update.fromJson(json['update']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.andior != null) {
      data['andior'] = this.andior!.toJson();
    }
    if (this.ios != null) {
      data['ios'] = this.ios!.toJson();
    }
    if (this.update != null) {
      data['update'] = this.update!.toJson();
    }
    return data;
  }
}

class Andior {
  String? key;
  String? downUrl;

  Andior({this.key, this.downUrl});

  Andior.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    downUrl = json['down_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['down_url'] = this.downUrl;
    return data;
  }
}

class Update {
  String? updatetext;

  Update({this.updatetext});

  Update.fromJson(Map<String, dynamic> json) {
    updatetext = json['updatetext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updatetext'] = this.updatetext;
    return data;
  }
}
