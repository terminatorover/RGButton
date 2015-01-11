# RGButton
[Check it out live](https://www.youtube.com/watch?v=RN47kjgtbhA&feature=youtu.be)

Custom Button when tapped displays an set of 5 buttons moving radially out . Inspired by myfitnesspal 

Implement the RGButtonDelegateProtocol
with the following method (it let's you know which button was tapped,the 0th index is left most button
- (void)tappedButtonWithIndex:(NSInteger )index;

#configuration 

- (void)setRadius:(CGFloat )radiusSet;//how far out the buttons move out
- (void)setImagesForButtons:(NSArray *)imageArray;
- (void)setCenterButtonImage:(UIImage *)setimage backgroundColor:(UIColor *)color;
- (void)backGroundColor:(UIColor *)color;


