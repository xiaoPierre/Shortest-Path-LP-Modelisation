def read_graph(filename):
    graph = {}
    with open(filename, 'r') as graphFile:
        (nbVertex, nbEdge) = graphFile.readline().rstrip().split(' ')
        for line in graphFile.readlines():
            (inVertex, outVertex, weight) = line.rstrip().split(' ')
            if inVertex in graph:
                graph[inVertex].append((outVertex, float(weight)))
            else:
                graph[inVertex] = [(outVertex, float(weight))]
    return graph


def shortest_path(graph, source, dest):
    """
    Generate lp file for shortest path problem
    concatenation of strings by building a list of strings, then join it (''.join(str_list))
    :param graph:
    :param source:
    :param dest:
    :return:
    """
    str_list = []
    description = r"\Shortest path problem from " + str(source) + " to " + str(dest) + '\n'
    str_list.append(description)

    # Objective function
    objectiveHeader = "Minimize\n\n\tobj: "
    objectifExpressionList = []
    for vertex in graph:
        for edge in graph[vertex]:
            objectifExpressionList.append(str(edge[1]) + " X_" + str(vertex) + str(edge[0]) + " + ")

    objectifExpression = ''.join(objectifExpressionList)[:-3] + '\n\n'
    str_list.append(objectiveHeader)
    str_list.append(objectifExpression)

    # *************  restrictions  ***************

    restrictionHeader = "Subject To\n\n"
    str_list.append(restrictionHeader)

    # ***** 1st restriction: conservation of flow between the source and the destination
    comment1 = r"\\\\_Conservation of flow between the source and the destination" + '\n'

    # for source
    outFlowRestriction = "\t_OutFlow_" + str(source) + "  : "
    for edge in graph[source]:
        outFlowRestriction += "X_" + str(source) + str(edge[0]) + " + "
    outFlowRestriction = outFlowRestriction[:-3] + " = 1\n"

    # for destination
    # less efficient, can be resolve by inverse indexing (two dictionary)
    inFlowRestriction = "\t_InFlow_" + str(source) + "  : "
    for vertex in graph:
        for edge in graph[vertex]:
            if edge[0] == dest:
                inFlowRestriction += "X_" + str(vertex) + str(dest) + " + "
    inFlowRestriction = inFlowRestriction[:-3] + " = 1\n"

    str_list.append(comment1)
    str_list.append(outFlowRestriction)
    str_list.append(inFlowRestriction)

    # ***** 2nd restriction: conservation of flow for every OTHER vertex
    comment2 = r"\\\\_Conservation of flow for every other vertex" + '\n'
    conservationFlowList = []
    for vertex in graph:
        if vertex == source or vertex == dest:
            continue
        conserv = "\t_Conserv_" + str(vertex) + "\t: "
        for edge in graph[vertex]:
            conserv += "X_" + str(vertex) + str(edge[0]) + " + "
        conserv = conserv[:-3]
        for otherVertex in graph:
            for edge in graph[otherVertex]:
                if edge[0] == vertex:
                    conserv += " - X_" + str(otherVertex) + str(edge[0])
        conserv += " = 0\n"
        conservationFlowList.append(conserv)
    conservationFlow = ''.join(conservationFlowList)
    str_list.append(comment2)
    str_list.append(conservationFlow)

    # Bounds of variables
    boundHeader = "Bounds\n"
    boundsList = []
    for vertex in graph:
        for edge in graph[vertex]:
            bound = "\t0 <= X_" + str(vertex) + str(edge[0]) + " <= 1\n"
            boundsList.append(bound)
    bounds = ''.join(boundsList)
    str_list.append(boundHeader)
    str_list.append(bounds)

    # Declaration of variables
    declarationHeader = "Binaries\n\t"
    varList = []
    for vertex in graph:
        for edge in graph[vertex]:
            var = "X_" + str(vertex) + str(edge[0]) + " "
            varList.append(var)
    vars = ''.join(varList) + '\n'
    str_list.append(declarationHeader)
    str_list.append(vars)

    str_list.append("End")

    with open("shortest_path_" + str(source) + str(dest) + ".lp", 'w') as lpFile:
        lpFile.write(''.join(str_list))


