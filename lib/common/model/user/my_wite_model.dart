class MyWiteModel {
  int? childs;
  double? rate;

  MyWiteModel({this.childs, this.rate});

  MyWiteModel.fromJson(Map<String, dynamic> json) {
    childs = json['childs'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['childs'] = this.childs;
    data['rate'] = this.rate;
    return data;
  }
}
