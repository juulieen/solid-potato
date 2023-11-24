FROM openjdk:22-slim-bullseye

WORKDIR /otp2
RUN apt update && apt install osmctools wget -y
RUN wget --quiet "http://developer.trimet.org/schedule/gtfs.zip" -O trimet.gtfs.zip
RUN wget --quiet "http://download.geofabrik.de/europe/france-latest.osm.pbf"
RUN wget --quiet "https://github.com/opentripplanner/OpenTripPlanner/releases/download/v2.4.0/otp-2.4.0-shaded.jar" -O otp-2.4.0-shaded.jar
RUN osmconvert france-latest.osm.pbf -b=-1.2221359368,42.2283503966,3.3140030746,44.3454095834 --complete-ways -o=south-west.pbf
RUN rm france-latest.osm.pbf
RUN java -Xmx15G -jar otp-2.4.0-shaded.jar --build --save .
CMD java -Xmx15G -jar otp-2.4.0-shaded.jar --load .