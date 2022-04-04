import 'package:flutter/material.dart';
import "package:myapp/Homepage.dart";

void main() {
  runApp(MaterialApp(
    title: 'Les Sons',
    home: Homepage(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      )
    ),
  ));
}

// class FirstRoute extends StatelessWidget {
//   const FirstRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//       // drawer: MyDrawer(),
//       // appBar: AppBar(
//       //     automaticallyImplyLeading: false,
//       //     title: Row(
//       //         children: <Widget>[
//       //           Builder(
//       //             builder: (context) => IconButton(
//       //                 icon: Icon(Icons.menu_rounded),
//       //                 onPressed: () {
//       //                   Scaffold.of(context).openDrawer();
//       //                 }
//       //             ),),
//       //           Expanded(child: Text("")),
//       //           Padding(
//       //             padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//       //             child: Builder(
//       //               builder: (context) => IconButton(
//       //                   icon: Icon(Icons.arrow_back_ios_rounded),
//       //                   onPressed: () {
//       //                     Navigator.push(
//       //                       context,
//       //                       MaterialPageRoute(builder: (context) => const FirstRoute()),
//       //                     );
//       //                   }
//       //               ),),
//       //           ),
//       //           Builder(
//       //             builder: (context) => IconButton(
//       //                 icon: Icon(Icons.arrow_forward_ios_rounded),
//       //                 onPressed: () {
//       //                   Navigator.push(
//       //                     context,
//       //                     MaterialPageRoute(builder: (context) => const SecondRoute()),
//       //                   );
//       //                 }
//       //             ),),
//       //         ]
//       //     )
//       // ),
//       // body: SingleChildScrollView(
//       //   child: Padding(
//       //     padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
//       //     child: Container(
//       //       child: Column(
//       //         crossAxisAlignment: CrossAxisAlignment.start,
//       //         children: const [
//       //           Text("An Introduction to the French Pronounciation",
//       //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
//       //           Text(""),
//       //           Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed imperdiet dolor, sit amet gravida augue. Vivamus eu orci nec mauris auctor accumsan at ac nulla. Sed scelerisque eleifend risus, sit amet bibendum metus gravida eget. Duis sit amet nisi sed nibh pellentesque rhoncus eu id augue. Sed accumsan arcu ac ante elementum, non ullamcorper lectus laoreet. Cras ac nunc sit amet arcu vestibulum pellentesque. Donec aliquam ac ligula ac imperdiet. Fusce ut semper lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin vitae magna finibus, lobortis massa id, faucibus quam. Fusce felis ex, laoreet et auctor sed, volutpat non neque.Phasellus sed neque libero. Morbi eget nunc nec nulla tristique porta quis at urna. Sed eu neque malesuada, imperdiet velit at, commodo neque. Sed malesuada felis ut diam pretium, et fringilla ipsum eleifend. Sed malesuada metus ut lectus maximus dictum. Nulla facilisi. Nunc nulla arcu, luctus eu tortor vel, aliquet accumsan ipsum. Sed finibus ipsum sit amet neque aliquet, ut dapibus elit egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur sed consectetur nisl. Nullam ut suscipit nisi, vel congue mauris. Maecenas facilisis molestie ante. Aenean eu volutpat augue, sit amet dignissim justo.Duis fringilla justo sed libero luctus venenatis et eu massa. Maecenas ornare ex vel ornare fermentum. Nam suscipit, massa sed ornare accumsan, sem velit tincidunt metus, blandit feugiat massa enim sit amet dolor. Vestibulum sit amet vehicula sem. Fusce quis pellentesque erat. Integer congue mi eu lorem dapibus, id tristique enim lobortis. Donec hendrerit id libero sit amet mattis. Fusce bibendum, magna non luctus hendrerit, diam erat tempus augue, ac ullamcorper erat purus ac dui. Nullam commodo urna turpis, eu dapibus turpis vehicula scelerisque.Donec pretium ultricies augue, gravida dignissim neque scelerisque sed. Curabitur id eleifend elit. Donec quis finibus leo, sit amet aliquet massa. Cras finibus pretium cursus. Etiam maximus ipsum neque, nec tempus sem convallis vitae. Aenean non suscipit sapien, quis rhoncus est. Morbi id nisi in orci luctus dapibus. Curabitur feugiat fermentum mi, a dictum arcu dapibus a. Aenean aliquet justo vel felis elementum venenatis. Proin at eros vitae nisi placerat hendrerit. Proin dictum vulputate felis. Duis mauris arcu, condimentum sit amet malesuada sit amet, hendrerit id quam. Quisque fringilla facilisis pharetra.Proin et enim arcu. Nunc efficitur, nulla ac mollis faucibus, neque neque congue lorem, quis vehicula dolor nisl vitae erat. Vivamus tempus sapien ut ligula efficitur, nec pellentesque velit euismod. Donec ut semper augue. Integer placerat metus eget aliquam egestas. Nullam tincidunt sem nec nunc pellentesque volutpat. Sed non congue ipsum. Aenean erat nunc, tristique ac sodales ut, dapibus sit amet turpis. Integer porta consequat ligula. Nunc sollicitudin, neque eu viverra tincidunt, eros lacus interdum dui, sed feugiat ex justo a dui. Pellentesque eu ligula lacinia, ultricies nibh ut, dictum sem. Quisque euismod posuere quam, et laoreet leo convallis at. Donec posuere eget diam et lobortis. Fusce congue sagittis tristique.\n\n\n",
//       //             style: TextStyle(fontSize: 18),),
//       //         ],
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     // );
//   }
// // }
//
// class MyDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           CustomListTile(Icons.book, "1a. An introduction to the French \n pronounciation", () {
//             Navigator.pop(context);
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const Homepage()),
//             );}, "Reading - 5 min"),
//           CustomListTile(Icons.book, "1b. The French Name of Each Letter", () {
//             Navigator.pop(context);
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const SecondRoute()),
//             );}, "Reading - 5 min"),
//           CustomListTile(Icons.record_voice_over_rounded, "1c. Practicing the Alphabet", () {}, "Exercise - 15 min"),
//           CustomListTile(Icons.book, "1d. Vowels and Consonants", () {}, "Reading - 2 min"),
//           CustomListTile(Icons.record_voice_over_rounded, "1e. Practicing the Alphabet", () {}, "Exercise - 15 min"),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomListTile extends StatelessWidget{
//
//   IconData icon;
//   String text;
//   VoidCallback onTap;
//   String time;
//
//   CustomListTile(this.icon, this.text, this.onTap, this.time);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(bottom: BorderSide(color: Colors.grey.shade400))
//         ),
//         child: InkWell(
//           onTap: onTap,
//           child: Container(
//             height: 65,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Icon(icon),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
//                         children:[
//                           Text(text),
//                           Text(time),
//                         ]
//                       ),
//                     ),
//                   ]
//                 ),
//                 Icon(Icons.arrow_right_rounded)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: MyDrawer(),
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Row(
//               children: <Widget>[
//                 Builder(
//                   builder: (context) => IconButton(
//                       icon: Icon(Icons.menu_rounded),
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       }
//                   ),),
//                 Expanded(child: Text("")),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
//                   child: Builder(
//                     builder: (context) => IconButton(
//                         icon: Icon(Icons.arrow_back_ios_rounded),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const Homepage()),
//                           );
//                         }
//                     ),),
//                 ),
//                 Builder(
//                   builder: (context) => IconButton(
//                       icon: Icon(Icons.arrow_forward_ios_rounded),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const SecondRoute()),
//                         );
//                       }
//                   ),),
//               ]
//           )
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(12, 15, 12, 50),
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text("The French Name of Each Letter",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
//                 Text(""),
//                 Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sed imperdiet dolor, sit amet gravida augue. Vivamus eu orci nec mauris auctor accumsan at ac nulla. Sed scelerisque eleifend risus, sit amet bibendum metus gravida eget. Duis sit amet nisi sed nibh pellentesque rhoncus eu id augue. Sed accumsan arcu ac ante elementum, non ullamcorper lectus laoreet. Cras ac nunc sit amet arcu vestibulum pellentesque. Donec aliquam ac ligula ac imperdiet. Fusce ut semper lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin vitae magna finibus, lobortis massa id, faucibus quam. Fusce felis ex, laoreet et auctor sed, volutpat non neque.Phasellus sed neque libero. Morbi eget nunc nec nulla tristique porta quis at urna. Sed eu neque malesuada, imperdiet velit at, commodo neque. Sed malesuada felis ut diam pretium, et fringilla ipsum eleifend. Sed malesuada metus ut lectus maximus dictum. Nulla facilisi. Nunc nulla arcu, luctus eu tortor vel, aliquet accumsan ipsum. Sed finibus ipsum sit amet neque aliquet, ut dapibus elit egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur sed consectetur nisl. Nullam ut suscipit nisi, vel congue mauris. Maecenas facilisis molestie ante. Aenean eu volutpat augue, sit amet dignissim justo.Duis fringilla justo sed libero luctus venenatis et eu massa. Maecenas ornare ex vel ornare fermentum. Nam suscipit, massa sed ornare accumsan, sem velit tincidunt metus, blandit feugiat massa enim sit amet dolor. Vestibulum sit amet vehicula sem. Fusce quis pellentesque erat. Integer congue mi eu lorem dapibus, id tristique enim lobortis. Donec hendrerit id libero sit amet mattis. Fusce bibendum, magna non luctus hendrerit, diam erat tempus augue, ac ullamcorper erat purus ac dui. Nullam commodo urna turpis, eu dapibus turpis vehicula scelerisque.Donec pretium ultricies augue, gravida dignissim neque scelerisque sed. Curabitur id eleifend elit. Donec quis finibus leo, sit amet aliquet massa. Cras finibus pretium cursus. Etiam maximus ipsum neque, nec tempus sem convallis vitae. Aenean non suscipit sapien, quis rhoncus est. Morbi id nisi in orci luctus dapibus. Curabitur feugiat fermentum mi, a dictum arcu dapibus a. Aenean aliquet justo vel felis elementum venenatis. Proin at eros vitae nisi placerat hendrerit. Proin dictum vulputate felis. Duis mauris arcu, condimentum sit amet malesuada sit amet, hendrerit id quam. Quisque fringilla facilisis pharetra.Proin et enim arcu. Nunc efficitur, nulla ac mollis faucibus, neque neque congue lorem, quis vehicula dolor nisl vitae erat. Vivamus tempus sapien ut ligula efficitur, nec pellentesque velit euismod. Donec ut semper augue. Integer placerat metus eget aliquam egestas. Nullam tincidunt sem nec nunc pellentesque volutpat. Sed non congue ipsum. Aenean erat nunc, tristique ac sodales ut, dapibus sit amet turpis. Integer porta consequat ligula. Nunc sollicitudin, neque eu viverra tincidunt, eros lacus interdum dui, sed feugiat ex justo a dui. Pellentesque eu ligula lacinia, ultricies nibh ut, dictum sem. Quisque euismod posuere quam, et laoreet leo convallis at. Donec posuere eget diam et lobortis. Fusce congue sagittis tristique.\n\n\n",
//                   style: TextStyle(fontSize: 18),),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }