function Y = kalman_filter(A, W, H, Q, data, measureHandle, x0, numDimensionsZ)
  % kalman filter, estimates states given measurements
  %
  % Inputs:
  %   A:              State transition model
  %   W:              Covariance of process noise
  %   H:              Observation model
  %   Q:              Covariance of measurement noise
  %   data:           data from which a measurement is extracted
  %   measureHandle:  handle to function that converts data to measurements.
  %                   The idea is to call measureHandle with data and an 
  %                   estimate where to measure. The result should be the
  %                   measurement. example:
  %                   measurement = measureHandle(dataVector(k), estimated_position);
  %   x0:             initial state estimate as d x 1 vector
  %   numDimensionsZ: number of dimensions per measurement
  %
  % Outputs:
  %   Y:  Kalman states as M x d matrix.
  %       M is the number of states, 
  %       d is the number of dimensions
  %   
  % Notes:
  %


  M = size(data, 1);
  d = size(x0, 1);
  
  xk = x0;
  Pk = eye(d,d);
  
  Y = zeros(M,d);
  Y(1,:) = x0;
  
  for k = 2:M
      
      xk0 = A * xk;  %prior
      Pk0 = A * Pk * A' + W; %error covariance after integrating the noise
      
      %next measurement
      zk = measureHandle(data(k,:)', xk0);
      
      %measurement update
      Kk = Pk0 * H'/ (H * Pk0 * H' + Q); %kalman gain
      xk = xk0 + Kk * (zk - H * xk0); % Posterier estimate
      Pk = (eye(d) - Kk * H) * Pk0; % error covariance after integrating the noise
      
      Y(k, :) = xk';
  end
  
end