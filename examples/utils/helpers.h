#pragma once

/*!
 * \ingroup GUI
 *
 * Makes sure `condition` is true, otherwise crashes the application.
 *
 * This is useful when using connect(), QMetaObject::invokeMethod() and other
 * similar pieces of code which should ALWAYS return true, but if developer
 * makes a mistake they only print warnings which are easy to miss.
 *
 \verbatim
CHECK(connect(object, &Class::someSignal,
              receiver, &OtherClass:someSlot,
              Qt::QueuedConnection));

CHECK(QMetaObject::invokeMethod(
    object, "functionName",
    Qt::QueuedConnection,
    Q_ARG(QVector, something));
 \endverbatim
 *
 */
#if !defined(CHECK)
#if defined(DEBUG_BUILD)
#define CHECK(condition) if (!condition) qFatal("Check failed!")
#else
#define CHECK(condition) condition
#endif
#endif

/*!
 * \ingroup GUI
 *
 * General helper functions, not related to GUI.
 */
class Helpers
{
public:
    /*!
     * Returns true if \a index is a valid index in \a container. To be valid,
     * the index must be equal to 0 or larger, and smaller than \a container
     * size.
     */
    template<class Container>
    static bool isValidIndex(const int index, const Container &container)
    {
        return index >= 0 && index < int(container.size());
    }
};
