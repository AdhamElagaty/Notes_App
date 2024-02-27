import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/views/widgets/custom_circle_color.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({
    super.key,
    required this.intialColor,
  });

  final int intialColor;

  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int curentIndex;

  @override
  void initState() {
    curentIndex = kColors.indexOf(Color(widget.intialColor));
    super.initState();
  }

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
                BlocProvider.of<EditNoteCubit>(context).color =
                    kColors[index].value;
                BlocProvider.of<EditNoteCubit>(context).isValidColor();
                setState(() {
                  curentIndex = index;
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
