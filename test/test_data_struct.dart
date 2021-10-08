void main() {
  CircleLinkedList list = CircleLinkedList();
  Node node1 = Node(1);
  Node node2 = Node(2);
  Node node3 = Node(3);
  list.addNode(node1);
  list.addNode(node2);
  list.addNode(node3);
  list.printLink();
}

class Node {
  ///数据域
  int data;

  ///指针域
  Node next;

  Node(this.data);
}


///单链表
class LinkList {
  Node head;

  addNode(Node data) {
    if (head == null) {
      head = data;
      return;
    }
    Node temp = head;
    while (temp.next != null) {
      temp = temp.next;
    }
    temp.next = data;
  }

  ///插入到指定位置
  insertNodeByIndex(int index, Node newNode) {
    if (index < 0 || index > getLength()) {
      print("插入位置不合法");
    }
    if (head == null) {
      head = newNode;
      return;
    }
    int len = 0;
    Node temp = head;
    while (temp.next != null) {
      len++;
      if (len == index) {
        newNode.next = temp.next;
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }
  }

  Node removeAt(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (head == null) {
      return null;
    }
    if (index == 0) {
      //删除头结点
      head = head.next;
      return head;
    }
    Node temp = head;
    Node delNode;
    int len = 0;
    while (temp.next != null) {
      len++;
      if (len == index) {
        delNode = temp.next;
        temp.next = temp.next.next;
        break;
      }
      temp = temp.next;
    }
    return delNode;
  }

  bool remove(Node node) {
    if (node == null) {
      return false;
    }
    if (head == null) {
      return false;
    }
    if (node.data == head.data) {
      //删除头结点
      head = head.next;
      return true;
    }
    Node temp = head;
    bool isSuccess = false;
    while (temp.next != null) {
      if (temp.next.next == node.next) {
        temp.next = node.next;
        isSuccess = true;
        break;
      }
      temp = temp.next;
    }
    return isSuccess;
  }

  int getLength() {
    if (head == null) {
      return 0;
    }
    int len = 0;
    Node temp = head;
    while (temp.next != null) {
      temp = temp.next;
      len++;
    }
    return len;
  }

  ///查找元素
  Node findNodeByIndex(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (head == null) {
      return null;
    }
    Node temp = head;
    for (int i = 0; i < index; i++) {
      temp = temp.next;
    }
    return temp;
  }

  ///遍历
  void printLink() {
    Node curNode = head;
    while (curNode != null) {
      print(curNode.data);
      curNode = curNode.next;
    }
  }
}

///单向循环链表
class CircleLinkedList {
  Node header;

  CircleLinkedList() {
    if (header == null) {
      header = Node(null);
      header.next = header;
    }
  }

  void addNode(Node data) {
    // if (header.next ==header) {
    //   header.next = data;
    //   data.next = header;
    //   return;
    // }
    Node temp = header;
    while (temp.next != header) {
      temp = temp.next;
    }
    temp.next = data;
    data.next =  header;
  }

  ///插入到指定位置
  insertNodeByIndex(int index, Node newNode) {
    if (index < 0 || index > getLength()) {
      print("插入位置不合法");
    }
    if (header == null) {
      header = newNode;
      return;
    }
    int len = 0;
    Node temp = header;
    while (temp.next != header) {
      len++;
      if (len == index) {
        newNode.next = temp.next;
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }
    newNode.next =  header;
  }

  Node removeAt(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (header == null) {
      return null;
    }
    if (index == 0) {
      //删除头结点
      header = header.next;
      return header;
    }
    Node temp = header;
    Node delNode;
    int len = 0;
    while (temp.next != null) {
      len++;
      if (len == index) {
        delNode = temp.next;
        temp.next = temp.next.next;
        break;
      }
      temp = temp.next;
    }
    return delNode;
  }

  bool remove(Node node) {
    if (node == null) {
      return false;
    }
    if (header == null) {
      return false;
    }
    if (node.data == header.data) {
      //删除头结点
      header = header.next;
      return true;
    }
    Node temp = header;
    bool isSuccess = false;
    while (temp.next != null) {
      if (temp.next.next == node.next) {
        temp.next = node.next;
        isSuccess = true;
        break;
      }
      temp = temp.next;
    }
    return isSuccess;
  }

  int getLength() {
    if (header == null) {
      return 0;
    }
    int len = 0;
    Node temp = header;
    while (temp.next != header) {
      temp = temp.next;
      len++;
    }
    return len;
  }

  ///查找元素
  Node findNodeByIndex(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (header == null) {
      return null;
    }
    Node temp = header;
    for (int i = 0; i < index; i++) {
      temp = temp.next;
    }
    return temp;
  }

  ///遍历
  void printLink() {
    Node curNode = header;
    while (curNode != header) {
      print(curNode.data);
      curNode = curNode.next;
    }
  }
}

///双向节点
class DoubleNode {
  ///数据域
  int data;

