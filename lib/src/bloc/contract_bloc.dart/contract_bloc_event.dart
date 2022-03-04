import 'package:equatable/equatable.dart';
import 'package:login_screen_bloc/src/repositories/contract_repository.dart';

abstract class ContractEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingContract extends ContractEvent {}

class LoadContract extends ContractEvent {
  final String param;
  LoadContract(ContractRepository contractRepository, {required this.param});
  @override
  List<Object> get props => [];
}

class SuccessEndPage extends ContractEvent {}
