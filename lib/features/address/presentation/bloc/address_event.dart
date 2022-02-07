part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetAddressEvent extends AddressEvent {
  final String cep;

  const GetAddressEvent(this.cep);
}
