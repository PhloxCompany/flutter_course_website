import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:phlox_drawer/controller/phlox_drawer_controller.dart';

class ProfileMobileModeProvider extends ChangeNotifier{
  double turns = 0;
  PhloxDrawerController controller = PhloxDrawerController();
  bool isClicked = false;
  AnimationController? animationController;
  void checkClickMode(){
    if(isClicked){
      turns -= 1 / 4;
      animationController?.reverse();
    } else{
      turns += 1 / 4;
      animationController?.forward();
    }
    isClicked = !isClicked;
    notifyListeners();
  }

}