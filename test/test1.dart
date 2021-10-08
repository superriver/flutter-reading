// void main() {
//   DoubleLinkList list = DoubleLinkList();
//   DoubleNode node1 = DoubleNode(1);
//   DoubleNode node2 = DoubleNode(2);
//   DoubleNode node3 = DoubleNode(3);
//   DoubleNode node4 = DoubleNode(4);
//   // list.insertNodeByIndex(1, node1);
//   list.addNode(node1);
//   list.addNode(node2);
//   list.addNode(node3);
//   list.insertNodeByIndex(1, node4);
//   print("遍历数据");
//   list.printLink();
// }
//
// ///双向节点
// class DoubleNode {
//   ///数据域
//   int data;
//
//   ///下一个节点
//   DoubleNode next;
//
//   ///前一个节点
//   DoubleNode prev;
//
//   DoubleNode(this.data);
// }
//
// ///双向循环列表
// class DoubleLinkList {
//   DoubleNode head;
//
//   // DoubleNode tail;
//
//   addNode(DoubleNode data) {
//     if (head == null) {
//       head = data;
//       head.prev = null;
//       head.next = null;
//       return;
//     }
//     DoubleNode temp = head;
//     while (temp.next != null) {
//       temp = temp.next;
//     }
//     temp.next = data;
//     data.prev = temp;
//   }
//
//   addFirst(DoubleNode data) {
//     if (!isEmpty()) {
//       head.prev = data;
//     }
//     data.next = head;
//     head = data;
//   }
//
//   addLast(DoubleNode data) {
//     if (head == null) {
//       head = data;
//       head.prev = null;
//       head.next = null;
//       // tail = head;
//       return;
//     }
//   }
//
//   bool isEmpty() {
//     return getLength() == 0;
//   }
//
//   ///插入到指定位置
//   insertNodeByIndex(int index, DoubleNode newNode) {
//     if (index < 0 || index > getLength()) {
//       print("插入位置不合法");
//     }
//     if (getLength() == 0) {
//       head = newNode;
//       head.next = null;
//       head.prev = null;
//       return;
//     }
//
//     ///插入第一个位置
//     if(index==0){
//       newNode.next = head.next;
//       head.next = newNode;
//       newNode.next.prev = newNode;
//
//     }
//     if (index == getLength()) {
//       // tail.next = newNode;
//       // newNode.prev = tail;
//       // tail = newNode;
//       return;
//     }
//     int len = 0;
//     DoubleNode temp = head;
//     for(int i=0;temp.next!=null&&i<index;i++){
//       temp = temp.next;
//     }
//
//     // while (temp.next != null) {
//     //   len++;
//     //   if (len == index) {
//     //     newNode.prev = temp;
//     //     newNode.next = temp.next;
//     //     temp.next.prev = newNode;
//     //     temp.next = newNode;
//     //     break;
//     //   }
//     //   temp = temp.next;
//     // }
//   }
//
//   DoubleNode removeAt(int index) {
//     if (index < 0 || index > getLength()) {
//       return null;
//     }
//     if (head == null) {
//       return null;
//     }
//     if (index == 0) {
//       if (getLength() == 0) {
//         //删除头结点
//         head = null;
//       } else {
//         //删除第一结点
//         head.next = null;
//         head.next.prev = null;
//       }
//
//       return head;
//     }
//     if (index == getLength() - 1) {}
//     DoubleNode temp = head;
//     DoubleNode delNode;
//     int len = 0;
//     while (temp.next != null) {
//       len++;
//       if (len == index) {
//         delNode = temp.next;
//         temp.next = temp.next.next;
//         temp.next.next.prev = temp;
//         break;
//       }
//       temp = temp.next;
//     }
//     return delNode;
//   }
//
//   bool remove(DoubleNode node) {
//     if (node == null) {
//       return false;
//     }
//     if (head == null) {
//       return false;
//     }
//     if (node.data == head.data) {
//       //删除头结点
//       head = head.next;
//       return true;
//     }
//     DoubleNode temp = head;
//     bool isSuccess = false;
//     while (temp.next != null) {
//       if (temp.next.next == node.next) {
//         temp.next = node.next;
//         isSuccess = true;
//         break;
//       }
//       temp = temp.next;
//     }
//     return isSuccess;
//   }
//
//   int getLength() {
//     if (head == null) {
//       return 0;
//     }
//     int len = 0;
//     DoubleNode temp = head;
//     while (temp.next != null) {
//       temp = temp.next;
//       len++;
//     }
//     return len;
//   }
//
//   ///查找元素
//   DoubleNode findNodeByIndex(int index) {
//     if (index < 0 || index > getLength()) {
//       return null;
//     }
//     if (head == null) {
//       return null;
//     }
//     DoubleNode temp = head;
//     for (int i = 0; i < index; i++) {
//       temp = temp.next;
//     }
//     return temp;
//   }
//
//   ///遍历
//   void printLink() {
//     DoubleNode curNode = head;
//     while (curNode != null) {
//       print(curNode.data);
//       curNode = curNode.next;
//     }
//   }
// }
//
//
// ///单向循环链表
// class SingleLinkList{
//
// }
//
// ///静态链表
// class StaticNode {
//   int data;
//   int next; //指向下个元素的下标
// }
//
// class StaticLinkList {}
