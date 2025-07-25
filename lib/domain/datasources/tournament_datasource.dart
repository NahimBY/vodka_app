import 'package:vodka_app/domain/entities/tournament/tournament.dart';

abstract class TournamentDatasource {
  Future<Tournament> getTournaments();
}