<<<<<<< HEAD
# AI Search Algorithms

## การค้นหาแบบไม่มีข้อมูล (Uninformed Search) และ การค้นหาแบบมีข้อมูล (Informed Search)

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

# heuristic: estimated cost to goal
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

# เพิ่มเติม: Uninformed Search

# ข้อ 4 - Uniform-Cost Search (UCS)
def uniform_cost_search(start, goal):
    priority_queue = []
    heapq.heappush(priority_queue, (0, [start]))  # (cost, path)
    visited = set()

    while priority_queue:
        cost, path = heapq.heappop(priority_queue)
        node = path[-1]

        if node == goal:
            return path, cost

        if node not in visited:
            visited.add(node)
            for neighbor, edge_cost in graph_cost[node].items():
                new_cost = cost + edge_cost
                new_path = list(path)
                new_path.append(neighbor)
                heapq.heappush(priority_queue, (new_cost, new_path))

path, cost = uniform_cost_search('S', 'G')
print(f"UCS Path: {path}, Cost: {cost}")

# ข้อ 5 - Depth-Limited Search (DLS)
def depth_limited_search(start, goal, depth_limit):
    return recursive_dls(start, goal, [], set(), depth_limit)

def recursive_dls(node, goal, path, visited, limit):
    path = path + [node]
    
    if node == goal:
        return path
    
    if limit == 0:
        return None
    
    visited.add(node)
    for neighbor in graph[node]:
        if neighbor not in visited:
            result = recursive_dls(neighbor, goal, path, visited.copy(), limit - 1)
            if result is not None:
                return result
    
    return None

print("DLS Path (limit=3):", depth_limited_search('S', 'G', 3))

# ข้อ 6 - Iterative Deepening Search (IDS)
def iterative_deepening_search(start, goal, max_depth):
    for depth in range(max_depth + 1):
        result = depth_limited_search(start, goal, depth)
        if result is not None:
            return result, depth
    return None, max_depth

path, depth = iterative_deepening_search('S', 'G', 5)
print(f"IDS Path: {path}, Found at depth: {depth}")

# เพิ่มเติม: Informed Search

# ข้อ 7 - Greedy Best-First Search
def greedy_best_first_search(start, goal):
    open_set = []
    heapq.heappush(open_set, (heuristic[start], [start]))  # (heuristic, path)
    visited = set()

    while open_set:
        _, path = heapq.heappop(open_set)
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in graph_cost[node]:
                if neighbor not in visited:
                    new_path = list(path)
                    new_path.append(neighbor)
                    heapq.heappush(open_set, (heuristic[neighbor], new_path))

print("Greedy Best-First Search Path:", greedy_best_first_search('S', 'G'))
```

## โจทย์ปัญหาเมืองในประเทศไทย

การหาเส้นทางจากกรุงเทพฯ (BKK) ไปเชียงใหม่ (CNX) โดยใช้อัลกอริทึมต่างๆ

```python
# กราฟเมืองในประเทศไทย
thai_cities_graph = {
    'BKK': ['AYT', 'LOP', 'KKN'],  # กรุงเทพฯ
    'AYT': ['BKK', 'LOP'],         # อยุธยา
    'LOP': ['BKK', 'AYT', 'PHS'],  # ลพบุรี
    'PHS': ['LOP', 'KKN', 'LPG'],  # พิษณุโลก
    'LPG': ['PHS', 'CNX'],         # ลำปาง
    'KKN': ['BKK', 'PHS', 'UDN'],  # ขอนแก่น
    'UDN': ['KKN', 'CNX'],         # อุดรธานี
    'CNX': ['LPG', 'UDN']          # เชียงใหม่
}

# ระยะทางระหว่างเมือง (กิโลเมตร)
thai_cities_cost = {
    'BKK': {'AYT': 80, 'LOP': 120, 'KKN': 450},
    'AYT': {'BKK': 80, 'LOP': 60},
    'LOP': {'BKK': 120, 'AYT': 60, 'PHS': 200},
    'PHS': {'LOP': 200, 'KKN': 300, 'LPG': 150},
    'LPG': {'PHS': 150, 'CNX': 100},
    'KKN': {'BKK': 450, 'PHS': 300, 'UDN': 180},
    'UDN': {'KKN': 180, 'CNX': 400},
    'CNX': {'LPG': 100, 'UDN': 400}
}

