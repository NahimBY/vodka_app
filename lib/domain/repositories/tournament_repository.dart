import 'package:vodka_app/domain/entities/tournament.dart';

abstract class TournamentRepository {
  Future<Tournament> getTournaments();
}