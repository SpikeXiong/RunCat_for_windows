from PIL import Image
import os

def convert_gif_to_ico(gif_path, output_dir):
    img = Image.open(gif_path)
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Copy the first frame to a new Image object
    first_frame = img.copy()
    first_frame.seek(0)
    first_frame_path = os.path.join(output_dir, 'light_custom_0.ico')
    first_frame.save(first_frame_path, 'ICO')

    for i in range(1, img.n_frames):
        img.seek(i)
        output_path = os.path.join(output_dir, f'light_custom_{i-1}.ico')
        img.save(output_path, 'ICO')

# Usage
convert_gif_to_ico('congadoge.gif', 'output')