function movie = annotate_video(images, numFrames, frame_size, object_size, positions)
% 
  % make an annotated movie from images
  %
  % Inputs:
  %   images:         images to be annotated, numFrames x (r * c) matrix
  %   numFrames:      number of frames in the video
  %   frame_size:     size of the images in [row; column]
  %   object_size:    size of the object in [row; column]
  %   positions:      position of object within frame, as 
  %                   numFrames x 2 matrix, where each row represents a
  %                   position row, column
  % Outputs:
  %   movie:          Matlab movie with a bounding box in each frame
  %                   indicating the position of the tracked object.
  %

  %
  % YOUR CODE HERE
  %

  movie = moviein(numFrames);
  
  for k = 1:numFrames
      image = reshape(images(k,:), frame_size(1), frame_size(2));
      row = positions(k,1);
      col = positions(k,2);
      
      row = round(min(max(1,row), frame_size(1)));
      col = round(min(max(1,col), frame_size(2)));
      
      annotated = draw_rectangle(image, [row col], object_size(2), object_size(1));
      movie(:,k) = im2frame(annotated);
  end
end
  