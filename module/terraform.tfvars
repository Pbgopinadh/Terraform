  components = {
      frontend = {                                          # this is each.key 
        instance = "t2.micro" ,                              # all the values of the keys are each.values.
        bu = 100,
      }

      backend = {
        instance = "t2.micro" ,
        bu = 50,
      }

      database = {
        instance = "t2.micro" ,
        bu = 20,
      }

  }