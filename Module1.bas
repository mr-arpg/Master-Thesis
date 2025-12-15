Sub CreateThesisPresentation()
    ' Macro para criar apresentação de defesa de tese
    ' "The Plasma Way to Ammonia: Modelling and Understanding Plasma-Derived NH_3"
    ' Armando Rafael Pires Gonçalves
    ' 20 minutos
    
    Dim ppt As Presentation
    Dim sld As Slide
    Dim shp As Shape
    Dim i As Integer
    Dim imagePath As String
    Dim txtBox As Shape
    
    
    ' Criar nova apresentação
    Set ppt = Presentations.Add
    
    ' Configurar tamanho do slide (16:9)
    ppt.PageSetup.SlideWidth = 960
    ppt.PageSetup.SlideHeight = 540
    
    ' ========================================
    ' SLIDE 1: TÍTULO
    ' ========================================
    Set sld = ppt.Slides.Add(1, ppLayoutTitle)
    With sld
        .Shapes.Title.TextFrame.TextRange.Text = "The Plasma Way to Ammonia"
        .Shapes(2).TextFrame.TextRange.Text = "Modelling and Understanding Plasma-Derived NH_3" & vbCrLf & vbCrLf & _
            "Armando Rafael Pires Gonçalves" & vbCrLf & vbCrLf & _
            "Supervisors:" & vbCrLf & _
            "Prof. Luís Lemos Alves (IST)" & vbCrLf & _
            "Dr. Olivier Guaitella (LPP École Polytechnique)" & vbCrLf & vbCrLf & _
            "Instituto Superior Técnico, Universidade de Lisboa" & vbCrLf & _
            "January 2026"
    End With
    
    ' ========================================
    ' SLIDE 2: ALIMENTAÇÃO MUNDIAL
    ' ========================================
    Set sld = ppt.Slides.Add(2, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 30, 600, 50)
    With shp.TextFrame.TextRange
        .Text = "Global Food Production"
        .Font.Size = 44
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Imagem real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\nitrogen_pathways.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=150, _
        Top:=120, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 400
    
    ' ========================================
    ' SLIDE 3: DEPENDÊNCIA DE AMÓNIA
    ' ========================================
    Set sld = ppt.Slides.Add(3, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 30, 600, 50)
    With shp.TextFrame.TextRange
        .Text = "The Ammonia Dependency"
        .Font.Size = 44
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Imagem real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\nh3_longTube.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=100, _
        Top:=120, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 300
    
    ' Caixa de texto com estatísticas
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 420, 120, 300, 250)
    With shp.TextFrame.TextRange
        .Text = "50% of global food production" & vbCrLf & vbCrLf & _
                "depends on synthetic NH_3 fertilizers" & vbCrLf & vbCrLf & _
                "Annual production:" & vbCrLf & _
                "~180 million tonnes (2021)"
        .Font.Size = 20
        .Font.Bold = msoTrue
        .ParagraphFormat.Bullet.Visible = msoFalse
    End With
    
    ' ========================================
    ' SLIDE 4: O PROBLEMA HABER-BOSCH
    ' ========================================
    Set sld = ppt.Slides.Add(4, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 20, 600, 40)
    With shp.TextFrame.TextRange
        .Text = "The Haber-Bosch Problem"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Equação
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 150, 80, 400, 50)
    With shp.TextFrame.TextRange
        .Text = "N_2 + 3H_2 <-> 2NH_3"
        .Font.Size = 36
        .Font.Name = "Cambria Math"
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Condições extremas
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 100, 150, 250, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 200, 200)
        .TextFrame.TextRange.Text = "Extreme Conditions:" & vbCrLf & _
                                     "P: 5-20 MPa" & vbCrLf & _
                                     "T: 673-773 K"
        .TextFrame.TextRange.Font.Size = 18
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' O Problema
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 370, 150, 280, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 150, 150)
        .TextFrame.TextRange.Text = "THE PROBLEM:" & vbCrLf & _
                                     "[bullet] 1-2% global energy" & vbCrLf & _
                                     "[bullet] 30-40 MJ/kg" & vbCrLf & _
                                     "[bullet] Fossil fuel dependent"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Imagem real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\default-alameda.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=150, _
        Top:=290, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 400
    
    ' ========================================
    ' SLIDE 5: A SOLUÇÃO PLASMA
    ' ========================================
    Set sld = ppt.Slides.Add(5, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 20, 600, 40)
    With shp.TextFrame.TextRange
        .Text = "The Plasma Solution"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Imagem real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\dc\cilinder.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=80, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 300
    
    ' Vantagens
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 370, 80, 330, 200)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .TextFrame.TextRange.Text = "ADVANTAGES:" & vbCrLf & vbCrLf & _
                                     "[check] Moderate conditions" & vbCrLf & _
                                     "   (p < 1 atm, Tgas ~ 300-600 K)" & vbCrLf & vbCrLf & _
                                     "[check] Renewable integration" & vbCrLf & _
                                     "   (electricity -> chemistry)" & vbCrLf & vbCrLf & _
                                     "[check] Selective non-equilibrium" & vbCrLf & _
                                     "   chemistry: Te >> Tg"
        .TextFrame.TextRange.Font.Size = 16
    End With
    
    ' O Desafio
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 300, 650, 80)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 255, 200)
        .TextFrame.TextRange.Text = "THE CHALLENGE:" & vbCrLf & _
                                     "Understanding and modeling complex volume-surface chemistry"
        .TextFrame.TextRange.Font.Size = 20
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 6: ELECTRON BOLTZMANN EQUATION (MOVIDO PARA AQUI)
    ' ========================================
    Set sld = ppt.Slides.Add(6, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 40)
    With shp.TextFrame.TextRange
        .Text = "The Electron Boltzmann Equation (EBE)"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Equação geral
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 70, 650, 70)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 240, 255)
        .TextFrame.TextRange.Text = "[partial]f/[partial]t + v[vector]·[nabla]f + (F[vector]/m)·[nabla]_vf = ([partial]f/[partial]t)|coll" & vbCrLf & vbCrLf & _
                                     "Describes electron velocity distribution in phase space"
        .TextFrame.TextRange.Font.Size = 18
        .TextFrame.TextRange.Font.Name = "Cambria Math"
    End With
    
    ' Two-term approximation
    Set shp = sld.Shapes.AddShape(msoShapeRectangle, 50, 155, 310, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 245, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "Two-term approximation:" & vbCrLf & _
                                     "f(r[vector],v[vector],t) [approx] f_0(r,v,t) + (v[vector]/v)·f[vector]_1(r,v,t)" & vbCrLf & _
                                     "        [uparrow]                [uparrow]" & vbCrLf & _
                                     "   isotropic      anisotropic (small)"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Name = "Cambria Math"
    End With
    
    ' Energy space form
    Set shp = sld.Shapes.AddShape(msoShapeRectangle, 380, 155, 320, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "In energy space:" & vbCrLf & vbCrLf & _
                                     "1/N [sqrt](me/2e) dG(u)/du = S(u)" & vbCrLf & _
                                     "        [uparrow]                  [uparrow]" & vbCrLf & _
                                     "  Continuous         Discrete"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Name = "Cambria Math"
    End With
    
    ' Continuous operators box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 280, 650, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 220, 255)
        .TextFrame.TextRange.Text = "G(u) contains CONTINUOUS OPERATORS:" & vbCrLf & _
                                     "  [bullet] Electric field (power gain from acceleration)" & vbCrLf & _
                                     "  [bullet] Elastic collisions (power loss, randomization)" & vbCrLf & _
                                     "  [bullet] CAR - Continuous Approximation for Rotation" & vbCrLf & _
                                     "  [bullet] Electron-electron collisions (thermalization)"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Nota sobre variable grid
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 410, 650, 30)
    With shp.TextFrame.TextRange
        .Text = "-> Variable energy grid implemented for continuous operators (see later)"
        .Font.Size = 14
        .Font.Italic = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 7: PROJETO PSI.COM
    ' ========================================
    Set sld = ppt.Slides.Add(7, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 20, 600, 40)
    With shp.TextFrame.TextRange
        .Text = "PSI.COM Project"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Logo IST
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\default-alameda.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=100, _
        Top:=70, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 200
    
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\lpp2.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=400, _
        Top:=70, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 200
    
    ' Nome completo do projeto
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 100, 160, 600, 30)
    With shp.TextFrame.TextRange
        .Text = "Plasma Surface Interaction (Data and Tools) COupled Modeling"
        .Font.Size = 18
        .Font.Bold = msoTrue
        .Font.Italic = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Objetivos
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 100, 200, 600, 200)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 248, 255)
        .TextFrame.TextRange.Text = "PROJECT OBJECTIVES:" & vbCrLf & vbCrLf & _
                                     "1. Experimental characterization of N_2-H_2 plasmas" & vbCrLf & vbCrLf & _
                                     "2. Development of modeling tools (LoKI framework)" & vbCrLf & vbCrLf & _
                                     "3. Understanding volume-surface coupling" & vbCrLf & _
                                     "    for ammonia synthesis"
        .TextFrame.TextRange.Font.Size = 20
        .TextFrame.TextRange.ParagraphFormat.Bullet.Visible = msoFalse
    End With
    
    ' ========================================
    ' SLIDE 8: ESTRUTURA DA TESE
    ' ========================================
    Set sld = ppt.Slides.Add(8, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 20, 600, 40)
    With shp.TextFrame.TextRange
        .Text = "Thesis Structure"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Bloco 1: EXPERIMENTAL
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 150, 80, 400, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 200, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "EXPERIMENTAL (Chapter 3)" & vbCrLf & _
                                     "Measurements at LPP" & vbCrLf & _
                                     "[bullet] Temperatures (Tgas, Twall)" & vbCrLf & _
                                     "[bullet] [NH_3] production [bullet] Discharge parameters"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Seta 1
    Call DrawArrow(sld, 350, 170, 350, 190, RGB(0, 0, 0), 4)
    
    ' Bloco 2: KINETIC MODEL
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 150, 190, 400, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "KINETIC MODEL (Chapter 4)" & vbCrLf & _
                                     "Database & Validation" & vbCrLf & _
                                     "[bullet] >100 species" & vbCrLf & _
                                     "[bullet] Volume + Surface [bullet] LoKI-B+C implementation"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Seta 2
    Call DrawArrow(sld, 350, 280, 350, 300, RGB(0, 0, 0), 4)
    
    ' Bloco 3: TOOL DEVELOPMENT
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 150, 300, 400, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 200, 255)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "TOOL DEVELOPMENT (Chapter 5)" & vbCrLf & _
                                     "Computational advances" & vbCrLf & _
                                     "[bullet] Variable energy grid [bullet] GUI for LoKI-B" & vbCrLf & _
                                     "[bullet] ML exploratory framework"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 9: DC DISCHARGE SETUP
    ' ========================================
    Set sld = ppt.Slides.Add(9, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Experimental Setup: DC Discharge"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Esquema setup real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\dc\scheme.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 350
    
    ' Operating conditions
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 420, 60, 270, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 250, 230)
        .TextFrame.TextRange.Text = "OPERATING CONDITIONS:" & vbCrLf & _
                                     "[bullet] Current: 20-40 mA" & vbCrLf & _
                                     "[bullet] Pressure: 133-665 Pa" & vbCrLf & _
                                     "  ([approx] 1-5 Torr)" & vbCrLf & _
                                     "[bullet] H_2 content: 0-93%" & vbCrLf & _
                                     "[bullet] Pyrex tube:" & vbCrLf & _
                                     "  R = 1 cm, L = 54 cm"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Diagnostics
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 420, 190, 270, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .TextFrame.TextRange.Text = "DIAGNOSTICS:" & vbCrLf & _
                                     "[bullet] OES -> Tgas" & vbCrLf & _
                                     "  (N_2 Second Positive)" & vbCrLf & _
                                     "[bullet] FTIR -> [NH_3]" & vbCrLf & _
                                     "  (umbrella, bending)" & vbCrLf & _
                                     "[bullet] Fiber optic -> Twall"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Foto do plasma
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\glow_discharge.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=270, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 350
    
    ' ========================================
    ' SLIDE 10: THERMAL EQUILIBRATION CHALLENGE
    ' ========================================
    Set sld = ppt.Slides.Add(10, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Key Discovery: Thermal Equilibration"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\temp\graph.jpg"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Observação crítica
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 100, 320, 280, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 220, 220)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "CRITICAL OBSERVATION:" & vbCrLf & _
                                     "t = 35 min -> Twall = 146[deg]C" & vbCrLf & _
                                     "t = 180 min -> Twall = 161[deg]C" & vbCrLf & _
                                     "[Delta]T [approx] 15[deg]C (10% variation!)"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Implicação
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 400, 320, 290, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "IMPLICATION:" & vbCrLf & _
                                     "Previous studies" & vbCrLf & _
                                     "underestimated thermal" & vbCrLf & _
                                     "equilibration time" & vbCrLf & vbCrLf & _
                                     "-> [plusminus]50 K uncertainty bands"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 11: GAS TEMPERATURE MEASUREMENTS
    ' ========================================
    Set sld = ppt.Slides.Add(11, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Gas Temperature Measurements"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\temp\G40_199.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 320
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\temp\G40_665.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=380, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 320
    
    ' Tendência observada
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 100, 350, 600, 60)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "CLEAR TREND: Tgas decreases with increasing H_2%" & vbCrLf & _
                                     "Explanation: High thermal conductivity of H_2 (0.18 vs 0.026 W/m·K for N_2)"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 12: NH_3 PRODUCTION - EXPERIMENTAL
    ' ========================================
    Set sld = ppt.Slides.Add(12, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "NH_3 Production: Experimental Results"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\dc\nh3_200Pa.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 320
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\dc\nh3_665Pa.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=380, _
        Top:=60, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 320
    
    ' Key findings box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 350, 650, 60)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "KEY FINDINGS:  Peak [approx] 70% H_2 (0.91% @ 200 Pa, 0.74% @ 665 Pa)  [bullet]  " & _
                                     "COUNTER-INTUITIVE: Higher [NH_3] at LOWER pressure  [bullet]  " & _
                                     "Contrast with Haber-Bosch thermodynamics"
        .TextFrame.TextRange.Font.Size = 15
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 13: KINETIC DATABASE CHALLENGE
    ' ========================================
    Set sld = ppt.Slides.Add(13, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 15, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Kinetic Database Challenge"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Subtítulo
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 55, 600, 25)
    With shp.TextFrame.TextRange
        .Text = "Rate Coefficients: The Literature Problem"
        .Font.Size = 20
        .Font.Italic = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Exemplo 1
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 80, 95, 620, 130)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 230, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "Example 1:  NH_3 + H -> NH_2 + H_2  (at T = 300 K)" & vbCrLf & vbCrLf & _
                                     "Source              Rate coefficient (m^3/s)" & vbCrLf & _
                                     "---------------------------------------------" & vbCrLf & _
                                     "Capitelli            4.56 [times] 10^-^3^3" & vbCrLf & _
                                     "Bang et al.          6.08 [times] 10^-^1^1      <- 22 orders difference!" & vbCrLf & _
                                     "NIST                 4.71 [times] 10^-^2^6" & vbCrLf & _
                                     "PSI.COM              1.08 [times] 10^-^2^6"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Exemplo 2
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 80, 235, 620, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 230, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "Example 2:  NH_2 + NH_2 -> NH + NH_3" & vbCrLf & vbCrLf & _
                                     "Capitelli            5.78 [times] 10^-^2^5" & vbCrLf & _
                                     "Bang et al.          1.31 [times] 10^-^2^0      <- 5 orders!" & vbCrLf & _
                                     "NIST                 < 3.32 [times] 10^-^2^1"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Estratégia adotada
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 80, 345, 620, 65)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "STRATEGY ADOPTED:" & vbCrLf & _
                                     "Treat chemical scheme as VARIABLE, not fixed input" & vbCrLf & _
                                     "Systematic critical review -> final selection based on physical consistency"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 14: THE CHEMICAL MODEL - SPECIES
    ' ========================================
    Set sld = ppt.Slides.Add(14, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "N_2-H_2 Plasma: A Complex Chemical Network"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Caixa principal de espécies
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 50, 340, 340)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 248, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "VOLUME SPECIES (>100 total):" & vbCrLf & vbCrLf & _
                                     "Ground states:" & vbCrLf & _
                                     "  N_2(X,v=0), H_2(X,v=0), NH_3(X)" & vbCrLf & vbCrLf & _
                                     "Vibrationally excited:" & vbCrLf & _
                                     "  N_2(X,v=1-44), H_2(X,v=1-14)" & vbCrLf & vbCrLf & _
                                     "Electronically excited:" & vbCrLf & _
                                     "  N_2(A^3[Sigma]_u^+), N_2(B^3[Pi]g), N_2(C^3[Pi]_u), ..." & vbCrLf & vbCrLf & _
                                     "Atoms:" & vbCrLf & _
                                     "  N(^4S), N(^2D), N(^2P)" & vbCrLf & _
                                     "  H(^1S), H(^2S), ..." & vbCrLf & vbCrLf & _
                                     "Radicals:" & vbCrLf & _
                                     "  NH(X), NH_2(X)" & vbCrLf & _
                                     "  N_2H, N_2H_2, N_2H_3, N_2H_4" & vbCrLf & vbCrLf & _
                                     "Ions:" & vbCrLf & _
                                     "  N_2^+(X), N_2^+(B), N_4^+, H_3^+," & vbCrLf & _
                                     "  NH_4^+, N_2H^+, e^-"
        .TextFrame.TextRange.Font.Size = 11
    End With
    
    ' Caixa espécies de superfície
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 400, 50, 300, 160)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 248, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "SURFACE SPECIES:" & vbCrLf & _
                                     "(Gordiets 1998 mesoscopic model)" & vbCrLf & vbCrLf & _
                                     "Vacant sites:" & vbCrLf & _
                                     "  F(v) - physical" & vbCrLf & _
                                     "  S(v) - chemical" & vbCrLf & vbCrLf & _
                                     "Adsorbed species:" & vbCrLf & _
                                     "  N(F), N(S)" & vbCrLf & _
                                     "  H(F), H(S)" & vbCrLf & _
                                     "  NH(S), NH_2(S)"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' Caixa cross sections
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 400, 220, 300, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "ELECTRON-IMPACT:" & vbCrLf & _
                                     "Cross sections from" & vbCrLf & _
                                     "IST-Lisbon database (LXCat)" & vbCrLf & vbCrLf & _
                                     "Validation: swarm parameters" & vbCrLf & _
                                     "< 20% deviation, 10^-^4-100 Td"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Nota sobre esquema completo
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 400, 320, 300, 70)
    With shp.TextFrame.TextRange
        .Text = "Complete kinetic scheme:" & vbCrLf & _
                "github.com/mr-arpg/LoKI-B" & vbCrLf & _
                "N_2H_2_CS_18a.chem" & vbCrLf & _
                "(volume + surface reactions)"
        .Font.Size = 11
        .Font.Italic = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 15: NH_3 FORMATION PATHWAY
    ' ========================================
    Set sld = ppt.Slides.Add(15, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "The Story of Ammonia Formation"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' VOLUME section
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 80)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 220, 220)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "VOLUME (Plasma) - DISSOCIATION:" & vbCrLf & _
                                     "e^- + N_2 -> N + N + e^-     (electron-impact)" & vbCrLf & _
                                     "e^- + H_2 -> H + H + e^-" & vbCrLf & _
                                     "        [downarrow]        [downarrow]"
        .TextFrame.TextRange.Font.Size = 15
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Arrow to surface
    Call DrawArrow(sld, 375, 135, 375, 150, RGB(0, 0, 0), 4)
    
    ' SURFACE section - header
    Set shp = sld.Shapes.AddShape(msoShapeRectangle, 150, 150, 500, 30)
    With shp
        .Fill.ForeColor.RGB = RGB(100, 100, 100)
        .Line.Visible = msoFalse
        .TextFrame.TextRange.Text = "=============== SURFACE ==============="
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Adsorption
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 190, 650, 50)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 200)
        .Line.weight = 1
        .TextFrame.TextRange.Text = "1. ADSORPTION:" & vbCrLf & _
                                     "N(gas) + F(v) -> N(F)  ->  N(F) + S(v) -> N(S) + F(v)  (physical -> chemical)"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Hydrogenation
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 250, 650, 60)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 255, 200)
        .Line.weight = 1
        .TextFrame.TextRange.Text = "2. HYDROGENATION (sequential):" & vbCrLf & _
                                     "H + N(S) -> NH(S)" & vbCrLf & _
                                     "H + NH(S) -> NH_2(S)"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Synthesis
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 320, 650, 65)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "3. SYNTHESIS & DESORPTION:" & vbCrLf & _
                                     "H + NH_2(S) -> NH_3 + S(v)             Eley-Rideal (70%)" & vbCrLf & _
                                     "H(F) + NH_2(S) -> NH_3 + S(v) + F(v)   Langmuir-Hinshelwood (10%)" & vbCrLf & _
                                     "Ion + NH_2(S) -> NH_3 + ...            Ion-wall recombination (20%)"
        .TextFrame.TextRange.Font.Size = 12
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' Destruction
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 395, 650, 45)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 200, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "4. DESTRUCTION (back to volume):" & vbCrLf & _
                                     "e^- + NH_3 -> fragments  (40-50% loss)    [bullet]    flow -> out  (10-50% loss)"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Name = "Courier New"
    End With
    
    ' ========================================
    ' SLIDE 16: MODEL IMPLEMENTATION - LoKI
    ' ========================================
    Set sld = ppt.Slides.Add(16, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Model Implementation: LoKI-B+C Framework"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Setup box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 200, 50, 300, 50)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 230, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "1. Setup & Initialization" & vbCrLf & _
                                     "(Tg, p, I, geometry, ...)"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Arrow down
    Call DrawArrow(sld, 350, 100, 350, 120, RGB(0, 0, 0), 3)
    
    ' LoKI-B box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 200, 120, 300, 80)
    With shp
        .Fill.ForeColor.RGB = RGB(220, 240, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "2. LoKI-B (Electron Kinetics)" & vbCrLf & _
                                     "[bullet] Solve Boltzmann Eq (EBE)" & vbCrLf & _
                                     "[bullet] Calculate EEDF" & vbCrLf & _
                                     "[bullet] Compute rate coefficients"
        .TextFrame.TextRange.Font.Size = 12
    End With
    
    ' Arrow down
    Call DrawArrow(sld, 350, 200, 350, 220, RGB(0, 0, 0), 3)
    
    ' LoKI-C box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 200, 220, 300, 80)
    With shp
        .Fill.ForeColor.RGB = RGB(220, 255, 220)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "3. LoKI-C (Chemistry Solver)" & vbCrLf & _
                                     "[bullet] Rate balance equations" & vbCrLf & _
                                     "[bullet] Volume + Surface kinetics" & vbCrLf & _
                                     "[bullet] Species densities -> steady-state"
        .TextFrame.TextRange.Font.Size = 12
    End With
    
    ' Arrow down
    Call DrawArrow(sld, 350, 300, 350, 320, RGB(0, 0, 0), 3)
    
    ' Neutrality check box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 200, 320, 300, 50)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 220)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "4. Neutrality & Current" & vbCrLf & _
                                     "Adjust E/N & ne | Check convergence"
        .TextFrame.TextRange.Font.Size = 12
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Arrow back (Global iteration)
    Call DrawCurvedArrow(sld, 510, 350, 600, 160, 510, 160, RGB(200, 0, 0), 3)
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 520, 220, 80, 40)
    With shp.TextFrame.TextRange
        .Text = "Global" & vbCrLf & "iteration"
        .Font.Size = 11
        .Font.Bold = msoTrue
    End With
    
    ' Final convergence
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 200, 380, 300, 40)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "Self-consistent solution"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Convergence criteria
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 430, 650, 20)
    With shp.TextFrame.TextRange
        .Text = "Convergence: EEDF < 10^-^9  [bullet]  E/N neutrality < 10^-^8  [bullet]  Species swarm < 10^-^4"
        .Font.Size = 11
        .Font.Italic = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 17: VALIDATION - ELECTRIC FIELD
    ' ========================================
    Set sld = ppt.Slides.Add(17, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Model Validation: Electric Field"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\sims\LPP-#2_Q_10_field_H2_band_E_N.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Non-monotonic behavior explanation
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 320, 420, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 250, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "NON-MONOTONIC BEHAVIOR:" & vbCrLf & _
                                     "Ionic composition evolution:" & vbCrLf & _
                                     "N_4^+ -> N_2H^+ -> H_3^+" & vbCrLf & vbCrLf & _
                                     "N_2H^+ formation mechanisms:" & vbCrLf & _
                                     "N_2^++H_2 / H_2^++N_2 / H_3^++N_2"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' Agreement box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 480, 320, 220, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "RESULT:" & vbCrLf & vbCrLf & _
                                     "Good qualitative" & vbCrLf & _
                                     "agreement" & vbCrLf & vbCrLf & _
                                     "(systematic E/N" & vbCrLf & _
                                     "overestimation)"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 18: ATOMIC NITROGEN
    ' ========================================
    Set sld = ppt.Slides.Add(18, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Atomic Nitrogen: Multi-component Diffusion"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\sims\Gordiets_FIG2_II.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Dramatic effect
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 300, 310, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "DRAMATIC EFFECT:" & vbCrLf & vbCrLf & _
                                     "5[times] enhancement of [N]" & vbCrLf & _
                                     "with 1-2% H_2 addition" & vbCrLf & _
                                     "to pure N_2 plasma!"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Key mechanisms
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 370, 300, 330, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "KEY MECHANISMS:" & vbCrLf & vbCrLf & _
                                 "1. Multi-component diffusion" & vbCrLf & _
                                 "   (Lennard-Jones parameters)" & vbCrLf & vbCrLf & _
                                 "2. N_2(A) quenching by H:" & vbCrLf & _
                                 "   N_2(A) + H  ' N_2(X,v) + H" & vbCrLf & _
                                 "   (Borges et al. 2019/2023)"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' ========================================
    ' SLIDE 19: ATOMIC HYDROGEN
    ' ========================================
    Set sld = ppt.Slides.Add(19, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Atomic Hydrogen Validation"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\sims\Gordiets_FIG4_II.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Observations
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 320, 650, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "OBSERVATIONS:" & vbCrLf & _
                                     "[bullet] Monotonic increase with H_2% (as expected)" & vbCrLf & _
                                     "[bullet] Steep rise at very low and very high H_2 compositions" & vbCrLf & _
                                     "[bullet] EXCELLENT agreement with all three experimental datasets" & vbCrLf & _
                                     "[bullet] Note: Amorim absolute values overestimated by ~10[times] (relative agreement perfect)"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 20: NH_3 - RESIDENCE TIME EFFECT
    ' ========================================
    Set sld = ppt.Slides.Add(20, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "NH_3 Production: Residence Time Effect"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\sims\Gordiets_FIG6_II_amorim_time_steps_[0.005, 0.04].png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Critical insight
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 300, 420, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "CRITICAL INSIGHT:" & vbCrLf & vbCrLf & _
                                     "Flow conditions dominate!" & vbCrLf & vbCrLf & _
                                     "Amorim: 200 sccm, V=3[times]10^-^5 m^3" & vbCrLf & _
                                     "-> [tau]res [approx] 10 ms"
        .TextFrame.TextRange.Font.Size = 15
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Resolution
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 480, 300, 220, 110)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "FACTOR OF 3" & vbCrLf & _
                                     "discrepancy" & vbCrLf & _
                                     "RESOLVED by" & vbCrLf & _
                                     "accounting for" & vbCrLf & _
                                     "realistic [tau]res!"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 21: NH_3 - THIS WORK VS MODEL
    ' ========================================
    Set sld = ppt.Slides.Add(21, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "NH_3 Validation: This Work vs Model"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\sims\LPP-2_NH3_H2_band_Long_tube.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Model predictions
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 320, 650, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "MODEL PREDICTIONS:" & vbCrLf & _
                                     "[check] Peak shifted to higher H_2% (consistent with experiments)" & vbCrLf & _
                                     "[check] Better agreement at lower pressure (smaller dispersion)" & vbCrLf & _
                                     "[check] Simulation bands cover experimental uncertainty" & vbCrLf & _
                                     "[check] NO modification needed in surface chemistry to capture trends!"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 22: VARIABLE ENERGY GRID - PROBLEM
    ' ========================================
    Set sld = ppt.Slides.Add(22, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Variable Energy Grid: The Problem"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Challenge box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 60)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "CHALLENGE: EEDF spans 10-25 orders of magnitude" & vbCrLf & _
                                     "from low energies (vibrational excitations ~1-3 eV) to high energies (>10 eV)"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico EEDF
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\benchmark\maxwellian_elastic_comparison.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=125, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Traditional approach
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 335, 650, 75)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 230, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "TRADITIONAL APPROACH: Uniform grid [Delta]u = constant" & vbCrLf & _
                                     "[cross] Inefficient: same resolution everywhere" & vbCrLf & _
                                     "[cross] High computational cost for molecular gases" & vbCrLf & _
                                     "[cross] Either: poor resolution at low E OR excessive points at high E"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' ========================================
    ' SLIDE 23: VARIABLE ENERGY GRID - SOLUTION
    ' ========================================
    Set sld = ppt.Slides.Add(23, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Variable Energy Grid: The Solution"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Geometric progression
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 60)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "GEOMETRIC PROGRESSION:   [Delta]u_n_+_1 = a·[Delta]u_n   (a [approx] 1.05-1.10)" & vbCrLf & _
                                     "Fine resolution where needed, coarse resolution elsewhere"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.Font.Name = "Cambria Math"
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Visual comparison - criar com formas
    ' Energy axis
    Set shp = sld.Shapes.AddLine(80, 150, 680, 150)
    shp.Line.weight = 2
    
    ' Labels
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 70, 125, 50, 20)
    shp.TextFrame.TextRange.Text = "0"
    shp.TextFrame.TextRange.Font.Size = 12
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 660, 125, 50, 20)
    shp.TextFrame.TextRange.Text = "umax"
    shp.TextFrame.TextRange.Font.Size = 12
    
    ' Uniform grid
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 175, 150, 25)
    With shp.TextFrame.TextRange
        .Text = "Uniform grid:"
        .Font.Size = 14
        .Font.Bold = msoTrue
    End With
    For i = 0 To 7
        Set shp = sld.Shapes.AddLine(100 + i * 75, 200, 100 + i * 75, 220)
        shp.Line.weight = 2
    Next i
    
    ' Variable grid
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 245, 150, 25)
    With shp.TextFrame.TextRange
        .Text = "Variable grid:"
        .Font.Size = 14
        .Font.Bold = msoTrue
    End With
    
    Dim positions As Variant
    positions = Array(100, 115, 135, 165, 210, 275, 365, 490)
    For i = 0 To 7
        Set shp = sld.Shapes.AddLine(positions(i), 270, positions(i), 290)
        shp.Line.weight = 2
        If i < 4 Then shp.Line.ForeColor.RGB = RGB(0, 150, 0)
    Next i
    
    ' Arrow + label
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 295, 200, 30)
    With shp.TextFrame.TextRange
        .Text = "[uparrow] Fine resolution where needed"
        .Font.Size = 12
        .Font.Bold = msoTrue
    End With
    
    ' Parameters box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 335, 650, 75)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 248, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "PARAMETERS:" & vbCrLf & _
                                     "[bullet] First step: h = [Delta]u_1 (e.g., 10^-^3 eV)" & vbCrLf & _
                                     "[bullet] Ratio: a [approx] 1.05-1.10 (optimizes resolution vs cost)" & vbCrLf & _
                                     "[bullet] Determined from maximum energy: umax = h(1-a^{N})/(1-a)"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Name = "Cambria Math"
    End With
    
    ' ========================================
    ' SLIDE 24: VARIABLE GRID - BENCHMARK
    ' ========================================
    Set sld = ppt.Slides.Add(24, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Variable Grid: Benchmark Results"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Gráfico erro relativo
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\benchmark\efficiency_error_evolution.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 310
    
    ' Gráfico convergência
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\benchmark\grid_convergence_analysis.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=390, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 310
    
    ' Key result
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 260, 650, 70)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "KEY RESULT:" & vbCrLf & _
                                     "Error < 2% using only 20% of uniform grid points" & vbCrLf & _
                                     "200 points (variable) [approx] 1000 points (uniform)" & vbCrLf & _
                                     "-> 80% REDUCTION in computational cost!"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Validation tests
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 340, 650, 70)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 248, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "VALIDATION with analytical distributions:" & vbCrLf & _
                                     "[bullet] Maxwellian (elastic only, E/N=0): mean error < 30%" & vbCrLf & _
                                     "[bullet] Maxwellian (with e-e collisions, E/N=1 Td): mean error < 0.4%" & vbCrLf & _
                                     "[bullet] Druyvesteyn (high E/N=100 Td): mean error < 0.14%"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' ========================================
    ' SLIDE 25: GUI FOR LoKI-B
    ' ========================================
    Set sld = ppt.Slides.Add(25, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "GUI for LoKI-B: Democratizing Access"
        .Font.Size = 32
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Screenshot GUI real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\gui1.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=50, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' Features box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 310, 420, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "FEATURES:" & vbCrLf & _
                                     "[bullet] Hierarchical organization (6 tabs)" & vbCrLf & _
                                     "[bullet] Real-time validation ([check]/[cross])" & vbCrLf & _
                                     "[bullet] File browsers with path check" & vbCrLf & _
                                     "[bullet] Array support: logspace(-3,3,100)" & vbCrLf & _
                                     "[bullet] 'Generate & Run' seamless workflow"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' Links box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 480, 310, 220, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 240, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "AVAILABILITY:" & vbCrLf & vbCrLf & _
                                     "github.com/" & vbCrLf & _
                                     "mr-arpg/LoKI-B" & vbCrLf & vbCrLf & _
                                     "Future:" & vbCrLf & _
                                     "Extension to LoKI-C"
        .TextFrame.TextRange.Font.Size = 13
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' ========================================
    ' SLIDE 26: ML - MOTIVATION
    ' ========================================
    Set sld = ppt.Slides.Add(26, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Machine Learning: The Motivation"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Problem statement
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "THE PROBLEM:" & vbCrLf & _
                                     "Complex chemical schemes: >100 species, >1000 reactions" & vbCrLf & _
                                     "Computational cost prohibitive for 2D/3D reactor simulations" & vbCrLf & _
                                     "Which reactions are truly important?"
        .TextFrame.TextRange.Font.Size = 18
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Goal
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 155, 650, 80)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "GOAL:" & vbCrLf & _
                                     "Automated chemistry reduction" & vbCrLf & _
                                     "Identify important vs negligible reactions" & vbCrLf & _
                                     "Preserve accuracy while reducing computational cost"
        .TextFrame.TextRange.Font.Size = 18
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Traditional approach
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 245, 310, 165)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 230, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "TRADITIONAL:" & vbCrLf & _
                                     "Sensitivity analysis" & vbCrLf & _
                                     "Reaction flow analysis" & vbCrLf & vbCrLf & _
                                     "[cross] Laborious" & vbCrLf & _
                                     "[cross] Requires many" & vbCrLf & _
                                     "   simulations" & vbCrLf & _
                                     "[cross] Local (condition-" & vbCrLf & _
                                     "   specific)"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' ML approach
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 390, 245, 310, 165)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "MACHINE LEARNING:" & vbCrLf & _
                                     "Learn from data" & vbCrLf & _
                                     "(full model simulations)" & vbCrLf & vbCrLf & _
                                     "[check] Automated" & vbCrLf & _
                                     "[check] Global representation" & vbCrLf & _
                                     "   (wide conditions)" & vbCrLf & _
                                     "[check] Identifies patterns"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' ========================================
    ' SLIDE 27: PETRI NET REPRESENTATION
    ' ========================================
    Set sld = ppt.Slides.Add(27, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Petri Net Representation"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Concept box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 50, 300, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 248, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "CONCEPT:" & vbCrLf & _
                                     "[bullet] Places ([whitecircle]) = species" & vbCrLf & _
                                     "[bullet] Transitions ([rectangle]) = reactions" & vbCrLf & _
                                     "[bullet] Tokens ([blackcircle]) = concentrations" & vbCrLf & _
                                     "[bullet] Arcs = stoichiometry"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Mathematical framework APAGAR COMENTARIOS
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 360, 50, 340, 120)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 248, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "MATHEMATICAL:" & vbCrLf & _
           "Linear system:  y = Ax + b" & vbCrLf & vbCrLf & _
                                     "A = incidence matrix (stoichiometry)" & vbCrLf & _
                                     "x = firing vector (reaction weights)" & vbCrLf & _
                                     "y = final species distribution" & vbCrLf & _
                                     "b = initial distribution"
            .TextFrame.TextRange.Font.Size = 13
            .TextFrame.TextRange.Font.Name = "Cambria Math"
      End With
    
    ' Petri net real
    imagePath = "C:\Users\Armando RPG\OneDrive - Universidade de Lisboa\Documentos\IST\MEFT\Tese\Dissertação\Images\ml\pnArgon.png"
    Set shp = sld.Shapes.AddPicture( _
        FileName:=imagePath, _
        LinkToFile:=msoFalse, _
        SaveWithDocument:=msoTrue, _
        Left:=50, _
        Top:=180, _
        Width:=-1, _
        Height:=-1)
    shp.LockAspectRatio = msoTrue
    shp.Width = 650
    
    ' ========================================
    ' SLIDE 28: ML APPROACH & CHALLENGES
    ' ========================================
    Set sld = ppt.Slides.Add(28, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "ML Approach & Challenges"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Method flowchart
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 50, 650, 140)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "METHOD (Ferreira et al. 2024):" & vbCrLf & vbCrLf & _
                                     "Input: b, y (initial/final species) -> ML model with constraints:" & vbCrLf & _
                                     "   [bullet] ReLU: x~ [ge] 0 (non-negative reaction rates)" & vbCrLf & _
                                     "   [bullet] Softmax: normalization (Volume/Surface separate)" & vbCrLf & _
                                     "-> Output: x~ (reaction importance weights)" & vbCrLf & _
                                     "-> Optimization: minimize KL divergence using Adam optimizer"
        .TextFrame.TextRange.Font.Size = 14
        .TextFrame.TextRange.Font.Name = "Cambria Math"
    End With
    
    ' Challenges identified
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 200, 650, 210)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 240, 240)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "CHALLENGES IDENTIFIED:" & vbCrLf & vbCrLf & _
                                     "1. MATRIX DEGENERACY:" & vbCrLf & _
                                     "   Different reactions -> identical matrix columns" & vbCrLf & _
                                     "   Example: e + Ar(^3P_2) -> e + Ar(^1S_0)  vs  Ar(^3P_2) + wall -> Ar(^1S_0)" & vbCrLf & _
                                     "   Both reduce to: [Ar(^3P_2)] [downarrow], [Ar(^1S_0)] [uparrow]" & vbCrLf & vbCrLf & _
                                     "2. CONSTRAINT ENFORCEMENT:" & vbCrLf & _
                                     "   Sequential ReLU->Softmax creates inconsistency" & vbCrLf & _
                                     "   Solution: Karush-Kuhn-Tucker (KKT) optimization" & vbCrLf & vbCrLf & _
                                     "3. MISSING 'WALL' SPECIES in matrix formulation"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' ========================================
    ' SLIDE 29: ML FUTURE WORK
    ' ========================================
    Set sld = ppt.Slides.Add(29, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "ML Framework: Future Directions"
        .Font.Size = 36
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Solutions proposed
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 150)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 255, 200)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "PROPOSED SOLUTIONS:" & vbCrLf & vbCrLf & _
                                     "[bullet] KKT constrained optimization (replace ReLU->Softmax sequential)" & vbCrLf & _
                                     "[bullet] Dual-matrix representation:" & vbCrLf & _
                                     "    - Full stoichiometry (including spectators) for identification" & vbCrLf & _
                                     "    - Reduced stoichiometry for balance calculations" & vbCrLf & _
                                     "[bullet] Explicit 'wall' species treatment in matrix" & vbCrLf & _
                                     "[bullet] Bayesian frameworks for rate coefficient uncertainties"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Extension plan
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 215, 650, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "EXTENSION PLAN:" & vbCrLf & vbCrLf & _
                                     "1. Resolve degeneracy issues in Ar-test system" & vbCrLf & _
                                     "2. Validate reduction methodology (compare reduced vs full scheme)" & vbCrLf & _
                                     "3. Apply to full N_2-H_2 kinetic scheme (>1000 reactions)" & vbCrLf & _
                                     "4. Enable efficient 2D/3D reactor simulations"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' GitHub link
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 325, 650, 85)
    With shp
        .Fill.ForeColor.RGB = RGB(240, 240, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "EXPLORATORY FRAMEWORK AVAILABLE:" & vbCrLf & vbCrLf & _
                                     "github.com/mr-arpg/PlasmaNetwork" & vbCrLf & _
                                     "(Petri net tools, ML training scripts, visualization)"
        .TextFrame.TextRange.Font.Size = 16
        .TextFrame.TextRange.Font.Bold = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 30: MAIN CONTRIBUTIONS
    ' ========================================
    Set sld = ppt.Slides.Add(30, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Main Contributions"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' 1. EXPERIMENTAL
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 230, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "1. EXPERIMENTAL (non-catalytic, SiO_2 surfaces):" & vbCrLf & _
                                     "   [check] Thermal equilibration: long timescales discovered ([plusminus]50 K bands justified)" & vbCrLf & _
                                     "   [check] Peak [NH_3] [approx] 70% H_2 (0.91% @ 200 Pa, 0.74% @ 665 Pa)" & vbCrLf & _
                                     "   [check] COUNTER-INTUITIVE: Higher production at LOWER pressure" & vbCrLf & _
                                     "   [check] Systematic temperature characterization (Tgas, Twall)"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' 2. KINETIC MODELING
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 165, 650, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "2. KINETIC MODELING:" & vbCrLf & _
                                     "   [check] Comprehensive database (>100 species, critical literature review)" & vbCrLf & _
                                     "   [check] Order-of-magnitude discrepancies identified and resolved" & vbCrLf & _
                                     "   [check] Multi-parameter validation: E/N, [N], [H], [NH_3]" & vbCrLf & _
                                     "   [check] KEY INSIGHT: Residence time critical for [NH_3] quantification" & vbCrLf & _
                                     "   [check] Volume-surface coupling via mesoscopic model (Gordiets 1998)"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' 3. COMPUTATIONAL TOOLS
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 275, 650, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 230, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "3. COMPUTATIONAL TOOLS:" & vbCrLf & _
                                     "   [check] Variable energy grid: -80% cost, <2% error (continuous operators)" & vbCrLf & _
                                     "   [check] GUI for LoKI-B (democratizing access to community)" & vbCrLf & _
                                     "   [check] ML framework foundations established:" & vbCrLf & _
                                     "      - Petri net representation implemented" & vbCrLf & _
                                     "      - Technical challenges identified (degeneracy, constraints)"
        .TextFrame.TextRange.Font.Size = 13
    End With
    
    ' Open source note
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 385, 650, 30)
    With shp.TextFrame.TextRange
        .Text = "All tools publicly available: github.com/mr-arpg/LoKI-B  [bullet]  github.com/mr-arpg/PlasmaNetwork"
        .Font.Size = 12
        .Font.Italic = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' SLIDE 31: OUTLOOK & VISION
    ' ========================================
    Set sld = ppt.Slides.Add(31, ppLayoutBlank)
    ' Título
    Set shp = sld.Shapes.AddTextbox(msoTextOrientationHorizontal, 50, 10, 600, 35)
    With shp.TextFrame.TextRange
        .Text = "Outlook & Vision"
        .Font.Size = 40
        .Font.Bold = msoTrue
        .ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' Short-term
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 55, 650, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(255, 250, 230)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "SHORT-TERM PRIORITIES:" & vbCrLf & _
                                     "[bullet] Refinement of surface kinetics (desorption frequencies, activation energies)" & vbCrLf & _
                                     "[bullet] FTIR improvements (independent calibration, alternative window materials)" & vbCrLf & _
                                     "[bullet] Time-dependent Boltzmann-Chemistry coupling" & vbCrLf & _
                                     "[bullet] Thermal model integration in LoKI-B+C framework"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Medium-term
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 155, 650, 90)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 255)
        .Line.weight = 2
        .TextFrame.TextRange.Text = "MEDIUM-TERM:" & vbCrLf & _
                                     "[bullet] Extension to CATALYTIC conditions (different surface materials)" & vbCrLf & _
                                     "[bullet] Variable grid for DISCRETE operators (inelastic collisions)" & vbCrLf & _
                                     "[bullet] GUI for LoKI-C (chemistry input interface)" & vbCrLf & _
                                     "[bullet] ML improvements: KKT optimization, dual-matrix, Bayesian uncertainties"
        .TextFrame.TextRange.Font.Size = 14
    End With
    
    ' Vision box
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 255, 650, 100)
    With shp
        .Fill.ForeColor.RGB = RGB(230, 255, 230)
        .Line.weight = 3
        .TextFrame.TextRange.Text = "VISION: Plasma-assisted NH_3 synthesis" & vbCrLf & _
                                     "   Sustainable [check]   Decentralized [check]   Renewable-powered [check]" & vbCrLf & vbCrLf & _
                                     "Challenges remain:" & vbCrLf & _
                                     "   [bullet] Energy efficiency (5-10[times] improvement needed)" & vbCrLf & _
                                     "   [bullet] Deep understanding of surface mechanisms" & vbCrLf & _
                                     "   [bullet] Scale-up to industrial conditions"
        .TextFrame.TextRange.Font.Size = 15
        .TextFrame.TextRange.Font.Bold = msoTrue
    End With
    
    ' Closing message
    Set shp = sld.Shapes.AddShape(msoShapeRoundedRectangle, 50, 365, 650, 55)
    With shp
        .Fill.ForeColor.RGB = RGB(200, 220, 255)
        .Line.weight = 3
        .TextFrame.TextRange.Text = Chr(34) & "The plasma way to ammonia is scientifically fascinating and" & vbCrLf & _
                                     "technologically promising. This thesis provides validated tools," & vbCrLf & _
                                     "curated databases, and physical insights - a foundation for" & vbCrLf & _
                                     "continued innovation toward industrial reality." & Chr(34)
        .TextFrame.TextRange.Font.Size = 12
        .TextFrame.TextRange.Font.Italic = msoTrue
        .TextFrame.TextRange.ParagraphFormat.Alignment = ppAlignCenter
    End With
    
    ' ========================================
    ' APPLY DESIGN THEME TO ALL SLIDES
    ' ========================================
    ApplyThemeToPresentation ppt
    
    ' Message
    MsgBox "Presentation created successfully!" & vbCrLf & vbCrLf & _
           "Total slides: " & ppt.Slides.Count & vbCrLf & vbCrLf & _
           "Next steps:" & vbCrLf & _
           "1. Ajustar dimensões/posicionamento das figuras conforme necessário" & vbCrLf & _
           "2. Rever timings e conteúdos", vbInformation, "Thesis Presentation Created"
    
