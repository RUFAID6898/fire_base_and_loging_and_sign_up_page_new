import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final openfir = FirebaseFirestore.instance.collection('login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: openfir.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot sanp = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(
                    sanp['name'],
                    style: const TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    sanp['phone'],
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        openfir.doc(sanp.id).delete();
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
