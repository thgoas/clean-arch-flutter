import 'package:fin_ca/layers/groups/domain/erros/failure_get_group.dart';

class NoElementDataSourceError extends FailureGroup {
  NoElementDataSourceError(super.message);
}

class EmptyResultException extends FailureGroup {
  EmptyResultException(super.message);
}
