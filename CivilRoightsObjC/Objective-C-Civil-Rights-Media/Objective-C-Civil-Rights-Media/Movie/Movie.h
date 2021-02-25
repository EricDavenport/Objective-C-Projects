//
//  Movie.h
//  Objective-C-Civil-Rights-Media
//
//  Created by Eric Davenport on 2/25/21.
//

@interface Movie : NSObject

// properties
@property NSString * originalTitle;
@property NSString * overview;  // description
@property NSString * posterPath;  // used to get the image url

// initializer
- (instancetype)initWithDict: (NSDictionary *)dict;

@end
