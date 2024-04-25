import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_demo/presentation/blocs/get_user/get_user_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;
  GetUserBloc bloc = GetIt.instance<GetUserBloc>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetUserButtonPressed());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        try {
          final data = await supabase.from('User').select();
          print(data);
        } catch (error) {
          print(error);
        }
      }),
      body: BlocConsumer<GetUserBloc, GetUserState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GetUserLoadingState) print('Loadig..');
          if (state is GetUserLoadedState) print(state.userList);
          if (state is GetUserErrorState) print(state.failure.message);
        },
        builder: (context, state) {
          return Text('Loading...');
        },
      ),
    );
  }
}
