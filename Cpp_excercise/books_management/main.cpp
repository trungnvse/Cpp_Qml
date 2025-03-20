/*****************************************************************************************************************
* Include
*****************************************************************************************************************/
#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <algorithm>
#include <limits> 

/*****************************************************************************************************************
* Define
*****************************************************************************************************************/

class Book {
public:
    std::string title;
    std::string author;
    int year;

    Book(std::string t, std::string a, int y) : title(t), author(a), year(y) {}

    void display() const {
        std::cout << "Title: " << title << ", Author: " << author << ", Year: " << year << std::endl;
    }
};

class ListBooks {
private:
    std::vector<Book> books;

public:

    /* add book into list */
    void addBook(const Book& book)
    {
        books.push_back(book);
    }

    /* display list of books */
    void displayBooks() const
    {
        if (books.empty())
        {
            std::cout << "Have no book here!\n";
        } else
        {
            for (const auto& book : books)
            {
                book.display();
            }
        }
    }

    /* save list into a file */
    void saveToFile(const std::string& filename) const
    {
        std::ofstream file(filename);
        for (const auto& book : books) 
        {
            file << book.title << "," << book.author << "," << book.year << "\n";
        }
    }

    /* take list from file, and add these into object */
    void loadFromFile(const std::string& filename)
    {
        std::ifstream file(filename);
        std::string line;
        while (std::getline(file, line)) {
            size_t pos1 = line.find(',');
            size_t pos2 = line.find(',', pos1 + 1);
            std::string title = line.substr(0, pos1);
            std::string author = line.substr(pos1 + 1, pos2 - pos1 - 1);
            int year = std::stoi(line.substr(pos2 + 1));
            books.emplace_back(title, author, year);
        }
    }

    /* delete book from the list */
    void deleteBook(const std::string& title) 
    {
        auto it = std::remove_if(books.begin(), books.end(), [&title](const Book& book) {
            return book.title == title;
        });

        if (it != books.end()) {
            books.erase(it, books.end());
            std::cout << "Book deleted successfully.\n";
        } else
        {
            std::cout << "Book not found.\n";
        }
    }

    /* search book from list by it's title */
    void searchBook(const std::string& title) const
    {
        bool found = false;
        for (const auto& book : books) {
            if (book.title == title) {
                book.display();
                found = true;
            }
        }
        if (!found) {
            std::cout << "Book not found.\n";
        }
    }

    /* sort book by year */
    void sortBooksByYear()
    {
        std::sort(books.begin(), books.end(), [](const Book& a, const Book& b) {
            return a.year < b.year;
        });
        std::cout << "Books sorted by year.\n";
    }
};

/* Function to check integer, if not, have to input again */
int inputInteger(const std::string& prompt) 
{
    int value;
    while (true) {
        std::cout << prompt;
        std::cin >> value;
        if (std::cin.fail()) { 
            std::cin.clear(); 
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); 
            std::cout << "Invalid input. Please enter a number.\n";
        } else
        {
            std::cin.ignore();
            break;
        }
    }
    return value;
}

/*****************************************************************************************************************
* Code
*****************************************************************************************************************/

int main() 
{
    /* Local variable */
    ListBooks list_of_Books;
    std::string title, author;
    int year;
    int choice; /* user will choose their choice, it will match with function */

    /* Load data from a file into list of books */
    list_of_Books.loadFromFile("books.txt");

    /* Menu of program */
    do {
        std::cout << "\n"
                     "--------------Books management--------------\n"
                     "1. Add Book                                |\n"
                     "2. Display All Books                       |\n"
                     "3. Delete Book                             |\n"
                     "4. Search Book                             |\n"
                     "5. Sort Books by Year                      |\n"
                     "6. Save and Exit                           |\n"
                     "--------------------------------------------\n"
                     "Enter your choice: ";

        choice = inputInteger("");

        if (choice == 1)
        { 
            /* add book into list */
            std::cout << "Enter title: ";
            std::getline(std::cin, title);
            std::cout << "Enter author: ";
            std::getline(std::cin, author);
            year = inputInteger("Enter year: ");
            list_of_Books.addBook(Book(title, author, year));
        } else if (choice == 2)
        {
            /* display list of books */
            list_of_Books.displayBooks();
        } else if (choice == 3)
        {
            /* delete book from the list */
            std::cout << "Enter the title of the book to delete: ";
            std::getline(std::cin, title);
            list_of_Books.deleteBook(title);
        } else if (choice == 4)
        {
            /* search book from list by it's title */
            std::cout << "Enter the title of the book to search: ";
            std::getline(std::cin, title);
            list_of_Books.searchBook(title);
        } else if (choice == 5)
        {
            /* sort book by year */
            list_of_Books.sortBooksByYear();
        } else if (choice != 6)
        {
            std::cout << "Invalid choice. Please try again.\n";
        }
    } while (choice != 6);

    list_of_Books.saveToFile("books.txt"); /* save in build folder */
    return 0;
}


/*****************************************************************************************************************
* EOF
*****************************************************************************************************************/