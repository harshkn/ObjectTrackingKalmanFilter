function [imgs, numFrames, r, c] = avi2images(filename)
  % This function loads an avi file and converts the frames into grayscale
  % images. These images are returned as columns of the matrix imgs. Further
  % return values are the number of frames nframes, as well as the number of
  % rows r and columns c of a single frame.

  filename = 'Ball1_raw.avi';
  fileinfo = aviinfo(filename);          
  numFrames = fileinfo.NumFrames-1;

  mov = aviread(filename);

  f = mov(1,1);
  f = frame2im(f);
  f = rgb2gray(f);
  f = im2double(f)*255;

  [r,c] = size(f);
  imgs = zeros(numFrames, r*c);

  imgs(1, :) = f(:);

  % extract the frames
  for k=2:numFrames
    f = mov(1,k);
    f = frame2im(f);
    f = rgb2gray(f);
    f = im2double(f)*255;
    imgs(k, :) = f(:);
    
  end

end
