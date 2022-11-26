# f4pg
 F4 Playground - many modules/apps in one to bring into other apps.

 @TODO
 - bring in go router for nested routing for a pg wrapper
 - on the search query for bips org list to have "starting with letter" words first in list. This needs to be tuned a tad imo. It works for MVP.
 -
 -
 

 - I NEED TO CLEAN MY ctrls - (txtctrls) https://docs.flutter.dev/cookbook/forms/text-field-changes

 @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }