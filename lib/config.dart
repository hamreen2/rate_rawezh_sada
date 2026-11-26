import 'package:flutter/material.dart';

// Supabase connection settings (Project Settings -> API).
// ONLY the Project URL and the public (anon / publishable) key belong here.
// NEVER put the service_role key or the database password in the app.
const supabaseUrl = 'https://sfgqvndpwrviecnvjzwi.supabase.co';
const supabaseAnonKey = 'sb_publishable_wsp5BRl8iap91pp3HIGFIg_ytP3yd9Y';

/// One student who can be rated. [name] must match the CHECK in setup.sql.
class Student {
  const Student(this.name, this.color);
  final String name;
  final Color color; // used for the avatar and the card border

  /// "Rawezh Ayoub" -> "RA"
  String get initials => name
      .split(' ')
      .where((w) => w.isNotEmpty)
      .map((w) => w[0].toUpperCase())
      .take(2)
      .join();
}

const students = [
  Student('Rawezh Ayoub', Color(0xFF8B5CF6)),
  Student('Sada Samad', Color(0xFFF2A33A)),
];

/// Big round avatar with the student's initials (no photo needed).
class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.student, required this.size});
  final Student student;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [student.color, student.color.withValues(alpha: 0.65)],
        ),
      ),
      child: Text(student.initials,
          style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.42,
              fontWeight: FontWeight.w700)),
    );
  }
}
