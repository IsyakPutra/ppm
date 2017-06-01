
        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                  <h3 class='box-title'>DAFTAR NILAI UJIAN &nbsp<?php echo anchor('ujian/create/','Tambah',array('class'=>'btn btn-warning btn-sm'));?>
		<?php echo anchor(site_url('ujian/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-success btn-sm"'); ?>
		<?php echo anchor(site_url('ujian/word'), '<i class="fa fa-file-word-o"></i> Word', 'class="btn btn-primary btn-sm"'); ?>
		<!-- <?php echo anchor(site_url('ujian/pdf'), '<i class="fa fa-file-pdf-o"></i> PDF', 'class="btn btn-primary btn-sm"'); ?></h3> -->
                </div><!-- /.box-header -->
                <div class='box-body'>
        <table class="table table-bordered table-striped" id="mytable">
            <thead>
                <tr>
                    <th width="80px">No</th>
		    <th>Nama Siswa</th>
		    <th>Guru Penguji</th>
		    <th>Kelas</th>
		    <th>Materi Ujian</th>
		    <th>UAS ke-</th>
		    <th>Nilai</th>
		    <th>Aksi</th>
                </tr>
            </thead>
	    <tbody>
            <?php
            $start = 0;
            foreach ($ujian_data as $ujian)
            {
                ?>
                <tr>
		    <td><?php echo ++$start ?></td>
		    <td><?php echo $ujian->id_siswa ?></td>
		    <td><?php echo $ujian->id_guru ?></td>
		    <td><?php echo $ujian->id_kelas ?></td>
		    <td><?php echo $ujian->id_materi ?></td>
		    <td><?php echo $ujian->id_uas ?></td>
		    <td><?php echo $ujian->nilai ?></td>
		    <td style="text-align:center" width="140px">
			<?php 
			echo anchor(site_url('ujian/read/'.$ujian->id_ujian),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-danger btn-sm')); 
			echo '  '; 
			echo anchor(site_url('ujian/update/'.$ujian->id_ujian),'<i class="fa fa-pencil-square-o"></i>',array('title'=>'edit','class'=>'btn btn-danger btn-sm')); 
			echo '  '; 
			echo anchor(site_url('ujian/delete/'.$ujian->id_ujian),'<i class="fa fa-trash-o"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Apakah anda yakin ingin menghapusnya ?\')"'); 
			?>
		    </td>
	        </tr>
                <?php
            }
            ?>
            </tbody>
        </table>
        <script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
        <script src="<?php echo base_url('assets/datatables/jquery.dataTables.js') ?>"></script>
        <script src="<?php echo base_url('assets/datatables/dataTables.bootstrap.js') ?>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#mytable").dataTable();
            });
        </script>
                    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->