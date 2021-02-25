//
//  Movie.m
//  Objective-C-Civil-Rights-Media
//
//  Created by Eric Davenport on 2/25/21.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@implementation Movie

- (instancetype)initWithDict:(NSDictionary *)dict {
  if (self = [super init]) {
    // initialize all properties
    self.originalTitle = dict[@"originalTitle"];
    self.overview = dict[@"overview"];
    self.posterPath = dict[@"posterPath"];
  }
  return self;
}

@end