End Sub

' ========================================
' HELPER FUNCTIONS
' ========================================

Sub DrawArrow(sld As Slide, x1 As Single, y1 As Single, x2 As Single, y2 As Single, clr As Long, weight As Single)
    Dim shp As Shape
    Set shp = sld.Shapes.AddLine(x1, y1, x2, y2)
    With shp.Line
        .weight = weight
        .ForeColor.RGB = clr
        .EndArrowheadStyle = msoArrowheadTriangle
        .EndArrowheadLength = msoArrowheadLengthMedium
        .EndArrowheadWidth = msoArrowheadWidthMedium
    End With
End Sub

Sub DrawCurvedArrow(sld As Slide, x1 As Single, y1 As Single, xMid As Single, yMid As Single, x2 As Single, y2 As Single, clr As Long, weight As Single)
    Dim shp As Shape
    ' Draw as connector (approximation of curved arrow)
    Set shp = sld.Shapes.AddConnector(msoConnectorCurve, x1, y1, x2, y2)
    With shp.Line
        .weight = weight
        .ForeColor.RGB = clr
        .EndArrowheadStyle = msoArrowheadTriangle
        .EndArrowheadLength = msoArrowheadLengthMedium
        .EndArrowheadWidth = msoArrowheadWidthMedium
    End With
