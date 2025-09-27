import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isLoadingDialogVisible = false; /// دا هنا عشان ال loading يشتغل في ال app كلو بس عاملوا ب false امتي بقا ب true
void showLoading(BuildContext context, {Key? key}) async {
  if(isLoadingDialogVisible) return; /// هنا بقولوا لو ال laoding ظاهر علي الشاشة متكملش ومتظهرش loading تاني بس
  isLoadingDialogVisible = true; /// يظهر ال loading  في حالة ال showLoading
  await showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          key: key,
          content: const Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text("Loading...")
            ],
          ),
        );
      });

}
Future<void> hideLoading(BuildContext context) async{
  if(isLoadingDialogVisible){
    Navigator.pop(context);
    isLoadingDialogVisible = false; /// وهنا يخفي ال loading
  }
}



showMessage(BuildContext context, {String? title,
  String? message,
  String? posButtonTitle,
  Function? onPosButtonClick,
  String? negButtonTitle,
  Function? onNegButtonClick,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog( ///تطلعلك الرسالة زي الايفون ios بالظبط
          title: title != null ? Text(title) : null,
          content: message != null ? Text(message) : null,
          actions: [
            if(posButtonTitle != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onPosButtonClick != null) onPosButtonClick();
                  },
                  child: Text(posButtonTitle)),

            if(negButtonTitle != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onNegButtonClick != null) onNegButtonClick();
                  },
                  child: Text(negButtonTitle)),
          ],
        );
      });
}

