
#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person

// initializers
-  (instancetype)initWithName:(NSString *)name {
  if (self = [super init]) {
    self.name = name;
  }
  return self;
}

// class methods
+ (NSArray *)allPeople {
  Person *alex = [[Person alloc] init];
  alex.name = @"Alex";
  
  Person *bien = [[Person alloc] init];
  bien.name = @"Boen";
  
  NSArray *people = @[alex, bien];
  
  return people;
}

// instance methods
- (void)info {
  NSLog(@"The person's name is %@", self.name);
}


@end
