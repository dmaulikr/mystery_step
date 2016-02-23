//
//  ViewController.h
//  TakeChance
//
//  Created by Kiddi on 17/06/14.
//  Copyright (c) 2014 KRabbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <GameKit/GameKit.h>

int level = 1;
int RandNumber;
int RandNumber2;
int RandNumber3;
int RandNumber4;
int FAA = 0;
int X = 0;
BOOL Started = NO;
BOOL WonGame = NO;
int Score = 0;
int HighScoreInt;
BOOL ClearScore = NO;
BOOL Game = YES;
int WinningNumber;
int BestScoreInt = 0;
BOOL iPAD = NO;
CGSize result;
BOOL firstround = YES;

BOOL h1 = NO;
BOOL h2 = NO;
BOOL h3 = NO;
BOOL h4 = NO;
BOOL h5 = NO;

CGPoint LeftShoe;
CGPoint RightShoe;
CGPoint treasureStart;

@interface ViewController : UIViewController <GKGameCenterControllerDelegate> {

    AVAudioPlayer *audioPlayer;
    IBOutlet UIButton *hella1;
    IBOutlet UIButton *hella2;
    IBOutlet UIButton *hella3;
    IBOutlet UIButton *hella4;
    IBOutlet UIButton *hella5;
    IBOutlet UIButton *hella6;
    IBOutlet UIButton *hella7;
    IBOutlet UIButton *hella8;
    IBOutlet UIButton *hella9;
    IBOutlet UIButton *hella10;
    IBOutlet UIButton *hella11;
    IBOutlet UIButton *hella12;
    IBOutlet UIButton *hella13;
    IBOutlet UIButton *hella14;
    IBOutlet UIButton *hella15;
    IBOutlet UIButton *hella16;
    IBOutlet UIButton *hella17;
    IBOutlet UIButton *hella18;
    IBOutlet UIButton *hella19;
    IBOutlet UIButton *hella20;
    IBOutlet UIButton *hella21;
    IBOutlet UIButton *hella22;
    IBOutlet UIButton *hella23;
    IBOutlet UIButton *hella24;
    IBOutlet UIButton *hella25;
    IBOutlet UIButton *hella26;
    IBOutlet UIButton *hella27;
    IBOutlet UIButton *hella28;
    IBOutlet UIButton *hella29;
    IBOutlet UIButton *hella30;
    IBOutlet UIImageView *boom;
    IBOutlet UIImageView *rightShoe;
    IBOutlet UIImageView *leftShoe;
    IBOutlet UIImageView *treasure;
    IBOutlet UILabel *header;
    IBOutlet UILabel *tapStart;
    IBOutlet UIImageView *monster;
    IBOutlet UILabel *winText1;
    IBOutlet UILabel *winText2;
    IBOutlet UIButton *beginNewGame;
    IBOutlet UIButton *instructions;
    IBOutlet UILabel *instructions1;
    IBOutlet UILabel *instructions2;
    IBOutlet UILabel *instructions3;
    IBOutlet UIImageView *explain;
    IBOutlet UILabel *Highscore;
    IBOutlet UILabel *stepPepp1;
    IBOutlet UILabel *stepPepp2;
    IBOutlet UILabel *BestScore;
    IBOutlet UILabel *pepp;
    IBOutlet UIImageView *treasurePepp;
    IBOutlet UIButton *Leaderboard;
    
    NSTimer *Movement;

}

-(void)randomHella;
-(void)checkHella;
-(void)StartOver;
-(void)GameOver;
-(void)NextLevel;
-(void)showRotation;
-(void)CheckIfGameWon;
-(void)TimersGame;
-(void)Winner;
-(void)themeSong;
-(void)boomSong;
-(void)correctSong;

- (IBAction)showGCOptions:(id)sender;

@end

