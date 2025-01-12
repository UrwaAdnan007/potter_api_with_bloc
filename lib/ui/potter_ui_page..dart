import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potter_api_bloc/potter_bloc/potter_bloc.dart';
import 'package:potter_api_bloc/potter_bloc/potter_state.dart';

class PotterUIPage extends StatelessWidget {
  const PotterUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    final potterBloc = BlocProvider.of<PotterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('API')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => potterBloc.attemptToFetchPotterData(),
            child: const Text('Fetch Potter Data'),
          ),
          Expanded(
            child: BlocBuilder<PotterBloc, PotterState>(
              bloc: potterBloc,
              builder: (context, state) {
                if (state is PotterInitial) {
                  return const Center(child: Text('Press the button to fetch data.'));
                } else if (state is PotterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PotterLoaded) {
                  return ListView.builder(
                    itemCount: state.potterdata.length,
                    itemBuilder: (context, index) {
                      final pottersdata = state.potterdata[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: NetworkImage(pottersdata.image!),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              pottersdata.fullName,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Nickname: ${pottersdata.nickname}',
                              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                            ),
                            Text(
                              'House: ${pottersdata.hogwartsHouse}',
                              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                            ),
                            Text(
                              'Played by: ${pottersdata.interpretedBy}',
                              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                            ),
                            Text(
                              'Birthdate: ${pottersdata.birthdate}',
                              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                            ),
                            Text(
                              'Children: ${pottersdata.children}',
                              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is PotterError) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
