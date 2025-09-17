# Copyright (c) OpenMMLab. All rights reserved.
import math
from xml.etree.ElementInclude import DEFAULT_MAX_INCLUSION_DEPTH

# import cv2
import numpy as np
from PIL import Image, ImageDraw
import random

def random_cropping_bbox(img_shape=(256,256), mask_mode='onedirection'):
    h, w = img_shape
    if mask_mode == 'onedirection':
        _type = np.random.randint(0, 4)
        if _type == 0:
            top, left, height, width = 0, 0, h, w//2
        elif _type == 1:
            top, left, height, width = 0, 0, h//2, w
        elif _type == 2:
            top, left, height, width = h//2, 0, h//2, w
        elif _type == 3:
            top, left, height, width = 0, w//2, h, w//2
    else:
        target_area = (h*w)//2
        width = np.random.randint(target_area//h, w)
        height = target_area//width
        if h==height:
            top = 0
        else:
            top = np.random.randint(0, h-height)
        if w==width:
            left = 0
        else:
            left = np.random.randint(0, w-width)
    return (top, left, height, width)

def random_bbox(img_shape=(256,256), max_bbox_shape=(128, 128), max_bbox_delta=40, min_margin=20):
    """Generate a random bbox for the mask on a given image.

    In our implementation, the max value cannot be obtained since we use
    `np.random.randint`. And this may be different with other standard scripts
    in the community.

    Args:
        img_shape (tuple[int]): The size of a image, in the form of (h, w).
        max_bbox_shape (int | tuple[int]): Maximum shape of the mask box,
            in the form of (h, w). If it is an integer, the mask box will be
            square.
        max_bbox_delta (int | tuple[int]): Maximum delta of the mask box,
            in the form of (delta_h, delta_w). If it is an integer, delta_h
            and delta_w will be the same. Mask shape will be randomly sampled
            from the range of `max_bbox_shape - max_bbox_delta` and
            `max_bbox_shape`. Default: (40, 40).
        min_margin (int | tuple[int]): The minimum margin size from the
            edges of mask box to the image boarder, in the form of
            (margin_h, margin_w). If it is an integer, margin_h and margin_w
            will be the same. Default: (20, 20).

    Returns:
        tuple[int]: The generated box, (top, left, h, w).
    """
    if not isinstance(max_bbox_shape, tuple):
        max_bbox_shape = (max_bbox_shape, max_bbox_shape)
    if not isinstance(max_bbox_delta, tuple):
        max_bbox_delta = (max_bbox_delta, max_bbox_delta)
    if not isinstance(min_margin, tuple):
        min_margin = (min_margin, min_margin)
        
    img_h, img_w = img_shape[:2]
    max_mask_h, max_mask_w = max_bbox_shape
    max_delta_h, max_delta_w = max_bbox_delta
    margin_h, margin_w = min_margin

    if max_mask_h > img_h or max_mask_w > img_w:
        raise ValueError(f'mask shape {max_bbox_shape} should be smaller than '
                         f'image shape {img_shape}')
    if (max_delta_h // 2 * 2 >= max_mask_h
            or max_delta_w // 2 * 2 >= max_mask_w):
        raise ValueError(f'mask delta {max_bbox_delta} should be smaller than'
                         f'mask shape {max_bbox_shape}')
    if img_h - max_mask_h < 2 * margin_h or img_w - max_mask_w < 2 * margin_w:
        raise ValueError(f'Margin {min_margin} cannot be satisfied for img'
                         f'shape {img_shape} and mask shape {max_bbox_shape}')

    # get the max value of (top, left)
    max_top = img_h - margin_h - max_mask_h
    max_left = img_w - margin_w - max_mask_w
    # randomly select a (top, left)
    top = np.random.randint(margin_h, max_top)
    left = np.random.randint(margin_w, max_left)
    # randomly shrink the shape of mask box according to `max_bbox_delta`
    # the center of box is fixed
    delta_top = np.random.randint(0, max_delta_h // 2 + 1)
    delta_left = np.random.randint(0, max_delta_w // 2 + 1)
    top = top + delta_top
    left = left + delta_left
    h = max_mask_h - delta_top
    w = max_mask_w - delta_left
    return (top, left, h, w)

def random_bbox_3d(img_shape=(32, 32, 32), max_bbox_shape=(16, 16, 16), max_bbox_delta=12, min_margin=2):
    '''
    Same as random_bbox, but for volumes
    
    Returns:
        tuple[int]: The generated box, (top, left, front, h, w, d)
    '''
    # Modify inputs if they aren't tuples already
    if not isinstance(max_bbox_shape, tuple):
        max_bbox_shape = (max_bbox_shape, max_bbox_shape, max_bbox_shape)
    if not isinstance(max_bbox_delta, tuple):
        max_bbox_delta = (max_bbox_delta, max_bbox_delta, max_bbox_delta)
    if not isinstance(min_margin, tuple):
        min_margin = (min_margin, min_margin, min_margin)

    # Mask parameters
    img_h, img_w, img_d = img_shape[:3]
    max_mask_h, max_mask_w, max_mask_d = max_bbox_shape
    max_delta_h, max_delta_w, max_delta_d = max_bbox_delta
    margin_h, margin_w, margin_d = min_margin

    # Check mask parameters
    if max_mask_h > img_h or max_mask_w > img_w or max_mask_d > img_d:
        raise ValueError(f'mask shape {max_bbox_shape} should be smaller than '
                         f'image shape {img_shape}')
    if (max_delta_h // 2 * 2 >= max_mask_h
            or max_delta_w // 2 * 2 >= max_mask_w
            or max_delta_d // 2 * 2 >= max_mask_d):
        raise ValueError(f'mask delta {max_bbox_delta} should be smaller than'
                         f'mask shape {max_bbox_shape}')
    if (img_h - max_mask_h < 2 * margin_h 
            or img_w - max_mask_w < 2 * margin_w
            or img_d - max_mask_d < 2 * margin_d):
        raise ValueError(f'Margin {min_margin} cannot be satisfied for img'
                         f'shape {img_shape} and mask shape {max_bbox_shape}')

    ## Create mask
    # get the max value of (top, left, front)
    max_top = img_h - margin_h - max_mask_h
    max_left = img_w - margin_w - max_mask_w
    max_front = img_d - margin_d - max_mask_d
    # randomly select a (top, left, front)
    top = np.random.randint(margin_h, max_top)
    left = np.random.randint(margin_w, max_left)
    front = np.random.randint(margin_d, max_front)
    # randomly shrink the shape of mask box according to `max_bbox_delta`
    # the center of box is fixed
    delta_top = np.random.randint(0, max_delta_h // 2 + 1)
    delta_left = np.random.randint(0, max_delta_w // 2 + 1)
    delta_front = np.random.randint(0, max_delta_d // 2 + 1)
    top = top + delta_top
    left = left + delta_left
    front = front + delta_front
    h = max_mask_h - delta_top
    w = max_mask_w - delta_left
    d = max_mask_d - delta_front
    return (top, left, front, h, w, d)

def bbox2mask(img_shape, bbox, nchan=1, dtype='uint8'):
    """Generate mask in ndarray from bbox.

    The returned mask has the shape of (h, w, [d], 1). '1' indicates the
    hole and '0' indicates the valid regions.

    We prefer to use `uint8` as the data type of masks, which may be different
    from other codes in the community.

    Args:
        img_shape (tuple[int]): The size of the image.
        bbox (tuple[int]): Configuration tuple, (top, left, [front], height, width, [depth])
        dtype (str): Indicate the data type of returned masks. Default: 'uint8'

    Return:
        numpy.ndarray: Mask in the shape of (h, w, [d], 1).
    """

    if len(img_shape) == 2:  # Plane data
        height, width = img_shape[:2]

        mask = np.zeros((height, width, nchan), dtype=dtype)
        mask[bbox[0]:bbox[0] + bbox[2], bbox[1]:bbox[1] + bbox[3], :] = 1
    elif len(img_shape) == 3:  # Volume data
        height, width, depth = img_shape[:3]

        mask = np.zeros((height, width, depth, nchan), dtype=dtype)
        mask[bbox[0]:bbox[0] + bbox[3], bbox[1]:bbox[1] + bbox[4], bbox[2]:bbox[2] + bbox[5], :] = 1

    return mask


def brush_stroke_mask(img_shape,
                      num_vertices=(4, 12),
                      mean_angle=2 * math.pi / 5,
                      angle_range=2 * math.pi / 15,
                      brush_width=(12, 40),
                      max_loops=4,
                      dtype='uint8'):
    """Generate free-form mask.

    The method of generating free-form mask is in the following paper:
    Free-Form Image Inpainting with Gated Convolution.

    When you set the config of this type of mask. You may note the usage of
    `np.random.randint` and the range of `np.random.randint` is [left, right).

    We prefer to use `uint8` as the data type of masks, which may be different
    from other codes in the community.

    TODO: Rewrite the implementation of this function.

    Args:
        img_shape (tuple[int]): Size of the image.
        num_vertices (int | tuple[int]): Min and max number of vertices. If
            only give an integer, we will fix the number of vertices.
            Default: (4, 12).
        mean_angle (float): Mean value of the angle in each vertex. The angle
            is measured in radians. Default: 2 * math.pi / 5.
        angle_range (float): Range of the random angle.
            Default: 2 * math.pi / 15.
        brush_width (int | tuple[int]): (min_width, max_width). If only give
            an integer, we will fix the width of brush. Default: (12, 40).
        max_loops (int): The max number of for loops of drawing strokes.
        dtype (str): Indicate the data type of returned masks.
            Default: 'uint8'.

    Returns:
        numpy.ndarray: Mask in the shape of (h, w, 1).
    """

    img_h, img_w = img_shape[:2]
    if isinstance(num_vertices, int):
        min_num_vertices, max_num_vertices = num_vertices, num_vertices + 1
    elif isinstance(num_vertices, tuple):
        min_num_vertices, max_num_vertices = num_vertices
    else:
        raise TypeError('The type of num_vertices should be int'
                        f'or tuple[int], but got type: {num_vertices}')

    if isinstance(brush_width, tuple):
        min_width, max_width = brush_width
    elif isinstance(brush_width, int):
        min_width, max_width = brush_width, brush_width + 1
    else:
        raise TypeError('The type of brush_width should be int'
                        f'or tuple[int], but got type: {brush_width}')

    average_radius = math.sqrt(img_h * img_h + img_w * img_w) / 8
    mask = Image.new('L', (img_w, img_h), 0)

    loop_num = np.random.randint(1, max_loops)
    num_vertex_list = np.random.randint(
        min_num_vertices, max_num_vertices, size=loop_num)
    angle_min_list = np.random.uniform(0, angle_range, size=loop_num)
    angle_max_list = np.random.uniform(0, angle_range, size=loop_num)

    for loop_n in range(loop_num):
        num_vertex = num_vertex_list[loop_n]
        angle_min = mean_angle - angle_min_list[loop_n]
        angle_max = mean_angle + angle_max_list[loop_n]
        angles = []
        vertex = []

        # set random angle on each vertex
        angles = np.random.uniform(angle_min, angle_max, size=num_vertex)
        reverse_mask = (np.arange(num_vertex, dtype=np.float32) % 2) == 0
        angles[reverse_mask] = 2 * math.pi - angles[reverse_mask]

        h, w = mask.size

        # set random vertices
        vertex.append((np.random.randint(0, w), np.random.randint(0, h)))
        r_list = np.random.normal(
            loc=average_radius, scale=average_radius // 2, size=num_vertex)
        for i in range(num_vertex):
            r = np.clip(r_list[i], 0, 2 * average_radius)
            new_x = np.clip(vertex[-1][0] + r * math.cos(angles[i]), 0, w)
            new_y = np.clip(vertex[-1][1] + r * math.sin(angles[i]), 0, h)
            vertex.append((int(new_x), int(new_y)))
        # draw brush strokes according to the vertex and angle list
        draw = ImageDraw.Draw(mask)
        width = np.random.randint(min_width, max_width)
        draw.line(vertex, fill=1, width=width)
        for v in vertex:
            draw.ellipse((v[0] - width // 2, v[1] - width // 2,
                          v[0] + width // 2, v[1] + width // 2),
                         fill=1)
    # randomly flip the mask
    if np.random.normal() > 0:
        mask.transpose(Image.FLIP_LEFT_RIGHT)
    if np.random.normal() > 0:
        mask.transpose(Image.FLIP_TOP_BOTTOM)
    mask = np.array(mask).astype(dtype=getattr(np, dtype))
    mask = mask[:, :, None]
    return mask


# def random_irregular_mask(img_shape,
#                           num_vertices=(4, 8),
#                           max_angle=4,
#                           length_range=(10, 100),
#                           brush_width=(10, 40),
#                           dtype='uint8'):
#     """Generate random irregular masks.

#     This is a modified version of free-form mask implemented in
#     'brush_stroke_mask'.

#     We prefer to use `uint8` as the data type of masks, which may be different
#     from other codes in the community.

#     TODO: Rewrite the implementation of this function.

#     Args:
#         img_shape (tuple[int]): Size of the image.
#         num_vertices (int | tuple[int]): Min and max number of vertices. If
#             only give an integer, we will fix the number of vertices.
#             Default: (4, 8).
#         max_angle (float): Max value of angle at each vertex. Default 4.0.
#         length_range (int | tuple[int]): (min_length, max_length). If only give
#             an integer, we will fix the length of brush. Default: (10, 100).
#         brush_width (int | tuple[int]): (min_width, max_width). If only give
#             an integer, we will fix the width of brush. Default: (10, 40).
#         dtype (str): Indicate the data type of returned masks. Default: 'uint8'

#     Returns:
#         numpy.ndarray: Mask in the shape of (h, w, 1).
#     """

#     h, w = img_shape[:2]

#     mask = np.zeros((h, w), dtype=dtype)
#     if isinstance(length_range, int):
#         min_length, max_length = length_range, length_range + 1
#     elif isinstance(length_range, tuple):
#         min_length, max_length = length_range
#     else:
#         raise TypeError('The type of length_range should be int'
#                         f'or tuple[int], but got type: {length_range}')
#     if isinstance(num_vertices, int):
#         min_num_vertices, max_num_vertices = num_vertices, num_vertices + 1
#     elif isinstance(num_vertices, tuple):
#         min_num_vertices, max_num_vertices = num_vertices
#     else:
#         raise TypeError('The type of num_vertices should be int'
#                         f'or tuple[int], but got type: {num_vertices}')

#     if isinstance(brush_width, int):
#         min_brush_width, max_brush_width = brush_width, brush_width + 1
#     elif isinstance(brush_width, tuple):
#         min_brush_width, max_brush_width = brush_width
#     else:
#         raise TypeError('The type of brush_width should be int'
#                         f'or tuple[int], but got type: {brush_width}')

#     num_v = np.random.randint(min_num_vertices, max_num_vertices)

#     for i in range(num_v):
#         start_x = np.random.randint(w)
#         start_y = np.random.randint(h)
#         # from the start point, randomly setlect n \in [1, 6] directions.
#         direction_num = np.random.randint(1, 6)
#         angle_list = np.random.randint(0, max_angle, size=direction_num)
#         length_list = np.random.randint(
#             min_length, max_length, size=direction_num)
#         brush_width_list = np.random.randint(
#             min_brush_width, max_brush_width, size=direction_num)
#         for direct_n in range(direction_num):
#             angle = 0.01 + angle_list[direct_n]
#             if i % 2 == 0:
#                 angle = 2 * math.pi - angle
#             length = length_list[direct_n]
#             brush_w = brush_width_list[direct_n]
#             # compute end point according to the random angle
#             end_x = (start_x + length * np.sin(angle)).astype(np.int32)
#             end_y = (start_y + length * np.cos(angle)).astype(np.int32)

#             cv2.line(mask, (start_y, start_x), (end_y, end_x), 1, brush_w)
#             start_x, start_y = end_x, end_y
#     mask = np.expand_dims(mask, axis=2)

#     return mask


def get_irregular_mask(img_shape, area_ratio_range=(0.15, 0.5), **kwargs):
    """Get irregular mask with the constraints in mask ratio

    Args:
        img_shape (tuple[int]): Size of the image.
        area_ratio_range (tuple(float)): Contain the minimum and maximum area
        ratio. Default: (0.15, 0.5).

    Returns:
        numpy.ndarray: Mask in the shape of (h, w, 1).
    """

    mask = random_irregular_mask(img_shape, **kwargs)
    min_ratio, max_ratio = area_ratio_range

    while not min_ratio < (np.sum(mask) /
                           (img_shape[0] * img_shape[1])) < max_ratio:
        mask = random_irregular_mask(img_shape, **kwargs)

    return mask

def get_custom_mask(img_shape, mask_dir, dtype='uint8'):
    '''
    Return a mask based on a user-specified numpy array
    '''

    ## Read the mask file
    mask = np.load(mask_dir)
    mask = mask.astype(dtype)

    ## Check that the mask dimensions are correct 
    height, width = img_shape[:2]
    assert mask.shape[0] == height, f"Shape mismatch! {mask.shape[0]} != {height}"
    assert mask.shape[1] == width, f"Shape mismatch! {mask.shape[1]} != {width}"

    if len(img_shape) == 3:  # Volume data
        depth = img_shape[2]
        assert mask.shape[2] == depth, f"Shape mismatch! {mask.shape[2]} != {depth}"

    return mask

def get_stripe_mask(img_shape, x0_stripe=4, dx_stripe=4, n_stripes=7, axis=0, dtype='uint8'):
    '''
    Create a mask for volumes with multiple stripes of visibility

    The orientation of the stripes changes with `axis`
    '''

    ## Check inputs
    if axis > 3: raise ValueError("Value of axis must be < 3!")
    if x0_stripe + n_stripes*dx_stripe > img_shape[axis]:
        raise ValueError("Requested mask inputs exceed image shape!")

    ## Initialize mask
    height, width, depth = img_shape[:3]
    mask = np.ones((height, width, depth, 1), dtype=dtype)

    ## Populate mask
    for i in range(n_stripes):
        xloc = x0_stripe + i*dx_stripe
        if axis == 0:
            mask[xloc,:,:,0] = 0
        elif axis == 1:
            mask[:,xloc,:,0] = 0
        elif axis == 2:
            mask[:,:,xloc,0] = 0

    return mask

def get_random_mask(img_shape, mask_percent=75, dtype='uint8'):
    '''
    Mask some percentage of the volume at random locations,
        following Meta's Masked Image Modeling

    TODO: Don't hardcode the mask percentage
    '''

    ## Mask shape
    height, width, depth = img_shape[:3]

    ## Create mask
    if mask_percent == 90:
        mask = np.random.randint(low=0, high=11, size=(height, width, depth, 1))
        mask = mask.astype(bool).astype(dtype)
    elif mask_percent == 75:
        mask = np.random.randint(low=0, high=4, size=(height, width, depth, 1))
        mask = mask.astype(bool).astype(dtype)
    elif mask_percent == 50:
        mask = np.random.randint(low=0, high=2, size=(height, width, depth, 1), dtype=dtype)
    else:
        raise NotImplementedError("Supported mask percents are currently hardcoded as [50, 75, 90].")

    return mask

def get_gappy_lidar_mask(img_shape, nchan, jlo_in_rel, jhi_in_rel, klo_in_rel, khi_in_rel, dtype='uint8'):
    '''
    Create a mask that mimics real world gappy lidar measurements
    '''
    ## Initialize mask
    ntime, width, height = img_shape[:3]
    mask = np.ones((ntime, width, height, nchan), dtype=dtype)

    ## Input parameters
    # Spatial position of the lidar, consult
    #   Consult datasets/01_trim_bc.ipynb for reference values regarding height/width
    lidar_k = klo_in_rel  # ASSUME: Lidar measurement is one pixel tall
    lidar_jrange = [jlo_in_rel,jhi_in_rel]

    # TODO: Don't hard code remaining parameters
    nmeas_per_sweep = [14, 15]  # Either 14 or 15 measurements per sweep
    ndrop_cyclic = [1, 2]       # Either 1 or 2 timesteps of data lost during reset
    drop_random = 1             # Random data drops are only 1 timestep wide

    ## Initial measurements
    mask[:,lidar_jrange[0]:lidar_jrange[1],lidar_k,0] = 0  # Initially measure u at all times

    ## Drop data following the cyclic pattern
    # Drop the first cyclic timestamp
    sweep_len0 = random.choice(nmeas_per_sweep)
    initial_tdrop = random.randint(0, sweep_len0+1)
    initial_dropwidth = random.choice(ndrop_cyclic)
    mask[initial_tdrop:initial_tdrop+initial_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Drop remaining cyclic timesteps
    curr_tind = initial_tdrop+initial_dropwidth
    while curr_tind < ntime:
        curr_tdrop = curr_tind + random.choice(nmeas_per_sweep)
        curr_dropwidth = random.choice(ndrop_cyclic)
        mask[curr_tdrop:curr_tdrop+curr_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1
        curr_tind = curr_tdrop+curr_dropwidth
        
    # Randomly remove one extra timestamp of data, maybe
    if random.choice([True, False]):
        curr_tind = random.randint(0, ntime+1)
        mask[curr_tind:curr_tind+drop_random,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    return mask

def get_gappy_lidar_and_thalf_mask(img_shape, nchan, jlo_in_rel, jhi_in_rel, klo_in_rel, khi_in_rel, dtype='uint8'):
    '''
    Create a mask that mimics real world gappy lidar measurements,
      plus account for knowing half the sample because we chain together samples
    '''
    ## Initialize mask
    ntime, width, height = img_shape[:3]
    mask = np.ones((ntime, width, height, nchan), dtype=dtype)

    ## Input parameters
    # Spatial position of the lidar, consult
    #   Consult datasets/01_trim_bc.ipynb for reference values regarding height/width
    lidar_k = klo_in_rel  # ASSUME: Lidar measurement is one pixel tall
    lidar_jrange = [jlo_in_rel,jhi_in_rel]

    # TODO: Don't hard code remaining parameters
    nmeas_per_sweep = [14, 15]  # Either 14 or 15 measurements per sweep
    ndrop_cyclic = [1, 2]       # Either 1 or 2 timesteps of data lost during reset
    drop_random = 1             # Random data drops are only 1 timestep wide

    ## Initial measurements
    mask[:,lidar_jrange[0]:lidar_jrange[1],lidar_k,0] = 0  # Initially measure u at all times

    ## Drop data following the cyclic pattern
    # Drop the first cyclic timestamp
    sweep_len0 = random.choice(nmeas_per_sweep)
    initial_tdrop = random.randint(0, sweep_len0+1)
    initial_dropwidth = random.choice(ndrop_cyclic)
    mask[initial_tdrop:initial_tdrop+initial_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Drop remaining cyclic timesteps
    curr_tind = initial_tdrop+initial_dropwidth
    while curr_tind < ntime:
        curr_tdrop = curr_tind + random.choice(nmeas_per_sweep)
        curr_dropwidth = random.choice(ndrop_cyclic)
        mask[curr_tdrop:curr_tdrop+curr_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1
        curr_tind = curr_tdrop+curr_dropwidth
        
    # Randomly remove one extra timestamp of data, maybe
    if random.choice([True, False]):
        curr_tind = random.randint(0, ntime+1)
        mask[curr_tind:curr_tind+drop_random,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Add the half-time bit
    mask[0:int(ntime/2),:,:,:] = 0  # Note: all variables are visible for half-time reconstructions

    return mask

def get_noisy_gappy_lidar_mask(img_shape, nchan, jlo_in_rel, jhi_in_rel, klo_in_rel, khi_in_rel, mask_pct=10, dtype='uint8'):
    '''
    Create a mask that mimics real world gappy lidar measurements that also
      have extra missing data (e.g., due to blade strikes)
    '''
    ## Initialize mask
    ntime, width, height = img_shape[:3]
    mask = np.ones((ntime, width, height, nchan), dtype=dtype)

    ## Input parameters
    # Spatial position of the lidar, consult
    #   Consult datasets/01_trim_bc.ipynb for reference values regarding height/width
    lidar_k = klo_in_rel  # ASSUME: Lidar measurement is one pixel tall
    lidar_jrange = [jlo_in_rel,jhi_in_rel]

    # TODO: Don't hard code remaining parameters
    nmeas_per_sweep = [14, 15]  # Either 14 or 15 measurements per sweep
    ndrop_cyclic = [1, 2]       # Either 1 or 2 timesteps of data lost during reset
    drop_random = 1             # Random data drops are only 1 timestep wide

    ## Initial measurements
    mask[:,lidar_jrange[0]:lidar_jrange[1],lidar_k,0] = 0  # Initially measure u at all times

    ## Drop data following the cyclic pattern
    # Drop the first cyclic timestamp
    sweep_len0 = random.choice(nmeas_per_sweep)
    initial_tdrop = random.randint(0, sweep_len0+1)
    initial_dropwidth = random.choice(ndrop_cyclic)
    mask[initial_tdrop:initial_tdrop+initial_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Drop remaining cyclic timesteps
    curr_tind = initial_tdrop+initial_dropwidth
    while curr_tind < ntime:
        curr_tdrop = curr_tind + random.choice(nmeas_per_sweep)
        curr_dropwidth = random.choice(ndrop_cyclic)
        mask[curr_tdrop:curr_tdrop+curr_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1
        curr_tind = curr_tdrop+curr_dropwidth
        
    # Randomly remove one extra timestamp of data, maybe
    if random.choice([True, False]):
        curr_tind = random.randint(0, ntime+1)
        mask[curr_tind:curr_tind+drop_random,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    ## Also, drop a random percent of data
    mask_random_pct = np.zeros((ntime, width, height, nchan), dtype=dtype).flatten()
    mask_random_pct[0:int(len(mask_random_pct)*mask_pct/100)] = 1
    np.random.shuffle(mask_random_pct)
    mask_random_pct = np.reshape(mask_random_pct, (ntime, width, height, nchan))
    mask = mask | mask_random_pct

    return mask

def get_noisy_gappy_lidar_and_thalf_mask(img_shape, nchan, jlo_in_rel, jhi_in_rel, klo_in_rel, khi_in_rel, mask_pct=10, dtype='uint8'):
    '''
    Create a mask that mimics real world gappy lidar measurements,
      possibly with extra missing data,
      plus account for knowing half the sample because we chain together samples
    '''
    ## Initialize mask
    ntime, width, height = img_shape[:3]
    mask = np.ones((ntime, width, height, nchan), dtype=dtype)

    ## Input parameters
    # Spatial position of the lidar, consult
    #   Consult datasets/01_trim_bc.ipynb for reference values regarding height/width
    lidar_k = klo_in_rel  # ASSUME: Lidar measurement is one pixel tall
    lidar_jrange = [jlo_in_rel,jhi_in_rel]

    # TODO: Don't hard code remaining parameters
    nmeas_per_sweep = [14, 15]  # Either 14 or 15 measurements per sweep
    ndrop_cyclic = [1, 2]       # Either 1 or 2 timesteps of data lost during reset
    drop_random = 1             # Random data drops are only 1 timestep wide

    ## Initial measurements
    mask[:,lidar_jrange[0]:lidar_jrange[1],lidar_k,0] = 0  # Initially measure u at all times

    ## Drop data following the cyclic pattern
    # Drop the first cyclic timestamp
    sweep_len0 = random.choice(nmeas_per_sweep)
    initial_tdrop = random.randint(0, sweep_len0+1)
    initial_dropwidth = random.choice(ndrop_cyclic)
    mask[initial_tdrop:initial_tdrop+initial_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Drop remaining cyclic timesteps
    curr_tind = initial_tdrop+initial_dropwidth
    while curr_tind < ntime:
        curr_tdrop = curr_tind + random.choice(nmeas_per_sweep)
        curr_dropwidth = random.choice(ndrop_cyclic)
        mask[curr_tdrop:curr_tdrop+curr_dropwidth,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1
        curr_tind = curr_tdrop+curr_dropwidth
        
    # Randomly remove one extra timestamp of data, maybe
    if random.choice([True, False]):
        curr_tind = random.randint(0, ntime+1)
        mask[curr_tind:curr_tind+drop_random,lidar_jrange[0]:lidar_jrange[1],lidar_k,:] = 1

    # Also, drop a random percent of data
    mask_random_pct = np.zeros((ntime, width, height, nchan), dtype=dtype).flatten()
    mask_random_pct[0:int(len(mask_random_pct)*mask_pct/100)] = 1
    np.random.shuffle(mask_random_pct)
    mask_random_pct = np.reshape(mask_random_pct, (ntime, width, height, nchan))
    mask = mask | mask_random_pct

    # Add the half-time bit
    mask[0:int(ntime/2),:,:,:] = 0  # Note: all variables are visible for half-time reconstructions

    return mask