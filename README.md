# Rawezh or Sada?

A live feedback app: students scan a QR code, choose **Rawezh Ayoub** or **Sada Samad**, give 1 to 5 stars and an optional comment. The projector screen shows each student's average rating, vote count and comments in real time.

- Front end: Flutter web (two screens: `#/` for phones, `#/wall` for the projector)
- Back end: Supabase (table `student_feedback`, Row Level Security, Realtime)
- Hosting: GitHub Pages (built by GitHub Actions)

SQL: `supabase/setup.sql`. Fonts (bundled, OFL): Roboto, Noto Emoji, Noto Sans Arabic.
