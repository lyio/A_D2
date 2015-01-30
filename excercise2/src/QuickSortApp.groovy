def file = { new File(it) }

def threeWayMedianIndex(list, l, r) {
    if (list != null && list.size() > r) {
        firstIndex = l
        lastIndex = r
        middleIndex = (int) ((l + r) / 2)

        first = list[firstIndex]
        middle = list[middleIndex]
        last = list[lastIndex]

        if ((middle >= first && middle <= last) || (middle <= first && middle >= last)) return middleIndex
        if (first >= middle && first <= last) return firstIndex
        else return lastIndex
    }
}

def listDivide(List list, range) {
    pivotIndex = threeWayMedianIndex(list, range[0], range[1])
    pivot = list[pivotIndex]

    last = range[1]
    first = range[0]
    while (first < last) {
        while (first < range[1] && list[first] <= pivot) first++
        while (last > range[0] && list[last] > pivot) last--
        if (first < last) swapElements(list, first, last)
    }
    swapElements(list, first - 1, pivotIndex)
    return [list, first - 1]
}

def select(list, r, index) {
    if (r[0] == r[1]) return (r[0] == index) ? list[index] : null
    p = listDivide(list, r)[1]
    println "left side: " + list.subList(r[0], p) + " right side: " + list.subList(p, r[1])
    if (p > index) select(list, [r[0], p], index)
    else if (p < index) select(list, [p, r[1]], index)
    else list[p]
}

def quickSelect(list, index) {
    if (list.size() <= index) return null
    else return select(list, [0, list.size() - 1], index)
}

def swapElements(list, i, j) {
    temp = list[i]
    list[i] = list[j]
    list[j] = temp
    list
}

values = []
file("C:\\Users\\Thomas\\Google Drive\\BA\\3. Semester\\A&D\\Übungen\\Daten_Ü2_A1.txt").eachLine {
    values.add(it.toInteger())
}

println ("Quick select: " + quickSelect(values, 8))

values = []
file("C:\\Users\\Thomas\\Google Drive\\BA\\3. Semester\\A&D\\Übungen\\Daten_Ü2_A1.txt").eachLine {
    values.add(it.toInteger())
}

println("Library sort: " + values.sort()[8])