End Sub

Sub ApplyThemeToPresentation(ppt As Presentation)
    Dim sld As Slide
    For Each sld In ppt.Slides
        ApplyThemeToSlide sld
    Next sld
End Sub

Sub ApplyThemeToSlide(sld As Slide)
    Dim shp As Shape
    sld.FollowMasterBackground = msoFalse
    sld.Background.Fill.ForeColor.RGB = RGB(18, 24, 38)
    
    For Each shp In sld.Shapes
        If shp.HasTextFrame Then
            If shp.TextFrame.HasText Then
                ApplyTextStyling shp
            End If
        End If
    Next shp
End Sub

Sub ApplyTextStyling(shp As Shape)
    Dim rng As TextRange
    Dim isTitle As Boolean
    Dim fontSize As Single
    Dim fontBold As MsoTriState
    Dim fontItalic As MsoTriState
    Dim fontUnderline As MsoTriState
    
    Set rng = shp.TextFrame.TextRange
    fontSize = rng.Font.Size
    fontBold = rng.Font.Bold
    fontItalic = rng.Font.Italic
    fontUnderline = rng.Font.Underline
    
    rng.Text = NormalizeText(rng.Text)
    
    isTitle = False
    If shp.Type = msoPlaceholder Then
        On Error Resume Next
        Select Case shp.PlaceholderFormat.Type
            Case ppPlaceholderTitle, ppPlaceholderCenterTitle
                isTitle = True
            Case Else
                isTitle = False
        End Select
        On Error GoTo 0
    End If
    
    With rng.Font
        .Name = IIf(isTitle, "Klavika Bd", "Klavika Lt")
        .Color.RGB = RGB(255, 255, 255)
        If fontSize > 0 Then .Size = fontSize
        .Bold = fontBold
        .Italic = fontItalic
        .Underline = fontUnderline
    End With
    
    AdjustShapeFillForContrast shp
