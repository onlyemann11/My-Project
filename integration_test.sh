#!/usr/bin/env bash
set -euo pipefail

mkdir -p reports

# Run the calculator with sample inputs
OUTPUT=$(python3 -c "import calculator; print(calculator.add(2, 3))")

EXPECTED="5"

if [[ "$OUTPUT" == "$EXPECTED" ]]; then
  cat > reports/junit.xml <<XML
<testsuite name="integration" tests="1" failures="0">
  <testcase name="calculator_add"/>
</testsuite>
XML
  exit 0
else
  cat > reports/junit.xml <<XML
<testsuite name="integration" tests="1" failures="1">
  <testcase name="calculator_add">
    <failure message="Output mismatch"><![CDATA[
Expected: $EXPECTED
Actual:   $OUTPUT
]]></failure>
  </testcase>
</testsuite>
XML
  exit 1
fi
