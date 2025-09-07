```python
from collections import deque, defaultdict

# ข้อ 1
graph = {
    'S': ['A', 'D'],
    'A': ['B'],
    'B': ['C', 'G'],
    'C': ['G'],
    'D': ['G'],
    'G': []
}

def bfs(start, goal):
    visited = set()
    queue = deque([[start]])

    while queue:
        path = queue.popleft()
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in graph[node]:
                new_path = list(path)
                new_path.append(neighbor)
                queue.append(new_path)

print("BFS Path:", bfs('S', 'G'))
chat gpt man

# ข้อ 2
def dfs(start, goal):
    stack = [[start]]
    visited = set()

    while stack:
        path = stack.pop()
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in reversed(graph[node]):  # reversed for consistency with normal DFS
                new_path = list(path)
                new_path.append(neighbor)
                stack.append(new_path)

print("DFS Path:", dfs('S', 'G'))
# ข้อ 3
import heapq

graph_cost = {
    'S': {'A': 1, 'D': 5},
    'A': {'B': 3},
    'B': {'C': 1, 'G': 1},
    'C': {'G': 1},
    'D': {'G': 1},
    'G': {}
}

heuristic: estimated cost to goal
heuristic = {
    'S': 5,
    'A': 4,
    'B': 2,
    'C': 1,
    'D': 3,
    'G': 0
}

def a_star(start, goal):
    open_set = []
    heapq.heappush(open_set, (0 + heuristic[start], 0, [start]))

    while open_set:
        est_total_cost, cost_so_far, path = heapq.heappop(open_set)
        node = path[-1]

        if node == goal:
            return path

        for neighbor in graph_cost[node]:
            new_cost = cost_so_far + graph_cost[node][neighbor]
            est = new_cost + heuristic[neighbor]
            new_path = list(path)
            new_path.append(neighbor)
            heapq.heappush(open_set, (est, new_cost, new_path))

print("A* Path:", a_star('S', 'G'))
```