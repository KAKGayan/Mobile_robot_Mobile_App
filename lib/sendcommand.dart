import 'Control_Page.dart';

class sendcmd{
  sendcmd({required this.commandmove});
  final ControlButton? commandmove;
    String updatecommand() {
    if(commandmove == ControlButton.forward){
      return 'Forward';
    }else if(commandmove == ControlButton.backward){
      return 'Backward';
    }else if(commandmove==ControlButton.stop){
      return 'Stop';
    }else if(commandmove == ControlButton.turnleft){
      return 'Turn Left';
    }else if(commandmove == ControlButton.turnright){
      return 'Turn Right';
    }else{
      return '';
    }
  }
}