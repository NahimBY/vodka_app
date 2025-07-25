import 'package:vodka_app/domain/entities/tournament/tournament.dart';

abstract class TournamentRepository {
  Future<Tournament> getTournaments();
}