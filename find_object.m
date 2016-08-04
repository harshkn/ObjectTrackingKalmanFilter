function pos = find_object(image, object, x)
  % finds an object in an image starting at an initial estimated position
  % using sum of squared differences (ssd)
  %
  % Inputs:
  %   image:              image where the object is hidden, rows x columns
  %                       matrix
  %   object:             image of the object to be found
  %   x:                  where the object might be, [column; row].
  %
  % Outputs:
  %    position:          where we found the object, 2 x 1 vector
  %


 
%   [images, numFrames, height, width] = avi2images('Ball1_raw.avi');

[ob_height, ob_width] = size(object);
[im_height, im_width] = size(image);
  
half_ob_height = (ob_height-1)/2;
half_ob_width = (ob_width-1)/2;

c = round(min(max(1, x(2)), im_height));
r = round(min(max(1, x(1)), im_width));

%search region 
H = 120;
W = 120;

height_begin  = min(im_height - half_ob_height, max(half_ob_height+1, r -H));
height_end = max(half_ob_height + 1, min(im_height - half_ob_height, r + H));

width_begin = min(im_width - half_ob_width, max(half_ob_width + 1, c - W));
width_end = max(half_ob_width + 1, min(im_width - half_ob_width, c + W));


ssd_min = Inf;
pos = zeros(2,1);
for h = height_begin:height_end
    for w = width_begin:width_end
        slice = image(h - half_ob_height: h + half_ob_height, w - half_ob_width:w + half_ob_width);
        ssd = sum((object(:) - slice(:)).^2);
        if(ssd < ssd_min)
            pos = [h;w];
            ssd_min = ssd;
        end
    end
end
end
  
  