import 'dart:convert';

import 'package:login_screen_bloc/src/models/base.dart';

class ContractModel {
  final String type;
  final String id;
  final String memberId;
  final String status;
  final String signDate;
  final String startDate;
  final String endDate;
  final String endOfCommitmentPeriod;
  final bool isFrozen;
  final String paymentPlanId;
  final String couponCode;
  final String paymentTotal;
  final String paymentPlanSaleOffId;
  final String createdAt;
  final String createdBy;
  final int clubId;
  final String duration;
  final String paymentPlanNameEn;
  final String paymentPlanNameVi;
  ContractModel({
    required this.type,
    required this.id,
    required this.memberId,
    required this.status,
    required this.signDate,
    required this.startDate,
    required this.endDate,
    required this.endOfCommitmentPeriod,
    required this.isFrozen,
    required this.paymentPlanId,
    required this.couponCode,
    required this.paymentTotal,
    required this.paymentPlanSaleOffId,
    required this.createdAt,
    required this.createdBy,
    required this.clubId,
    required this.duration,
    required this.paymentPlanNameEn,
    required this.paymentPlanNameVi,
  });

  ContractModel copyWith({
    String? type,
    String? id,
    String? memberId,
    String? status,
    String? signDate,
    String? startDate,
    String? endDate,
    String? endOfCommitmentPeriod,
    bool? isFrozen,
    String? paymentPlanId,
    String? couponCode,
    String? paymentTotal,
    String? paymentPlanSaleOffId,
    String? createdAt,
    String? createdBy,
    int? clubId,
    String? duration,
    String? paymentPlanNameEn,
    String? paymentPlanNameVi,
  }) {
    return ContractModel(
      type: type ?? this.type,
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      status: status ?? this.status,
      signDate: signDate ?? this.signDate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      endOfCommitmentPeriod:
          endOfCommitmentPeriod ?? this.endOfCommitmentPeriod,
      isFrozen: isFrozen ?? this.isFrozen,
      paymentPlanId: paymentPlanId ?? this.paymentPlanId,
      couponCode: couponCode ?? this.couponCode,
      paymentTotal: paymentTotal ?? this.paymentTotal,
      paymentPlanSaleOffId: paymentPlanSaleOffId ?? this.paymentPlanSaleOffId,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      clubId: clubId ?? this.clubId,
      duration: duration ?? this.duration,
      paymentPlanNameEn: paymentPlanNameEn ?? this.paymentPlanNameEn,
      paymentPlanNameVi: paymentPlanNameVi ?? this.paymentPlanNameVi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'memberId': memberId,
      'status': status,
      'signDate': parseDatime(signDate),
      'startDate': parseDatime(startDate),
      'endDate': parseDatime(endDate),
      'endOfCommitmentPeriod': parseDatime(endOfCommitmentPeriod),
      'isFrozen': isFrozen,
      'paymentPlanId': paymentPlanId,
      'couponCode': couponCode,
      'paymentTotal': paymentTotal,
      'paymentPlanSaleOffId': paymentPlanSaleOffId,
      'createdAt': parseDatime(createdAt),
      'createdBy': createdBy,
      'clubId': clubId,
      'duration': duration,
      'paymentPlanNameEn': paymentPlanNameEn,
      'paymentPlanNameVi': paymentPlanNameVi,
    };
  }

  factory ContractModel.fromMap(Map<String, dynamic> map) {
    return ContractModel(
      type: map['type'] ?? '',
      id: map['id'] ?? '',
      memberId: map['memberId'] ?? '',
      status: map['status'] ?? '',
      signDate: map['signDate'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      endOfCommitmentPeriod: map['endOfCommitmentPeriod'] ?? '',
      isFrozen: map['isFrozen'] ?? false,
      paymentPlanId: map['paymentPlanId'] ?? '',
      couponCode: map['couponCode'] ?? '',
      paymentTotal: map['paymentTotal'] ?? '',
      paymentPlanSaleOffId: map['paymentPlanSaleOffId'] ?? '',
      createdAt: map['createdAt'] ?? '',
      createdBy: map['createdBy'] ?? '',
      clubId: map['clubId'] ?? '',
      duration: map['duration'] ?? '',
      paymentPlanNameEn: map['paymentPlanNameEn'] ?? '',
      paymentPlanNameVi: map['paymentPlanNameVi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractModel.fromJson(String source) =>
      ContractModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContractModel(type: $type, id: $id, memberId: $memberId, status: $status, signDate: $signDate, startDate: $startDate, endDate: $endDate, endOfCommitmentPeriod: $endOfCommitmentPeriod, isFrozen: $isFrozen, paymentPlanId: $paymentPlanId, couponCode: $couponCode, paymentTotal: $paymentTotal, paymentPlanSaleOffId: $paymentPlanSaleOffId, createdAt: $createdAt, createdBy: $createdBy, clubId: $clubId, duration: $duration, paymentPlanNameEn: $paymentPlanNameEn, paymentPlanNameVi: $paymentPlanNameVi)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContractModel &&
        other.type == type &&
        other.id == id &&
        other.memberId == memberId &&
        other.status == status &&
        other.signDate == signDate &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.endOfCommitmentPeriod == endOfCommitmentPeriod &&
        other.isFrozen == isFrozen &&
        other.paymentPlanId == paymentPlanId &&
        other.couponCode == couponCode &&
        other.paymentTotal == paymentTotal &&
        other.paymentPlanSaleOffId == paymentPlanSaleOffId &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy &&
        other.clubId == clubId &&
        other.duration == duration &&
        other.paymentPlanNameEn == paymentPlanNameEn &&
        other.paymentPlanNameVi == paymentPlanNameVi;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        memberId.hashCode ^
        status.hashCode ^
        signDate.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        endOfCommitmentPeriod.hashCode ^
        isFrozen.hashCode ^
        paymentPlanId.hashCode ^
        couponCode.hashCode ^
        paymentTotal.hashCode ^
        paymentPlanSaleOffId.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode ^
        clubId.hashCode ^
        duration.hashCode ^
        paymentPlanNameEn.hashCode ^
        paymentPlanNameVi.hashCode;
  }
}
