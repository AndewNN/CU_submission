#ifndef _CP_LIST_INCLUDED_
#define _CP_LIST_INCLUDED_

#include <iostream>
#include <stdexcept>
//#pragma once

namespace CP {

template <typename T>
class list {
   protected:
    class node {
        friend class list;

       public:
        T data;
        node* prev;
        node* next;

        node() : data(T()), prev(this), next(this) {}

        node(const T& data, node* prev, node* next) : data(T(data)), prev(prev), next(next) {}
    };

    class list_iterator {
        friend class list;

       protected:
        node* ptr;

       public:
        list_iterator() : ptr(NULL) {}

        list_iterator(node* a) : ptr(a) {}

        list_iterator& operator++() {
            ptr = ptr->next;
            return (*this);
        }

        list_iterator& operator--() {
            ptr = ptr->prev;
            return (*this);
        }

        list_iterator operator++(int) {
            list_iterator tmp(*this);
            operator++();
            return tmp;
        }
        list_iterator operator--(int) {
            list_iterator tmp(*this);
            operator--();
            return tmp;
        }

        T& operator*() { return ptr->data; }
        T* operator->() { return &(ptr->data); }
        bool operator==(const list_iterator& other) { return other.ptr == ptr; }
        bool operator!=(const list_iterator& other) { return other.ptr != ptr; }
    };

   public:
    typedef list_iterator iterator;

   protected:
    node* mHeader;  // pointer to a header node
    size_t mSize;
    bool mCheck;  // for quiz

   public:
    //-------------- constructor & copy operator ----------

    // copy constructor
    list(list<T>& a) : mHeader(new node()), mSize(0) {
        for (iterator it = a.begin(); it != a.end(); it++) {
            push_back(*it);
        }
        mCheck = true;
    }

    // default constructor
    list() : mHeader(new node()), mSize(0) { mCheck = true; }

    // copy assignment operator using copy-and-swap idiom
    list<T>& operator=(list<T> other) {
        // other is copy-constructed which will be destruct at the end of this scope
        // we swap the content of this class to the other class and let it be descructed
        using std::swap;
        swap(this->mHeader, other.mHeader);
        swap(this->mSize, other.mSize);
        return *this;
    }

    ~list() {
        clear();
        delete mHeader;
    }

    //------------- capacity function -------------------
    bool empty() const {
        return mSize == 0;
    }

    size_t size() const {
        return mSize;
    }

    //----------------- iterator ---------------
    iterator begin() {
        return iterator(mHeader->next);
    }

    iterator end() {
        return iterator(mHeader);
    }
    //----------------- access -----------------
    T& front() { return mHeader->next->data; }

    T& back() { return mHeader->prev->data; }

    //----------------- modifier -------------
    void push_back(const T& element) {
        insert(end(), element);
    }

    void push_front(const T& element) {
        insert(begin(), element);
    }

    void pop_back() {
        erase(iterator(mHeader->prev));
    }

    void pop_front() {
        erase(begin());
    }

    iterator insert(iterator it, const T& element) {
        node* n = new node(element, it.ptr->prev, it.ptr);
        it.ptr->prev->next = n;
        it.ptr->prev = n;
        mSize++;
        return iterator(n);
    }

    iterator erase(iterator it) {
        if (mCheck) std::cout << "WRONG FUNCTION CALL" << std::endl;
        iterator tmp(it.ptr->next);
        it.ptr->prev->next = it.ptr->next;
        it.ptr->next->prev = it.ptr->prev;
        delete it.ptr;
        mSize--;
        return tmp;
    }

    void clear() {
        mCheck = false;
        while (mSize > 0) erase(begin());
    }

    void check() {
        node* p;
        int n;
        p = mHeader;
        n = mSize + 1;
        while (n--) p = p->next;
        if (p != mHeader) {
            std::cout << "next POINTER ERROR" << std::endl;
        }
        p = mHeader;
        n = mSize + 1;
        while (n--) p = p->prev;
        if (p != mHeader) {
            std::cout << "prev POINTER ERROR" << std::endl;
        }
    }

    void print() {
        std::cout << "[ ";
        for (iterator it = begin(); it != end(); it++) {
            std::cout << *it << " ";
        }
        std::cout << "]" << std::endl;
    }
    void printb() {
        iterator before;
        std::cout << "[ ";
        iterator it = begin();
        it--;
        it--;
        for (; it != begin(); it--) {
            std::cout << *it << " ";
        }
        std::cout << *it << " ";
        std::cout << "]" << std::endl;
    }

#include "shift.h"
};

}  // namespace CP

#endif
