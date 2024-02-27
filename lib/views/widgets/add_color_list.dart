import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/custom_circle_color.dart';

class AddColorList extends StatefulWidget {
  const AddColorList({
    super.key,
  });

  @override
  State<AddColorList> createState() => _AddColorListState();
}

class _AddColorListState extends State<AddColorList> {
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  curentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                });
              },
              child: CustomCircleColor(
                color: kColors[index],
                isLoading: curentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
