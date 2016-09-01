
"""
Run all SBML tests via the SEDML files.
Download the SBML test cases.
http://sbml.org/Facilities/Database/
"""

from __future__ import print_function
import tellurium as te
import re
import os
import matplotlib

# switch the backend of matplotlib, so plots can be tested
matplotlib.pyplot.switch_backend("Agg")

# location of test cases
CASES_DIRECTORY = os.path.join(".", 'testdata', 'sbml-test-cases-2014-10-22')

# find all L3V1 SEDML files
pattern = re.compile("""^\d{5}-sbml-l3v1-sedml.xml$""")

matches = []
for root, dirnames, filenames in os.walk(CASES_DIRECTORY):
    for filename in filenames:
        if pattern.match(filename):
            matches.append(os.path.join(root, filename))

matches = sorted(matches)
# execute the SEDML
import tellurium as te
for match in matches:
    print(match)
    try:
        te.executeSEDML(match)
    except RuntimeError:
        print("RUNTIME ERROR: {}".format(match))
        pass

