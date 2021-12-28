import 'package:cep_tdd/features/address/domain/entities/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tCep = '57020070';
  const tPublicPlace = 'Teste';
  const tComplement = '';
  const tDistrict = '';
  const tUf = 'AL';
  const tIbge = '';
  const tDDD = '82';

  const tAddressOne = Address(
    cep: tCep,
    publicPlace: tPublicPlace,
    complement: tComplement,
    district: tDistrict,
    uf: tUf,
    ibge: tIbge,
    ddd: tDDD,
  );

  const tAddressTwo = Address(
    cep: tCep,
    publicPlace: '',
    complement: tComplement,
    district: tDistrict,
    uf: tUf,
    ibge: tIbge,
    ddd: tDDD,
  );

  test(
    'should compare two address with the same cep',
    () {
      expect(tAddressOne, tAddressTwo);
    },
  );
}
