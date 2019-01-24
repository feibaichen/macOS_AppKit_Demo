//
//  AppDelegate.m
//  MacTableViewDemo
//
//  Created by MacOS on 2019/1/24.
//  Copyright © 2019 MacOS. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTableCellView.h"
#import "CustomTableRowView.h"
#import "Masonry.h"

@interface AppDelegate ()<NSTableViewDelegate,NSTableViewDataSource>

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic,strong) NSTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self tableViewSetting];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSTableView *)tableView
{
    if(!_tableView){
        _tableView = [[NSTableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    }
    return _tableView;
}

-(void)tableViewSetting{
    
    self.window.backgroundColor = [NSColor blackColor];
    
    //第一列
    NSTableColumn *column1 = [[NSTableColumn alloc] initWithIdentifier:@"columnFrist"];
    column1.title = @"columnFrist";
    [column1 setWidth:80];
    [self.tableView addTableColumn:column1];
    
    //第二列
    NSTableColumn * column2 = [[NSTableColumn alloc] initWithIdentifier:@"columnSecond"];
    column2.title = @"columnSecond"; //如果为空，则默认显示‘Field’
    [column2 setWidth:60];
    [self.tableView addTableColumn:column2];
    
    //第三列
    NSTableColumn * column3 = [[NSTableColumn alloc] initWithIdentifier:@"column3"];
    column3.title = @"column3";
    [column3 setWidth:60];
    [self.tableView addTableColumn:column3];
    
    self.tableView.focusRingType = NSFocusRingTypeExterior;//tableview获得焦点时的风格
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleRegular;//行高亮的风格
    //self.tableView.backgroundColor = [NSColor orangeColor];
    //self.tableView.usesAlternatingRowBackgroundColors = YES; //背景颜色的交替，一行白色，一行灰色。设置后，原来设置的 backgroundColor 就无效了。
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.gridColor = [NSColor magentaColor];
    
    //实现tableview的滚动效果
    NSScrollView *tableContainerView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    tableContainerView.backgroundColor = [NSColor redColor];
    
    [tableContainerView setDocumentView:self.tableView];
    [tableContainerView setDrawsBackground:NO];//不画背景（背景默认画成白色）
    [tableContainerView setHasVerticalScroller:YES];//有垂直滚动条
    
    //[_tableContainer setHasHorizontalScroller:YES];  //有水平滚动条
    tableContainerView.autohidesScrollers = YES;//自动隐藏滚动条（滚动的时候出现）
    
    
    [self.window.contentView addSubview:tableContainerView];
    
    [tableContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.window.contentView.mas_top).with.offset(10);
        make.left.equalTo(self.window.contentView.mas_left).with.offset(10);
        make.bottom.equalTo(self.window.contentView.mas_bottom).with.offset(-30);
        make.right.equalTo(self.window.contentView.mas_right).with.offset(-10);
    }];
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[
                                                       @{@"columnFrist": @"Jack", @"columnSecond": @"China",@"column3": @"4234"},
                                                       @{@"columnFrist": @"Lily", @"columnSecond": @"USA",@"column3": @"434"},
                                                       @{@"columnFrist": @"Tom", @"columnSecond": @"Canada",@"column3": @"24"},
                                                       @{@"columnFrist": @"Lucy", @"columnSecond": @"Russia",@"column3": @"54"},
                                                       @{@"columnFrist": @"John", @"columnSecond": @"Japan",@"column3": @"65"},
                                                       @{@"columnFrist": @"Derek", @"columnSecond": @"Swiden",@"column3": @"56"},
                                                       @{@"columnFrist": @"Berlin", @"columnSecond": @"Bretch",@"column3": @"67"},
                                                       @{@"columnFrist": @"Seel", @"columnSecond": @"indel",@"column3": @"76"},
                                                       @{@"columnFrist": @"Juliy", @"columnSecond": @"jsskl",@"column3": @"78"},
                                                       @{@"columnFrist": @"Kavel", @"columnSecond": @"kaoe",@"column3": @"23"},
                                                       @{@"columnFrist": @"Gooh", @"columnSecond": @"Relwe",@"column3": @"435"},
                                                       @{@"columnFrist": @"Kelo", @"columnSecond": @"Goood",@"column3": @"89"},
                                                       @{@"columnFrist": @"Fetv", @"columnSecond": @"WEE",@"column3": @"56"},
                                                       @{@"columnFrist": @"Luir", @"columnSecond": @"FDF",@"column3": @"432"},
                                                       @{@"columnFrist": @"Reven", @"columnSecond": @"YETR",@"column3": @"78"},
                                                       @{@"columnFrist": @"Per", @"columnSecond": @"CCDF",@"column3": @"98"},
                                                       @{@"columnFrist": @"Well", @"columnSecond": @"TYURTY",@"column3": @"09"}
                                                       ]];
    }
    return _dataSource;
}

#pragma mark - NSTableViewDelegate,NSTableViewDataSource
//返回行数
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return self.dataSource.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSDictionary *rowInfoDic = self.dataSource[row];
    //获取表格列的标识符
    NSString *columnID = rowInfoDic[tableColumn.identifier];;
    NSLog(@"columnID : %@ ,row : %ld",columnID,row);
    
    //NSString *strIdt = @"123";
    CustomTableCellView *cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if (!cell) {
        cell = [[CustomTableCellView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        //cell.identifier = tableColumn.identifier;
    }
    
    cell.wantsLayer = YES;
    cell.layer.backgroundColor = [NSColor yellowColor].CGColor;
    cell.string = columnID;
    return cell;
}

//自定义 row view
- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    CustomTableRowView *rowView = [tableView makeViewWithIdentifier:@"rowView" owner:self];
    if (rowView == nil) {
        rowView = [[CustomTableRowView alloc] init];
        rowView.identifier = @"rowView";
    }
    return rowView;
}

#pragma mark - 行高
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 44;
}

//选中的响应
-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    
    NSTableView *tableView = notification.object;
    NSLog(@"---selection row %ld", tableView.selectedRow);
    //    CustomTableCellView *contentView = [tableView makeViewWithIdentifier:@"name" owner:self];
    
    CustomTableCellView *contentView = [tableView viewAtColumn:0 row:tableView.selectedRow makeIfNecessary:NO];
    contentView.label.wantsLayer = YES;
    contentView.label.textColor = [NSColor blueColor];
}

@end
