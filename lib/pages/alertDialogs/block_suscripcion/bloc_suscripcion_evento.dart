part of 'bloc_suscripcion.dart';

@immutable
sealed class BlocSuscripcionEvent {
  const BlocSuscripcionEvent();

}

class BlocSuscripcionEventSuscribirse extends BlocSuscripcionEvent {
  const BlocSuscripcionEventSuscribirse({
    required this.flagSuscripcion,
  });
final bool flagSuscripcion;
}