import 'package:equatable/equatable.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();
  ConfigState getStateCopy();
}

//when there is not state or initial state
class UncofigState extends ConfigState {
  @override
  String toString()=>'UnConfigState';

  @override
  ConfigState getStateCopy() {
    
    return UncofigState();
  }

  @override
  
  List<Object> get props => null;
  
}

//when we have some configuration

class IncofigState extends ConfigState {
  @override
  String toString()=>'InConfigState';

  @override
  ConfigState getStateCopy() {
    
    return IncofigState();
  }

  @override
  
  List<Object> get props => null;
  
}

//when there is some error
class ErrorcofigState extends ConfigState {
  final String errorMessage;

  ErrorcofigState(this.errorMessage);
  @override
  String toString()=>'ErrorConfigState';

  @override
  ConfigState getStateCopy() {
    
    return ErrorcofigState(this.errorMessage);
  }

  @override
  
  List<Object> get props => null;
  
}