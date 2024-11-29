Christopher Hernandez<br/>
November 2024<br/>
Development of a Solar Array Deployment Mechanism for a CubeSat<br/>

This repository stores the MATLAB code used in the master project of, "Development of a Solar Array Deployment Mechanism for a CubeSat."
The MATLAB programs used in this repository are listed below with a corresponding description and methodology.


Program: [IncidenceCalculations.m]([url](https://github.com/ConcealedHero/Development-of-a-Solar-Array-Deployment-Mechanism-for-a-CubeSat/blob/main/IncidenceCalculations.m))

  Description:
  This program calculates the effective solar irradiance based on the incidence angle and subsequently calculates the power generated by a solar panel. 
  Solar irradiance reflected from Earth's atmosphere is not considered within these calculations. 
  This program splits the calculations for one, two, and three irradiated solar panels.
  
  Methodology Concept Explanation:
  For only one irradiated solar panel, this indicates that the incidence angle must be 0°.
  
  For only two irradiated solar panels, it is first assumed that only one face is irradiated; the corresponding incidence angles are 0° and 90°. 
  By assuming rotation about one axis and an angular change of 1°/s, the incident angle of both faces must converge to 45°.

  The case of three irradiated solar panels follows a similar methodology as in the two irradiated solar panel case. 
  By first assuming only one face is irradiated, the incidence angles of the three faces are 0°, 90°, and 90°. 
  By considering an angular change of 1°/s for each face, the incident angle for each face must converge to 45°.
  
  This methodology was formed on the basis that a maximum of three faces could be observed at any given time.
