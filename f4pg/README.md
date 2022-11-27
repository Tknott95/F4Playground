# f4pg
 F4 Playground - many modules/apps in one to bring into other apps.

 @IMPORTANT
 - hero widget for animating acorss pages with same iimage (opening a val in a list for example)
 - play withi this hero widget as it creates clean animations

 - sliver list fixes list rendering bug https://youtu.be/LUqDNnv_dh0

 @TODO
 - bring in go router for nested routing for a pg wrapper
 - on the search query for bips org list to have "starting with letter" words first in list. This needs to be tuned a tad imo. It works for MVP.
 - I can pull some old reduntant code now that providers are in.
 - A Custom node widget which sets the node to be fired at via provider.
 - Fetch /wallets and map all logged in wallets (just map id - put the first to active or nest a type/ add another var outside of such encapsulation) to a provider/global.

 @DOING
 - setting up theming


 - I NEED TO CLEAN MY ctrls - (txtctrls) https://docs.flutter.dev/cookbook/forms/text-field-changes

 @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
