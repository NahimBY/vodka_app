import 'package:dio/dio.dart';
import 'package:vodka_app/domain/datasources/tournament_datasource.dart';
import 'package:vodka_app/domain/entities/tournament.dart';
import 'package:vodka_app/infrastructure/mappers/tournament_mapper.dart';
import 'package:vodka_app/infrastructure/models/tournamentdb/tournament_response.dart';
import 'package:vodka_app/infrastructure/providers/dio_provider.dart';
import 'package:vodka_app/infrastructure/services/key_value_storage_service.dart';

class TournamentdbDatasource extends TournamentDatasource {
  late final Dio dio = DioProvider.createDio();

  TournamentdbDatasource() {
    final dio = DioProvider.createDio();

    // Agregar interceptor para el token de autenticación si es necesario
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = KeyValueStorageService.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }

  @override
  Future<Tournament> getTournaments() async {
    try {
      final response = await dio.get('/tournaments');
      // COMPLETAR GET DE TOURNAMENTS
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        String errorMessage = 'Solicitud incorrecta';

        if (errorData is Map<String, dynamic>) {
          errorMessage = errorData['message'] ?? 'Solicitud incorrecta';
        }

        throw Exception(errorMessage);
      }

      if (e.response?.statusCode == 401) {
        throw Exception('No autorizado. Verifica tu sesión');
      }

      if (e.response?.statusCode == 403) {
        throw Exception('Acceso denegado');
      }

      if (e.response?.statusCode == 404) {
        throw Exception('Torneos no encontrados');
      }

      if (e.response?.statusCode == 422) {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('errors')) {
          final errors = errorData['errors'] as Map<String, dynamic>;
          final firstError = errors.values.first;
          throw Exception(firstError is List ? firstError.first : firstError);
        }
      }

      if (e.response?.statusCode == 500) {
        throw Exception('Error del servidor. Intenta más tarde');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Tiempo de conexión agotado');
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Tiempo de respuesta agotado');
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Error de conexión. Verifica tu internet');
      }

      throw Exception('Error de red: ${e.message}');
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }

      throw Exception('Error inesperado: $e');
    }
  }
}
