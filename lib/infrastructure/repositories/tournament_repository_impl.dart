import 'package:vodka_app/domain/datasources/tournament_datasource.dart';
import 'package:vodka_app/domain/entities/tournament.dart';
import 'package:vodka_app/domain/repositories/tournament_repository.dart';

class TournamentRepositoryImpl implements TournamentRepository {
  final TournamentDatasource datasource;

  TournamentRepositoryImpl(this.datasource);

  @override
  Future<Tournament> getTournaments() {
    return datasource.getTournaments();
  }
}
