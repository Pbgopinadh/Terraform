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