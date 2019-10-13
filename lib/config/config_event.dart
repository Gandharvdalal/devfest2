import 'package:devfest_demo/utils/devfest.dart';

import 'index.dart';
import 'package:devfest_demo/config/index.dart';
import 'package:equatable/equatable.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
  //follwing code is used for making the app know in which state it is currently on.
  Future<ConfigState>applyAsync({ConfigState currentState,ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent{
  final bool darkOn;
  DarkModeEvent(this.darkOn);
  @override
  String toString()=>'DarkModeEvent';

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc})async {
    
    try {
      bloc.darkModeOn=darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);
      return IncofigState();
      
    } catch (_,stackTrace) {
      print('$_ $stackTrace');
      return ErrorcofigState(_?.toString());
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => null;

}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString()=>'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async{
    
    try {
      await Future.delayed(Duration(seconds:2));
      return IncofigState();
      
    } catch (_,stackTrace) {
      print('$_ $stackTrace');
      return ErrorcofigState(_?.toString());
    }
  }
  

  @override
  // TODO: implement props
  List<Object> get props => null;
  
  
}