include RSpec

require_relative 'min_binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

describe "#insert(data)" do
  it "inserts a new node" do
    tree.insert(root, pacific_rim)
    expect(root.parent.title).to eq "Pacific Rim"
  end

  it "inserts nodes using the proper heap format" do
    tree.insert(root, pacific_rim)
    tree.insert(root, braveheart)
    tree.insert(root, jedi)
    expect(root.left).to eq nil
    expect(root.parent.title).to eq "Star Wars: Return of the Jedi"
  end
end

describe "#find(data)" do
  it "finds a left node" do
    tree.insert(root, pacific_rim)
    tree.insert(root, braveheart)
    tree.insert(root, jedi)
    expect(tree.find(root,pacific_rim)).to eq "Pacific Rim"
  end

  it "finds a right node" do
    tree.insert(root, pacific_rim)
    tree.insert(root, braveheart)
    tree.insert(root, jedi)
    expect(tree.find(root,braveheart)).to eq "Braveheart"
  end
end

describe "#delete(data)" do
  it "properly deletes a left node and order is intact" do
    tree.insert(root, pacific_rim)
    tree.insert(root, braveheart)
    tree.insert(root, jedi)
    tree.delete(root,jedi)
    expect(tree.delete(root,jedi)).to eq "Sorry, we could not find Star Wars: Return of the Jedi"
    expect(root.parent.title).to eq "Pacific Rim"
  end

  it "properly deletes a right node and order is intact" do
    tree.insert(root, pacific_rim)
    tree.insert(root, braveheart)
    tree.insert(root, jedi)
    tree.insert(root,donnie)
    tree.insert(root,inception)
    tree.delete(root,braveheart)
    expect(tree.delete(root,braveheart)).to eq "Sorry, we could not find Braveheart"
    expect(root.parent.parent.right.title).to eq "Inception"
  end
end

describe "#print" do
   specify {
     expected_output = "Pacific Rim\nBraveheart\nStar Wars: Return of the Jedi\nThe Matrix\nDistrict 9\nStar Wars: The Empire Strikes Back\nInception\nStar Wars: A New Hope\nThe Shawshank Redemption\nThe Martian\nMad Max 2: The Road Warrior\n"
     tree.insert(root, hope)
     tree.insert(root, empire)
     tree.insert(root, jedi)
     tree.insert(root, martian)
     tree.insert(root, pacific_rim)
     tree.insert(root, inception)
     tree.insert(root, braveheart)
     tree.insert(root, shawshank)
     tree.insert(root, district)
     tree.insert(root, mad_max_2)
     expect { tree.print(root) }.to output(expected_output).to_stdout
   }
end

end
