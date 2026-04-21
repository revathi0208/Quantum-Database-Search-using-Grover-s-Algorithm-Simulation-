OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// === STEP 1: SUPERPOSITION ===
h q[0];
h q[1];
h q[2];

// === STEP 2: ORACLE — marks target state |101> ===
x q[1];
h q[2];
ccx q[0], q[1], q[2];
h q[2];
x q[1];

// === STEP 3: DIFFUSION OPERATOR — iteration 1 ===
h q[0]; h q[1]; h q[2];
x q[0]; x q[1]; x q[2];
h q[2];
ccx q[0], q[1], q[2];
h q[2];
x q[0]; x q[1]; x q[2];
h q[0]; h q[1]; h q[2];

// === STEP 2 REPEAT: ORACLE — iteration 2 ===
x q[1];
h q[2];
ccx q[0], q[1], q[2];
h q[2];
x q[1];

// === STEP 3 REPEAT: DIFFUSION — iteration 2 ===
h q[0]; h q[1]; h q[2];
x q[0]; x q[1]; x q[2];
h q[2];
ccx q[0], q[1], q[2];
h q[2];
x q[0]; x q[1]; x q[2];
h q[0]; h q[1]; h q[2];

// === STEP 4: MEASURE ===
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
