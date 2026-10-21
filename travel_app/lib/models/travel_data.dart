import 'destination_model.dart';

const Tour iconicBrazilTour = Tour(
  id: 'tour_1',
  title: 'Iconic Brazil',
  days: 8,
  priceFrom: 659,
  rating: 4.6,
  reviewCount: 56,
  dates: 'Wed, Oct 21 – Sun, Nov 1',
  adventureTitle: '8-Days Brazil Adventure',
  imageUrl:
      'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?q=80&w=1000&auto=format&fit=crop',
  schedule: [
    ItineraryDay(
      dayNumber: 1,
      title: 'Arrival to Rio de Janeiro',
      imageUrl:
          'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description: 'Arrive in Rio de Janeiro and transfer to your hotel',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Free time to relax or explore the nearby area',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description:
              'Welcome dinner at a traditional Brazilian restaurant',
        ),
      ],
    ),
    ItineraryDay(
      dayNumber: 2,
      title: 'Rio de Janeiro Highlights',
      imageUrl:
          'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description:
              'Cable car journey up Sugarloaf Mountain for panoramic views',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description:
              'Scenic walk along Copacabana and Ipanema beachfronts',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description:
              'Live Samba music and street culinary tour in historic Lapa',
        ),
      ],
    ),
    ItineraryDay(
      dayNumber: 3,
      title: 'Corcovado & Christ the Redeemer',
      imageUrl:
          'https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description:
              'Cog train through Tijuca forest to Christ the Redeemer statue',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Art galleries and bohemian cafés in Santa Teresa',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Sunset drinks at Arpoador rock overlooking the sea',
        ),
      ],
    ),
    ItineraryDay(
      dayNumber: 4,
      title: 'Tijuca National Park & Waterfalls',
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description:
              'Guided eco-hike through lush rainforest trails and hidden waterfalls',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Botanical Garden visit with royal palms and exotic birds',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Relaxed seaside dinner at beachfront bistro',
        ),
      ],
    ),
  ],
);

const Tour beachTour = Tour(
  id: 'tour_2',
  title: 'Beach & Nature',
  days: 8,
  priceFrom: 720,
  rating: 4.8,
  reviewCount: 82,
  dates: 'Mon, Nov 9 – Tue, Nov 17',
  adventureTitle: '8-Days Coastal Paradise',
  imageUrl:
      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=1000&auto=format&fit=crop',
  schedule: [
    ItineraryDay(
      dayNumber: 1,
      title: 'Arrival & Copacabana Sunset',
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description: 'Check-in to oceanfront hotel in Ipanema',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Relaxation and beach volleyball at Copacabana',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Seafood dinner and caipirinhas at beachfront lounge',
        ),
      ],
    ),
    ItineraryDay(
      dayNumber: 2,
      title: 'Ilha Grande Island Hopping',
      imageUrl:
          'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description: 'Speedboat transfer to emerald lagoons and secluded bays',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Snorkeling with sea turtles and tropical fish',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Sunset cruise back along the coastline',
        ),
      ],
    ),
  ],
);

const Tour rainforestTour = Tour(
  id: 'tour_3',
  title: 'Rainforest & Wildlife',
  days: 5,
  priceFrom: 480,
  rating: 4.9,
  reviewCount: 94,
  dates: 'Fri, Nov 20 – Wed, Nov 25',
  adventureTitle: '5-Days Rainforest & Canopy Expedition',
  imageUrl:
      'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?q=80&w=1000&auto=format&fit=crop',
  schedule: [
    ItineraryDay(
      dayNumber: 1,
      title: 'Tijuca National Park Trek',
      imageUrl:
          'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description: 'Guided eco-trek into the world\'s largest urban forest',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Swimming in natural cascades and crystalline waterfalls',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Canopy lodge dinner featuring Amazonian culinary delights',
        ),
      ],
    ),
    ItineraryDay(
      dayNumber: 2,
      title: 'Exotic Birds & Botanical Wonders',
      imageUrl:
          'https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=500&auto=format&fit=crop',
      items: [
        ScheduleItem(
          timeOfDay: 'Morning',
          description: 'Early birdwatching walk to spot toucans and hummingbirds',
        ),
        ScheduleItem(
          timeOfDay: 'Afternoon',
          description: 'Orchid gardens tour and historical greenhouse exploration',
        ),
        ScheduleItem(
          timeOfDay: 'Evening',
          description: 'Campfire acoustic music and stargazing session',
        ),
      ],
    ),
  ],
);

final List<Destination> appDestinations = [
  Destination(
    id: 'asia_kyoto',
    country: 'Japan',
    name: 'Kyoto',
    region: 'Asia',
    imageUrl:
        'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?q=80&w=1000&auto=format&fit=crop',
    rating: 4.9,
    reviewCount: 210,
    description:
        'Kyoto, once the capital of Japan, is a city on the island of Honshu famous for its classical Buddhist temples, gardens, imperial palaces, Shinto shrines and traditional wooden houses.',
    upcomingTours: [iconicBrazilTour, beachTour, rainforestTour],
  ),
  Destination(
    id: 'europe_dolomites',
    country: 'Italy',
    name: 'Dolomites',
    region: 'Europe',
    imageUrl:
        'https://images.unsplash.com/photo-1530122037265-a5f1f91d3b99?q=80&w=1000&auto=format&fit=crop',
    rating: 4.9,
    reviewCount: 184,
    description:
        'The Dolomites are a mountain range located in northeastern Italy. They form part of the Southern Limestone Alps and feature dramatic sheer cliffs and idyllic alpine valleys.',
    upcomingTours: [iconicBrazilTour, beachTour, rainforestTour],
  ),
  Destination(
    id: 'south_america_rio',
    country: 'Brazil',
    name: 'Rio de Janeiro',
    region: 'South America',
    imageUrl:
        'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?q=80&w=1000&auto=format&fit=crop',
    rating: 5.0,
    reviewCount: 143,
    description:
        'Rio de Janeiro, often simply called Rio, is one of Brazil\'s most iconic cities, renowned for its golden beaches, vibrant culture, and dramatic mountains.',
    upcomingTours: [iconicBrazilTour, beachTour, rainforestTour],
  ),
  Destination(
    id: 'north_america_banff',
    country: 'Canada',
    name: 'Banff',
    region: 'North America',
    imageUrl:
        'https://images.unsplash.com/photo-1503614472-8c93d56e92ce?q=80&w=1000&auto=format&fit=crop',
    rating: 4.8,
    reviewCount: 168,
    description:
        'Banff is a resort town in the province of Alberta, located within Banff National Park in the Canadian Rockies. Peaks like Mt. Rundle and Mt. Cascade dominate its skyline.',
    upcomingTours: [iconicBrazilTour, beachTour, rainforestTour],
  ),
];
