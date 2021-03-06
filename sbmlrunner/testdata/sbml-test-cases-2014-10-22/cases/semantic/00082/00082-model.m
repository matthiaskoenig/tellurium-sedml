(* 

category:      Test
synopsis:      Two reactions and a rate rule with four species in a compartment. 
componentTags: Compartment, Species, Reaction, Parameter, RateRule
testTags:      Amount
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3, 2.4, 3.1
generatedBy:   Numeric

The model contains one compartment called "compartment".  There are four
species named S1, S2, S3 and S4 and two parameters named k1 and k2.  The
model contains two reactions defined as:

[{width:30em,margin: 1em auto}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 | $k1 * S1 * S2 * compartment$  |
| S3 -> S1 + S2 | $k2 * S3 * compartment$  |]

The model contains one rule:

[{width:30em,margin: 1em auto}|  *Type*  |  *Variable*  |  *Formula*  |
 | Rate | S4 | $1 10^-3$  |]

The initial conditions are as follows:

[{width:30em,margin: 1em auto}|       |*Value*          |*Units*  |
|Initial amount of S1                |$1.5 \x 10^-3$ |mole                      |
|Initial amount of S2                |$2.0 \x 10^-3$ |mole                      |
|Initial amount of S3                |$1.5 \x 10^-3$ |mole                      |
|Initial amount of S4                |$  1 \x 10^-3$ |mole                      |
|Value of parameter k1               |$0.75 \x 10^3$ |litre mole^-1^ second^-1^ |
|Value of parameter k2               |$0.25 \x 10^-2$ |second^-1^ |
|Volume of compartment "compartment" |$            1$ |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00082" ];

addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.5 10^-3 ];
addSpecies[ S2, initialAmount -> 2.0 10^-3];
addSpecies[ S3, initialAmount -> 1.5 10^-3];
addSpecies[ S4, initialAmount -> 1 10^-3 ];
addParameter[ k1, value -> .75 10^3];
addParameter[ k2, value -> .25 10^-2];
addRule[ type->RateRule, variable -> S4, math -> 1 10^-3];
addReaction[ S1 + S2 -> S3, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * compartment ];
addReaction[ S3 -> S1 + S2, reversible -> False,
	     kineticLaw -> k2 * S3 * compartment ];

makemodel[]
