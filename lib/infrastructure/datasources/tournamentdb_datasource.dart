import 'package:dio/dio.dart';
import 'package:vodka_app/domain/datasources/tournament_datasource.dart';
import 'package:vodka_app/domain/entities/tournament.dart';
import 'package:vodka_app/infrastructure/providers/dio_provider.dart';

// class TournamentdbDatasource extends TournamentDatasource {
//   late final Dio dio = DioProvider.createDio();

//   @override
//   Future<Tournament> getTournaments() async {
//     try {
//       final response = await dio.get()
//     }
//   }
// }
