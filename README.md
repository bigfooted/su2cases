# su2cases
su2cases
Contains validation test cases for su2



https://user-images.githubusercontent.com/7050568/154577982-17444d18-3787-4ee2-b42e-934ad87f0682.mp4

Unsteady wake behind a 2D cylinder at Re=120

https://github.com/bigfooted/su2cases/assets/7050568/61b4e006-5eba-4b4a-bc47-da7e1ea01fdf

You can make these movies from a sequence of images using:
ffmpeg -r 24 -f image2 -s 1920x1080 -start_number 200 -i unsteady_cylinder_Re120.%04d.png -vf "crop=trunc(iw/2)*2:trunc(ih/2)*2" -vframes 1000 -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
