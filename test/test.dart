import 'dart:math';

void main() {
  // t5(0, 8);
  List list = [50, 3, 542, 745, 2014, 154, 63, 616];

  // List list = [53, 3, 542, 748, 14, 214, 154, 63, 616];
  // radix_sort(list,list.length);
  // print("nums:$nums");
  // bucketSort();
  // sortByHeap();

}

final List<int> nums = [3, 1, 7, 8, 4, 6, 9, 2, 5];

void t1() {
  List<int> nums = [3, 1, 7, 8, 4, 6];

  for (int i = 0; i < nums.length - 1; i++) {
    int minPos = i;
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[j] < nums[minPos]) minPos = j;
    }
    print("minPos:$minPos");
    int temp = nums[i];
    nums[i] = nums[minPos];
    nums[minPos] = temp;
  }
  print("nums:$nums");
}

void t2() {
  List<int> nums = [3, 1, 7, 8, 4, 6];

  for (int i = 0; i < nums.length - 1; i++) {
    for (int j = 0; j < nums.length - 1; j++) {
      if (nums[j + 1] < nums[j]) {
        int temp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = temp;
      }
    }
  }
  print("nums:$nums");
}

void t3() {
  List<int> nums = [3, 1, 7, 8, 4, 6];

  for (int i = 0; i < nums.length - 1; i++) {
    for (int j = i + 1; j > 0; j--) {
      if (nums[j] < nums[j - 1]) {
        int temp = nums[j];
        nums[j] = nums[j - 1];
        nums[j - 1] = temp;
      }
    }
  }
  print("nums:$nums");
}

void t4() {
  List<int> nums = [3, 1, 7, 8, 4, 6, 9, 2, 5];
  for (int gap = nums.length ~/ 2; gap > 0; gap ~/= 2) {
    print("gap:$gap");
    for (int i = gap; i < nums.length; i++) {
      for (int j = i; j - gap >= 0; j -= gap) {
        if (nums[j] < nums[j - gap]) {
          int temp = nums[j];
          nums[j] = nums[j - gap];
          nums[j - gap] = temp;
        }
      }
    }
    print("nums:$nums");
  }
  print("nums:$nums");
}

void t5(int left, int right) {
  // [3, 1, 7, 8, 4, 6,9,2,5]
  // [3, 1, 2, 8, 4, 6,9,7,5]
  // [2, 1, 3, 8, 4, 6,9,7,5]
  int i, j, t, temp;
  if (left > right) return;
  temp = nums[left];
  i = left;
  j = right;
  while (i != j) {
    while (nums[j] >= temp && i < j) j--;
    while (nums[i] <= temp && i < j) i++;
    print("nums[i]:${nums[i]} $i");
    print("nums[j]:${nums[j]} $j");
    if (i < j) {
      t = nums[i];
      nums[i] = nums[j];
      nums[j] = t;
    }
  }
  print("temp:$temp");

  nums[left] = nums[i];
  nums[i] = temp;
  t5(left, i - 1);
  t5(i + 1, right);
}

void t6() {
  List<int> nums = [3, 1, 7, 8, 4, 6, 9, 2, 5, 2, 1];

  List<int> temp = List.filled(11, 0, growable: false);
  for (int i = 0; i < nums.length; i++) {
    temp[nums[i]]++;
  }
  List<int> sortedArray = List.filled(nums.length, 0, growable: false);
  int index = 0;
  for (int j = 0; j < temp.length; j++) {
    for (int k = 0; k < temp[j]; k++) {
      sortedArray[index++] = j;
    }
  }
  print("temp:$temp");
  print("sortedArray:$sortedArray");
}

///[53, 3, 542, 748, 14, 214, 154, 63, 616];
void t7(List a, int n, int exp) {
  List output = List.filled(n, 0, growable: false);
  List buckets = List.filled(10, 0, growable: false);

  for (int i = 0; i < n; i++) {
    // print("(a[i]~/exp)%10:${(a[i]~/exp)%10}");
    buckets[(a[i] ~/ exp) % 10]++;
  }
  //[0, 0, 1, 3, 3, 0, 1, 0, 1, 0]
  for (int i = 1; i < 10; i++) {
    //这步的意思是对前面的数累加，表示当前索引的数的前面还有多少个数，例如：个数是3的有3个，前面只有1一个数
    buckets[i] = buckets[i] + buckets[i - 1];
  }
  //[0, 0, 1, 4, 7, 7, 8, 8, 9, 9]
  for (int i = n - 1; i >= 0; i--) {
    output[buckets[(a[i] ~/ exp) % 10] - 1] = a[i];
    buckets[(a[i] ~/ exp) % 10]--; //这步的作用是计数超过1的，逐步递减。例如14, 214, 154,计数是3，分别排列在7/6/5的位置
  }
  // 将排序好的数据赋值给a[]
  for (int i = 0; i < n; i++) a[i] = output[i];
  print("output:$output");
}

