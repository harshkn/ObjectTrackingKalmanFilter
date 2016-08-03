function a5p2
  % load images from movie
  [images, numFrames, height, width] = avi2images('Ball1_raw.avi');
  
  % set ball model
  [A, W, H, Q] = init_ball_model();

  %initial state estimate
  x0 = [200; 200; 200; 200];


  % load ball
  ball = imread('ball.png');
  ball = im2double(ball)*255;
  

  % create handle to anonymous function
  % bind the object we are looking for
  % also handle a transformation of the input data to the arguments of
  % find_object.
  measureHandle = @(data, state_estimate) ...
      find_object(reshape(data, height, width), ball, state_estimate);
  
  % compute kalman states
  estimated_states = kalman_filter(A, W, H, Q, images, measureHandle, x0, 2);

  % annotate video with ball positions
  video = annotate_video(images, numFrames, [height width], size(ball), estimated_states(:, 1:2));

  % make movie
  movie2avi(video, 'tracking.avi')

  % display result
  axis off
  movie(video)
end