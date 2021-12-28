import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Address extends Equatable {
  final String cep;
  @JsonKey(name: 'logradouro')
  final String publicPlace;
  @JsonKey(name: 'complemento')
  final String complement;
  @JsonKey(name: 'bairro')
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
