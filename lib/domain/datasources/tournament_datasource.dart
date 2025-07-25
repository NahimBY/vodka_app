import 'package:vodka_app/domain/entities/tournament.dart';

abstract class TournamentDatasource {
  Future<Tournament> getTournaments();
}