void radix_sort(List a, int n) {
  List list = [53, 3, 542, 748, 14, 214, 154, 63, 616];
  int max = getMax(list, list.length);
  for (int exp = 1; max ~/ exp > 0; exp *= 10) {
    print("exp:$exp");
    t7(a, n, exp);
  }
}

int getMax(List a, int n) {
  int max = a[0];
  for (int i = 1; i < n; i++) {
    if (a[i] > max) {
      max = a[i];
    }
  }
  return max;
}

void bucketSort() {
  List list = [53, 3, 42, 47, 14, 21, 34, 63, 16];
  //计算最大值与最小值
  int maxVal = list[0];
  int minVal = list[0];
  for (int i = 0; i < list.length; i++) {
    maxVal = max(maxVal, list[i]);
    minVal = min(minVal, list[i]);
  }
  //计算桶的数量
  int bucketNum = (maxVal - minVal) ~/ (list.length) + 1;
  print("bucketNum:$bucketNum");
  List<List<int>> bucketArr = List.generate(bucketNum, (_) => []);
  //将每个元素放入桶 这个是整个的重点如何将每个元素放入对应的桶当中
  for (int i = 0; i < list.length; i++) {
    int num = (list[i] - minVal) ~/ list.length;
    print("num:$num");
    bucketArr[num].add(list[i]);
  }

  //对每个桶进行排序
  for (int i = 0; i < bucketNum; i++) {
    bucketArr[i].sort();
    print(" bucketArr[i]:${bucketArr[i]}");
  }

  ///[[3], [14, 16], [21], [34], [42], [48, 53], [63]]
  print("bucketArr:$bucketArr");
  //将桶中的元素赋值到原序列
  int index = 0;
  for (int i = 0; i < bucketArr.length; i++) {
    for (int j = 0; j < bucketArr[i].length; j++) {
      list[index++] = bucketArr[i][j];
    }
  }
  print("list:$list");
}

void t8() {
  List list = [53, 3, 42, 47, 14, 21, 34, 63, 16];
  List temp = List.filled(list.length, 0, growable: false);
  sort(list, 0, list.length - 1, temp);
  print("list:$list");
}

void sort(List arr, int left, int right, List temp) {
  if (left < right) {
    int mid = (left + right) ~/ 2;
    sort(arr, left, mid, temp);
    sort(arr, mid + 1, right, temp);
    merge(arr,left,mid,right,temp);//将两个有序子数组合并操作
  }
}

void merge(List arr, int left, int mid, int right, List temp) {
  print("left:$left  mid:$mid right:$right $temp");
  int i = left; //左序列指针
  int j = mid + 1; //右序列指针
  int t = 0; //临时数组指针
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      temp[t++] = arr[i++];
    } else {
      temp[t++] = arr[j++];
    }
  }
  //如果左序列没有排完，直接添加进去
  while (i <= mid) {
    temp[t++] = arr[i++];
  }
  //如果右序列没有排完，直接添加进去
  while (j <= right) {
    temp[t++] = arr[j++];
  }
  t = 0;
  // 将合并序列复制到原始序列中
  while(left<=right){
    arr[left++] = temp[t++];
  }
}


void sortByHeap(){
  List list = [53, 3, 42, 47, 14, 21, 34, 63, 16];
  for(int i=list.length~/2-1;i>=0;i--){
    adjustHeap(list, i, list.length);
  }
  for(int j=list.length-1;j>0;j--){
    swap(list,0,j);
    adjustHeap(list, 0, j);

  }

}
swap(List list,int i,int j){
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
///调整堆
void adjustHeap(List list,int i,int len){
  int temp = list[i];
  for(int k = 2*i+1;k<len; k =k*2+1 ){

    if(k+1<len&&list[k]<list[k+1]){
      print("k:$k");
      k++;
    }
    if(list[k]>temp){
      list[i] = list[k];
      i = k;
    }
  }
   list[i] = temp;

}