# ค่าประมาณระยะทางถึงเชียงใหม่ (heuristic)
thai_cities_heuristic = {
    'BKK': 600,  # กรุงเทพฯ
    'AYT': 650,  # อยุธยา
    'LOP': 580,  # ลพบุรี
    'PHS': 380,  # พิษณุโลก
    'LPG': 100,  # ลำปาง
    'KKN': 520,  # ขอนแก่น
    'UDN': 400,  # อุดรธานี
    'CNX': 0     # เชียงใหม่
}

from collections import deque
import heapq

# BFS สำหรับเมืองไทย
def bfs_thai_cities(start, goal):
    visited = set()
    queue = deque([[start]])

    while queue:
        path = queue.popleft()
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in thai_cities_graph[node]:
                new_path = list(path)
                new_path.append(neighbor)
                queue.append(new_path)

# DFS สำหรับเมืองไทย
def dfs_thai_cities(start, goal):
    stack = [[start]]
    visited = set()

    while stack:
        path = stack.pop()
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in thai_cities_graph[node]:
                if neighbor not in visited:
                    new_path = list(path)
                    new_path.append(neighbor)
                    stack.append(new_path)

# UCS สำหรับเมืองไทย
def ucs_thai_cities(start, goal):
    priority_queue = [(0, [start])]  # (cost, path)
    visited = set()

    while priority_queue:
        cost, path = heapq.heappop(priority_queue)
        node = path[-1]

        if node == goal:
            return path, cost

        if node not in visited:
            visited.add(node)
            for neighbor, edge_cost in thai_cities_cost[node].items():
                if neighbor not in visited:
                    new_cost = cost + edge_cost
                    new_path = list(path)
                    new_path.append(neighbor)
                    heapq.heappush(priority_queue, (new_cost, new_path))

# Greedy Best-First Search สำหรับเมืองไทย
def greedy_thai_cities(start, goal):
    open_set = [(thai_cities_heuristic[start], [start])]  # (heuristic, path)
    visited = set()

    while open_set:
        _, path = heapq.heappop(open_set)
        node = path[-1]

        if node == goal:
            return path

        if node not in visited:
            visited.add(node)
            for neighbor in thai_cities_cost[node]:
                if neighbor not in visited:
                    new_path = list(path)
                    new_path.append(neighbor)
                    heapq.heappush(open_set, (thai_cities_heuristic[neighbor], new_path))

# A* สำหรับเมืองไทย
def astar_thai_cities(start, goal):
    open_set = []
    heapq.heappush(open_set, (thai_cities_heuristic[start], 0, [start]))  # (f, g, path)
    visited = set()

    while open_set:
        _, g, path = heapq.heappop(open_set)
        node = path[-1]

        if node == goal:
            return path, g

        if node not in visited:
            visited.add(node)
            for neighbor, cost in thai_cities_cost[node].items():
                if neighbor not in visited:
                    new_g = g + cost
                    new_f = new_g + thai_cities_heuristic[neighbor]
                    new_path = list(path)
                    new_path.append(neighbor)
                    heapq.heappush(open_set, (new_f, new_g, new_path))

# ทดสอบอัลกอริทึมต่างๆ
bfs_path = bfs_thai_cities('BKK', 'CNX')
dfs_path = dfs_thai_cities('BKK', 'CNX')
ucs_path, ucs_cost = ucs_thai_cities('BKK', 'CNX')
greedy_path = greedy_thai_cities('BKK', 'CNX')
astar_path, astar_cost = astar_thai_cities('BKK', 'CNX')

