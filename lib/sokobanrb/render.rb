



module Sokoban1
  class Render
    class << self
      attr_accessor  :game

      def render_man
        unless @render_man  
          @render_man  = glGenLists 1

          glNewList(@render_man , GL_COMPILE)    

          glMaterialfv GL_FRONT, GL_AMBIENT,convert( [0.0, 0.0, 0.0, 1.0] )
          glMaterialfv GL_FRONT, GL_DIFFUSE,convert( [0.5, 0.0, 0.0, 1.0] )
          glMaterialfv GL_FRONT, GL_SPECULAR,convert( [0.7, 0.6, 0.6, 1.0] )
          #glMaterialfv GL_FRONT, GL_SHININESS, 0.25 * 128.0 unless   SHOW_FFI

          glutSolidSphere 0.5, 16, 16
          glEndList
        end
        glCallList @render_man
      end

      def render_crate
        unless @render_crate  
          @render_crate  = glGenLists 1

          glNewList(@render_crate , GL_COMPILE)    
          glMaterialfv GL_FRONT, GL_AMBIENT,convert( [0.19125, 0.0735, 0.0225, 1.0]   )
          glMaterialfv GL_FRONT, GL_DIFFUSE,convert( [0.7038, 0.27048, 0.0828, 1.0]    )
          glMaterialfv GL_FRONT, GL_SPECULAR,convert( [0.256777, 0.137622, 0.086014, 1.0] )
          #glMaterialfv GL_FRONT, GL_SHININESS, 0.1 * 128.0 unless  SHOW_FFI

          glPushMatrix
          glScalef 0.9, 0.9, 0.9
          glTranslatef 0.0, 0.0, 0.45

          glutSolidCube 1.0
          glPopMatrix 
          glEndList
        end   
        glCallList @render_crate
      end

      def render_stored_crate
        unless @render_stored_crate  
          @render_stored_crate  = glGenLists 1

          glNewList(@render_stored_crate , GL_COMPILE)    

          glMaterialfv GL_FRONT, GL_AMBIENT,convert( [0.25, 0.20725, 0.20725, 1.0]  )
          glMaterialfv GL_FRONT, GL_DIFFUSE,convert(  [1.0, 0.829, 0.829, 1.0]       )
          glMaterialfv GL_FRONT, GL_SPECULAR,convert( [0.296648, 0.296648, 0.296648, 1.0] )
          #glMaterialfv GL_FRONT, GL_SHININESS, 0.088 * 128.0  unless SHOW_FFI

          glPushMatrix
          glScalef 0.9, 0.9, 0.9
          glTranslatef 0.0, 0.0, 0.45

          glutSolidCube 1.0
          glPopMatrix   
          glEndList
        end
        glCallList @render_stored_crate
      end

      def render_open_floor

        unless @render_open_floor 
          @render_open_floor   = glGenLists 1

        glNewList(@render_open_floor, GL_COMPILE)    

        glMaterialfv GL_FRONT, GL_AMBIENT,convert( [0.05, 0.05, 0.05, 1.0] )
        glMaterialfv GL_FRONT, GL_DIFFUSE,convert( [0.5, 0.5, 0.5, 1.0]     )
        glMaterialfv GL_FRONT, GL_SPECULAR,convert(  [0.7, 0.7, 0.7, 1.0]    )
        #glMaterialfv GL_FRONT, GL_SHININESS, 0.078125 * 128.0



        glPushMatrix
        glScalef 0.9, 0.9, 0.1
        glTranslatef 0.0, 0.0, -0.05

        glutSolidCube 1.0
        glPopMatrix

        glMaterialfv GL_FRONT, GL_AMBIENT, convert( [0.05375, 0.05, 0.06625, 1.0]    )
        glMaterialfv GL_FRONT, GL_DIFFUSE, convert( [0.18275, 0.17, 0.22525, 1.0]     )
        glMaterialfv GL_FRONT, GL_SPECULAR, convert( [0.332741, 0.328634, 0.346435, 1.0] )
        #glMaterialfv GL_FRONT, GL_SHININESS, 0.3 * 128.0 unless  SHOW_FFI

        glPushMatrix
        glScalef 1.0, 1.0, 0.1
        glTranslatef 0.0, 0.0, -0.1

        glutSolidCube 1.0
        glPopMatrix    
        glEndList
        end
      glCallList @render_open_floor
      end

      def render_storage

        #glGenLists(1)
        # Make the gears
        unless @render_storage
          puts 'REGISTER IN DISPLAY LIST'
          @render_storage =  glGenLists 1

          glNewList(@render_storage, GL_COMPILE)
          #glMaterialfv(GL_FRONT, GL_AMBIENT_AND_DIFFUSE,@mRED)
          #gear(1.0, 4.0, 1.0, 20, 0.7)


          glMaterialfv GL_FRONT, GL_AMBIENT, convert( [0.05, 0.05, 0.0, 1.0] )
          glMaterialfv GL_FRONT, GL_DIFFUSE, convert( [0.5, 0.5, 0.4, 1.0] )
          glMaterialfv GL_FRONT, GL_SPECULAR, convert( [0.7, 0.7, 0.04, 1.0] )
          #glMaterialfv GL_FRONT, GL_SHININESS, 0.078125 * 128.0 unless   SHOW_FFI


          glPushMatrix
          glScalef 0.9, 0.9, 0.1
          glTranslatef 0.0, 0.0, -0.05

          glutSolidCube 1.0
          glPopMatrix

          glMaterialfv GL_FRONT, GL_AMBIENT, convert([0.05375, 0.05, 0.06625, 1.0])
          glMaterialfv GL_FRONT, GL_DIFFUSE, convert([0.18275, 0.17, 0.22525, 1.0])
          glMaterialfv GL_FRONT, GL_SPECULAR, convert([0.332741, 0.328634, 0.346435, 1.0])
          #glMaterialfv GL_FRONT, GL_SHININESS, 0.3 * 128.0 unless SHOW_FFI

          glPushMatrix
          glScalef 1.0, 1.0, 0.1
          glTranslatef 0.0, 0.0, -0.1

          glutSolidCube 1.0
          glPopMatrix

          glEndList()
        end  
        #glPushMatrix()
        #glTranslatef(-3.0, -2.0, 0.0)
        #glRotatef(@angle, 0.0, 0.0, 1.0)
        glCallList(@render_storage)
        #glPopMatrix()

      end

      def solid_cylinder(radius, height, slices, stacks) 
 
          glPushAttrib GL_POLYGON_BIT
          glPolygonMode GL_FRONT_AND_BACK, GL_FILL
          obj = gluNewQuadric
          gluCylinder obj, radius, radius, height, slices, stacks
          glPushMatrix
          glTranslatef 0.0, 0.0, height
          gluDisk obj, 0.0, radius, slices, stacks
          glPopMatrix
          gluDeleteQuadric obj 
          glPopAttrib  
        
      end 

      def convert args
        #puts args.class
        if SHOW_FFI
          MemoryPointer.new(:float, 4).put_array_of_float(0, args)
        else
          args
        end



      end
      def render_wall

        unless @render_wall  
          @render_wall  = glGenLists 1

          glNewList(@render_wall , GL_COMPILE)    

          glMaterialfv GL_FRONT, GL_AMBIENT, convert( [0.0, 0.0, 0.0, 1.0])
          glMaterialfv GL_FRONT, GL_DIFFUSE, convert( [0.1, 0.35, 0.1, 1.0])
          glMaterialfv GL_FRONT, GL_SPECULAR, convert( [0.45, 0.55, 0.45, 1.0])
          #glMaterialfv GL_FRONT, GL_SHININESS,  0.25 * 128.0 unless  SHOW_FFI

          glPushMatrix
          glTranslatef 0.0, 0.0, 0.5

          solid_cylinder 0.45, 1.0, 16, 4
          glPopMatrix 
          glEndList
        end
        glCallList @render_wall
      end

      def keyboard_not_ffi  key , x , y
        #= lambda do |key, x, y|
        puts key
        puts x
        puts y
        case key
        when ?c
          exit 0
        when ?s
          @game.save
          #when ?l
          #if test ?e, File.join(PATH, "sokoban_saved_@game.yaml")
          #@game = Sokoban.load 
          #end
        when ?r
          @game.restart_level
        when ?n
          @game.load_level
        when ?u
          @game.undo
        when ?j
          @game.move_left
        when ?l 
          @game.move_right
        when ?k 
          @game.move_down
        when ?i
          #?i, ?I
          @game.move_up
          #puts 'move up'
        when ?q
          exit
        end

        if @game.level_solved?
          @game.load_level

          exit 0 if @game.over?
        end

        glutPostRedisplay 
      end


      def keyboard_ffi key , x , y
        #= lambda do |key, x, y|
        puts key
        puts x
        puts y
        case key
        when ?c
          exit 0
        when ?s
          @game.save
          #when ?l
          #if test ?e, File.join(PATH, "sokoban_saved_@game.yaml")
          #@game = Sokoban.load 
          #end
        when ?r
          @game.restart_level
        when ?n
          @game.load_level
        when ?u
          @game.undo
        when 104
          @game.move_left
        when 107 
          @game.move_right
        when 106 
          @game.move_down
        when 117
          #?i, ?I
          @game.move_up
          #puts 'move up'
        when 27
          exit
        end

        if @game.level_solved?
          @game.load_level

          exit 0 if @game.over?
        end

        glutPostRedisplay
      end




      def display2 
        #= lambda do
        puts 'render::display2() glClear (..)'
        glClear GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT

        #GLUT.InitDisplayMode GLUT::SINGLE | GLUT::RGB | GLUT::DEPTH

        screen = @game.display
        #puts         screen.class
        screen = screen.split("\n")
        #puts        screen.class
        puts screen
        screen.each_with_index do |row, y|
          row.chomp!
          first = row =~ /^(\s+)/ ? $1.length : 0
          (first...row.length).each do |x|
            glPushMatrix
            glTranslatef 1.0 + x, 17.5 - y, 0.0

            if row[x, 1] == "." or row[x, 1] == "*" or row[x, 1] == "+"
              render_storage
            else
              render_open_floor
            end
            if row[x, 1] == "@" or row[x, 1] == "+"
              render_man
            elsif row[x, 1] == "o"
              render_crate
            elsif row[x, 1] == "*"
              render_stored_crate
            elsif row[x, 1] == "#"
              render_wall
            end
            glPopMatrix
          end
        end

        glFlush
        glutSwapBuffers
      end        
      def register_glut_with_soko

        glutDisplayFunc (method(:display2).to_proc)
        #glutIdleFunc(method(:idle).to_proc)

        glutReshapeFunc (method(:reshape_soko).to_proc)

        if SHOW_FFI

          glutKeyboardFunc(method(:keyboard_ffi).to_proc)
        else

          glutKeyboardFunc(method(:keyboard_not_ffi).to_proc)
        end

      end
      def init_soko

        puts 'render think: SHOW_FFI is:'
        puts SHOW_FFI

        @game = Sokoban.new
      end
      def enable_light_soko
        unless SHOW_FFI 
          puts 'Render::senable_light_soko() how ffi'
          glLight GL_LIGHT0, GL_AMBIENT, [0.0, 0.0, 0.0, 1.0]
          glLight GL_LIGHT0, GL_DIFFUSE, [1.0, 1.0, 1.0, 1.0]
          glLight GL_LIGHT0, GL_POSITION, [0.0, 3.0, 3.0, 0.0]
          glLightModel GL_LIGHT_MODEL_AMBIENT, [0.2, 0.2, 0.2, 1.0]
          glLightModel GL_LIGHT_MODEL_LOCAL_VIEWER, [0.0]
        end

        #GL.FrontFace GL::CW
        #GL.Enable GL::LIGHTING
        #GL.Enable GL::LIGHT0
        #GL.Enable GL::AUTO_NORMAL
        #GL.Enable GL::NORMALIZE
        #GL.Enable GL::DEPTH_TEST
        #GL.DepthFunc GL::LESS

        glFrontFace GL_CW
        glEnable GL_LIGHTING
        glEnable GL_LIGHT0
        glEnable GL_AUTO_NORMAL
        glEnable GL_NORMALIZE
        glEnable GL_DEPTH_TEST
        glDepthFunc GL_LESS
      end   
      # New window size or exposure
      def reshape_soko(width, height)

        h = height.to_f / width.to_f
        glViewport(0, 0, width, height)
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glFrustum(-1.0, 1.0, -h, h, 1.5, 20.0)
        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()

        gluLookAt 10.0, 10.0, 17.5, 10.0, 10.0, 0.0, 0.0, 1.0, 0.0
        #glTranslatef(0.0, 0.0, -40.0)
        #
        glutPostRedisplay
      end   

    end       
  end
end
