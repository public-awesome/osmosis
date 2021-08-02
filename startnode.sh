#!/bin/bash

rm -rf $HOME/.osmosisd/

cd $HOME

osmosisd init --chain-id=testing testing --home=$HOME/.osmosisd
osmosisd keys add validator --keyring-backend=test --home=$HOME/.osmosisd
osmosisd add-genesis-account $(osmosisd keys show validator -a --keyring-backend=test --home=$HOME/.osmosisd) 1000000000uosmox --home=$HOME/.osmosisd
osmosisd gentx validator 500000000uosmox --keyring-backend=test --home=$HOME/.osmosisd --chain-id=testing
osmosisd collect-gentxs --home=$HOME/.osmosisd
osmosisd prepare-genesis testnet cygnusx-osmo-1
osmosisd start --home=$HOME/.osmosisd
