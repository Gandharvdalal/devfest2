import 'package:bloc/bloc.dart';

import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  //we are using singleton because when ever we use config bloc it doe snot recreate the paragraphs
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();

  factory ConfigBloc(){
    return _configBlocSingleton;
  }

  ConfigBloc._internal();

  bool darkModeOn=false;
  @override
  ConfigState get initialState => UncofigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    
  }
}