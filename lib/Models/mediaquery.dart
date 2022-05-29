import 'package:flutter/cupertino.dart';

class MediaResponsive with ChangeNotifier{


  MediaQueryData setMediaquery(BuildContext context) {
    return MediaQuery.of(context);
  }

  double getWidth(BuildContext context) {
    return setMediaquery(context).size.width;
  }

  double getheight(BuildContext context) {
    return setMediaquery(context).size.height;
  }


  
}
