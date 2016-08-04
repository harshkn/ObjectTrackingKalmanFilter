function annotated_image = draw_rectangle(image, position, width, height)
%
  % takes a graylevel image as input and draws a colored
  % rectangle at position with specified height and width
  %
  % Inputs:
  %   image:      grayscale image
  %   position:   position of rectangle, [row; column]
  %   width:      width of rectangle
  %   height:     height of the rectangle
  %
  % Outputs:
  %   annotated_image:    image with rectangle, 3 channels
  %

  %
  % YOUR CODE HERE
  %
  
%   [images, numFrames, height, width] = avi2images('Ball1_raw.avi');
%    position= [40 40];

row = position(1);
col = position(2);

[r,c] = size(image);

a = (height-1)/2;
b= (width-1)/2;

upper_limit = min(r, row + a);
lower_limit = max(1, row - a);

right_limit = min(c, col + b);
left_limit = max(1, col - b);

img1 = image./255;
img2 = image./255;

img1(lower_limit:upper_limit, left_limit) = 1;
img1(lower_limit:upper_limit, right_limit) = 1;

img1(lower_limit, left_limit:right_limit) = 1;
img1(upper_limit, left_limit:right_limit) = 1;

% img2(lower_limit:upper_limit, left_limit) = 1;
% img2(lower_limit:upper_limit, right_limit) = 1;
% 
% img2(lower_limit, left_limit:right_limit) = 1;
% img2(upper_limit, left_limit:right_limit) = 1;

red = img1;
green = img2;
blue  = img2;

annotated_image = cat(3, red, green, blue);
end
