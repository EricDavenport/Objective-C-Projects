//
//  APIClient.h
//  Objective-C-Civil-Rights-Media
//
//  Created by Eric Davenport on 2/25/21.
//

@interface APIClient : NSObject

// methods
// in obj-c closures are called blocks
- (void)fetchCivilRightsMovies: (void (^) (NSError *, NSArray *)) completion;

// swift completion handler
// func fetchCivilRightsMovies(completion: (Result<[Movies], Error>) -> (Void)) {
//
// }



@end
