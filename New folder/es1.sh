# Task 1
mkdir -p lab
mkdir -p lab/dir1
mkdir -p lab/dir2/dir3
echo "" > lab/dir2/dir3/file1.txt
echo "" > lab/file2.txt

# Task 2
mkdir -p lab/documents
echo "This is my project report." > lab/documents/report.txt
echo "This is my project summary." > lab/documents/summary.txt
echo "These are my project notes." > lab/documents/notes.txt

mkdir -p lab/images
echo "" > lab/images/image1.png
echo "" > lab/images/image2.png
echo "" > lab/images/image3.png

# Task 3
ls lab/documents/*.txt

# Task 4
cat lab/documents/summary.txt

# Task 5
wc -l lab/documents/notes.txt

# Task 6
ls lab/images | wc -l

# Task 7
cat lab/documents/report.txt lab/documents/summary.txt | wc -w

# Task 8
grep "project" lab/documents/*.txt > lab/search_results.txt

# Task 9
mv -f lab/documents/notes.txt lab/documents/todo.txt
rm -f lab/file2.txt

# Task 10
ls -R lab