  ///下一个节点
  DoubleNode next;
  ///前一个节点
  DoubleNode prev;

  DoubleNode(this.data);
}
///双向链表
class DoubleLinkList {
  DoubleNode head;
  DoubleNode tail;
  DoubleLinkList(){
    if(head==null){
      head = DoubleNode(null);
    }
  }
  addNode(DoubleNode data) {
    if (head == null) {
      head = data;
      return;
    }
    DoubleNode temp = head;
    while (temp.next != null) {
      temp = temp.next;
    }
    temp.next = data;
  }

  ///插入到指定位置
  insertNodeByIndex(int index, DoubleNode newNode) {
    if (index < 0 || index > getLength()) {
      print("插入位置不合法");
    }
    if (index == 0) {
      newNode.next = head;
      newNode.prev = null;
      head = newNode;
      return;
    }
    if(index == getLength()){
      tail.next =newNode;
      newNode.prev = tail;
      tail = newNode;
      return;
    }
    int len = 0;
    DoubleNode temp = head;
    while (temp.next != head) {
      len++;
      if (len == index) {
        newNode.prev = temp;
        newNode.next = temp.next;
        temp.next.prev = newNode;
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }
  }

  DoubleNode removeAt(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (head == null) {
      return null;
    }
    if (index == 0) {
      //删除头结点
      head = head.next;
      return head;
    }
    DoubleNode temp = head;
    DoubleNode delNode;
    int len = 0;
    while (temp.next != head) {
      len++;
      if (len == index) {
        delNode = temp.next;
        temp.next = temp.next.next;
        temp.next.next.prev = temp;
        break;
      }
      temp = temp.next;
    }
    return delNode;
  }

  bool remove(DoubleNode node) {
    if (node == null) {
      return false;
    }
    if (head == null) {
      return false;
    }
    if (node.data == head.data) {
      //删除头结点
      head = head.next;
      return true;
    }
    DoubleNode temp = head;
    bool isSuccess = false;
    while (temp.next != null) {
      if (temp.next.next == node.next) {
        temp.next = node.next;
        isSuccess = true;
        break;
      }
      temp = temp.next;
    }
    return isSuccess;
  }

  int getLength() {
    if (head == null) {
      return 0;
    }
    int len = 0;
    DoubleNode temp = head;
    while (temp.next != null) {
      temp = temp.next;
      len++;
    }
    return len;
  }

  ///查找元素
  DoubleNode findNodeByIndex(int index) {
    if (index < 0 || index > getLength()) {
      return null;
    }
    if (head == null) {
      return null;
    }
    DoubleNode temp = head;
    for (int i = 0; i < index; i++) {
      temp = temp.next;
    }
    return temp;
  }

  ///遍历
  void printLink() {
    DoubleNode curNode = head;
    while (curNode != null) {
      print(curNode.data);
      curNode = curNode.next;
    }
  }
}


///双向循环列表
class DoubleCircleLinkedList{
  DoubleNode head;
  DoubleNode tail;
  DoubleCircleLinkedList(){

  }
}