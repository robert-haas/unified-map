.. _cluster-setup:

*************
Cluster setup
*************

Distributed computing is a wide topic with inconsistent terminology. To reduce complexity,
this package currently sticks to third-party libraries which basically follow a
**master-slave paradigm**, or in less problematic terms, a **scheduler-worker paradigm**.
For more nuances see
`Dask <https://distributed.readthedocs.io/en/latest/#architecture>`_
and `Apache Spark <https://spark.apache.org/docs/latest/cluster-overview.html>`_.

.. image:: ../../images/cluster_architecture.svg
   :width: 40%
   :alt: Cluster architecture visualization: Image not found
   :align: center

What steps are necessary to get going?

    1. Start a **scheduler process** (aka master, controller, manager, ...),
       either on your local computer or on a node of the cluster.

          :code:`start_scheduler(...)` is a Python function provided for this, see below.
          Alternatively, the libraries also provide a shell command for starting a scheduler.

    2. Start some **worker processes** (aka slaves, ...) on nodes of the cluster.
       By giving them the scheduler address, they can connect themselves to the scheduler
       via the local network.

          :code:`start_worker(...)` is a Python function provided for this, see below.
          Alternatively, the libraries also provide a shell command for starting a worker.

    3. Start a **connection** (aka client) from your computer to the scheduler via the
       local network.
       This allows you to send a computing task to the scheduler which in turn distributes it
       intelligently (load balancing, fault tolerance, ...) to the nodes of the cluster. Once
       they completed their tasks, the results can be collected by the scheduler and sent back
       to your computer.

          :code:`connect_to_scheduler(...)` is a Python function provided for this, see below.

    4. Check the **system status**.

          :code:`report_status(...)` is a Python function provided for this, see below.

How can a program (e.g. a worker process) be started on a cluster node?

    An initial assumption is that every node has the same Python environment
    (=same interpreter and library versions) as your local computer.
    One way to start a program remotely on a cluster node would be to connect
    via SSH and run it from the shell (best with a 
    `terminal multiplexer <https://en.wikipedia.org/wiki/Terminal_multiplexer>`_
    like
    `GNU Screen <https://en.wikipedia.org/wiki/GNU_Screen>`_).
    However, usually a cluster has a **cluster manager** (e.g.
    `Sun Grid Engine <https://en.wikipedia.org/wiki/Oracle_Grid_Engine>`_,
    `Apache Mesos <https://en.wikipedia.org/wiki/Apache_Mesos>`_, or
    `others <https://en.wikipedia.org/wiki/List_of_cluster_management_software>`_)
    who is in charge and provides users with computing resources on demand. This means
    one needs to first request resources (CPU cores, RAM) on the cluster
    and submit a job that is executed at some time.
    Since cluster managers differ substantially, please refer to its documentation
    or ask a cluster administrator for help.


.. _dask-cluster-setup:

Dask cluster setup
==================

The object :code:`unified_map.cluster_setup.dask` provides methods to configure
this package and Dask for distributed computing.
It is an instance of the class outlined below.

.. note::
   Do not try to instantiate the class yourself.
   The package will only recognize the object
   :code:`unified_map.cluster_setup.dask` that was created during import.


.. autoclass:: unified_map.cluster_setup._DaskSetup
   :members:



.. _spark-cluster-setup:

Spark cluster setup
===================

The object :code:`unified_map.cluster_setup.spark` provides methods to configure
this package and Apache Spark for distributed computing.
It is an instance of the class outlined below.

.. note::
   Do not try to instantiate the class yourself.
   The package will only recognize the object
   :code:`unified_map.cluster_setup.spark` that was created during import.

.. autoclass:: unified_map.cluster_setup._SparkSetup
   :members:
