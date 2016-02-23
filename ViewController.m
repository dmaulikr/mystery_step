//
//  ViewController.m
//  TakeChance
//
//  Created by Kiddi on 17/06/14.
//  Copyright (c) 2014 KRabbi. All rights reserved.
//

#import "ViewController.h"
#import "CustomActionSheet.h"

@interface ViewController ()
 //A flag indicating whether the Game Center features can be used after a user has been authenticated.
@property (nonatomic) BOOL gameCenterEnabled;

@property (nonatomic) BOOL notLoggedIN;

// This property stores the default leaderboard's identifier.
@property (nonatomic, strong) NSString *leaderboardIdentifier;

@property (nonatomic, strong) CustomActionSheet *customActionSheet;

@end

@implementation ViewController


///GAME CENTER

-(void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                _gameCenterEnabled = YES;
                _notLoggedIN = NO;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        _leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                _gameCenterEnabled = NO;
                _notLoggedIN = YES;
                
            }
        }
    };
}

-(void)reportScore{
    GKScore *score = [[GKScore alloc] initWithLeaderboardIdentifier:_leaderboardIdentifier];
    score.value = BestScoreInt;
    
    [GKScore reportScores:@[score] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcViewController.leaderboardIdentifier = _leaderboardIdentifier;
    }
    else {
        
    }
    
    [self presentViewController:gcViewController animated:YES completion:nil];
}


- (IBAction)showGCOptions:(id)sender {
    // Allow the action sheet to be displayed if only the gameCenterEnabled flag is true, meaning if only
    // a player has been authenticated.
    if (_gameCenterEnabled) {
        if (_customActionSheet != nil) {
            _customActionSheet = nil;
        }
        
        // Create a CustomActionSheet object and handle the tapped button in the completion handler block.
        
        _customActionSheet = [[CustomActionSheet alloc] initWithTitle:@"Mystery Steps"
                                                             delegate:nil
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"View Leaderboard", nil];
        
        
        [_customActionSheet showInView:self.view
                 withCompletionHandler:^(NSString *buttonTitle, NSInteger buttonIndex) {
                     if ([buttonTitle isEqualToString:@"View Leaderboard"]) {
                         [self showLeaderboardAndAchievements:YES];
                     }
                 }];
    }
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

/////////GAME CENTER

-(void)randomHella{
    h1 = NO;
    h2 = NO;
    h3 = NO;
    h4 = NO;
    h5 = NO;
    
        RandNumber = arc4random()%5;
        
        do (RandNumber2 = arc4random()%5);
        while (RandNumber2 == RandNumber);
        do (RandNumber3 = arc4random()%5);
        while (RandNumber3 == RandNumber || RandNumber3 == RandNumber2 );
        do (RandNumber4 = arc4random()%5);
        while (RandNumber4 == RandNumber || RandNumber4 == RandNumber2 || RandNumber4 == RandNumber3);
        
        [self checkHella];

    NSLog(@"%i",RandNumber);
    NSLog(@"%i",RandNumber2);
    NSLog(@"%i",RandNumber3);
    NSLog(@"%i",RandNumber4);
}

-(void)checkHella{
    
    if (level == 1 ){
        if(RandNumber == 0){
            h1 = YES;
        }
        if(RandNumber == 1){
            h2 = YES;
        }
        if(RandNumber == 2){
            h3 = YES;
        }
        if(RandNumber == 3){
            h4 = YES;
        }
        if(RandNumber == 4){
            h5 = YES;
        }
    }
    
    if (level == 2 || level == 3){
        if(RandNumber == 0 || RandNumber2 == 0){
            h1 = YES;
        }
        if(RandNumber == 1 || RandNumber2 == 1){
            h2 = YES;
        }
        if(RandNumber == 2 || RandNumber2 == 2){
            h3 = YES;
        }
        if(RandNumber == 3 || RandNumber2 == 3){
            h4 = YES;
        }
        if(RandNumber == 4 || RandNumber2 == 4){
            h5 = YES;
        }
    }
    
    if (level == 4){
        if(RandNumber == 0 || RandNumber2 == 0 || RandNumber3 == 0){
            h1 = YES;
        }
        if(RandNumber == 1 || RandNumber2 == 1 || RandNumber3 == 1){
            h2 = YES;
        }
        if(RandNumber == 2 || RandNumber2 == 2 || RandNumber3 == 2){
            h3 = YES;
        }
        if(RandNumber == 3 || RandNumber2 == 3 || RandNumber3 == 3){
            h4 = YES;
        }
        if(RandNumber == 4 || RandNumber2 == 4 || RandNumber3 == 4){
            h5 = YES;
        }
    }
    
    if (level == 5 || level == 6){
        
        if(RandNumber == 0 || RandNumber2 == 0 || RandNumber3 == 0 || RandNumber4 == 0){
            h1 = YES;
        }
        if(RandNumber == 1 || RandNumber2 == 1 || RandNumber3 == 1 || RandNumber4 == 1){
            h2 = YES;
        }
        if(RandNumber == 2 || RandNumber2 == 2 || RandNumber3 == 2 || RandNumber4 == 2){
            h3 = YES;
        }
        if(RandNumber == 3 || RandNumber2 == 3 || RandNumber3 == 3 || RandNumber4 == 3){
            h4 = YES;
        }
        if(RandNumber == 4 || RandNumber2 == 4 || RandNumber3 == 4 || RandNumber4 == 4){
            h5 = YES;
        }
        
    }
        
    
}

-(void)GameOver{
    
    [self boomSong];
    
    if (level == 2) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella1 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella2 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella3 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella4 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella5 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 3) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella6 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella7 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella8 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella9 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella10 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 4) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella11 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella12 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella13 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella14 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella15 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
        
    if (level == 5) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella16 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella17 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella18 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella19 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella20 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 6) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella21 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella22 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella23 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella24 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella25 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 7) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella26 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella27 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella28 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella29 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella30 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    level = 8;
    [self performSelector:@selector(showRotation) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(StartOver) withObject:nil afterDelay:2.5];
    
}
    
