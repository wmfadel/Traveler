class Destination {
  int id;
  String name;
  double rate;
  int hotelsCount;
  String image;
  String imageDescription;

  Destination(this.id, this.name, this.rate, this.hotelsCount, this.image,
      this.imageDescription);
}

List<Destination> destinations = [
  Destination(
      1,
      'San Francisco',
      7.2,
      366116,
      'https://cdn.pixabay.com/photo/2018/05/12/20/03/san-francisco-3394456__340.jpg',
      '	San Francisco, California and Marin County, California, U.S.'),
  Destination(
      2,
      'Paris',
      9.6,
      954554,
      'https://www.telegraph.co.uk/content/dam/Travel/hotels/europe/france/paris/paris-cityscape-overview-guide.jpg?imwidth=500',
      'Eiffel Tower, 7th arrondissement, Paris, France.'),
  Destination(
      3,
      'Marina Bay',
      7.9,
      659884,
      'https://www.shipit.co.uk/blog/wp-content/uploads/Fotolia_103305335_S-1.jpg',
      'Marina Bay, 	Bayfront Subzone, Downtown Core, Singapore.'),
  Destination(
      4,
      'Mount Fuji',
      6.9,
      128889,
      'https://www.budgetdirect.com.au/blog/wp-content/uploads/2018/03/Japan-Travel-Guide.jpg',
      'Mount Fuji, Mount Fuji Japan'),
  Destination(
      5,
      'Beijing',
      5.4,
      951515,
      'https://www.sciencemag.org/sites/default/files/styles/inline__450w__no_aspect/public/images/16Dec-China-Lead.jpg?itok=IvSaklsk',
      'Guangzhou city on the Pearl River, China'),
];
