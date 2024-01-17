import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_suscripcion_evento.dart';
part 'bloc_suscripcion_estado.dart';

class BlocSuscripcionBloc
    extends Bloc<BlocSuscripcionEvent, BlocSuscripcionState> {
  BlocSuscripcionBloc() : super(BlocSuscripcionInitial()) {
    on<BlocSuscripcionEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<BlocSuscripcionEventSuscribirse>(
      _onSuscripcion,
    );
  }
  void _onSuscripcion(BlocSuscripcionEventSuscribirse event,
      Emitter<BlocSuscripcionState> emit) {
    emit(
      BlocSuscripcionExitoso.desde(state,
          flagSuscripcion: event.flagSuscripcion),
    );
  }
}