-(void)showRotation{
    
    boom.hidden = NO;
    rightShoe.hidden = YES;
    leftShoe.hidden = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    boom.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    
    [UIView commitAnimations];
    
    }


-(void)StartOver{
    
    [self themeSong];
    
    hella1.hidden = YES;
    hella2.hidden = YES;
    hella3.hidden = YES;
    hella4.hidden = YES;
    hella5.hidden = YES;
    hella6.hidden = YES;
    hella7.hidden = YES;
    hella8.hidden = YES;
    hella9.hidden = YES;
    hella10.hidden = YES;
    hella11.hidden = YES;
    hella12.hidden = YES;
    hella13.hidden = YES;
    hella14.hidden = YES;
    hella15.hidden = YES;
    hella16.hidden = YES;
    hella17.hidden = YES;
    hella18.hidden = YES;
    hella19.hidden = YES;
    hella20.hidden = YES;
    hella21.hidden = YES;
    hella22.hidden = YES;
    hella23.hidden = YES;
    hella24.hidden = YES;
    hella25.hidden = YES;
    hella26.hidden = YES;
    hella27.hidden = YES;
    hella28.hidden = YES;
    hella29.hidden = YES;
    hella30.hidden = YES;
    boom.hidden = YES;
    rightShoe.hidden = YES;
    leftShoe.hidden = YES;
    treasure.hidden = YES;
    boom.hidden = YES;
    winText1.hidden = YES;
    winText2.hidden = YES;
    beginNewGame.hidden = YES;
    monster.hidden = YES;
    instructions.hidden = NO;
    treasure.center = treasureStart;
    stepPepp1.hidden = NO;
    stepPepp2.hidden = NO;
    treasurePepp.hidden = NO;
    pepp.hidden = NO;
    Leaderboard.hidden = _notLoggedIN;
    
    if (BestScoreInt > 4) {
        BestScore.hidden = NO;
        BestScore.text = [NSString stringWithFormat:@"Your personal best is %i steps", BestScoreInt];
    }
    
    NSLog(@"%i",BestScoreInt);

    
    Highscore.hidden = YES;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    boom.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    
    [UIView commitAnimations];

    UIImage *BoomImage1 = [UIImage imageNamed:@"pavement.png"];
    [hella1 setImage:BoomImage1 forState:UIControlStateNormal];
    UIImage *BoomImage2 = [UIImage imageNamed:@"pavement.png"];
    [hella2 setImage:BoomImage2 forState:UIControlStateNormal];
    UIImage *BoomImage3 = [UIImage imageNamed:@"pavement.png"];
    [hella3 setImage:BoomImage3 forState:UIControlStateNormal];
    UIImage *BoomImage4 = [UIImage imageNamed:@"pavement.png"];
    [hella4 setImage:BoomImage4 forState:UIControlStateNormal];
    UIImage *BoomImage5 = [UIImage imageNamed:@"pavement.png"];
    [hella5 setImage:BoomImage5 forState:UIControlStateNormal];
    UIImage *BoomImage6 = [UIImage imageNamed:@"pavement.png"];
    [hella6 setImage:BoomImage6 forState:UIControlStateNormal];
    UIImage *BoomImage7 = [UIImage imageNamed:@"pavement.png"];
    [hella7 setImage:BoomImage7 forState:UIControlStateNormal];
    UIImage *BoomImage8 = [UIImage imageNamed:@"pavement.png"];
    [hella8 setImage:BoomImage8 forState:UIControlStateNormal];
    UIImage *BoomImage9 = [UIImage imageNamed:@"pavement.png"];
    [hella9 setImage:BoomImage9 forState:UIControlStateNormal];
    UIImage *BoomImage10 = [UIImage imageNamed:@"pavement.png"];
    [hella10 setImage:BoomImage10 forState:UIControlStateNormal];
    UIImage *BoomImage11 = [UIImage imageNamed:@"pavement.png"];
    [hella11 setImage:BoomImage11 forState:UIControlStateNormal];
    UIImage *BoomImage12 = [UIImage imageNamed:@"pavement.png"];
    [hella12 setImage:BoomImage12 forState:UIControlStateNormal];
    UIImage *BoomImage13 = [UIImage imageNamed:@"pavement.png"];
    [hella13 setImage:BoomImage13 forState:UIControlStateNormal];
    UIImage *BoomImage14 = [UIImage imageNamed:@"pavement.png"];
    [hella14 setImage:BoomImage14 forState:UIControlStateNormal];
    UIImage *BoomImage15 = [UIImage imageNamed:@"pavement.png"];
    [hella15 setImage:BoomImage15 forState:UIControlStateNormal];
    UIImage *BoomImage16 = [UIImage imageNamed:@"pavement.png"];
    [hella16 setImage:BoomImage16 forState:UIControlStateNormal];
    UIImage *BoomImage17 = [UIImage imageNamed:@"pavement.png"];
    [hella17 setImage:BoomImage17 forState:UIControlStateNormal];
    UIImage *BoomImage18 = [UIImage imageNamed:@"pavement.png"];
    [hella18 setImage:BoomImage18 forState:UIControlStateNormal];
    UIImage *BoomImage19 = [UIImage imageNamed:@"pavement.png"];
    [hella19 setImage:BoomImage19 forState:UIControlStateNormal];
    UIImage *BoomImage20 = [UIImage imageNamed:@"pavement.png"];
    [hella20 setImage:BoomImage20 forState:UIControlStateNormal];
    UIImage *BoomImage21 = [UIImage imageNamed:@"pavement.png"];
    [hella21 setImage:BoomImage21 forState:UIControlStateNormal];
    UIImage *BoomImage22 = [UIImage imageNamed:@"pavement.png"];
    [hella22 setImage:BoomImage22 forState:UIControlStateNormal];
    UIImage *BoomImage23 = [UIImage imageNamed:@"pavement.png"];
    [hella23 setImage:BoomImage23 forState:UIControlStateNormal];
    UIImage *BoomImage24 = [UIImage imageNamed:@"pavement.png"];
    [hella24 setImage:BoomImage24 forState:UIControlStateNormal];
    UIImage *BoomImage25 = [UIImage imageNamed:@"pavement.png"];
    [hella25 setImage:BoomImage25 forState:UIControlStateNormal];
    UIImage *BoomImage26 = [UIImage imageNamed:@"pavement.png"];
    [hella26 setImage:BoomImage26 forState:UIControlStateNormal];
    UIImage *BoomImage27 = [UIImage imageNamed:@"pavement.png"];
    [hella27 setImage:BoomImage27 forState:UIControlStateNormal];
    UIImage *BoomImage28 = [UIImage imageNamed:@"pavement.png"];
    [hella28 setImage:BoomImage28 forState:UIControlStateNormal];
    UIImage *BoomImage29 = [UIImage imageNamed:@"pavement.png"];
    [hella29 setImage:BoomImage29 forState:UIControlStateNormal];
    UIImage *BoomImage30 = [UIImage imageNamed:@"pavement.png"];
    [hella30 setImage:BoomImage30 forState:UIControlStateNormal];
    
    leftShoe.center = LeftShoe;
    rightShoe.center = RightShoe;
    
    header.hidden = NO;
    tapStart.hidden = NO;
    level = 1;
    Started = NO;
    Game = YES;
    
    Highscore.text = [NSString stringWithFormat:@"%i", HighScoreInt];
    
    stepPepp1.text = [NSString stringWithFormat:@"You have taken %i steps so far!", HighScoreInt];
    
    if (HighScoreInt < 10) {
        
        stepPepp2.text = [NSString stringWithFormat:@"You can set the world record!"];
        
    }
    
    else if (HighScoreInt < 30) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Still looking good!"];
        
    }
    
    else if (HighScoreInt < 60) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Keep on believing!"];
        
    }
    
    else if (HighScoreInt < 100) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Don't get to three digits!"];
        
    }
    
    else if (HighScoreInt < 300) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Step up your game!"];
        
    }
    
    else if (HighScoreInt < 500) {
        
        stepPepp2.text = [NSString stringWithFormat:@"This isn't fair!"];
        
    }
    
    else if (HighScoreInt < 1000) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Your just not good!"];
        
    }
    else if (HighScoreInt < 1500) {
        
        stepPepp2.text = [NSString stringWithFormat:@"This is bad!"];
        
    }
    
    else if (HighScoreInt > 2000) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Why are you so unlucky?"];
        
    }
    
}

