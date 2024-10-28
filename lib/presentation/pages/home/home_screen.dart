
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_clean_archi_bloc_api_app/utils/routes/routes_name.dart';

import '../../../config/storage/local_storage.dart';
import '../../../main.dart';
import '../../../utils/enums.dart';
import '../../bloc/movie_bloc/movies_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    moviesBloc = MoviesBloc(moviesrepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Row(
            children: [
              Text("Update Screen"),
              SizedBox(width: 4,),
              IconButton(onPressed: (){
                Navigator.pushNamed(context, RoutesName.updateScreen);
              }, icon: Icon(Icons.update)),

              IconButton(onPressed: (){
                LocalStorage localStorage = LocalStorage();
                localStorage.clearValue('token').then((value){
                  localStorage.clearValue('isLogin').then((value){
                    Navigator.pushNamed(context, RoutesName.loginScreen);
                  });

                });
              }, icon: Icon(Icons.login_outlined))
            ],
          )


        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state){
            switch(state.movieList.status){
              case Status.loading:
                return const Center(child: CircularProgressIndicator(),);

              case Status.error :
               /* if(state.movieList.message == 'No Internet'){
                  return InternetException(onPress: (){
                    print("no internet");
                    moviesBloc.add(MoviesFetched());
                  });
                }*/
                return  Center(child: Text('${state.movieList.message.toString()}'));
              case Status.completed:
                print('complited ${state.movieList.data?.tvShows?.length}');
                if(state.movieList.data == null){
                  return Text('No data Found');
                }

                final movieList = state.movieList.data!;
                return ListView.builder(
                    itemCount: movieList.tvShows?.length,
                    itemBuilder: (context, index){
                      print('list $movieList');
                      final tvShow = movieList.tvShows?[index];
                      return Card(
                        child: ListTile(
                          title: Text(tvShow!.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    });

              default: return SizedBox();

            }
            return SizedBox();
          },
        ),
      ),

    );
  }
}
