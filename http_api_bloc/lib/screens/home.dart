import 'package:flutter/material.dart';

import '../blocs/bloc_export.dart';
import '../models/user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            )..add(LoadUser()),
        child: Scaffold(
            // key: scaffoldKey,
            body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoaded) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    UserModel user = userList[index];
                    return Card(
                      color: Colors.blue,
                      child: ListTile(
                        title: Text(
                          user.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          user.body,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // trailing: CircleAvatar(
                        //   backgroundImage: NetworkImage(user.atvatar),
                        // )
                      ),
                    );
                  });
            }
            if (state is UserError) {
              return const Center(child: Text("Error"));
            }
            return Container();
          },
        )));
  }
}