-(void)Scoring{
    
    if (ClearScore) {
        
        WinningNumber = HighScoreInt;
        
        if (BestScoreInt > HighScoreInt || BestScoreInt == 0) {
            
            BestScoreInt = HighScoreInt;
            
            [self reportScore];
            
            [[NSUserDefaults standardUserDefaults] setInteger:BestScoreInt forKey:@"BestScoreSaved"];
            
            if (BestScoreInt > 4) {
                BestScore.hidden = YES;
                BestScore.text = [NSString stringWithFormat:@"Your personal best is %i steps", BestScoreInt];
            }
            
        }
        
        HighScoreInt = HighScoreInt - HighScoreInt;
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreInt forKey:@"HighScoreSaved"];
        
        Score = 0;
        
        ClearScore = NO;
    }
    else{
        
        HighScoreInt = HighScoreInt + Score;
        
        Score = 0;
        
        [[NSUserDefaults standardUserDefaults] setInteger:HighScoreInt forKey:@"HighScoreSaved"];
    
        Highscore.text = [NSString stringWithFormat:@"%i", HighScoreInt];
    }
    
}

-(void)CheckIfGameWon{
    
    
    if(WonGame == YES){
        WonGame = NO;
        hella1.hidden = YES;
        hella2.hidden = YES;
        hella3.hidden = YES;
        hella4.hidden = YES;
        hella5.hidden = YES;
        hella6.hidden = YES;
        hella7.hidden = YES;
        hella8.hidden = YES;
        hella9.hidden = YES;
        hella10.hidden = YES;
        hella11.hidden = YES;
        hella12.hidden = YES;
        hella13.hidden = YES;
        hella14.hidden = YES;
        hella15.hidden = YES;
        hella16.hidden = YES;
        hella17.hidden = YES;
        hella18.hidden = YES;
        hella19.hidden = YES;
        hella20.hidden = YES;
        hella21.hidden = YES;
        hella22.hidden = YES;
        hella23.hidden = YES;
        hella24.hidden = YES;
        hella25.hidden = YES;
        hella26.hidden = YES;
        hella27.hidden = YES;
        hella28.hidden = YES;
        hella29.hidden = YES;
        hella30.hidden = YES;
        boom.hidden = YES;
        rightShoe.hidden = YES;
        leftShoe.hidden = YES;
        boom.hidden = YES;
        [self TimersGame];
    }
    
    else{
        
        [self randomHella];
        Game = YES;
        
    }
    
}

