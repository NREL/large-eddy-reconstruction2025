import argparse
from pathlib import Path
import sys

def main(working_dir, nz_in, nz_out):
    '''
    Create the directory where all measurements of a certain size/resolution will get inpainted
    '''
    res_dir_name = f'{nz_in}_to_{nz_out}'
    output_dir = Path(working_dir, res_dir_name)
    output_dir.mkdir()

    return str(output_dir)


def parse_args():
    parser = argparse.ArgumentParser("", add_help=False)
    parser.add_argument("--working_dir", help="The working directory that contains all cascading and concatenating outout", required=True, type=Path)
    parser.add_argument("--nz_in", help="The height of the input measurements", required=True, type=int)
    parser.add_argument("--nz_out", help="The height of the inpainted sample", required=True, type=int)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    output_dir = main(args.working_dir, args.nz_in, args.nz_out)
    sys.stdout.write(output_dir)
