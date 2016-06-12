//
//  LoadAnimation.m
//  CAShowcase
//
//  Created by tusm on 15/4/27.
//
//

#import "LoadAnimation.h"
#define ImageNameDotWhite @"community_point_white.png"
#define ImageNameDotBlu @"community_point_blue.png"
#define SizeWidthYiubook 100
#define SizeHeigthYiubook 25
#define TimeAnimationDur 0.1
#define DistanceDotAndYiubook 5
#define DistanceDot 13
#define SizeWidthDot 10
static const CGFloat  padding= 0;    //刷新动画和tableView的上边界或下边界的距离

@interface LoadAnimation()
@property(strong,nonatomic) NSTimer *animationTimer;
@property(assign,nonatomic) int dotIndex;
@property(nonatomic,strong) NSMutableArray *arrayHeadImageViews;
@property(nonatomic,strong) NSMutableArray *arrayFooterImageViews;
@end
@implementation LoadAnimation

- (instancetype)initYiubookViewWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitHeadImageviews];
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:TimeAnimationDur target:self selector:@selector(timerYiubook:) userInfo:nil repeats:YES];
    }
    self.dotIndex=0;
    return self;
}
- (instancetype)initDotLoadingWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitFooterImageViews];
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:TimeAnimationDur target:self selector:@selector(timerDot:) userInfo:nil repeats:YES];
    }
    self.dotIndex=0;
    return self;
}
-(void)InitHeadImageviews
{
    self.arrayHeadImageViews=[[NSMutableArray alloc]init];
    NSString *imageName;
    for(int i=0;i<5;i++){
        if(i==self.dotIndex)
            imageName=ImageNameDotBlu;
        else
            imageName=ImageNameDotWhite;
        UIImageView *imageDotLeft=[[UIImageView alloc]initWithFrame:CGRectMake(DistanceDot*i, 0, SizeWidthDot, SizeWidthDot)];
        imageDotLeft.image=[UIImage imageNamed:imageName];
        imageDotLeft.center=CGPointMake(self.frame.size.width/2-SizeWidthYiubook/2-DistanceDotAndYiubook-DistanceDot*i-SizeWidthDot/2, self.frame.size.height/2+padding);
        [self addSubview:imageDotLeft];
        
        UIImageView *imageDotRight=[[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - DistanceDot*i, 0, SizeWidthDot, SizeWidthDot)];
        imageDotRight.image=[UIImage imageNamed:imageName];
        imageDotRight.center=CGPointMake(self.frame.size.width/2+SizeWidthYiubook/2+DistanceDotAndYiubook+DistanceDot*i+SizeWidthDot/2, self.frame.size.height/2+padding);
        [self addSubview:imageDotRight];
        
        [self.arrayHeadImageViews addObject:imageDotLeft];
        [self.arrayHeadImageViews addObject:imageDotRight];
    }
}
-(void)InitFooterImageViews{
    self.arrayFooterImageViews=[[NSMutableArray alloc]init];
    NSString *imageName;
    for(int i=-2;i<3;i++){
        if((i+2)==self.dotIndex)
            imageName=ImageNameDotBlu;
        else
            imageName=ImageNameDotWhite;
        UIImageView *imageDot=[[UIImageView alloc]initWithFrame:CGRectMake(DistanceDot*i, 0, SizeWidthDot, SizeWidthDot)];
        imageDot.image=[UIImage imageNamed:imageName];
        imageDot.center=CGPointMake(self.frame.size.width/2+DistanceDot*i, self.frame.size.height/2);
        [self addSubview:imageDot];
        [self.arrayFooterImageViews addObject:imageDot];
    }
}
- (void)timerYiubook:(NSTimer *)timer
{
    if (!self) {
        return;
    }
    
    if (self.hidden) {
        return;
    }
    NSString *imageName;
    for(int i=0;i<5;i++){
        if(i==self.dotIndex)
            imageName=ImageNameDotBlu;
        else
            imageName=ImageNameDotWhite;
        UIImageView *imageDotLeft=[self.arrayHeadImageViews objectAtIndex:2*i];
        imageDotLeft.image=[UIImage imageNamed:imageName];

        UIImageView *imageDotRight=[self.arrayHeadImageViews objectAtIndex:2*i+1];
        imageDotRight.image=[UIImage imageNamed:imageName];
    }
    self.dotIndex--;
    if(self.dotIndex<0)
        self.dotIndex=4;
}
- (void)timerDot:(NSTimer *)timer
{
    if (!self) {
        return;
    }
    
    if (self.hidden) {
        return;
    }
    NSString *imageName;
    for(int i=-2;i<3;i++){
        if((i+2)==self.dotIndex)
            imageName=ImageNameDotBlu;
        else
            imageName=ImageNameDotWhite;
        UIImageView *imageDot=[self.arrayFooterImageViews objectAtIndex:i+2];
        imageDot.image=[UIImage imageNamed:imageName];
    }
    self.dotIndex++;
    if(self.dotIndex>4)
        self.dotIndex=0;
}
@end