End Sub

Sub AdjustShapeFillForContrast(shp As Shape)
    Dim clr As Long
    Dim r As Double
    Dim g As Double
    Dim b As Double
    Dim brightness As Double
    
    If shp.Fill.Visible <> msoTrue Then Exit Sub
    If shp.Fill.Type = msoFillBackground Then Exit Sub
    
    On Error Resume Next
    If shp.Fill.ForeColor.Type = msoColorTypeRGB Then
        clr = shp.Fill.ForeColor.RGB
        r = clr And &HFF&
        g = (clr \ &H100) And &HFF&
        b = (clr \ &H10000) And &HFF&
        
        brightness = 0.299 * r + 0.587 * g + 0.114 * b
        If brightness > 160 Then
            r = ClampColor(r * 0.35)
            g = ClampColor(g * 0.35)
            b = ClampColor(b * 0.35)
            shp.Fill.ForeColor.RGB = RGB(CLng(r), CLng(g), CLng(b))
        End If
    Else
        shp.Fill.ForeColor.RGB = RGB(40, 40, 40)
    End If
    On Error GoTo 0
End Sub

Function ClampColor(value As Double) As Long
    If value < 0 Then value = 0
    If value > 255 Then value = 255
    ClampColor = CLng(value)
End Function

Function NormalizeText(inputText As String) As String
    Dim result As String
    result = inputText
    
    result = ReplaceTokenStrings(result)
    result = ReplaceSuperscripts(result)
    result = ReplaceSubscripts(result)
    result = Replace(result, "x~", "x" & ChrW(&H303))
    result = Replace(result, "[vector]", ChrW(&H20D7))
    
    NormalizeText = result