print(f"BFS Path: {bfs_path}")
print(f"DFS Path: {dfs_path}")
print(f"UCS Path: {ucs_path}, Cost: {ucs_cost}")
print(f"Greedy Path: {greedy_path}")
print(f"A* Path: {astar_path}, Cost: {astar_cost}")
```

## เปรียบเทียบอัลกอริทึม

| อัลกอริทึม | คุณสมบัติ | ข้อดี | ข้อเสีย | เหมาะสมกับ |
|-----------|---------|------|--------|-----------|
| BFS | - ตรวจสอบทุกโหนดในระดับความลึกเท่ากัน<br>- ใช้ Queue | - รับประกันเส้นทางสั้นที่สุด (จำนวนขั้นตอน)<br>- รับประกันพบเป้าหมายถ้ามี | - ใช้หน่วยความจำมาก<br>- อาจช้าเมื่อเป้าหมายอยู่ลึก | ปัญหาที่มีจำนวนขั้นตอนน้อย หรือเป้าหมายอยู่ไม่ลึก |
| DFS | - ตรวจสอบโหนดตามความลึกก่อน<br>- ใช้ Stack | - ใช้หน่วยความจำน้อย<br>- อาจพบเป้าหมายเร็วหากอยู่ลึก | - ไม่รับประกันเส้นทางสั้นที่สุด<br>- อาจติดลูปอนันต์ | ปัญหาที่มีเส้นทางหลายเส้นไปยังเป้าหมาย และต้องการค้นหาเส้นทางใดเส้นทางหนึ่ง |
| UCS | - ขยายโหนดที่มีต้นทุนน้อยที่สุด<br>- ใช้ Priority Queue | - รับประกันเส้นทางที่มีต้นทุนน้อยที่สุด<br>- รับประกันพบเป้าหมายถ้ามี | - อาจตรวจสอบเส้นทางมากเกินความจำเป็น<br>- ไม่ใช้ข้อมูลเพิ่มเติม | ปัญหาที่มีต้นทุนแตกต่างกัน และต้องการเส้นทางที่มีต้นทุนน้อยที่สุด |
| Greedy | - เลือกโหนดที่ดูเหมือนจะใกล้เป้าหมายที่สุด<br>- ใช้ Priority Queue + Heuristic | - เร็ว<br>- ใช้หน่วยความจำน้อย | - ไม่รับประกันเส้นทางที่ดีที่สุด<br>- อาจติดกับดักท้องถิ่น | ปัญหาที่ต้องการความเร็วมากกว่าความแม่นยำ |
| A* | - พิจารณาทั้งต้นทุนที่ใช้แล้วและประมาณต้นทุนที่เหลือ<br>- ใช้ Priority Queue + Heuristic | - มีประสิทธิภาพสูง<br>- รับประกันเส้นทางที่ดีที่สุด (ถ้า heuristic เหมาะสม) | - ต้องมี heuristic ที่ดี<br>- ใช้หน่วยความจำมาก | ปัญหาที่ต้องการเส้นทางที่ดีที่สุดและมี heuristic ที่เหมาะสม |
=======
# คำศัพท์สำคัญในการค้นหา (Search Algorithms)

## การแบ่งประเภทของการค้นหา

- **Uninformed Search** - การค้นหาแบบไม่มีข้อมูล คือ การค้นหาที่ไม่มีความรู้เพิ่มเติมเกี่ยวกับปัญหา นอกจากคำอธิบายปัญหาเท่านั้น
  - **BFS (Breadth-First Search)** - การค้นหาแบบกว้างก่อนลึก คือ ค้นหาทุกโหนดในระดับความลึกเดียวกันก่อนไปยังระดับถัดไป
  - **DFS (Depth-First Search)** - การค้นหาแบบลึกก่อนกว้าง คือ ค้นหาตามเส้นทางจนสุดก่อนย้อนกลับมาลองเส้นทางอื่น
  - **UCS (Uniform Cost Search)** - การค้นหาแบบต้นทุนสม่ำเสมอ คือ ค้นหาโดยขยายโหนดที่มีต้นทุนน้อยที่สุดก่อนเสมอ

- **Informed Search** - การค้นหาแบบมีข้อมูล คือ การค้นหาที่มีข้อมูลเพิ่มเติมเกี่ยวกับปัญหา ทำให้สามารถค้นหาได้อย่างมีประสิทธิภาพมากขึ้น
  - **A* Search** - อัลกอริทึม A* คือ การค้นหาที่ใช้ทั้งต้นทุนที่ใช้มาแล้วและค่าประมาณต้นทุนที่เหลือ (f = g + h)
  - **Greedy Best-First Search** - การค้นหาแบบละโมบ คือ การค้นหาที่เลือกโหนดที่คาดว่าจะใกล้เป้าหมายที่สุดก่อนเสมอ

## อัลกอริทึมการค้นหาแบบไม่มีข้อมูล (Uninformed Search Algorithms)

- **Uniform Cost Search (UCS)** - การค้นหาที่ใช้ต้นทุน (cost) ของเส้นทางเป็นเกณฑ์ในการเลือกเส้นทางที่จะขยายต่อไป
  - ใช้โครงสร้างข้อมูลแบบ priority queue ในการจัดการกับเส้นทาง
  - เหมาะสำหรับปัญหาที่มีต้นทุนแตกต่างกันในแต่ละเส้นทาง
  - มีความสมบูรณ์ (completeness) และให้ผลลัพธ์เป็นเส้นทางที่ดีที่สุด (optimal)
  - เป็นการประยุกต์ของอัลกอริทึม Dijkstra สำหรับปัญหาการค้นหาเส้นทาง

- **Depth-Limited Search (DLS)** - การค้นหาแบบจำกัดความลึก คือ DFS ที่กำหนดขีดจำกัดความลึกสูงสุด เพื่อป้องกันการค้นหาไปไม่สิ้นสุด
  
- **Iterative Deepening Search (IDS)** - การค้นหาแบบเพิ่มความลึกทีละขั้น คือ การทำ DLS โดยค่อยๆ เพิ่มขีดจำกัดความลึกทีละระดับ

- **Bidirectional Search** - การค้นหาแบบสองทิศทาง คือ การค้นหาพร้อมกันจากจุดเริ่มต้นและจุดหมาย และเชื่อมเส้นทางเมื่อพบกัน

## อัลกอริทึมการค้นหาแบบมีข้อมูล (Informed Search Algorithms)

- **Heuristic Function** - ฟังก์ชันฮิวริสติก คือ ฟังก์ชันที่ให้ค่าประมาณของต้นทุนที่น้อยที่สุดจากโหนดปัจจุบันไปยังเป้าหมาย

- **Admissible Heuristic** - ฮิวริสติกที่ยอมรับได้ คือ ฮิวริสติกที่ไม่ประมาณต้นทุนสูงเกินความเป็นจริง ทำให้ A* ให้ผลลัพธ์เป็นเส้นทางที่ดีที่สุด

- **Manhattan Distance** - ระยะแมนฮัตตัน คือ ฮิวริสติกที่คำนวณระยะทางโดยการเดินตามแกน x และแกน y (|x1-x2| + |y1-y2|)

- **Diagonal Distance** - ระยะทางแนวทแยง คือ ฮิวริสติกที่อนุญาตการเคลื่อนที่แนวทแยง โดยคำนวณจากการเคลื่อนที่แนวทแยงและแนวตรง

- **Euclidean Distance** - ระยะยูคลิด คือ ฮิวริสติกที่คำนวณระยะทางเส้นตรงระหว่างสองจุดในพื้นที่แบบยูคลิด (√((x1-x2)² + (y1-y2)²))

## คุณสมบัติและแนวคิดสำคัญ

- **Optimal Path** - เส้นทางที่ดีที่สุด คือ เส้นทางที่มีต้นทุนต่ำที่สุดจากจุดเริ่มต้นไปยังเป้าหมาย

- **Completeness** - ความสมบูรณ์ คือ คุณสมบัติของอัลกอริทึมที่รับประกันว่าจะพบเป้าหมายถ้ามีเส้นทางไปยังเป้าหมายนั้น

- **Time Complexity** - ความซับซ้อนเชิงเวลา คือ การวัดว่าอัลกอริทึมใช้เวลามากขึ้นอย่างไรเมื่อขนาดของปัญหาเพิ่มขึ้น

- **Space Complexity** - ความซับซ้อนเชิงพื้นที่ คือ การวัดว่าอัลกอริทึมใช้หน่วยความจำมากขึ้นอย่างไรเมื่อขนาดของปัญหาเพิ่มขึ้น

- **Evaluation Function (f)** - ฟังก์ชันประเมินค่า ในอัลกอริทึม A* คือ f(n) = g(n) + h(n) โดย g(n) เป็นต้นทุนที่ใช้มาแล้ว และ h(n) เป็นค่าประมาณต้นทุนที่เหลือ

![](image.png)
![](image2.png)
>>>>>>> bc1524d1b0724caff062721070ec1bf019121e4f
