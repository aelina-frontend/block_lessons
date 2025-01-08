import 'package:bloc_lessons/rent_car_app/cubit/rent_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentCarScreen extends StatelessWidget {
  const RentCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (name){
            context.read<RentCubit>().searchByBrand(name);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),

        ),
      ),
      body: BlocBuilder<RentCubit, RentState>(builder: (context, state) {
        if (state is RentLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RentError) {
          return Center(
            child: Text('${state.error}'),
          );
        } else if (state is RentSuccess) {
          return GridView.builder(
              itemCount: state.cars.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        state.cars[index]['image'],
                        width: 200,
                      ),
                      Text(state.cars[index]['brand']),
                      Text(state.cars[index]['price'].toString()),
                      IconButton(
                        onPressed: () {
                          context.read<RentCubit>().isLIke(index);

                        },
                        icon: state.cars[index]['isLike']
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                );
              });
        }
        return const Center(
          child: Text('нету доступных машин'),
        );
      }),
    );
  }
}
