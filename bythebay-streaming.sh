echo ...Starting Spark Streaming...
cd $PIPELINE_HOME
sbt streaming/package
nohup spark-submit --packages org.apache.spark:spark-streaming-kafka-assembly_2.10:1.4.1,com.datastax.spark:spark-cassandra-connector-java_2.10:1.4.0-M3 --class com.bythebay.pipeline.spark.streaming.StreamingRatings $PIPELINE_HOME/streaming/target/scala-2.10/streaming_2.10-1.0.jar 2>&1 1>streaming-out.log &
