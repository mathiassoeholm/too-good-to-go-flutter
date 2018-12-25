import 'package:flutter/widgets.dart';

class ListUtil {

  static List<Widget> notNullWidgets(List<Widget> widgets) => whereNotNull(widgets);

  static List<E> whereNotNull<E>(List<E> list) => list.where((e) => e != null).toList();
}