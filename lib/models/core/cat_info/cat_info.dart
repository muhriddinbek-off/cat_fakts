class CatsDetail {
  Status? status;
  String? sId;
  int? iV;
  String? text;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;
  User? user;

  CatsDetail({this.status, this.sId, this.iV, this.text, this.source, this.updatedAt, this.type, this.createdAt, this.deleted, this.used, this.user});

  CatsDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    sId = json['_id'];
    iV = json['__v'];
    text = json['text'];
    source = json['source'];
    updatedAt = json['updatedAt'];
    type = json['type'];
    createdAt = json['createdAt'];
    deleted = json['deleted'];
    used = json['used'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['text'] = this.text;
    data['source'] = this.source;
    data['updatedAt'] = this.updatedAt;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['used'] = this.used;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Status {
  bool? verified;
  int? sentCount;

  Status({this.verified, this.sentCount});

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['sentCount'] = this.sentCount;
    return data;
  }
}

class User {
  Name? name;
  String? sId;
  String? photo;

  User({this.name, this.sId, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    sId = json['_id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['_id'] = this.sId;
    data['photo'] = this.photo;
    return data;
  }
}

class Name {
  String? first;
  String? last;

  Name({this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}
