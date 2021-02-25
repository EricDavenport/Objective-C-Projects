//
//  APIClient.m
//  Objective-C-Civil-Rights-Media
//
//  Created by Eric Davenport on 2/25/21.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"
#import "Movie.h"

@implementation APIClient

- (void)fetchCivilRightsMovies:(void (^)(NSError *, NSArray *))completion {
  
  // endpoint
  NSString *endpoint =
  @"https://civilrights-media-default-rtdb.firebaseio.com/.json";
  
  // create a url
  NSURL *url = [NSURL URLWithString:endpoint];
  
  // create and make data task request using NSURLSession
  NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error) {
      completion(error, nil);
    } else {
      // declare an error type to capture reference of any errors
      NSError *error;
      
      // inintialize a dictionary to hold parsed JSON data
      // how do we convert JSON data to swift objects => JSONDecoder()
      // decodable protocol -> sobject needs to conform to decodable
      
      // Swift  =>> decodable
      // OBJ-C Decodable =>> NSJSONSeriallization
      NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
      
      NSMutableArray *movies = [[NSMutableArray alloc] init];
      
      // create movies dict array
      // currenlty moviesDict has 64 objects
      NSDictionary * moviesDict = jsonDict[@"movies"];
      
      for (NSString * movieId in moviesDict) {
        NSDictionary *movieDict = moviesDict[movieId];
        Movie *movie = [[Movie alloc] initWithDict:movieDict];
        [movies addObject:movie];
      }
      
      // capture movies in completion
      // dispatch back to main thread
      dispatch_async(dispatch_get_main_queue(), ^{
        completion(nil, movies);
      });
    }
    
    
  }];
  
  // resume execution of network request
  [dataTask resume];

}

@end