End Function

Function ReplaceTokenStrings(textValue As String) As String
    Dim result As String
    result = textValue
    
    result = Replace(result, "[check]", ChrW(&H2713))
    result = Replace(result, "[cross]", ChrW(&H2717))
    result = Replace(result, "[bullet]", ChrW(&H2022))
    result = Replace(result, "[Delta]", ChrW(&H394))
    result = Replace(result, "[Sigma]", ChrW(&H3A3))
    result = Replace(result, "[Pi]", ChrW(&H3A0))
    result = Replace(result, "[tau]", ChrW(&H3C4))
    result = Replace(result, "[chi]", ChrW(&H3C7))
    result = Replace(result, "[mu]", ChrW(&H3BC))
    result = Replace(result, "[plusminus]", ChrW(&HB1))
    result = Replace(result, "[approx]", ChrW(&H2248))
    result = Replace(result, "[ge]", ChrW(&H2265))
    result = Replace(result, "[deg]", ChrW(&HB0))
    result = Replace(result, "[times]", ChrW(&HD7))
    result = Replace(result, "[circle]", ChrW(&H2218))
    result = Replace(result, "[whitecircle]", ChrW(&H25CB))
    result = Replace(result, "[blackcircle]", ChrW(&H25CF))
    result = Replace(result, "[triangle]", ChrW(&H25BD))
    result = Replace(result, "[rectangle]", ChrW(&H25AD))
    result = Replace(result, "[uparrow]", ChrW(&H2191))
    result = Replace(result, "[downarrow]", ChrW(&H2193))
    result = Replace(result, "[partial]", ChrW(&H2202))
    result = Replace(result, "[nabla]", ChrW(&H2207))
    result = Replace(result, "[sqrt]", ChrW(&H221A))
    result = Replace(result, "<->", ChrW(&H21C4))
    result = Replace(result, "->", ChrW(&H2192))
    result = Replace(result, "<-", ChrW(&H2190))
    
    ReplaceTokenStrings = result
