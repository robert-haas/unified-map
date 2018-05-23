import unified_map as umap

def square(x):
    return x**2

data = [1, 2, 3, 4, 5, 6, 7, 8]

# Serial on one core
results = umap.univariate.serial.for_loop(square, data)
results = umap.univariate.serial.generator_expression(square, data)
results = umap.univariate.serial.generator_function(square, data)
results = umap.univariate.serial.list_comprehension(square, data)
results = umap.univariate.serial.map(square, data)
results = umap.univariate.serial.starmap(square, data)

# Parallel on several cores
results = umap.univariate.parallel.dask(square, data)
results = umap.univariate.parallel.futures(square, data)
results = umap.univariate.parallel.joblib(square, data)
results = umap.univariate.parallel.multiprocessing(square, data)

# Distributed on several machines
umap.cluster_setup.spark.connect_to_scheduler('10.0.0.5:7077')
results = umap.univariate.distributed.spark(square, data)

umap.cluster_setup.dask.connect_to_scheduler('10.0.0.5:8789')
results = umap.univariate.distributed.dask(square, data)
