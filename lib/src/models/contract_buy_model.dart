import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:login_screen_bloc/src/models/contact_model.dart';

class ContractBuyModel {
  final int total;
  final List<ContractModel> result;
  ContractBuyModel({
    required this.total,
    required this.result,
  });

  ContractBuyModel copyWith({
    int? total,
    List<ContractModel>? result,
  }) {
    return ContractBuyModel(
      total: total ?? this.total,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'result': result.map((x) => x.toMap()).toList(),
    };
  }

  factory ContractBuyModel.fromMap(Map<String, dynamic> map) {
    return ContractBuyModel(
      total: map['total']?.toInt() ?? 0,
      result: List<ContractModel>.from(
          map['result']?.map((x) => ContractModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractBuyModel.fromJson(String source) =>
      ContractBuyModel.fromMap(json.decode(source));

  @override
  String toString() => 'ContractBuyModel(total: $total, result: $result)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContractBuyModel &&
        other.total == total &&
        listEquals(other.result, result);
  }

  @override
  int get hashCode => total.hashCode ^ result.hashCode;
}
