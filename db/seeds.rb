# ArtTag.destroy_all
Art.destroy_all
Tag.destroy_all
User.destroy_all
# User.destroy_all

User.create([
  {first_name:"John",last_name:"Ankle",email:"kidon@street.com",location:"San FranPsycho",image:"http://pickaface.net/includes/themes/clean/img/slide4.png", password: "password"
  	},
  	{first_name:"Cindy",last_name:"Toe",email:"yoyo@spin.com",location:"Valley-Jo",image:"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRnxhg4qZG-kVJlONQfbknfFoYsTlurgjZwY7xBC_mZUacc-RZc", password: "password"
  	},
  	{first_name:"Ham",last_name:"Finger",email:"petes@shoelace.com",location:"San-Jozie",image:"http://pickaface.net/avatar/pickaface51f38ca9987be.png", password: "password"
  	}
  ])

Art.create!([
  {user_id: 1, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
  {user_id: 5, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
   {user_id: 6, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
   {user_id: 11, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
   {user_id: 12, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
   {user_id: 13, image:"http://www.nimball.com/uploads/1/4/4/9/144966/3291334.jpg"
  },
  {user_id: 10,image:"http://www.nimball.com/uploads/1/4/4/9/144966/6129264.jpg"
  },
  {user_id: 9,image:"http://www.nimball.com/uploads/1/4/4/9/144966/4936452.jpg"
  },
  {user_id: 9,image:"http://www.nimball.com/uploads/1/4/4/9/144966/994840.jpg"
  },
  {user_id: 1,image:"http://www.nimball.com/uploads/1/4/4/9/144966/1585557.jpg"
  },
  {user_id: 2,image:"http://www.nimball.com/uploads/1/4/4/9/144966/6129264.jpg"
  },
  {user_id: 3,image:"http://www.nimball.com/uploads/1/4/4/9/144966/4936452.jpg"
  },
  {user_id: 4,image:"http://www.nimball.com/uploads/1/4/4/9/144966/994840.jpg"
  },
  {user_id: 5,image:"http://www.nimball.com/uploads/1/4/4/9/144966/1585557.jpg"
  },
  {user_id: 6,image:"http://www.nimball.com/uploads/1/4/4/9/144966/2809666.jpg"
  }
  ])

Tag.create([
  {art_id: 1,category: "3D",description: "man"},
  {art_id: 2,category: "3D",description: "Fishing"},
  {art_id: 3,category: "3D",description: "Cars"},
  {art_id: 4,category: "3D",description: "SnowMan"},
  {art_id: 5,category: "3D",description: "Woman"},
  {art_id: 6,category: "3d",description: "Tiger"}
  ])

