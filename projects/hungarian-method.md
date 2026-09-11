# Hungarian Method Optimization Algorithm

**Domain:** Operations Research | Linear Programming | Algorithm Design  
**Tools & Frameworks:** Python, MATLAB, Combinatorial Optimization

---

## 1. Problem Statement
The assignment problem requires matching $n$ tasks to $n$ agents at minimal total cost. Standard brute-force enumeration ($n!$ combinations) is computationally intractable for large-scale operations.

---

## 2. Methodology & Tools Applied
* **Matrix Reduction:** Implemented row and column reduction steps to isolate zero-cost assignments.
* **Covering Lines Algorithm:** Algorithmic determination of the minimum number of lines to cover all zeros in the reduced cost matrix.
* **Matrix Adjustment & Iteration:** Dynamically updated matrix elements using the minimum uncovered value until an optimal assignment vector was found.
* **Implementation:** Built custom, fully commented scripts in Python/MATLAB without relying on external black-box solvers.

---

## 3. Code Snippet & Implementation

```python
# Hungarian Algorithm Core Logic (Matrix Reduction Step)
import numpy as np

def reduce_matrix(cost_matrix):
    # Step 1: Subtract row minima
    row_min = cost_matrix.min(axis=1, keepdims=True)
    matrix_reduced = cost_matrix - row_min
    
    # Step 2: Subtract column minima
    col_min = matrix_reduced.min(axis=0, keepdims=True)
    matrix_reduced -= col_min
    
    return matrix_reduced
```

---

## 4. Results & Performance
* **Computational Speedup:** Achieved $O(n^3)$ time complexity, outperforming brute-force search by orders of magnitude for $n > 10$.
* **Verification:** Validated outputs against benchmark linear programming solvers (SciPy `linear_sum_assignment`).

---

[← Back to Main Portfolio](../index.html)
