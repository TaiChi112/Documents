```mermaid
graph LR
    %% L2: { a^i b^j | i>j, i,j>0 } (accept-only)
    q0((q0))
    q1s((q1s))   
    %% ensure at least one pair exists
    q1((q1))
    q2((q2))
    q3((q3))
    q4((q4))
    q5((q5))
    qh((qh))
    q0 -->|□→□,R| q1s
    q1s -->|a→□,R| q2
    q1s -->|b→b,S| q1s
    q1s -->|□→□,S| q1s
    q1  -->|a→□,R| q2
    q1  -->|b→b,S| q1
    q1  -->|□→□,S| q1       
    %% no accept here; i=j case should not accept
    q2  -->|a→a,R| q2
    q2  -->|b→b,R| q3
    q2  -->|□→□,S| qh       
    %% an 'a' without a matching 'b' -> i>j
    q3  -->|b→b,R| q3
    q3  -->|□→□,L| q4
    q4  -->|b→□,L| q5
    q5  -->|a→a,L| q5
    q5  -->|b→b,L| q5
    q5  -->|□→□,R| q1
```