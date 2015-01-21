import glob


def get_statistics_for_file(filename):
    with open(filename) as f:
        program = [line for line in f]
        instructions_only = filter(lambda x: x and x[0] != ';',
                                   map(lambda x: x.strip(), program))

    return {
        'instruction_count': len(instructions_only)
    }


def h(number, content):
    return '#' * number + ' ' + content


def tr(*args):
    return ' %s '.join(['|'] * (len(args) + 1)) % args


def main():
    print h(1, 'Demolicious snippets')
    print '''
Here are some demolicious snippets.
They are mostly meant to be used as drop-in replacements for macros,
making them useful for application writing.

Here are some automatically generated statistics:
'''
    for filename in glob.glob('*.demosembly'):
        statistics = get_statistics_for_file(filename)
        print h(2, filename)
        print tr('Instruction count', statistics['instruction_count'])


if __name__ == '__main__':
    main()