-(void)Winner{
    
    [self cheerSong];
    Highscore.hidden = YES;
    
    if (iPAD == NO){
        
        X = 2;
        
        if(treasure.center.y > 350){
            
            treasure.image = [UIImage imageNamed:@"treasureOpen.png"];
            
        }
        
        if (treasure.center.y > 450) {
            X = 0;
            monster.hidden = NO;
            FAA = 5;
        }
        
        if (monster.center.y < 160) {
            [Movement invalidate];
            stepPepp2.text = [NSString stringWithFormat:@"You got there in %i steps!", WinningNumber];
            stepPepp2.hidden = NO;
            winText1.hidden = NO;
            winText2.hidden = NO;
            beginNewGame.hidden = NO;
        }
        
        if (HighScoreInt > 0) {
            
            ClearScore = YES;
            [self Scoring];
            
        }
        
        treasure.center = CGPointMake(160, treasure.center.y + X);
        monster.center = CGPointMake(160, monster.center.y - FAA);
        
    }
    else{
        
        int X = 6;
        
        if(treasure.center.y > 650){
            
            treasure.image = [UIImage imageNamed:@"treasureOpen.png"];
            
        }
        
        if (treasure.center.y > 850) {
            X = 0;
            monster.hidden = NO;
            FAA = 5;
        }
        
        if (monster.center.y < 250) {
            [Movement invalidate];
            stepPepp2.text = [NSString stringWithFormat:@"You got there in %i steps!", WinningNumber];
            stepPepp2.hidden = NO;
            winText1.hidden = NO;
            winText2.hidden = NO;
            beginNewGame.hidden = NO;
        }
        
        if (HighScoreInt > 0) {
            
            ClearScore = YES;
            [self Scoring];
            
        }
        
        treasure.center = CGPointMake(385, treasure.center.y + X);
        monster.center = CGPointMake(385, monster.center.y - FAA);
        
    }
    
}

