// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
// import 'package:pharmacy_app/ui/screen/mobile_screen/utilits/screen_size/screen_size.dart';

// class SearchOfChemicals extends SearchDelegate {
//   Box myBox = Hive.box<ChemicalModel>('chemicalinfo');
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.close))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List values = myBox.values.toList();
//     List filterNames = values
//         .where(
//             (element) => element.nameOfChemical.contains(query.toUpperCase()))
//         .toList();
//     return Container(
//       height: 0.5*getHeight(context: context),
//       width: 0.5*getwidth(context: context),
//       child: ListView.builder(
//           itemCount: myBox.length,
//           itemBuilder: (context, index) {
//             return Row(
//               children: [
//                 Text(query == '' ? '$values' : '$filterNames'),
//                 Text(query == '' ? '$values' : '$filterNames'),
//               ],
//             );
//           }),
//     );
//   }
// }
