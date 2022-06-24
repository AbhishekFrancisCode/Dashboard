class Student {
  bool? success;
  Data? data;

  Student({this.success, this.data});

  Student.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  ScreenTimes? screenTime;
  FreeTime? freeTime;
  List<Devices>? devices;

  Data({this.screenTime, this.freeTime, this.devices});

  Data.fromJson(Map<String, dynamic> json) {
    screenTime = json['screenTime'] != null
        ? ScreenTimes.fromJson(json['screenTime'])
        : null;
    freeTime =
        json['freeTime'] != null ? FreeTime.fromJson(json['freeTime']) : null;
    if (json['devices'] != null) {
      devices = <Devices>[];
      json['devices'].forEach((v) {
        devices!.add(Devices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (screenTime != null) {
      data['screenTime'] = screenTime!.toJson();
    }
    if (freeTime != null) {
      data['freeTime'] = freeTime!.toJson();
    }
    if (devices != null) {
      data['devices'] = devices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScreenTimes {
  int? clasz;
  int? study;
  int? free;
  int? total;

  ScreenTimes({this.clasz, this.study, this.free, this.total});

  ScreenTimes.fromJson(Map<String, dynamic> json) {
    clasz = json['class'];
    study = json['study'];
    free = json['free'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = clasz;
    data['study'] = study;
    data['free'] = free;
    data['total'] = total;
    return data;
  }
}

class FreeTime {
  int? limit;
  int? usage;

  FreeTime({this.limit, this.usage});

  FreeTime.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    usage = json['usage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['usage'] = usage;
    return data;
  }
}

class Devices {
  String? name;
  int? usage;

  Devices({this.name, this.usage});

  Devices.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    usage = json['usage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['usage'] = usage;
    return data;
  }
}
