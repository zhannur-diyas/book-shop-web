package kz.epam.zd.service;

import kz.epam.zd.dao.BookDao;
import kz.epam.zd.dao.DaoFactory;
import kz.epam.zd.exception.DaoException;
import kz.epam.zd.exception.ServiceException;
import kz.epam.zd.model.Book;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import static kz.epam.zd.util.ConstantHolder.DEFAULT_PAGE_COUNT;

public class BookService extends AbstractService {
    private static final Logger log = LoggerFactory.getLogger(BookService.class);

    private static final String GET_BOOKS_AMOUNT = "get.books.amount";
    private static final String GET_BOOKS_ALL_ACTIVE = "get.books.all";
    private static final String GET_BOOKS_BY_TITLE = "get.books.by.title";
    private static final String GET_BOOK_BY_ID = "get.book.by.id";
    private static final String UPDATE_BOOK = "update.book";
    private static final String INSERT_BOOK = "insert.book";
    private static final String PERCENT_SIGN = "%";

    private List<Book> getBooksByQuery(Book book, String query) throws ServiceException {
        List<Book> bookList;
        try (DaoFactory daoFactory = DaoFactory.createJdbcDaoFactory()) {
            BookDao bookDao = daoFactory.getBookDao();
            bookList = bookDao.getAllByParameters(book, parameters, query);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
        return bookList;
    }

    public List<Book> getBooksAll(int pageNumber) throws ServiceException {
        int offset = --pageNumber * DEFAULT_PAGE_COUNT;
        parameters.add(offset);
        return getBooksByQuery(new Book(), GET_BOOKS_ALL_ACTIVE);
    }

    public int getTotalBookAmount() throws ServiceException {
        List<Book> books = getBooksByQuery(new Book(), GET_BOOKS_AMOUNT);
        return books.size();
    }

    public List<Book> getBooksByTitle( String title) throws ServiceException {
        parameters.add(PERCENT_SIGN + title + PERCENT_SIGN);
        return getBooksByQuery(new Book(), GET_BOOKS_BY_TITLE);
    }

    public Book getBookById(int id) throws ServiceException {
        parameters.add(id);
        return getBooksByQuery(new Book(), GET_BOOK_BY_ID).get(0);
    }

    public void updateBook(Book book) throws ServiceException{
        parameters.add(book.getTitle());
        parameters.add(book.getAuthor());
        parameters.add(book.getPrice());
        parameters.add(book.getIsbn());
        parameters.add(book.getDescription());
        parameters.add(book.getQuantity());
        parameters.add(book.getId());

        try (DaoFactory daoFactory = DaoFactory.createJdbcDaoFactory()) {
            BookDao bookDao = daoFactory.getBookDao();
            bookDao.update(book, parameters, UPDATE_BOOK);
        } catch (DaoException e) {
            log.debug("Error in OrderService occurred: " + e.getMessage());
            throw new ServiceException(e);
        }
    }

    public Book insertBook(Book book) throws ServiceException{
        parameters.add(book.getTitle());
        parameters.add(book.getAuthor());
        parameters.add(book.getPrice());
        parameters.add(book.getIsbn());
        parameters.add(book.getDescription());
        parameters.add(book.getQuantity());

        Book resultBook;
        try (DaoFactory daoFactory = DaoFactory.createJdbcDaoFactory()) {
            BookDao bookDao = daoFactory.getBookDao();
            resultBook = bookDao.insert(book, parameters, INSERT_BOOK);
        } catch (DaoException e) {
            log.debug("Error in OrderService occurred: " + e.getMessage());
            throw new ServiceException(e);
        }
        return resultBook;
    }
}
