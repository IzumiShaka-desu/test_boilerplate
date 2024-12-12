import 'package:dartz/dartz.dart';
import 'failure.dart';

bool xor(bool a, bool b) => (a || b) && !(a && b);

typedef FailOr<T> = Either<Failure, T>;