-(void)TimersGame{
    Movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Winner)userInfo:nil repeats:YES];
}

-(void)NextLevel{
    
    [self correctSong];
    
    if (level == 2) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella1 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella2 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella3 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella4 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella5 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 3) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella6 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella7 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella8 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella9 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella10 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 4) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella11 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella12 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella13 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella14 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella15 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 5) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella16 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella17 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella18 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella19 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella20 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 6) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella21 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella22 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella23 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella24 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella25 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    if (level == 7) {
        if (h1){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella26 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h2){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella27 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h3){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella28 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h4){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella29 setImage:BoomImage forState:UIControlStateNormal];
        }
        if (h5){
            UIImage *BoomImage = [UIImage imageNamed:@"mine.png"];
            [hella30 setImage:BoomImage forState:UIControlStateNormal];
        }
    }
    
    [self CheckIfGameWon];
    
}


- (IBAction)hella1:(id)sender {
    if(Game){
    if (level == 1){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            rightShoe.center = hella1.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella1.center;
            level++;
            Game = NO;
            [self NextLevel];
        }
    }
}
}

- (IBAction)hella2:(id)sender {
    if(Game){
    if (level == 1){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            rightShoe.center = hella2.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella2.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    }
}
}

- (IBAction)hella3:(id)sender {
    if(Game){
    if (level == 1){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            rightShoe.center = hella3.center;
            Game = NO;
            [self GameOver];
        }
        else{
            level++;
            Game = NO;
            rightShoe.center = hella3.center;
            [self NextLevel];
        };
    }
}
}

