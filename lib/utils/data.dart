import 'package:uuid/uuid.dart';

import '../enums/movie_category.dart';
import '../models/movie.dart';

final List<Movie> _movies = [
  ///poster
  Movie(id: "poster", title: "The Crown", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4" , imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/crown1.png?alt=media&token=4b67920b-87f8-4f44-94bc-96af8b26fd5e"),

  ///regular
  Movie(id: const Uuid().v4(), title: "Avengers", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.action.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/avengers.png?alt=media&token=dda15fee-3cd2-45e6-99b2-1a6a43030222"),
  Movie(id: const Uuid().v4(), title: "Den of Thieves", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/den.png?alt=media&token=aa119634-7c1c-482a-9d20-f28c072eceff"),
  Movie(id: const Uuid().v4(), title: "Stranger Things", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.fantasy.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/stranger_things.png?alt=media&token=e30223ec-957f-4468-a17b-14c0b2c4c893"),
  Movie(id: const Uuid().v4(), title: "Hustle", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/hustle.png?alt=media&token=80413f10-e5ee-427f-ba3b-e98777aecb82"),
  Movie(id: const Uuid().v4(), title: "Money Heist", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.action.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/hiest.png?alt=media&token=4648972f-23b5-4907-b499-04170b705779"),
  Movie(id: const Uuid().v4(), title: "Iron Chef", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/ironchef.png?alt=media&token=2cca58b7-3bc4-407b-a8b6-0378caa1bf69"),
  Movie(id: const Uuid().v4(), title: "Lincoln Lawyer", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/lincon_layer.png?alt=media&token=5de1c222-c87c-465e-8d57-d3a695da3443"),
  Movie(id: const Uuid().v4(), title: "Love & Gelato", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/love.png?alt=media&token=00b1ec85-518b-4b1a-80bd-d9d8a51f3f75"),
  Movie(id: const Uuid().v4(), title: "The Toronto Man", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/man.png?alt=media&token=7510285b-dd79-45e8-b0ed-280251b69a5e"),
  Movie(id: const Uuid().v4(), title: "The Man vs Bee", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/man_vs_bee.png?alt=media&token=ae75bf5f-1852-4564-b238-702ed563ec1f"),
  Movie(id: const Uuid().v4(), title: "The Peaky Blinders", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.action.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/peaky.png?alt=media&token=fe11036e-be3a-4570-bd7b-4c5557a5ca9c"),
  Movie(id: const Uuid().v4(), title: "Lives of Pets", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/pets.png?alt=media&token=39e449f6-0dca-459b-bf20-faca831b8389"),
  Movie(id: const Uuid().v4(), title: "Snowflakes", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.fantasy.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/snowflake.png?alt=media&token=3a04b862-4d2e-4760-bfcb-68751051d37e"),
  Movie(id: const Uuid().v4(), title: "Switch", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: false, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/switch.png?alt=media&token=f3d4793a-0495-4e95-84f8-0715703d68ae"),
  Movie(id: const Uuid().v4(), title: "Umbrella Academy", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.action.name, isSeason: true, releaseDate: DateTime.now(), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/umbrella.png?alt=media&token=8c9b8c4e-0f09-40d6-b979-e2dd71671ba1"),

  ///coming soon
  Movie(id: const Uuid().v4(), title: "The Dogs", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.fantasy.name, isSeason: false, releaseDate: DateTime(2023,2,06), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/dogs.jpg?alt=media&token=bc1e0138-1c8c-4b9c-9086-88ce319d3e8f"),
  Movie(id: const Uuid().v4(), title: "Black Mirror", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.fantasy.name, isSeason: false, releaseDate: DateTime(2023,2,13), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/black_mirror.jpg?alt=media&token=a853ea5f-0c5f-4728-aabb-a5bd6a767b82"),
  Movie(id: const Uuid().v4(), title: "Breaking Bad", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.drama.name, isSeason: true, releaseDate: DateTime(2023,3,7), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/breaking_bad.jpeg?alt=media&token=f35a8d66-b38f-40a7-8bc7-e0fc9709d74f"),
  Movie(id: const Uuid().v4(), title: "Sintel", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.comedy.name, isSeason: false, releaseDate: DateTime(2023,4,8), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/sintel.jpg?alt=media&token=50b8437f-2e2e-4d4a-a0a4-eac7c7259b9c"),
  Movie(id: const Uuid().v4(), title: "13 reasons why", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.fantasy.name, isSeason: true, releaseDate: DateTime(2023,5,23), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/thirteen_reasons_why.jpg?alt=media&token=d17263e7-afe9-4716-8e2f-e4bdd75ff4ff"),
  Movie(id: const Uuid().v4(), title: "Witcher", des: "dummy", length: 90, ageRating: 13, category: MovieCategory.action.name, isSeason: true, releaseDate: DateTime(2023,5,23), videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", imgUrl: "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/witcher.jpg?alt=media&token=3b0a670d-59e7-4e13-ae71-b9d71ab55418"),

];

// uploadMovies() async{
//   if(uploaded){
//     return;
//   }
//   uploaded = true;
//
//   for (int i=0; i<_releasedMovies.length; i++){
//     Movie movie = _releasedMovies[i];
//     if(movie.category == MovieCategory.action.name){
//       await FirebaseFirestore.instance.collection("movies")
//           .doc(movie.id)
//           .update({
//         "videoUrl": "https://firebasestorage.googleapis.com/v0/b/netflix-clone-3d1e2.appspot.com/o/VID_20230116_154853.mp4?alt=media&token=6c649092-9ce2-455f-a8db-11163f8c6eb5"
//       });
//     }
//   }
//
// }
