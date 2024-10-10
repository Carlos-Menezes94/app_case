import 'package:app_random_numbers/app/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';
import '../../entities/token_entity.dart';

abstract interface class LoginRepositoryAbstract {
  Future<Either<Failure, TokenEntity>> loginWithEmailPassword(
      {required LoginEntity loginEntity});
}