- (IBAction)hella4:(id)sender {
    if(Game){
    if (level == 1){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            rightShoe.center = hella4.center;
            Game = NO;
            [self GameOver];
            
        }
        else{
            rightShoe.center = hella4.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella5:(id)sender {
    if(Game){
    if (level == 1){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            rightShoe.center = hella5.center;
            Game = NO;
            [self GameOver];
            
        }
        else{
            rightShoe.center = hella5.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella6:(id)sender {
    if(Game){
    if (level == 2){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            leftShoe.center = hella6.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella6.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella7:(id)sender {
    if(Game){
    if (level == 2){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            leftShoe.center = hella7.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella7.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella8:(id)sender {
    if(Game){
    if (level == 2){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            leftShoe.center = hella8.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella8.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella9:(id)sender {
    if(Game){
    if (level == 2){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            leftShoe.center = hella9.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella9.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella10:(id)sender {
    if(Game){
    if (level == 2){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            leftShoe.center = hella10.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella10.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella11:(id)sender {
    if(Game){
    if (level == 3){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            rightShoe.center = hella11.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella11.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella12:(id)sender {
    if(Game){
    if (level == 3){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            rightShoe.center = hella12.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella12.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella13:(id)sender {
    if(Game){
    if (level == 3){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            rightShoe.center = hella13.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella13.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella14:(id)sender {
    if(Game){
    if (level == 3){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            rightShoe.center = hella14.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella14.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella15:(id)sender {
    if(Game){
    if (level == 3){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            rightShoe.center = hella15.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella15.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella16:(id)sender {
    if(Game){
    if (level == 4){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            leftShoe.center = hella16.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella16.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
    
}
}

- (IBAction)hella17:(id)sender {
    if(Game){
    if (level == 4){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            leftShoe.center = hella17.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella17.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella18:(id)sender {
    if(Game){
    if (level == 4){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            leftShoe.center = hella18.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella18.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella19:(id)sender {
    if(Game){
    if (level == 4){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            leftShoe.center = hella19.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella19.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella20:(id)sender {
    if(Game){
    if (level == 4){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            leftShoe.center = hella20.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella20.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella21:(id)sender {
    if(Game){
    if (level == 5){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            rightShoe.center = hella21.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella21.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella22:(id)sender {
    if(Game){
    if (level == 5){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            rightShoe.center = hella22.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella22.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella23:(id)sender {
    if(Game){
    if (level == 5){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            rightShoe.center = hella23.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella23.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella24:(id)sender {
    if(Game){
    if (level == 5){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            rightShoe.center = hella24.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella24.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella25:(id)sender {
    if(Game){
    if (level == 5){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            rightShoe.center = hella25.center;
            Game = NO;
            [self GameOver];
        }
        else{
            rightShoe.center = hella25.center;
            level++;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella26:(id)sender {
    if(Game){
    if (level == 6){
        Score++;
        [self Scoring];
        if (h1){
            level++;
            leftShoe.center = hella26.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella26.center;
            level++;
            WonGame = YES;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella27:(id)sender {
    if(Game){
    if (level == 6){
        Score++;
        [self Scoring];
        if (h2){
            level++;
            leftShoe.center = hella27.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella27.center;
            level++;
            WonGame = YES;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella28:(id)sender {
    if(Game){
    if (level == 6){
        Score++;
        [self Scoring];
        if (h3){
            level++;
            leftShoe.center = hella28.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella28.center;
            level++;
            WonGame = YES;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella29:(id)sender {
    if(Game){
    if (level == 6){
        Score++;
        [self Scoring];
        if (h4){
            level++;
            leftShoe.center = hella29.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella29.center;
            level++;
            WonGame = YES;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)hella30:(id)sender {
    if(Game){
    if (level == 6){
        Score++;
        [self Scoring];
        if (h5){
            level++;
            leftShoe.center = hella30.center;
            Game = NO;
            [self GameOver];
        }
        else{
            leftShoe.center = hella30.center;
            level++;
            WonGame = YES;
            Game = NO;
            [self NextLevel];
        };
    };
}
}

- (IBAction)beginNewGame:(id)sender {
    [self StartOver];
}

- (IBAction)instructions:(id)sender {
    [self Instructions];
}

-(void)Instructions{
    
    header.hidden = YES;
    instructions1.hidden = NO;
    instructions2.hidden = NO;
    instructions3.hidden = NO;
    explain.hidden = NO;
    instructions.hidden = YES;
    stepPepp1.hidden = YES;
    stepPepp2.hidden = YES;
    BestScore.hidden = YES;
    pepp.hidden = YES;
    treasurePepp.hidden = YES;
    Leaderboard.hidden = YES;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (Started == NO){
        
        hella1.hidden = NO;
        hella2.hidden = NO;
        hella3.hidden = NO;
        hella4.hidden = NO;
        hella5.hidden = NO;
        hella6.hidden = NO;
        hella7.hidden = NO;
        hella8.hidden = NO;
        hella9.hidden = NO;
        hella10.hidden = NO;
        hella11.hidden = NO;
        hella12.hidden = NO;
        hella13.hidden = NO;
        hella14.hidden = NO;
        hella15.hidden = NO;
        hella16.hidden = NO;
        hella17.hidden = NO;
        hella18.hidden = NO;
        hella19.hidden = NO;
        hella20.hidden = NO;
        hella21.hidden = NO;
        hella22.hidden = NO;
        hella23.hidden = NO;
        hella24.hidden = NO;
        hella25.hidden = NO;
        hella26.hidden = NO;
        hella27.hidden = NO;
        hella28.hidden = NO;
        hella29.hidden = NO;
        hella30.hidden = NO;
        rightShoe.hidden = NO;
        leftShoe.hidden = NO;
        treasure.hidden = NO;
        Highscore.hidden = NO;
        
        Leaderboard.hidden = YES;
        header.hidden = YES;
        tapStart.hidden = YES;
        instructions1.hidden = YES;
        instructions2.hidden = YES;
        instructions3.hidden = YES;
        instructions.hidden = YES;
        explain.hidden = YES;
        stepPepp1.hidden = YES;
        stepPepp2.hidden = YES;
        BestScore.hidden = YES;
        Game = YES;
        pepp.hidden = YES;
        treasurePepp.hidden = YES;
        
        [self randomHella];
        
    }
    Started = YES;
    
}

-(void)themeSong{
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/themeSong.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = -1;
    audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    [audioPlayer play];
    
}

-(void)correctSong{
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/correct.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    [audioPlayer play];
    
}

-(void)boomSong{
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/boom.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    [audioPlayer play];
    
}

-(void)cheerSong{
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/cheer.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = -1;
    audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    [audioPlayer play];
    
}



- (void)viewDidLoad {
    
    [self authenticateLocalPlayer];
    
    [self themeSong];
    
    HighScoreInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    BestScoreInt = [[NSUserDefaults standardUserDefaults] integerForKey:@"BestScoreSaved"];
    
    if (BestScoreInt > 4) {
        BestScore.hidden = NO;
        BestScore.text = [NSString stringWithFormat:@"Your personal best is %i steps", BestScoreInt];
    }
    
    Highscore.text = [NSString stringWithFormat:@"%i", HighScoreInt];
    
    stepPepp1.text = [NSString stringWithFormat:@"You have taken %i steps so far!", HighScoreInt];
    
    if (HighScoreInt < 10) {
        
        stepPepp2.text = [NSString stringWithFormat:@"You can set the world record!"];
        
    }
    
    else if (HighScoreInt < 30) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Still looking good!"];
        
    }
    
    else if (HighScoreInt < 60) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Keep on believing!"];
        
    }
    
    else if (HighScoreInt < 100) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Don't get to three digits!"];
        
    }
    
    else if (HighScoreInt < 300) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Step up your game!"];
        
    }
    
    else if (HighScoreInt < 500) {
        
        stepPepp2.text = [NSString stringWithFormat:@"This isn't fair!"];
        
    }
    
    else if (HighScoreInt > 500) {
        
        stepPepp2.text = [NSString stringWithFormat:@"Why are you so unlucky?"];
        
    }
    
    if (BestScoreInt > 4) {
        BestScore.hidden = NO;
        BestScore.text = [NSString stringWithFormat:@"Your personal best is %i steps", BestScoreInt];
    }

    
    hella1.hidden = YES;
    hella2.hidden = YES;
    hella3.hidden = YES;
    hella4.hidden = YES;
    hella5.hidden = YES;
    hella6.hidden = YES;
    hella7.hidden = YES;
    hella8.hidden = YES;
    hella9.hidden = YES;
    hella10.hidden = YES;
    hella11.hidden = YES;
    hella12.hidden = YES;
    hella13.hidden = YES;
    hella14.hidden = YES;
    hella15.hidden = YES;
    hella16.hidden = YES;
    hella17.hidden = YES;
    hella18.hidden = YES;
    hella19.hidden = YES;
    hella20.hidden = YES;
    hella21.hidden = YES;
    hella22.hidden = YES;
    hella23.hidden = YES;
    hella24.hidden = YES;
    hella25.hidden = YES;
    hella26.hidden = YES;
    hella27.hidden = YES;
    hella28.hidden = YES;
    hella29.hidden = YES;
    hella30.hidden = YES;
    boom.hidden = YES;
    rightShoe.hidden = YES;
    leftShoe.hidden = YES;
    treasure.hidden = YES;
    monster.hidden = YES;
    winText1.hidden = YES;
    winText2.hidden = YES;
    beginNewGame.hidden = YES;
    instructions1.hidden = YES;
    instructions2.hidden = YES;
    instructions3.hidden = YES;
    explain.hidden = YES;
    Highscore.hidden = YES;
    Leaderboard.hidden = _notLoggedIN;
    
    LeftShoe = leftShoe.center;
    RightShoe = rightShoe.center;
    treasureStart = treasure.center;
    
    result = [[UIScreen mainScreen] bounds].size;
    int screenSize = result.height;
    if (screenSize > 600){
        
        iPAD = YES;
        
    }

    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _gameCenterEnabled = NO;
    _leaderboardIdentifier = @"MysStepStodutafla";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
