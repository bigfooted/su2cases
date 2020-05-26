#!/bin/bash

HISTORY_FILE=$1

echo
echo "Plotting ${HISTORY_FILE}"
echo
cp -f plot_residuals_template.gpl .plot_residuals.gpl

sed -i 's|FIXME_HISTORY_FILE|'${HISTORY_FILE}'|g' .plot_residuals.gpl

gnuplot .plot_residuals.gpl
