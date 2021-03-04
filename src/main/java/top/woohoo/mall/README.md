# Structural interpretation
Structure in java code package: top.woohoo.mall

## About MVC
- [Model](#about-model)
- [Dao](#about-dao)
- [Service](./service)
- [Controller](./controller)
- [~~View(JSP)~~](../../../../webapp)


## About Model
### About vo, pojo
[VO](./vo): 
Value Object - Entities for Service & Controller

[POJO](./pojo): 
Plain Ordinary Java Object - Entities for Dao

### About vo, bo, pojo
VO: 
View Object - Entities for Controller

BO: 
Business Object - Entities for Service

[POJO](./pojo): 
Plain Ordinary Java Object - Entities for Dao


## About Dao
[Dao](./dao): 
Database operation interface for each module.

[Mapper](../../../../resources/mappers): 
Implementation of Dao interface, specific logic code for database operations.