<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Siswa extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Siswa_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $siswa = $this->Siswa_model->get_all_query();

        $data = array(
            'siswa_data' => $siswa
        );

        $this->template->load('template','siswa_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Siswa_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id_siswa' => $row->id_siswa,
		'nama_lengkap' => $row->nama_lengkap,
		'nama_panggilan' => $row->nama_panggilan,
		'tempat_lahir' => $row->tempat_lahir,
		'tanggal_lahir' => $row->tanggal_lahir,
		'umur' => $row->umur,
		'jenis_kelamnin' => $row->jenis_kelamnin,
		'golongan_darah' => $row->golongan_darah,
		'alamat' => $row->alamat,
		'provinsi' => $row->provinsi,
		'kabupaten' => $row->kabupaten,
		'kecamatan' => $row->kecamatan,
		'nama_ayah' => $row->nama_ayah,
		'pekerjaan_ayah' => $row->pekerjaan_ayah,
		'nama_ibu' => $row->nama_ibu,
		'pekerjaan_ibu' => $row->pekerjaan_ibu,
		'jumlah_saudara' => $row->jumlah_saudara,
		'urutan' => $row->urutan,
		'universitas' => $row->universitas,
		'fakultas' => $row->fakultas,
		'prodi' => $row->prodi,
		'id_jurusan' => $row->id_jurusan,
		'angkatan_universitas' => $row->angkatan_universitas,
		'tahun_masuk_universitas' => $row->tahun_masuk_universitas,
		'angkatan_ppm' => $row->angkatan_ppm,
		'tahun_masuk_ppm' => $row->tahun_masuk_ppm,
		'kelas' => $row->kelas,
		'id_kelas' => $row->id_kelas,
	    );
            $this->template->load('template','siswa_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('siswa'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('siswa/create_action'),
	    'id_siswa' => set_value('id_siswa'),
	    'nama_lengkap' => set_value('nama_lengkap'),
	    'nama_panggilan' => set_value('nama_panggilan'),
	    'tempat_lahir' => set_value('tempat_lahir'),
	    'tanggal_lahir' => set_value('tanggal_lahir'),
	    'umur' => set_value('umur'),
	    'jenis_kelamnin' => set_value('jenis_kelamnin'),
	    'golongan_darah' => set_value('golongan_darah'),
	    'alamat' => set_value('alamat'),
	    'provinsi' => set_value('provinsi'),
	    'kabupaten' => set_value('kabupaten'),
	    'kecamatan' => set_value('kecamatan'),
	    'nama_ayah' => set_value('nama_ayah'),
	    'pekerjaan_ayah' => set_value('pekerjaan_ayah'),
	    'nama_ibu' => set_value('nama_ibu'),
	    'pekerjaan_ibu' => set_value('pekerjaan_ibu'),
	    'jumlah_saudara' => set_value('jumlah_saudara'),
	    'urutan' => set_value('urutan'),
	    'universitas' => set_value('universitas'),
	    'fakultas' => set_value('fakultas'),
	    'prodi' => set_value('prodi'),
	    'id_jurusan' => set_value('id_jurusan'),
	    'angkatan_universitas' => set_value('angkatan_universitas'),
	    'tahun_masuk_universitas' => set_value('tahun_masuk_universitas'),
	    'angkatan_ppm' => set_value('angkatan_ppm'),
	    'tahun_masuk_ppm' => set_value('tahun_masuk_ppm'),
	    'kelas' => set_value('kelas'),
	    'id_kelas' => set_value('id_kelas'),
	);
        $this->template->load('template','siswa_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'nama_lengkap' => $this->input->post('nama_lengkap',TRUE),
		'nama_panggilan' => $this->input->post('nama_panggilan',TRUE),
		'tempat_lahir' => $this->input->post('tempat_lahir',TRUE),
		'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
		'umur' => $this->input->post('umur',TRUE),
		'jenis_kelamnin' => $this->input->post('jenis_kelamnin',TRUE),
		'golongan_darah' => $this->input->post('golongan_darah',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'provinsi' => $this->input->post('provinsi',TRUE),
		'kabupaten' => $this->input->post('kabupaten',TRUE),
		'kecamatan' => $this->input->post('kecamatan',TRUE),
		'nama_ayah' => $this->input->post('nama_ayah',TRUE),
		'pekerjaan_ayah' => $this->input->post('pekerjaan_ayah',TRUE),
		'nama_ibu' => $this->input->post('nama_ibu',TRUE),
		'pekerjaan_ibu' => $this->input->post('pekerjaan_ibu',TRUE),
		'jumlah_saudara' => $this->input->post('jumlah_saudara',TRUE),
		'urutan' => $this->input->post('urutan',TRUE),
		'universitas' => $this->input->post('universitas',TRUE),
		'fakultas' => $this->input->post('fakultas',TRUE),
		'prodi' => $this->input->post('prodi',TRUE),
		'id_jurusan' => $this->input->post('id_jurusan',TRUE),
		'angkatan_universitas' => $this->input->post('angkatan_universitas',TRUE),
		'tahun_masuk_universitas' => $this->input->post('tahun_masuk_universitas',TRUE),
		'angkatan_ppm' => $this->input->post('angkatan_ppm',TRUE),
		'tahun_masuk_ppm' => $this->input->post('tahun_masuk_ppm',TRUE),
		'kelas' => $this->input->post('kelas',TRUE),
		'id_kelas' => $this->input->post('id_kelas',TRUE),
	    );

            $this->Siswa_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('siswa'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Siswa_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('siswa/update_action'),
		'id_siswa' => set_value('id_siswa', $row->id_siswa),
		'nama_lengkap' => set_value('nama_lengkap', $row->nama_lengkap),
		'nama_panggilan' => set_value('nama_panggilan', $row->nama_panggilan),
		'tempat_lahir' => set_value('tempat_lahir', $row->tempat_lahir),
		'tanggal_lahir' => set_value('tanggal_lahir', $row->tanggal_lahir),
		'umur' => set_value('umur', $row->umur),
		'jenis_kelamnin' => set_value('jenis_kelamnin', $row->jenis_kelamnin),
		'golongan_darah' => set_value('golongan_darah', $row->golongan_darah),
		'alamat' => set_value('alamat', $row->alamat),
		'provinsi' => set_value('provinsi', $row->provinsi),
		'kabupaten' => set_value('kabupaten', $row->kabupaten),
		'kecamatan' => set_value('kecamatan', $row->kecamatan),
		'nama_ayah' => set_value('nama_ayah', $row->nama_ayah),
		'pekerjaan_ayah' => set_value('pekerjaan_ayah', $row->pekerjaan_ayah),
		'nama_ibu' => set_value('nama_ibu', $row->nama_ibu),
		'pekerjaan_ibu' => set_value('pekerjaan_ibu', $row->pekerjaan_ibu),
		'jumlah_saudara' => set_value('jumlah_saudara', $row->jumlah_saudara),
		'urutan' => set_value('urutan', $row->urutan),
		'universitas' => set_value('universitas', $row->universitas),
		'fakultas' => set_value('fakultas', $row->fakultas),
		'prodi' => set_value('prodi', $row->prodi),
		'id_jurusan' => set_value('id_jurusan', $row->id_jurusan),
		'angkatan_universitas' => set_value('angkatan_universitas', $row->angkatan_universitas),
		'tahun_masuk_universitas' => set_value('tahun_masuk_universitas', $row->tahun_masuk_universitas),
		'angkatan_ppm' => set_value('angkatan_ppm', $row->angkatan_ppm),
		'tahun_masuk_ppm' => set_value('tahun_masuk_ppm', $row->tahun_masuk_ppm),
		'kelas' => set_value('kelas', $row->kelas),
		'id_kelas' => set_value('id_kelas', $row->id_kelas),
	    );
            $this->template->load('template','siswa_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('siswa'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_siswa', TRUE));
        } else {
            $data = array(
		'nama_lengkap' => $this->input->post('nama_lengkap',TRUE),
		'nama_panggilan' => $this->input->post('nama_panggilan',TRUE),
		'tempat_lahir' => $this->input->post('tempat_lahir',TRUE),
		'tanggal_lahir' => $this->input->post('tanggal_lahir',TRUE),
		'umur' => $this->input->post('umur',TRUE),
		'jenis_kelamnin' => $this->input->post('jenis_kelamnin',TRUE),
		'golongan_darah' => $this->input->post('golongan_darah',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'provinsi' => $this->input->post('provinsi',TRUE),
		'kabupaten' => $this->input->post('kabupaten',TRUE),
		'kecamatan' => $this->input->post('kecamatan',TRUE),
		'nama_ayah' => $this->input->post('nama_ayah',TRUE),
		'pekerjaan_ayah' => $this->input->post('pekerjaan_ayah',TRUE),
		'nama_ibu' => $this->input->post('nama_ibu',TRUE),
		'pekerjaan_ibu' => $this->input->post('pekerjaan_ibu',TRUE),
		'jumlah_saudara' => $this->input->post('jumlah_saudara',TRUE),
		'urutan' => $this->input->post('urutan',TRUE),
		'universitas' => $this->input->post('universitas',TRUE),
		'fakultas' => $this->input->post('fakultas',TRUE),
		'prodi' => $this->input->post('prodi',TRUE),
		'id_jurusan' => $this->input->post('id_jurusan',TRUE),
		'angkatan_universitas' => $this->input->post('angkatan_universitas',TRUE),
		'tahun_masuk_universitas' => $this->input->post('tahun_masuk_universitas',TRUE),
		'angkatan_ppm' => $this->input->post('angkatan_ppm',TRUE),
		'tahun_masuk_ppm' => $this->input->post('tahun_masuk_ppm',TRUE),
		'kelas' => $this->input->post('kelas',TRUE),
		'id_kelas' => $this->input->post('id_kelas',TRUE),
	    );

            $this->Siswa_model->update($this->input->post('id_siswa', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('siswa'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Siswa_model->get_by_id($id);

        if ($row) {
            $this->Siswa_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('siswa'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('siswa'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('nama_lengkap', 'nama lengkap', 'trim|required');
	$this->form_validation->set_rules('nama_panggilan', 'nama panggilan', 'trim|required');
	$this->form_validation->set_rules('tempat_lahir', 'tempat lahir', 'trim|required');
	$this->form_validation->set_rules('tanggal_lahir', 'tanggal lahir', 'trim|required');
	$this->form_validation->set_rules('umur', 'umur', 'trim|required');
	$this->form_validation->set_rules('jenis_kelamnin', 'jenis kelamnin', 'trim|required');
	$this->form_validation->set_rules('golongan_darah', 'golongan darah', 'trim|required');
	$this->form_validation->set_rules('alamat', 'alamat', 'trim|required');
	$this->form_validation->set_rules('provinsi', 'provinsi', 'trim|required');
	$this->form_validation->set_rules('kabupaten', 'kabupaten', 'trim|required');
	$this->form_validation->set_rules('kecamatan', 'kecamatan', 'trim|required');
	$this->form_validation->set_rules('nama_ayah', 'nama ayah', 'trim|required');
	$this->form_validation->set_rules('pekerjaan_ayah', 'pekerjaan ayah', 'trim|required');
	$this->form_validation->set_rules('nama_ibu', 'nama ibu', 'trim|required');
	$this->form_validation->set_rules('pekerjaan_ibu', 'pekerjaan ibu', 'trim|required');
	$this->form_validation->set_rules('jumlah_saudara', 'jumlah saudara', 'trim|required');
	$this->form_validation->set_rules('urutan', 'urutan', 'trim|required');
	$this->form_validation->set_rules('universitas', 'universitas', 'trim|required');
	$this->form_validation->set_rules('fakultas', 'fakultas', 'trim|required');
	$this->form_validation->set_rules('prodi', 'prodi', 'trim|required');
	$this->form_validation->set_rules('id_jurusan', 'id jurusan', 'trim|required');
	$this->form_validation->set_rules('angkatan_universitas', 'angkatan universitas', 'trim|required');
	$this->form_validation->set_rules('tahun_masuk_universitas', 'tahun masuk universitas', 'trim|required');
	$this->form_validation->set_rules('angkatan_ppm', 'angkatan ppm', 'trim|required');
	$this->form_validation->set_rules('tahun_masuk_ppm', 'tahun masuk ppm', 'trim|required');
	$this->form_validation->set_rules('kelas', 'kelas', 'trim|required');
	$this->form_validation->set_rules('id_kelas', 'id kelas', 'trim|required');

	$this->form_validation->set_rules('id_siswa', 'id_siswa', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file Siswa.php */
/* Location: ./application/controllers/Siswa.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-05-25 18:41:27 */
/* http://harviacode.com */