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
  {user_id: 1, image:"http://streetartlondon.co.uk/tours/files/2014/01/23-Street-Art-London-Street-Art-Tour.jpg"
  },
  {user_id: 1, image:"http://thesource.com/wp-content/uploads/2014/02/NobodyLikesMe.jpg"
  },
   {user_id: 2, image:"https://modedeville.files.wordpress.com/2014/11/street-art-mariobros.jpg"
  },
   {user_id: 2, image:"https://res.cloudinary.com/streetartsf/image/upload/artworks/7307/MD-Clarion-DSC07250.jpg"
  },
   {user_id: 3, image:"http://ww4.hdnux.com/photos/07/23/40/1914887/9/920x920.jpg"
  },
   {user_id: 3, image:"https://upworthy-production.s3.amazonaws.com/nugget/51a56ed73f9a60c870000944/attachments/Art_7.jpeg"
  }
  ])

Tag.create([
  {art_id: 1,category: "Street Art",description: "elephant"},
  {art_id: 1,category: "Street Art",description: "octopus"},
  {art_id: 1,category: "Street Art",description: "turquoise"},
  {art_id: 1,category: "Street Art",description: "graffiti"},

  {art_id: 2,category: "Street Art",description: "boy"},
  {art_id: 2,category: "Street Art",description: "orange"},
  {art_id: 2,category: "Street Art",description: "street"},
  {art_id: 2,category: "Street Art",description: "graffiti"},

  {art_id: 3,category: "Street Art",description: "cartoon"},
  {art_id: 3,category: "Street Art",description: "police"},
  {art_id: 3,category: "Street Art",description: "mario"},
  {art_id: 3,category: "Street Art",description: "graffiti"},

  {art_id: 4,category: "Street Art",description: "bear"},
  {art_id: 4,category: "Street Art",description: "fence"},
  {art_id: 4,category: "Street Art",description: "street"},
  {art_id: 4,category: "Street Art",description: "graffiti"},


  {art_id: 5,category: "Street Art",description: "bike"},
  {art_id: 5,category: "Street Art",description: "tree"},
  {art_id: 5,category: "Street Art",description: "cactus"},
  {art_id: 5,category: "Street Art",description: "graffiti"},

  {art_id: 6,category: "Street Art",description: "olympics"},
  {art_id: 6,category: "Street Art",description: "hoodie"},
  {art_id: 6,category: "Street Art",description: "runner"},
  {art_id: 6,category: "Street Art",description: "street"},
  ])
