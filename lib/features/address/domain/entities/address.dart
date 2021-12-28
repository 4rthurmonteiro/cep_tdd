import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String cep;
  final String publicPlace;
  final String complement;
  final String district;
  final String uf;
  final String ibge;
  final String ddd;

  const Address({
    required this.cep,
    required this.publicPlace,
    required this.complement,
    required this.district,
    required this.uf,
    required this.ibge,
    required this.ddd,
  });

  @override
  List<Object?> get props => [cep];
}
