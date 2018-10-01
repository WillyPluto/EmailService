# Main file for local testing
import sys
from .functions import test

def main(args):
    test()

    

if __name__ == "__main__":
    main(sys.argv[1:])