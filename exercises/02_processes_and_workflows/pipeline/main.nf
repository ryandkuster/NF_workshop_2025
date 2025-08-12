nextflow.enable.dsl=2

process WRITE_ODD {

    input:
        val x

    output:
        path "*txt"

    script:
        """
        echo ${x} > ${x}.txt
        """
}


workflow {
    ch_odd = Channel.of(1, 3, 5, 7)
    ch_even = Channel.of(2, 4, 6, 8)

    WRITE_ODD(ch_odd)

    /*
    goals:
        1. create a process called WRITE_EVEN that takes the queue channel
           "ch_even" as input
        2. see what happens if you re-use WRITE_ODD a second time with
           "ch_even" as input
        3. use the "view" operator to see the output of WRITE_ODD
    */
}
