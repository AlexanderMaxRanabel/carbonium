// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// RUN: %{not} %{carbon-run-semantics}
// CHECK:STDOUT: cross_reference_irs_size: 1
// CHECK:STDOUT: callables: [
// CHECK:STDOUT:   {param_ir: block0, param_refs: block0}
// CHECK:STDOUT: ]
// CHECK:STDOUT: integer_literals: [
// CHECK:STDOUT:   12,
// CHECK:STDOUT:   12,
// CHECK:STDOUT: ]
// CHECK:STDOUT: strings: [
// CHECK:STDOUT:   Main,
// CHECK:STDOUT: ]
// CHECK:STDOUT: nodes: [
// CHECK:STDOUT:   {kind: CrossReference, arg0: ir0, arg1: block0, type: node0},
// CHECK:STDOUT:   {kind: CrossReference, arg0: ir0, arg1: block1, type: node1},
// CHECK:STDOUT:   {kind: CrossReference, arg0: ir0, arg1: block2, type: node0},
// CHECK:STDOUT:   {kind: CrossReference, arg0: ir0, arg1: block3, type: node0},
// CHECK:STDOUT:   {kind: FunctionDeclaration, arg0: callable0},
// CHECK:STDOUT:   {kind: BindName, arg0: str0, arg1: node4},
// CHECK:STDOUT:   {kind: IntegerLiteral, arg0: int0, type: node2},
// CHECK:STDOUT:   {kind: RealLiteral, type: node3},
// CHECK:STDOUT:   {kind: BinaryOperatorAdd, arg0: node6, arg1: node7, type: node1},
// CHECK:STDOUT:   {kind: IntegerLiteral, arg0: int1, type: node2},
// CHECK:STDOUT:   {kind: BinaryOperatorAdd, arg0: node8, arg1: node9, type: node1},
// CHECK:STDOUT:   {kind: ReturnExpression, arg0: node10, type: node1},
// CHECK:STDOUT:   {kind: FunctionDefinition, arg0: node4, arg1: block2},
// CHECK:STDOUT: ]
// CHECK:STDOUT: node_blocks: [
// CHECK:STDOUT:   [
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node4,
// CHECK:STDOUT:     node5,
// CHECK:STDOUT:     node12,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node6,
// CHECK:STDOUT:     node7,
// CHECK:STDOUT:     node8,
// CHECK:STDOUT:     node9,
// CHECK:STDOUT:     node10,
// CHECK:STDOUT:     node11,
// CHECK:STDOUT:   ],
// CHECK:STDOUT: ]

fn Main() {
  // The following line has two mismatches, but after the first, it shouldn't
  // keep erroring.
  // CHECK:STDERR: {{.*}}/toolchain/semantics/testdata/operators/fail_type_mismatch_once.carbon:[[@LINE+1]]:13: Type mismatch: lhs is node2, rhs is node3
  return 12 + 3.4 + 12;
}
