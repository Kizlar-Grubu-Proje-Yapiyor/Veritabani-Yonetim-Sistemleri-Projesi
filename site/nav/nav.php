<div class="nav-menus">
           <div class="logo">
              <a href="../index.php"> <span>LİBTÜ</span> <a/>
               <span style="font-size:10px;">kitap kovanı...</span>
           </div>
           <ul>
               
               
               
               
               <?php
               
               if(isset($_SESSION['AD']))
                  {
                   echo '<li><a href="../kutuphane/kutuphane.php">Kütüphaneler</a></li>';
                   
                      echo '<li><a href="../cikis/cikis.php">Çıkış Yap</a></li>';
                   echo '<li><a href="../uye_panel/index.php">Hi,';
                   echo $_SESSION['AD'];
                   echo '</a></li>';
                  }
                  else{
                      echo '<li><a href="../kayit/kayit.php">Üye ol</a></li>';
                      echo '<li><a href="../giris/index.php">Giriş Yap</a></li>';
                      }
                  ?>
               
               
           </ul>
            
        </div>