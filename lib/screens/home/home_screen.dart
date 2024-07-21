import 'package:cat_fakts/bloc/cats_random/cat_fakts_random_bloc.dart';
import 'package:cat_fakts/bloc/detail/detail_bloc.dart';
import 'package:cat_fakts/screens/fakt/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _getStart() {
    context.read<CatFaktsRandomBloc>().add(CatsRandomFactsFetch());
  }

  @override
  void initState() {
    _getStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats Fakts Random"),
      ),
      body: BlocBuilder<CatFaktsRandomBloc, CatFaktsRandomState>(builder: (context, state) {
        if (state is CatFaktsRandomLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CatFaktsRandomSuccess) {
          return ListView.builder(
              itemCount: state.catsFakts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Type:",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.catsFakts[index].type!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Short info:",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.catsFakts[index].text!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.indigo),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent),
                            ),
                            onPressed: () {
                              context.read<DetailBloc>().add(DetailFetch(state.catsFakts[index].sId!));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const InformationPage()));
                            },
                            child: const Text(
                              "Detail",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                );
              });
        }
        if (state is CatFaktsRandomError) {
          return Center(
            child: Text(
              state.errorMassage,
              style: const TextStyle(fontSize: 22),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