End Function

Function ReplaceSuperscripts(ByVal textValue As String) As String
    Dim startPos As Long
    Dim endPos As Long
    Dim inner As String
    Dim replacement As String
    
    Do
        startPos = InStr(textValue, "^{")
        If startPos = 0 Then Exit Do
        endPos = InStr(startPos + 2, textValue, "}")
        If endPos = 0 Then Exit Do
        inner = Mid$(textValue, startPos + 2, endPos - startPos - 2)
        replacement = BuildSuperscriptString(inner)
        textValue = Left$(textValue, startPos - 1) & replacement & Mid$(textValue, endPos + 1)
    Loop
    
    Dim i As Long
    i = 1
    Do While i <= Len(textValue)
        If Mid$(textValue, i, 1) = "^" And i < Len(textValue) Then
            Dim supChar As String
            supChar = SuperscriptChar(Mid$(textValue, i + 1, 1))
            If supChar <> "" Then
                textValue = Left$(textValue, i - 1) & supChar & Mid$(textValue, i + 2)
            Else
                i = i + 1
            End If
        Else
            i = i + 1
        End If
    Loop
    
    ReplaceSuperscripts = textValue
End Function

Function ReplaceSubscripts(ByVal textValue As String) As String
    Dim startPos As Long
    Dim endPos As Long
    Dim inner As String
    Dim replacement As String
    Dim i As Long
    
    Do
        startPos = InStr(textValue, "_(")
        If startPos = 0 Then Exit Do
        endPos = InStr(startPos + 2, textValue, ")")
        If endPos = 0 Then Exit Do
        inner = Mid$(textValue, startPos + 2, endPos - startPos - 2)
        replacement = BuildSubscriptString(inner)
        textValue = Left$(textValue, startPos - 1) & replacement & Mid$(textValue, endPos + 1)
    Loop
    
    i = 1
    Do While i <= Len(textValue)
        If Mid$(textValue, i, 1) = "_" And i < Len(textValue) Then
            Dim subChar As String
            subChar = SubscriptChar(Mid$(textValue, i + 1, 1))
            If subChar <> "" Then
                textValue = Left$(textValue, i - 1) & subChar & Mid$(textValue, i + 2)
            Else
                i = i + 1
            End If
        Else
            i = i + 1
        End If
    Loop
    
    ReplaceSubscripts = textValue
