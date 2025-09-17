import argparse
from datetime import datetime
from pathlib import Path
import random
import sys

def main(output_parent_dir, meas_dir):
    '''
    Create the working directory
    output_parent_dir will likely be: /scratch/orybchuk/wakedynamics/bcs-ldm/palette_3d/concat_and_cascade
    meas_dir can be e.g.,: /projects/wakedynamics/orybchuk/bcs-ldm/palette_3d/datasets/med_10min_les_24_4_onlyu/chunked0000
    Returns:
      - The name of the working directory
    '''
    random_id = str(random.randint(0,9999)).zfill(4)
    output_dir = Path(output_parent_dir, datetime.now().strftime('%Y_%m_%d_%H_%M')+'_'+meas_dir.name+'_'+random_id)
    output_dir.mkdir()

    return str(output_dir)


def parse_args():
    parser = argparse.ArgumentParser("", add_help=False)
    parser.add_argument("--output_parent_dir", help="The output will be stored in this parent directory", required=True, type=Path)
    parser.add_argument("--meas_dir", help="The directory containing chunked measurements", required=True, type=Path)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    output_dir = main(args.output_parent_dir, args.meas_dir)
    sys.stdout.write(output_dir)
