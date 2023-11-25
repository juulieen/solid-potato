# OTP 2 Dockerfile for experiment

## Motivation

I want to explore the OTP planner exisiting capabilities and see if there is a itinary planner algorithme dedicated to using "off-road" track/path

## Notes

Let's running the OTP2 planner on my PC
- I'm using the docker because I don't want bother install openjdk:22 directly on my OS
- I've filter data from france and more specificly of south-west
- I've put enormous limit on memory allocation because I didn't wanted to bother searching.

## Ressources used

- [OTP2 java Executable download](https://github.com/opentripplanner/OpenTripPlanner/releases/tag/v2.4.0)
- [Tool to choose the bounding box](https://boundingbox.klokantech.com/)
- [Source for OSM data](http://download.geofabrik.de/europe/france.html)
- [Preparing OSM Data](https://docs.opentripplanner.org/en/v2.4.0/Preparing-OSM/)

## Final output

```shell
docker build -t otp2 .
docker run -it -p 8080:8080 -p 8081:8081 --name otp2-south-west otp2
```