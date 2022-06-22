import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.success,
    required this.data,
  });

  final bool success;
  final Data data;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.screenTime,
    required this.freeTime,
    required this.devices,
  });

  final ScreenTime screenTime;
  final FreeTime freeTime;
  final List<Device> devices;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        screenTime: ScreenTime.fromJson(json["screenTime"]),
        freeTime: FreeTime.fromJson(json["freeTime"]),
        devices:
            List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "screenTime": screenTime.toJson(),
        "freeTime": freeTime.toJson(),
        "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
      };
}

class Device {
  Device({
    required this.name,
    required this.usage,
  });

  final String name;
  final int usage;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        name: json["name"],
        usage: json["usage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "usage": usage,
      };
}

class FreeTime {
  FreeTime({
    required this.limit,
    required this.usage,
  });

  final int limit;
  final int usage;

  factory FreeTime.fromJson(Map<String, dynamic> json) => FreeTime(
        limit: json["limit"],
        usage: json["usage"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "usage": usage,
      };
}

class ScreenTime {
  ScreenTime({
    required this.screenTimeClass,
    required this.study,
    required this.free,
    required this.total,
  });

  final int screenTimeClass;
  final int study;
  final int free;
  final int total;

  factory ScreenTime.fromJson(Map<String, dynamic> json) => ScreenTime(
        screenTimeClass: json["class"],
        study: json["study"],
        free: json["free"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "class": screenTimeClass,
        "study": study,
        "free": free,
        "total": total,
      };
}
