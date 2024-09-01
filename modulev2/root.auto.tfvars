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
ami = "ami-0fcc78c828f981df2"
zid = "Z03899023O0YIJPSBX9WU"

# secutiry group, ami id and zoneid should not be hardcoded as we did

