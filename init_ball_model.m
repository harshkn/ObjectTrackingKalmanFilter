function [A, W, H, Q] = init_ball_model()
  % set estimates for ball example
  %
  % Outputs:
  %   A:  State transition model
  %   W:  Covariance of process noise
  %   H:  Observation model
  %   Q:  Covariance of measurement noise
  %   

  % set state transition model
  % A = ;
  %
  % YOUR CODE HERE
  %
  A = [1 0 1 0; ...
       0 1 0 1; ...
       0 0 1 0; ...
       0 0 0 1]; 


  % set observation model
  % H = ;
  %
  % YOUR CODE HERE
  %
  H = [1 0 0 0;...
       0 1 0 0]; 


  % set process noise
  % W = ;
  %
  % YOUR CODE HERE
  %
  
  W =  eye(4);


  % set mesurement noise
  % Q = ;
  %
  % YOUR CODE HERE
  %
  
  Q =   eye(2);
end