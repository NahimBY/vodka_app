import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vodka_app/infrastructure/models/tournamentdb/tournament_response.dart';

part 'tournament_service.g.dart';

@RestApi()
abstract class TournamentService {
  factory TournamentService(Dio dio, {String baseUrl}) = _TournamentService;

  @GET('/tournaments')
  Future<TournamentResponse> getTournaments(@Body() Map<String, dynamic> tournamentsData);
}