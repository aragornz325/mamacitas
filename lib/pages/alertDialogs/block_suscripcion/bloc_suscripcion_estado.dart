part of 'bloc_suscripcion.dart';

@immutable
sealed class BlocSuscripcionState {
  const BlocSuscripcionState._(
      {this.flagSuscripcion = false, this.leyenda = 'no suscripto'});

  BlocSuscripcionState.desde(
    BlocSuscripcionState otro, {
    bool? flagSuscripcion,
    String? leyenda,
  }) : this._(
          flagSuscripcion: flagSuscripcion ?? otro.flagSuscripcion,
          leyenda: leyenda ?? otro.leyenda,
        );
  final bool flagSuscripcion;
  final String leyenda;
}

final class BlocSuscripcionInitial extends BlocSuscripcionState {
  const BlocSuscripcionInitial() : super._();
}

final class BlocSuscripcionCargando extends BlocSuscripcionState {
  BlocSuscripcionCargando.desde(super.otro) : super.desde();
}

final class BlocSuscripcionExitoso extends BlocSuscripcionState {
  BlocSuscripcionExitoso.desde(
    super.otro, {
    super.flagSuscripcion,
    super.leyenda,
  }) : super.desde();
}

final class BlocSuscripcionFallido extends BlocSuscripcionState {
  BlocSuscripcionFallido.desde(super.otro) : super.desde();
}
