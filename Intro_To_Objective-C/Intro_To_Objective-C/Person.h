

@interface Person : NSObject

// properties
@property NSString *name;
// let name: String -> Swift

// initializers
- (instancetype) initWithName: (NSString *) name;

// methods

// class methods
+ (NSArray *)allPeople;

// instance methods begin with a minus (-)
- (void)info;

@end

