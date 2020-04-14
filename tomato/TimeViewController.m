//
//  TimeViewController.m
//  tomato
//
//  Created by 刘子祺 on 2020/4/10.
//  Copyright © 2020 刘子祺. All rights reserved.
//

#import "TimeViewController.h"
#import "CountdownView.h"
#import "FinishNotice.h"

@interface TimeViewController ()
@property (strong, nonatomic) CountdownView * countDownView;
@property (nonatomic, readwrite) int length;

@end

@implementation TimeViewController

- (instancetype) init:(NSString *)length{
    self = [super init];
    if(self){
        self.length = [length intValue];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpeg"]];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 200)/2.0, 0, 200, 50);
    btn.center = self.view.center;
    btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:24];
    [btn setTitle:@"开始计时" forState:UIControlStateNormal];
    //[btn setTitleColor:[UIColor colorWithRed:48/255.0 green:157/255.0 blue:216/255.0 alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(countDownEvent) forControlEvents:UIControlEventTouchUpInside];
    [self countDownEvent];
    [self.view addSubview:btn];
    
    __weak typeof (btn)weakBtn= btn;
//    CountdownView * countView = [[CountdownView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.0, 200, 200, 200) totalTime:5  lineWidth:3.0 lineColor:[UIColor colorWithRed:48/255.0 green:157/255.0 blue:216/255.0 alpha:1]  completeBlock:^{
////        [weakBtn setTitle:@"重新计时" forState:UIControlStateNormal];
//            FinishNotice *aview = [[FinishNotice alloc]initWithFrame:[[[UIApplication sharedApplication] windows] objectAtIndex:0].bounds];
//            [aview show];
//            [self.navigationController popViewControllerAnimated:YES];
//
//    }];
    CountdownView * countView = [[CountdownView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.0, 200, 200, 200) totalTime:_length * 1 * 60  lineWidth:5.0 lineColor:[UIColor whiteColor]  startBlock:^{
            [weakBtn setTitle:@"计时中..." forState:UIControlStateNormal];
            } completeBlock:^{
    //        [weakBtn setTitle:@"重新计时" forState:UIControlStateNormal];
                FinishNotice *aview = [[FinishNotice alloc]initWithFrame:[[[UIApplication sharedApplication] windows] objectAtIndex:0].bounds];
                [aview show];
                [self.navigationController popViewControllerAnimated:YES];

        }];
    [self.view addSubview:self.countDownView = countView];
    // Do any additional setup after loading the view.
}

-(void)countDownEvent
{
    if (!self.countDownView.isCountingDown) {
        [self.countDownView startCountDown];
    }
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

