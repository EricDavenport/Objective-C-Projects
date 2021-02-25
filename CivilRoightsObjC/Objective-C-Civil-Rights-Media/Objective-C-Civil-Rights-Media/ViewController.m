//
//  ViewController.m
//  Objective-C-Civil-Rights-Media
//
//  Created by Eric Davenport on 2/25/21.
//

#import "ViewController.h"
#import "APIClient.h"
#import "Movie.h"

// private properties are stored here
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property APIClient *apiClient;
@property NSArray *movies;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.tableView.dataSource = self;
  
  if (_apiClient == nil) {  // if doesn't exist or is nil
    _apiClient = [[APIClient alloc] init];  // initialize
  }
  
  [self fetchMovies];
  
  
}

- (void)fetchMovies {
  [self.apiClient fetchCivilRightsMovies:^(NSError *error, NSArray *movies) {
    self.movies = movies;
    [self.tableView reloadData];
  }];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
  Movie *movie = self.movies[indexPath.row];
  cell.textLabel.text = movie.originalTitle;
  return cell;
}

@end
