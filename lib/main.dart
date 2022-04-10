import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score = 1;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  String name = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Score: $score'),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Tambah data'),
                                  content: Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: nameController,
                                            decoration: const InputDecoration(
                                                label: Text('Name')),
                                            validator: (value) {
                                              if (value == '' ||
                                                  value!.isEmpty) {
                                                return 'Nama Wajib diisi!';
                                              }
                                            },
                                          ),
                                          Container(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                child: const Text('Simpan'),
                                                onPressed: () {
                                                  setState(() {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      name =
                                                          nameController.text;
                                                    }
                                                  });
                                                },
                                              )),
                                          Text(name)
                                        ],
                                      )),
                                ));
                      },
                      icon: const Icon(Icons.add)),
                )
              ],
            ),
            body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, i) => ListTile(
                    title: const Text('Hallo'), subtitle: Text('Item ke-$i'))
                // Container(
                //     padding: const EdgeInsets.all(50),
                //     decoration: const BoxDecoration(color: Colors.green),
                //     child: ElevatedButton(
                //         child: Text('Tombol ke-$i+1'),
                //         onPressed: () {
                //           setState(() {
                //             score++;
                //           });
                //         }))
                )));
  }
}

// class _MyAppState extends State<MyApp> {
//   var score = 1;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: Text('Score: $score')),
//             body: Row(
//               children: [
//                 const Text('kiri'),
//                 Container(
//                     margin: const EdgeInsets.all(50),
//                     decoration: const BoxDecoration(color: Colors.green),
//                     child: ElevatedButton(
//                         child: const Text('Tekan'),
//                         onPressed: () {
//                           setState(() {
//                             score++;
//                           });
//                         }))
//               ],
//             )));
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: const Text('Home'),
//     ));
//   }
// }
