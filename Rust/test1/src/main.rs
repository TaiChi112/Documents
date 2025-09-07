struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> Node<T> {
    fn new(data: T) -> Node<T> {
        Node { data, next: None }
    }
}

struct Stack<T> {
    top: Option<Box<Node<T>>>,
    size: usize,
    capacity: usize,
}

impl<T> Stack<T> {
    fn new(capacity: usize) -> Stack<T> {
        Stack { top: None, size: 0, capacity }
    }

    fn is_empty(&self) -> bool {
        self.size == 0
    }

    fn is_full(&self) -> bool {
        self.size == self.capacity
    }

    fn push(&mut self, data: T) {
        if self.is_full() {
            println!("Stack is full");
            return;
        }
        let mut new_node = Box::new(Node::new(data));
        new_node.next = self.top.take();
        self.top = Some(new_node);
        self.size += 1;
    }

    fn pop(&mut self) -> Option<T> {
        if self.is_empty() {
            println!("Stack is empty");
            return None;
        }
        if let Some(mut node) = self.top.take() {
            self.top = node.next.take();
            self.size -= 1;
            Some(node.data)
        } else {
            None
        }
    }
}

fn main() {
    let mut stack = Stack::new(3);
    stack.push(10);
    stack.push(20);
    stack.push(30);

    println!("Popped: {:?}", stack.pop());
    println!("Popped: {:?}", stack.pop());
    println!("Popped: {:?}", stack.pop());
    println!("Popped: {:?}", stack.pop());
}

