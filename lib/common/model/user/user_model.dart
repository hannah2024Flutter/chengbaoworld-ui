class UserModel {
  String? token;
  UserInfo? userInfo;

  UserModel({this.token, this.userInfo});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? personalAuth;
  Queue? queue;
  int? id;
  int? companyId;
  int? headFileId;
  String? mobile;
  String? nickname;
  String? userCode;
  int? userSex;
  String? birthday;
  int? certId;
  int? levelId;
  String? balance;
  String? remark;
  int? status;
  String? addTime;
  int? unquied;
  String? registIp;
  String? validTime;
  String? food;
  String? gold;
  int? isCreateGuild;
  int? isMine;
  String? wechat;
  String? qq;
  int? isGiv;
  String? javaPassword;
  String? openid;
  int? version;
  String? avatar;
  int? invitedCount;
  String? tokensRate;
  int? isAgent;
  int? agentLevel;
  int? countPool;
  int? childs;
  double? product;
  int? teamTotal;
  TjrInfo? tjrInfo;
  String? avatars;

  UserInfo(
      {this.personalAuth,
      this.queue,
      this.id,
      this.companyId,
      this.headFileId,
      this.mobile,
      this.nickname,
      this.userCode,
      this.userSex,
      this.birthday,
      this.certId,
      this.levelId,
      this.balance,
      this.remark,
      this.status,
      this.addTime,
      this.unquied,
      this.registIp,
      this.validTime,
      this.food,
      this.gold,
      this.isCreateGuild,
      this.isMine,
      this.wechat,
      this.qq,
      this.isGiv,
      this.javaPassword,
      this.openid,
      this.version,
      this.avatar,
      this.invitedCount,
      this.tokensRate,
      this.isAgent,
      this.agentLevel,
      this.countPool,
      this.childs,
      this.product,
      this.teamTotal,
      this.tjrInfo,
      this.avatars});

  UserInfo.fromJson(Map<String, dynamic> json) {
    personalAuth = json['personal_auth'];
    queue = json['queue'] != null ? new Queue.fromJson(json['queue']) : null;
    id = json['id'];
    companyId = json['company_id'];
    headFileId = json['head_file_id'];
    mobile = json['mobile'];
    nickname = json['nickname'];
    userCode = json['user_code'];
    userSex = json['user_sex'];
    birthday = json['birthday'];
    certId = json['cert_id'];
    levelId = json['level_id'];
    balance = json['balance'];
    remark = json['remark'];
    status = json['status'];
    addTime = json['add_time'];
    unquied = json['unquied'];
    registIp = json['regist_ip'];
    validTime = json['valid_time'];
    food = json['food'];
    gold = json['gold'];
    isCreateGuild = json['is_create_guild'];
    isMine = json['is_mine'];
    wechat = json['wechat'];
    qq = json['qq'];
    isGiv = json['is_giv'];
    javaPassword = json['java_password'];
    openid = json['openid'];
    version = json['version'];
    avatar = json['avatar'];
    invitedCount = json['invitedCount'];
    tokensRate = json['tokens_rate'];
    isAgent = json['is_agent'];
    agentLevel = json['agent_level'];
    countPool = json['countPool'];
    childs = json['childs'];
    product = json['product'];
    teamTotal = json['team_total'];
    tjrInfo =
        json['tjrInfo'] != null ? new TjrInfo.fromJson(json['tjrInfo']) : null;
    avatars = json['avatars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personal_auth'] = this.personalAuth;
    if (this.queue != null) {
      data['queue'] = this.queue!.toJson();
    }
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['head_file_id'] = this.headFileId;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    data['user_code'] = this.userCode;
    data['user_sex'] = this.userSex;
    data['birthday'] = this.birthday;
    data['cert_id'] = this.certId;
    data['level_id'] = this.levelId;
    data['balance'] = this.balance;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['add_time'] = this.addTime;
    data['unquied'] = this.unquied;
    data['regist_ip'] = this.registIp;
    data['valid_time'] = this.validTime;
    data['food'] = this.food;
    data['gold'] = this.gold;
    data['is_create_guild'] = this.isCreateGuild;
    data['is_mine'] = this.isMine;
    data['wechat'] = this.wechat;
    data['qq'] = this.qq;
    data['is_giv'] = this.isGiv;
    data['java_password'] = this.javaPassword;
    data['openid'] = this.openid;
    data['version'] = this.version;
    data['avatar'] = this.avatar;
    data['invitedCount'] = this.invitedCount;
    data['tokens_rate'] = this.tokensRate;
    data['is_agent'] = this.isAgent;
    data['agent_level'] = this.agentLevel;
    data['countPool'] = this.countPool;
    data['childs'] = this.childs;
    data['product'] = this.product;
    data['team_total'] = this.teamTotal;
    if (this.tjrInfo != null) {
      data['tjrInfo'] = this.tjrInfo!.toJson();
    }
    data['avatars'] = this.avatars;
    return data;
  }
}

class Queue {
  String? nickname;
  String? avatar;
  String? userCode;

  Queue({this.nickname, this.avatar, this.userCode});

  Queue.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    avatar = json['avatar'];
    userCode = json['user_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['user_code'] = this.userCode;
    return data;
  }
}

class TjrInfo {
  int? companyId;
  int? userId;
  int? parentId;
  int? levels;
  String? userMobile;
  String? mobile;
  String? nickname;

  TjrInfo(
      {this.companyId,
      this.userId,
      this.parentId,
      this.levels,
      this.userMobile,
      this.mobile,
      this.nickname});

  TjrInfo.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    userId = json['user_id'];
    parentId = json['parent_id'];
    levels = json['levels'];
    userMobile = json['user_mobile'];
    mobile = json['mobile'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['user_id'] = this.userId;
    data['parent_id'] = this.parentId;
    data['levels'] = this.levels;
    data['user_mobile'] = this.userMobile;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    return data;
  }
}