def couverture(graph, source, dest):
    """
    Generate lp file covering problem
    concatenation of strings by building a list of strings, then join it (''.join(str_list))
    :param graph:
    :param source:
    :param dest:
    :return:
    """
    str_list = []
    description = r"\Covering problem from " + str(source) + " to " + str(dest) + '\n'
    str_list.append(description)

    # Objective function
    objectiveHeader = "Minimize\n\n\tobj: "
    objectifExpressionList = []
    for vertex in graph:
        for edge in graph[vertex]:
            objectifExpressionList.append(str(edge[1]) + " X_" + str(vertex) + str(edge[0]) + " + ")

    objectifExpression = ''.join(objectifExpressionList)[:-3] + '\n\n'
    str_list.append(objectiveHeader)
    str_list.append(objectifExpression)

    # *************  restrictions  ***************

    restrictionHeader = "Subject To\n\n"
    str_list.append(restrictionHeader)

    # definition of sum the dates of visit
    sumT = "_SommeT : "
    for vertex in graph:
        sumT += "T_" + str(vertex) + " + "
    sumT = sumT[:-3] + ' - sumT = 0\n'
    str_list.append(sumT)

    # ***** 1st restriction: conservation of flow between the source and the destination
    comment1 = r"\\\\_Conservation of flow between the source and the destination" + '\n'

    # for source
    outFlowRestriction = "\t_OutFlow_" + str(source) + "  : "
    for edge in graph[source]:
        outFlowRestriction += "X_" + str(source) + str(edge[0]) + " + "
    outFlowRestriction = outFlowRestriction[:-3] + " - NB_FLOW = 0\n"

    # for destination
    # less efficient, can be resolve by inverse indexing (two dictionary)
    inFlowRestriction = "\t_InFlow_" + str(source) + "  : "
    for vertex in graph:
        for edge in graph[vertex]:
            if edge[0] == dest:
                inFlowRestriction += "X_" + str(vertex) + str(dest) + " + "
    inFlowRestriction = inFlowRestriction[:-3] + " - NB_FLOW = 0\n"

    str_list.append(comment1)
    str_list.append(outFlowRestriction)
    str_list.append(inFlowRestriction)

    # ***** 2nd restriction: conservation of flow for every OTHER vertex
    comment2 = r"\\\\_Conservation of flow for every other vertex" + '\n'
    conservationFlowList = []
    for vertex in graph:
        if vertex == source or vertex == dest:
            continue
        conserv = "\t_Conserv_" + str(vertex) + "\t: "
        for edge in graph[vertex]:
            conserv += "X_" + str(vertex) + str(edge[0]) + " + "
        conserv = conserv[:-3]
        for otherVertex in graph:
            for edge in graph[otherVertex]:
                if edge[0] == vertex:
                    conserv += " - X_" + str(otherVertex) + str(edge[0])
        conserv += " = 0\n"
        conservationFlowList.append(conserv)
    conservationFlow = ''.join(conservationFlowList)
    str_list.append(comment2)
    str_list.append(conservationFlow)

    # ***** 3rd restriction: covering every vertex
    comment3 = r"\\\\_Covering vertex" + '\n'
    coveringList = []
    for vertex in graph:
        if vertex == source or vertex == dest:
            continue
        covering = "\t_Covering_" + str(vertex) + "\t: "
        for otherVertex in graph:
            for edge in graph[otherVertex]:
                if edge[0] == vertex:
                    covering += "X_" + str(otherVertex) + str(vertex) + " + "
        covering = covering[:-3] + " >= 1\n"
        coveringList.append(covering)
    coverings = ''.join(coveringList)
    str_list.append(comment3)
    str_list.append(coverings)

    # 4th restriction: date of visit (time window)
    BIGNUMBER = 1234
    comment4 = r"\\\\_Date of visit" + '\n'
    # origin
    dateVisitList = ['\tVisit_' + str(source) + " : T_" + str(source) + " = 0\n"]
    for vertex in graph:
        if vertex == source:
            continue
        dateVisit = ""
        for otherVertex in graph:
            for edge in graph[otherVertex]:
                if edge[0] == vertex:
                    dateVisit += "\tVisit_" + str(vertex) + "_by_"
                    dateVisit += str(otherVertex) + " : T_" + str(otherVertex) + " - T_" \
                                 + str(vertex) + " + " + str(BIGNUMBER) + " X_" + str(otherVertex) \
                                 + str(vertex) + " <= " + str(BIGNUMBER - edge[1]) + '\n'
        dateVisitList.append(dateVisit)
    dateVisits = ''.join(dateVisitList)
    str_list.append(comment4)
    str_list.append(dateVisits)

    # Bounds of variables
    boundHeader = "Bounds\n"
    boundsList = []
    for vertex in graph:
        for edge in graph[vertex]:
            bound = "\t0 <= X_" + str(vertex) + str(edge[0]) + " <= 1\n"
            boundsList.append(bound)
    bounds = ''.join(boundsList)
    str_list.append(boundHeader)
    str_list.append(bounds)

    # Declaration of variables
    declarationHeader = "Binaries\n\t"
    varList = []
    for vertex in graph:
        for edge in graph[vertex]:
            var = "X_" + str(vertex) + str(edge[0]) + " "
            varList.append(var)
    vars = ''.join(varList) + '\n'
    str_list.append(declarationHeader)
    str_list.append(vars)

    str_list.append("End")

    with open("covering_" + str(source) + str(dest) + ".lp", 'w') as lpFile:
        lpFile.write(''.join(str_list))


if __name__ == '__main__':
    graph = read_graph('graph1.graph')
    print(graph)
    couverture(graph, 'A', 'J')
