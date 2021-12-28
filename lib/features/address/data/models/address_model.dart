import 'package:json_annotation/json_annotation.dart';
import 'package:cep_tdd/features/address/domain/entities/address.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends Address {
  const AddressModel({
    required String cep,
    required String publicPlace,
    required String complement,
    required String district,
    required String uf,
    required String ibge,
    required String ddd,
  }) : super(
          cep: cep,
          publicPlace: publicPlace,
          complement: complement,
          district: district,
          uf: uf,
          ibge: ibge,
          ddd: ddd,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
