
[images, numFrames, height, width] = avi2images('Ball1_raw.avi');
for i = 1:numFrames
temp = images(i,:);
temp1 = reshape(temp, height, width);
imagesc(temp1)
title(i)
waitforbuttonpress
end


% x0 = [200; 200; 200; 200];
% ball = imread('ball.png');
% ball = im2double(ball)*255;
% pos = find_object(images, ball, x0)