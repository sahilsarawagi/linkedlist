class Node
  def initialize 
    @value = nil
    @node = nil
  end
  def value=(value)
    @value = value
  end
  def get_value
    @value
  end
  def next_node=(node)
    @node = node
  end
  def get_next_node
    @node
  end
end

class LinkedList

  def initialize
    @head = Node.new
    @tail = @head
  end

  def append(value)
    if @head.get_value==nil
      @head.value= value
    else
      node = Node.new
      node.value= value
      @tail.next_node=node
      @tail = node
    end
  end

  def prepend(value)
    if @head.get_value==nil
      append(value)
    else
      node = Node.new
      node.value= value
      node.next_node= @head
      @head = node
    end
  end

  def size
    count =0
    node = @head
    while node!=nil
      node=node.get_next_node
      count+=1
    end
   count  
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    node = @head
    while index>0
      node = node.get_next_node
      index-=1
    end
    node
  end

  def pop
    if @head.get_value==nil
      puts "List has no element to delete"
    elsif @head == @tail
      @head.value =nil
    else
      node = @head
      while node.get_next_node!=@tail
        node = node.get_next_node
      end
      @tail = node
    end
  end

  def contains?(value)
    node =@head
    while node!= nil
      if node.get_value==value
        return true
      end
      node= node.get_next_node
    end
    false
  end

  def find(value)
    index =0 
    node =@head
    while node!= nil
      if node.get_value==value
        return index
      end
      index+=1
      node= node.get_next_node
    end
    nil
  end

  def insert_at(value,index)
    node = @head
    if index==0
      prepend(value)
    elsif index== self.size
      append(value)
    else
      while index>1
        node= node.get_next_node
        index-=1
      end
      inserted_node = Node.new
      inserted_node.value=value
      inserted_node.next_node= node.get_next_node
      node.next_node =inserted_node
    end
    
  end

  def remove_at(index)
    node = @head
    if index==0
      @head = @head.get_next_node
    elsif index== self.size-1
      while index>1
        node= node.get_next_node
        index-=1
      end
      @tail=node
      @tail.next_node=nil
    else
      while index>1
        node= node.get_next_node
        index-=1
      end
      node.next_node= node.get_next_node.get_next_node
    end
    
  end

  def to_s
    return 'nil' if @head.nil?
    result=""
    node = @head
    while node!=nil
      result += "#{node.get_value}->"
      node =node.get_next_node
    end
    result + "nil"
  end
end


li = LinkedList.new
li.append(5)
li.append(6)
li.append(5)
li.append(6)
p li.to_s

li.prepend(2)

p li.to_s
# li.pop


p li.at(1).get_value
p li.find(5)
p li.size
p li.head.get_value
p li.tail.get_value
p li.contains?(7)
p li.contains?(5)
p li.to_s
li.insert_at(9,2)
p li.to_s
li.remove_at(1)
p li.to_s
