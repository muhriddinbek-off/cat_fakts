import 'package:cat_fakts/bloc/detail/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'General Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
        if (state is DetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DetailSuccess) {
          return Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.deepPurple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(state.catsDetail.user!.photo!),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.catsDetail.user!.name!.first!} ${state.catsDetail.user!.name!.first!}",
                              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Discription",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        state.catsDetail.text!,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        if (state is DetailError) {
          return Center(
            child: Text(state.errorMassage),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
