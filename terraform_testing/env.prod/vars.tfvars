env = "PROD"

  components = {
      frontend = {                                          # this is each.key 
        instance = "t2.micro" ,                              # all the values of the keys are each.values.
      }
      backend = {
        instance = "t2.micro" ,
      }
      database = {
        instance = "t2.micro" ,
      }

  }

sg = ["sg-0f32ca9e850ae332e"]

# secutiry group, ami id and zoneid should not be hardcoded as we did
# other env related values.