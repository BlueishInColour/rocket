import 'package:dart_frog/dart_frog.dart';

List list_of_articles = [
  {
    'title': 'bahamas trip to newyork, putin fails to deliver',
    'pictureUrl': '',
    'content': '',
    'likesCount': '34',
    'viewsCount': '12k',
    'creator': 'starshit',
    'commentCount': '76',
  },
  {
    'title': 'summer beach is flamy hot right now, get back in the car',
    'pictureUrl': '',
    'content': '',
    'likesCount': '23',
    'creator': 'niggabros',
    'viewsCount': '24k',
    'commentCount': '1k',
  },
  {
    'title':
        'i am a barbie girl in a barbie world is topping the charts all over the world',
    'pictureUrl': '',
    'content': '',
    'likesCount': '23',
    'viewsCount': '24k',
    'commentCount': '1k',
  },
  {
    'title':
        'i did this all for you , buh she saw noting in my eyes after lookig dead inside',
    'pictureUrl': 'ih9iowkhioekn',
    'content': '',
    'likesCount': '23',
    'creator': '2bros',
    'viewsCount': '24k',
    'commentCount': '1k',
  },
  {
    'title':
        ' i feel selfish some tikmes , lookk what i turned into, sorry bro',
    'pictureUrl': '',
    'content': '',
    'likesCount': '23',
    'viewsCount': '24k',
    'commentCount': '1k',
  },
  {
    'title':
        'its been a long time, since ewe were young , ive always wanted t have you clise',
    'pictureUrl': 'igwoluihw9io',
    'content': '',
    'likesCount': '23',
    'creator': '6ix2wo',
    'viewsCount': '24k',
    'commentCount': '1k',
  },
];

Response onRequest(RequestContext context) {
  // TODO: implement route handler
  return Response.json(body: list_of_articles);
}
