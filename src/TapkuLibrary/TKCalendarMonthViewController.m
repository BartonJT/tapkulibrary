//
//  DaterViewController.m
//  Created by Devin Ross on 7/28/09.
//
/*
 
 tapku.com || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */
#import "TKCalendarMonthViewController.h"


@interface TKCalendarMonthViewController ()
{
	BOOL _sundayFirst;
}


@end


@implementation TKCalendarMonthViewController

@synthesize monthView  = _monthView;

@synthesize delegate   = _delegate;
@synthesize dataSource = _dataSource;

@synthesize cancelButton = _cancelButton;



#pragma mark - Initialisation -

- (id) init
{
	return [self initWithSunday:YES];
}


- (id) initWithSunday:(BOOL)sundayFirst
{
	if (!(self = [super init]))
    {
        return nil;
    }
    
    _delegate = nil;
    _dataSource = nil;
    
    _cancelButton = nil;
    
	_sundayFirst = sundayFirst;
    
	return self;
}



#pragma mark - View Lifecycle -

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}


- (void) viewDidUnload
{
    self.navigationItem.leftBarButtonItem = nil;
    
	self.monthView = nil;
    
    [self setCancelButton:nil];
}


- (void) loadView
{
	[super loadView];
    
    [self setTitle:@"Pick Date"];
	
	_monthView = [[TKCalendarMonthView alloc] initWithSundayAsFirst:_sundayFirst];
    
    
    if (!_delegate)
    {
        _monthView.delegate = self;
    }
    else
    {
        //_monthView.delegate = _delegate;
    }
    
    if (!_dataSource)
    {
        _monthView.dataSource = self;
    }
    else
    {
        _monthView.dataSource = _dataSource;
    }
    
    _cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                  target:self
                                                                  action:@selector(dismissTKCalendarMonthViewController)];
    
    self.navigationItem.leftBarButtonItem = self.cancelButton;
    
    
	[self.view addSubview:_monthView];
	[_monthView reload];
}



#pragma mark - Object Methods -

- (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView
                 marksFromDate:(NSDate*)startDate
                        toDate:(NSDate*)lastDate
{
	return nil;
}


- (void) dismissTKCalendarMonthViewController
{
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(dismissTKCalendarMonthViewController:)])
    {
        [self.delegate dismissTKCalendarMonthViewController:self];
    }
}


@end

