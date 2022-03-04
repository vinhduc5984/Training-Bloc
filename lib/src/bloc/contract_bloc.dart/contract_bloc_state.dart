import 'package:equatable/equatable.dart';
import 'package:login_screen_bloc/src/models/contact_model.dart';

abstract class ContractState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContractInitState extends ContractState {}

class ContractLoading extends ContractState {}

class ContractLoaded extends ContractState {
  final List<ContractModel> contracts;
  ContractLoaded({required this.contracts});
  @override
  List<Object> get props => [contracts];
}

class EndPageLoad extends ContractState {}
