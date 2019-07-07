import csv

def modify_file():
    """
        This function modifies profiles. txt file in order to keep those data
        we are interested in
    """

    with open("./soc-pokec-profiles.txt", encoding='utf8') as inp:
        reader = csv.reader(inp, delimiter='\t')

        with open("./data.txt",
                  mode='w') as out:
            for row in reader:
                out.write(row[0] + ", " + row[3] + ", " + row[7])
                out.write("\n")

if __name__ == '__main__':
    modify_file()
