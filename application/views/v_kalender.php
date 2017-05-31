<?php
  if (empty($this->uri->segment(2))) {
    $judul = $waktu = null;
  } else {
    $judul = $detail->title;
    $waktu = $detail->start;
  }
?>
<section class="content">
  <div class="row">
    <div class="col-md-4">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Kalender</h3>
        </div>
        <div class="box-body">
          <?= form_open() ?>
            <div class="form-group">
              <label for="judul">Judul Kegiatan</label>
              <input type="text" class="form-control" name="judul" value="<?= $judul ?>">
            </div>
            <div class="form-group">
              <label for="waktu">Waktu Kegiatan</label>
              <input type="text" class="form-control" id="datetimepicker" name="waktu" value="<?= $waktu ?>">
            </div>
            <button class="btn btn-primary" type="submit">Simpan</button>
          <?= form_close() ?> 
        </div>
      </div>
      <div class="box box-warning">
        <div class="box-header with-border">
          <h3 class="box-title">Daftar Kegiatan</h3>
        </div>
        <div class="box-body">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Judul</th>
                  <th>Waktu</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <?php if (empty($data)): ?>
                  <tr>
                    <td colspan="3" class="text-center">Data Kosong</td>
                  </tr>
                <?php else: ?>
                  <?php foreach ($data as $agenda): ?>
                    <tr>
                      <td><a href="<?= base_url('kalender/edit/'.$agenda['id'])?>"><?= $agenda['title']?></a></td>
                      <td><?= $agenda['start']?></td>
                      <td><a href="<?= base_url('kalender/delete/'.$agenda['id'])?>" class="btn btn-danger btn-xs">Hapus</a></td>
                    </tr>
                  <?php endforeach ?>
                <?php endif ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-8">
      <div class="box box-primary">
        <div class="box-body no-padding">
          <div id="calendar"></div>
        </div> <!-- /.box-body -->
      </div> <!-- /.box -->
    </div> <!-- /.col-md-9 -->
  </div> <!-- /.row -->
</section>
<script>
$(document).ready(function(){
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    navLinks: true,
    eventLimit: true,
    events: <?= json_encode($data) ?>
  });
  $('#datetimepicker').datetimepicker({
    language:  'id',
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    forceParse: 0,
    showMeridian: 1,
    format: "yyyy-mm-dd hh:ii:ss",
    locale: "id"
  });
});
</script>