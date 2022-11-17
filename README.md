# Static Taint Analysis for Ethereum Contracts

The analyzer detects vulnerable contracts that may be deleted from the blockchain and have all remaining cryptocurrency transferred to an untrusted address.

## Repository Structure
* `/peck`: This directory contains a parser that transforms a Solidity contract into an intermediate representation (IR), and derives Datalog facts that encode the contract’s IR.  Technical details on the IR and its representation in Datalog can be found in `analyser/README-IR.md`.
* `analyser/`: This directory contains the code for the static taint analyser and some test contracts. The `analyser/analyze.dl` and `analyser/analyze.py` are the main source files for the analysis.

## Setup Instructions
The analyser requires `python 3.7`, `solc 0.5.7` and `souffle 1.5.1`:
* Solidity: https://github.com/ethereum/solidity
* Graphviz: https://gitlab.com/graphviz/graphviz/
* Souffle: https://github.com/souffle-lang/souffle
* py-solc: https://github.com/ethereum/py-solc

Create a python virtual environment and install python dependencies.
```
$ python -m venv venv
$ source venv/bin/activate
$ pip install --upgrade pip
$ pip install -e .
```

## Example Usage
Run analyser:
```
$ cd analyser
$ python analyze.py test_contracts/0.sol
Tainted
```

Inspect the contract’s control flow graph / Datalog representation:
```
$ python analyze.py --visualize test_contracts/0.sol
$ ls test_contract_out 
facts.pdf  graph.pdf
```
