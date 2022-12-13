import 'dart:convert';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

class Device {
  Device({
    required this.additionParents,
    required this.owner,
    required this.childDevices,
    required this.childAssets,
    required this.creationTime,
    required this.type,
    required this.lastUpdated,
    required this.childAdditions,
    required this.name,
    required this.deviceParents,
    required this.assetParents,
    required this.self,
    required this.id,
    required this.height,
    required this.weight,
    required this.bpdia,
    required this.bpsys,
    required this.bmi,
    required this.tempA,
    required this.tempB,
    required this.comCumulocityModelAgent,
    required this.c8YIsDevice,
    required this.c8YSupportedOperations,
  });

  AdditionParents additionParents;
  String owner;
  AdditionParents childDevices;
  AdditionParents childAssets;
  DateTime creationTime;
  String type;
  DateTime lastUpdated;
  AdditionParents childAdditions;
  String name;
  AdditionParents deviceParents;
  AdditionParents assetParents;
  String self;
  String id;
  String tempA;
  String tempB;
  String bpdia;
  String bpsys;
  String bmi;
  String height;
  String weight;
  C8YIsDevice comCumulocityModelAgent;
  C8YIsDevice c8YIsDevice;
  List<String> c8YSupportedOperations;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    additionParents: AdditionParents.fromJson(json["additionParents"]),
    owner: json["owner"],
    childDevices: AdditionParents.fromJson(json["childDevices"]),
    childAssets: AdditionParents.fromJson(json["childAssets"]),
    creationTime: DateTime.parse(json["creationTime"]),
    type: json["type"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
    childAdditions: AdditionParents.fromJson(json["childAdditions"]),
    name: json["name"],
    deviceParents: AdditionParents.fromJson(json["deviceParents"]),
    assetParents: AdditionParents.fromJson(json["assetParents"]),
    self: json["self"],
    id: json["id"],
    tempA: json["temp"],
    tempB: json["temp_user_b"],
    bpdia: json["bpdia"],
    bpsys: json["bpsys"],
    height:json["height"],
    weight:json["weight"],
    bmi:json["bmi"],
    comCumulocityModelAgent: C8YIsDevice.fromJson(json["com_cumulocity_model_Agent"]),
    c8YIsDevice: C8YIsDevice.fromJson(json["c8y_IsDevice"]),
    c8YSupportedOperations: List<String>.from(json["c8y_SupportedOperations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "additionParents": additionParents.toJson(),
    "owner": owner,
    "childDevices": childDevices.toJson(),
    "childAssets": childAssets.toJson(),
    "creationTime": creationTime.toIso8601String(),
    "type": type,
    "lastUpdated": lastUpdated.toIso8601String(),
    "childAdditions": childAdditions.toJson(),
    "name": name,
    "deviceParents": deviceParents.toJson(),
    "assetParents": assetParents.toJson(),
    "self": self,
    "id": id,
    "temp":tempA,
    "temp_user_b":tempB,
    "bpdia":bpdia,
    "bpsys":bpsys,
    "height":height,
    "weight":weight,
    "bmi":bmi,
    "com_cumulocity_model_Agent": comCumulocityModelAgent.toJson(),
    "c8y_IsDevice": c8YIsDevice.toJson(),
    "c8y_SupportedOperations": List<dynamic>.from(c8YSupportedOperations.map((x) => x)),
  };
}

class AdditionParents {
  AdditionParents({
    required this.references,
    required this.self,
  });

  List<Reference> references;
  String self;

  factory AdditionParents.fromJson(Map<String, dynamic> json) => AdditionParents(
    references: List<Reference>.from(json["references"].map((x) => Reference.fromJson(x))),
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "references": List<dynamic>.from(references.map((x) => x.toJson())),
    "self": self,
  };
}

class Reference {
  Reference({
    required this.managedObject,
    required this.self,
  });

  ManagedObject managedObject;
  String self;

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    managedObject: ManagedObject.fromJson(json["managedObject"]),
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "managedObject": managedObject.toJson(),
    "self": self,
  };
}

class ManagedObject {
  ManagedObject({
    required this.name,
    required this.self,
    required this.id,
  });

  String name;
  String self;
  String id;

  factory ManagedObject.fromJson(Map<String, dynamic> json) => ManagedObject(
    name: json["name"],
    self: json["self"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "self": self,
    "id": id,
  };
}

class C8YIsDevice {
  C8YIsDevice();

  factory C8YIsDevice.fromJson(Map<String, dynamic> json) => C8YIsDevice(
  );

  Map<String, dynamic> toJson() => {
  };
}
