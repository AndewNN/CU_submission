#ifndef __STUDENT_H_
#define __STUDENT_H_

template <typename T>
std::vector<T> CP::queue<T>::to_vector(int k) const {
    std::vector<T> res;
    // write your code only here
    //
    for (int i = 0; i < std::min(k, (int)mSize); i++)
        res.push_back(mData[(mFront + i) % mCap]);
    return res;
}

template <typename T>
CP::queue<T>::queue(iterator from, iterator to) {
    // write your code only here
    int now = 0;
    mCap = to - from;
    mData = new T[mCap];
    mSize = mCap;
    mFront = 0;
    auto it = from;
    while (it < to)
        mData[now++] = *(it++);
}

#endif
