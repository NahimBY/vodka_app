import 'package:vodka_app/domain/entities/tournament.dart';
import 'package:vodka_app/infrastructure/models/tournament_response.dart';

class TournamentMapper {
  static Tournament tournamentResponseToEntity(
    TournamentResponse tournamentresponse,
  ) => Tournament(
    id: tournamentresponse.id,
    name: tournamentresponse.name,
    emblem: tournamentresponse.emblem,
    status: tournamentresponse.status,
  );

  static TournamentResponse toModel(Tournament entity) => TournamentResponse(
    id: entity.id,
    name: entity.name,
    emblem: entity.emblem,
    status: entity.status,
  );
}
