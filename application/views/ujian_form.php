<!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                
                  <h3 class='box-title'>UJIAN</h3>
                      <div class='box box-primary'>
        <form action="<?php echo $action; ?>" method="post"><table class='table table-bordered'>
	    <tr><td>Id Siswa <?php echo form_error('id_siswa') ?></td>
            <td><input type="text" class="form-control" name="id_siswa" id="id_siswa" placeholder="Id Siswa" value="<?php echo $id_siswa; ?>" />
        </td>
	    <tr><td>Id Kelas <?php echo form_error('id_kelas') ?></td>
            <td><input type="text" class="form-control" name="id_kelas" id="id_kelas" placeholder="Id Kelas" value="<?php echo $id_kelas; ?>" />
        </td>
	    <tr><td>Id Materi <?php echo form_error('id_materi') ?></td>
            <td><input type="text" class="form-control" name="id_materi" id="id_materi" placeholder="Id Materi" value="<?php echo $id_materi; ?>" />
        </td>
	    <tr><td>Id Uas <?php echo form_error('id_uas') ?></td>
            <td><input type="text" class="form-control" name="id_uas" id="id_uas" placeholder="Id Uas" value="<?php echo $id_uas; ?>" />
        </td>
	    <tr><td>Nilai <?php echo form_error('nilai') ?></td>
            <td><input type="text" class="form-control" name="nilai" id="nilai" placeholder="Nilai" value="<?php echo $nilai; ?>" />
        </td>
	    <input type="hidden" name="id_ujian" value="<?php echo $id_ujian; ?>" /> 
	    <tr><td colspan='2'><button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('ujian') ?>" class="btn btn-default">Cancel</a></td></tr>
	
    </table></form>
    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->