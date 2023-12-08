import 'package:books_app/Resources/colors_manager.dart';
import 'package:books_app/Resources/routes_manager.dart';
import 'package:books_app/Resources/values_manager.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        // if (state is BookLoaded) print(state.appBooks[0].name);
      },
      builder: (context, state) {
        if (state is BookLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.appBooks.length,
              itemBuilder: (context, index) {
                final image = state.appBooks[index].image;
                return Container(
                  margin: const EdgeInsets.only(
                      right: AppMargin.m8, top: AppMargin.m10),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                          color: ColorManager.White,
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          image: DecorationImage(
                            image: NetworkImage(
                                image), // replace with your image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: AppSize.s10,
                        right: AppSize.s10,
                        child: SizedBox(
                          height: AppSize.s40,
                          width: AppSize.s40,
                          child: FloatingActionButton(
                            heroTag: null,
                            backgroundColor: ColorManager.DarkGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s100)),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.bookRoute);
                              BlocProvider.of<BookCubit>(context)
                                  .selectBook(index);
                            },
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