End Function

Function BuildSuperscriptString(ByVal content As String) As String
    Dim i As Long
    Dim buffer As String
    buffer = ""
    For i = 1 To Len(content)
        buffer = buffer & SuperscriptChar(Mid$(content, i, 1))
    Next i
    BuildSuperscriptString = buffer
End Function

Function BuildSubscriptString(ByVal content As String) As String
    Dim i As Long
    Dim buffer As String
    buffer = ""
    For i = 1 To Len(content)
        buffer = buffer & SubscriptChar(Mid$(content, i, 1))
    Next i
    BuildSubscriptString = buffer
End Function

Function SuperscriptChar(ByVal ch As String) As String
    Select Case ch
        Case "0": SuperscriptChar = ChrW(&H2070)
        Case "1": SuperscriptChar = ChrW(&HB9)
        Case "2": SuperscriptChar = ChrW(&HB2)
        Case "3": SuperscriptChar = ChrW(&HB3)
        Case "4": SuperscriptChar = ChrW(&H2074)
        Case "5": SuperscriptChar = ChrW(&H2075)
        Case "6": SuperscriptChar = ChrW(&H2076)
        Case "7": SuperscriptChar = ChrW(&H2077)
        Case "8": SuperscriptChar = ChrW(&H2078)
        Case "9": SuperscriptChar = ChrW(&H2079)
        Case "+": SuperscriptChar = ChrW(&H207A)
        Case "-": SuperscriptChar = ChrW(&H207B)
        Case "N", "n": SuperscriptChar = ChrW(&H1D3A)
        Case Else: SuperscriptChar = ch
    End Select
End Function

Function SubscriptChar(ByVal ch As String) As String
    Select Case ch
        Case "0": SubscriptChar = ChrW(&H2080)
        Case "1": SubscriptChar = ChrW(&H2081)
        Case "2": SubscriptChar = ChrW(&H2082)
        Case "3": SubscriptChar = ChrW(&H2083)
        Case "4": SubscriptChar = ChrW(&H2084)
        Case "5": SubscriptChar = ChrW(&H2085)
        Case "6": SubscriptChar = ChrW(&H2086)
        Case "7": SubscriptChar = ChrW(&H2087)
        Case "8": SubscriptChar = ChrW(&H2088)
        Case "9": SubscriptChar = ChrW(&H2089)
        Case "+": SubscriptChar = ChrW(&H208A)
        Case "-": SubscriptChar = ChrW(&H208B)
        Case "(": SubscriptChar = ChrW(&H208D)
        Case ")": SubscriptChar = ChrW(&H208E)
        Case "v", "V": SubscriptChar = ChrW(&H1D65)
        Case "n", "N": SubscriptChar = ChrW(&H2099)
        Case Else: SubscriptChar = ch
    End Select
End Function


