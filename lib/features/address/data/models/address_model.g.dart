// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      cep: json['cep'] as String,
      publicPlace: json['logradouro'] as String,
      complement: json['complemento'] as String,
      district: json['bairro'] as String,
      uf: json['uf'] as String,
      ibge: json['ibge'] as String,
      ddd: json['ddd'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.publicPlace,
      'complemento': instance.complement,
      'bairro': instance.district,
      'uf': instance.uf,
      'ibge': instance.ibge,
      'ddd': instance.ddd,
    };
