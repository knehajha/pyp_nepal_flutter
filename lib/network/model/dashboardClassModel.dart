// To parse this JSON data, do
//
//     final dashboardClassModel = dashboardClassModelFromJson(jsonString);

import 'dart:convert';

DashboardClassModel dashboardClassModelFromJson(String str) => DashboardClassModel.fromJson(json.decode(str));

String dashboardClassModelToJson(DashboardClassModel data) => json.encode(data.toJson());

class DashboardClassModel {
  DashboardClassModel({
    required this.totalTrainers,
    required this.yttCondected,
    required this.yttpApplications,
    required this.totakClasses,
    required this.totalSadhak,
    required this.totalDonation,
    required this.totalScore,
    required this.attendance,
  });

  int totalTrainers;
  int yttCondected;
  int yttpApplications;
  int totakClasses;
  int totalSadhak;
  int totalDonation;
  int totalScore;
  int attendance;

  factory DashboardClassModel.fromJson(Map<String, dynamic> json) => DashboardClassModel(
    totalTrainers: json["totalTrainers"],
    yttCondected: json["yttCondected"],
    yttpApplications: json["yttpApplications"],
    totakClasses: json["totakClasses"],
    totalSadhak: json["totalSadhak"],
    totalDonation: json["totalDonation"],
    totalScore: json["totalScore"],
    attendance: json["attendance"],
  );

  Map<String, dynamic> toJson() => {
    "totalTrainers": totalTrainers,
    "yttCondected": yttCondected,
    "yttpApplications": yttpApplications,
    "totakClasses": totakClasses,
    "totalSadhak": totalSadhak,
    "totalDonation": totalDonation,
    "totalScore": totalScore,
    "attendance": attendance,
  };
}
