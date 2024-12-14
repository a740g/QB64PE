//-----------------------------------------------------------------------------------------------------
//  QB64-PE Compression Library
//  Powered by miniz (https://github.com/richgel999/miniz)
//-----------------------------------------------------------------------------------------------------

#include "compression.h"
#include "libqb-common.h"
#include "miniz.h"
#include "qbs.h"
#include <vector>

/// @brief Compresses a string using the DEFLATE algorithm.
/// @param text The qbs object containing the string to be compressed.
/// @return A new qbs object containing the compressed data.
qbs *func__deflate(qbs *text) {
    auto fileSize = uLongf(text->len);
    auto compSize = compressBound(fileSize);
    auto dest = qbs_new(compSize, 1);                    // compressing directly to the qbs gives us a performance boost
    compress(dest->chr, &compSize, text->chr, fileSize); // discard result because we do not do any error checking
    return qbs_left(dest, compSize);                     // resize the qbs to the actual compressed size
}

/// @brief Decompresses a string using the INFLATE algorithm.
/// @param text The qbs object containing the compressed data.
/// @param originalSize The expected original size of the uncompressed data.
/// @param passed Flag indicating if the originalSize should be used directly.
/// @return A new qbs object containing the uncompressed data.
qbs *func__inflate(qbs *text, int64_t originalSize, int32_t passed) {
    if (passed) {
        // Passing negative values can do bad things to qbs
        if (originalSize > 0) {
            auto uncompSize = uLongf(originalSize);
            auto dest = qbs_new(uncompSize, 1);                               // decompressing directly to the qbs gives us a performance boost
            uncompress(dest->chr, &uncompSize, text->chr, uLongf(text->len)); // discard result because we do not do any error checking
            return dest;                                                      // no size adjustment is done assuming the exact original size was passed
        } else {
            return qbs_new(0, 1); // simply return an empty qbs if originalSize is zero or negative
        }
    } else {
        static const uLongf InflateChunkSize = 10 * 1024 * 1024;
        std::vector<Byte> dest; // to get rid of malloc() and free()
        auto compSize = uLongf(text->len);
        uLongf uncompSize = 0;
        do {
            uncompSize += InflateChunkSize; // 10 mb original buffer, resized by 10 mb each pass until it's large enough to hold the uncompressed data.
            dest.resize(uncompSize);
        } while (uncompress(&dest[0], &uncompSize, text->chr, compSize) == Z_BUF_ERROR); // and try again with a larger buffer
        auto ret = qbs_new(uncompSize, 1);
        memcpy(ret->chr, &dest[0], uncompSize);
        return ret;
    }
}
