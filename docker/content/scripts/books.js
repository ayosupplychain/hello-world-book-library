const books = [
    {
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        thumbnail: "https://m.media-amazon.com/images/I/61z0MrB6qOS._SL1500_.jpg"
    },
    {
        title: "1984",
        author: "George Orwell",
        thumbnail: "https://m.media-amazon.com/images/I/61HkdyBpKOL._SL1200_.jpg"
    },
    {
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        thumbnail: "https://www.booktopia.com.au/covers/big/9780099419785/0000/to-kill-a-mockingbird.jpg"
    },
    // ...add 17 more books with similar structure...
];

const bookGrid = document.getElementById('book-grid');

books.forEach(book => {
    const bookCard = document.createElement('div');
    bookCard.className = 'book-card';

    bookCard.innerHTML = `
        <img src="${book.thumbnail}" alt="${book.title}">
        <h3>${book.title}</h3>
        <p>${book.author}</p>
    `;

    bookGrid.appendChild(bookCard);
});
