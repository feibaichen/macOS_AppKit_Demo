#import "CustomCollectionViewItem.h"
@implementation CustomCollectionViewItem
-(void)viewDidLoad{
    
    if(!self.representedObject){
        return;
    }
    
    [self.myImageView setImage:[self.representedObject objectForKey:@"image"]];
    [self.myText setStringValue:[self.representedObject objectForKey:@"title"]];
}

@end
