// import 'package:cep_tdd/features/address/domain/usecases/get_address.dart';
// import 'package:cep_tdd/features/address/presentation/bloc/address_bloc.dart';
// import 'package:cep_tdd/features/address/presentation/cubit/address_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddressPage extends StatelessWidget {
//   AddressPage({Key? key}) : super(key: key);
//   final bloc = AddressBloc();
//   final cubit = AddressCubit();
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       BlocBuilder(
//           bloc: bloc,
//           builder: (context, state) {
//             return Container();
//           }),
//       BlocBuilder(
//           bloc: cubit,
//           builder: (context, state) {
//             return Container();
//           }),
//     ]);
//   }

//   void callBloc() {
//     bloc.add(GetAddressEvent());
//   }

//   void callCubit() {
//     cubit.requestAddressInfo('');
//   }
// }
