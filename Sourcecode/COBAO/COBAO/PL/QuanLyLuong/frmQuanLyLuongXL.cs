﻿using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using COBAO.BLL;
using COBAO.DAL;
using DevExpress.XtraEditors.DXErrorProvider;
using DevExpress.XtraBars.Alerter;
using System.Runtime.InteropServices;
using DevExpress.XtraEditors.Controls;
using System;
using System.Collections.Generic;

namespace COBAO.PL.QuanLyLuong
{
    public partial class frmQuanLyLuongXL : DevExpress.XtraEditors.XtraForm
    {
        #region Khai báo
        private DonGiaLuongXLProvider dglxlp;
        private NhatKyDonGiaLuongXLProvider nkdglxlp;
        private NhatKyThayDoiGiaXL nkdglxl;
        List<NhatKyThayDoiGiaXL> listNhatKyThayDoiGiaXL;
        private DonGiaLuongXL dglxl;
        private Guid madglxl;
        private Guid mankdglxl;
        private string mota;
        ConditionValidationRule ruleTrong;
        private AlertControl alert;
        #endregion
        #region FormLoad
        public frmQuanLyLuongXL()
        {
            InitializeComponent();
            dglxlp = new DonGiaLuongXLProvider();
            nkdglxlp = new NhatKyDonGiaLuongXLProvider();
            listNhatKyThayDoiGiaXL = new List<NhatKyThayDoiGiaXL>();
            ruleTrong = new ConditionValidationRule();
            alert = new AlertControl { AutoFormDelay = COBAOMessage.AlertDelayTime };
        }

        private void frmQuanLyLuongXL_Load(object sender, EventArgs e)
        {           
            LoadDataSource();
        }

        private void LoadDataSource()
        {
            txtMoTa.Select();
            dtNgayNhap.EditValue = dtNgayThayDoi.EditValue = DateTime.Now;
            txtMoTa.Text = txtLoaiA.Text = txtLoaiB.Text = txtLoaiC.Text =  txtLoaiAMoi.Text = txtLoaiBMoi.Text = txtLoaiCMoi.Text = null;
            txtLoaiAMoi.Enabled = txtLoaiBMoi.Enabled = txtLoaiCMoi.Enabled = dtNgayThayDoi.Enabled = false;

            dglxlp = new DonGiaLuongXLProvider();
            nkdglxlp = new NhatKyDonGiaLuongXLProvider();
            List<NhatKyThayDoiGiaXL> dtsource = new List<NhatKyThayDoiGiaXL>();
            var a = new DonGiaLuongXLProvider().GetAll();
            foreach (var item in a)
            {
                dtsource.Add(nkdglxlp.nhomNhatKy(item.MaLuongXL));
            }
            gcDonGiaXL.DataSource = dtsource;
            lDonGiaXL.DataSource = dglxlp.GetAll();
            madglxl = new Guid("00000000-0000-0000-0000-000000000000");
            mankdglxl = new Guid("00000000-0000-0000-0000-000000000000");
            dxValid.Dispose();
            btnSuaChua.Enabled = btnXoa.Enabled = false;
            btnThemMoi.Enabled = true; 
        }
        #endregion
        #region Thêm
        private void btnThemMoi_Click(object sender, EventArgs e)
        {
            try
            {
                dxValid.Dispose();
                ruleTrong.ConditionOperator = ConditionOperator.IsNotBlank;
                if (txtMoTa.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtMoTa, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtLoaiA.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiA, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtLoaiB.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiB, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtLoaiC.Text.Trim().Length ==0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiC, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtDonViTinh.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtDonViTinh, ruleTrong);
                    dxValid.Validate();
                }
                else
                {
                    var a = new Guid();
                    a = Guid.NewGuid();
                    DonGiaLuongXL dglxl = new DonGiaLuongXL { MaLuongXL = a, MoTa = txtMoTa.Text.Trim(), DonViTinh = txtDonViTinh.Text.Trim() };
                    if (dglxlp.IsExisted(dglxl))
                    {
                        ruleTrong.ConditionOperator = ConditionOperator.IsBlank;
                        ruleTrong.ErrorText = COBAOMessage.DATONTAI;
                        dxValid.SetValidationRule(txtMoTa, ruleTrong);
                    dxValid.Validate();
                    }
                    else
                    {
                        dglxlp.Insert(dglxl);
                        nkdglxl = new NhatKyThayDoiGiaXL();
                        nkdglxl.MaLuongXL = dglxl.MaLuongXL;
                        nkdglxl.LoaiAMoi = Int32.Parse(txtLoaiA.Text.Trim());
                        nkdglxl.LoaiBMoi = Int32.Parse(txtLoaiB.Text.Trim());
                        nkdglxl.LoaiCMoi = Int32.Parse(txtLoaiC.Text.Trim());
                        nkdglxl.MaNV = COBAOMessage.nhanvien.MaNV;
                         try { nkdglxl.NgayThayDoi = DateTime.Parse(dtNgayNhap.EditValue.ToString()); }
                        catch { }
                        new NhatKyDonGiaLuongXLProvider().Insert(nkdglxl);
                        LoadDataSource();
                        clsFuntion.ShowMess(Text, COBAOMessage.THEMTHANHCONG);
                    }
                    dxValid.Validate();
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show("Lỗi: " + ex.Message, Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        #endregion
        #region thay đổi giá
        private void btnSuaChua_Click(object sender, EventArgs e)
        {
            try
            {
                dxValid.Dispose();
                ruleTrong.ConditionOperator = ConditionOperator.IsNotBlank;                
                if (txtLoaiAMoi.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiAMoi, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtLoaiBMoi.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiBMoi, ruleTrong);
                    dxValid.Validate();
                }
                else if (txtLoaiCMoi.Text.Trim().Length == 0)
                {
                    ruleTrong.ErrorText = COBAOMessage.KHONGDUOCTRONG;
                    dxValid.SetValidationRule(txtLoaiCMoi, ruleTrong);
                    dxValid.Validate();
                }
                else
                {
                    NhatKyThayDoiGiaXL nkdglxl = new NhatKyThayDoiGiaXL();
                    string mota = txtMoTa.Text.Trim();
                    dglxl = new DonGiaLuongXLProvider().GetDonGiaByMoTa(mota);
                    nkdglxl.MaLuongXL = dglxl.MaLuongXL;
                    nkdglxl.LoaiACu = Int32.Parse(txtLoaiA.Text.Trim());
                    nkdglxl.LoaiBCu = Int32.Parse(txtLoaiB.Text.Trim());
                    nkdglxl.LoaiCCu = Int32.Parse(txtLoaiC.Text.Trim());
                    nkdglxl.LoaiAMoi = Int32.Parse(txtLoaiAMoi.Text.Trim());
                    nkdglxl.LoaiBMoi = Int32.Parse(txtLoaiBMoi.Text.Trim());
                    nkdglxl.LoaiCMoi = Int32.Parse(txtLoaiCMoi.Text.Trim());
                    try { nkdglxl.NgayThayDoi = DateTime.Parse(dtNgayThayDoi.EditValue.ToString()); }
                    catch { };
                    nkdglxl.MaNV = COBAOMessage.nhanvien.MaNV;
                    ruleTrong.ConditionOperator = ConditionOperator.IsBlank;
                    nkdglxlp.Insert(nkdglxl);
                    txtMoTa.Enabled = txtLoaiA.Enabled = txtLoaiB.Enabled = txtLoaiC.Enabled = txtDonViTinh.Enabled = dtNgayNhap.Enabled = true;
                    txtLoaiAMoi.Enabled = txtLoaiBMoi.Enabled = txtLoaiCMoi.Enabled = dtNgayThayDoi.Enabled = false;
                    LoadDataSource();
                    clsFuntion.ShowMess(Text, COBAOMessage.THAYDOITHANHCONG);
                    dxValid.Validate();
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show("Lỗi: " + ex.Message, Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        #endregion
       
        #region đỗ dữ liệu
        private void gvDonGiaXL_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            try
            {
                var nkdglxl = gvDonGiaXL.GetRow(gvDonGiaXL.GetSelectedRows()[0]) as NhatKyThayDoiGiaXL;
                madglxl = (Guid)nkdglxl.MaLuongXL;
                mankdglxl = (Guid)nkdglxl.MaNhatKyXL;
                dglxl = new DonGiaLuongXLProvider().GetDonGiaByMaDG(madglxl);
                txtMoTa.Text = dglxl.MoTa;
                txtDonViTinh.Text = dglxl.DonViTinh;
                txtLoaiA.Text = nkdglxl.LoaiAMoi.ToString();
                txtLoaiB.Text = nkdglxl.LoaiBMoi.ToString();
                txtLoaiC.Text = nkdglxl.LoaiCMoi.ToString();
                dtNgayNhap.EditValue = nkdglxl.NgayThayDoi;
                txtMoTa.Enabled = txtLoaiA.Enabled = txtLoaiB.Enabled = txtLoaiC.Enabled = txtDonViTinh.Enabled = dtNgayNhap.Enabled = false;                
                btnSuaChua.Enabled = btnXoa.Enabled = true;
                btnThemMoi.Enabled = false;
                if (txtMoTa.Text == "Thoi, Bất bình hành")
                {
                    txtLoaiAMoi.Enabled = txtLoaiCMoi.Enabled = false;
                    txtLoaiBMoi.Focus();
                }
                else
                {
                    txtLoaiAMoi.Enabled = txtLoaiBMoi.Enabled = txtLoaiCMoi.Enabled = dtNgayThayDoi.Enabled = true;
                    txtLoaiAMoi.Focus();
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show("Lỗi: " + ex.Message, Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        #endregion

        private void btnXoaTrang_Click(object sender, EventArgs e)
        {
            LoadDataSource();
            txtMoTa.Enabled = txtLoaiA.Enabled = txtLoaiB.Enabled = txtLoaiC.Enabled = txtDonViTinh.Enabled = dtNgayNhap.Enabled = true;
            txtLoaiAMoi.Enabled = txtLoaiBMoi.Enabled = txtLoaiCMoi.Enabled = dtNgayThayDoi.Enabled = false;

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Close();
        }
        #region Xóa
        private void btnXoa_Click(object sender, EventArgs e)
        {
            string mota = txtMoTa.Text.Trim();
            dglxl = new DonGiaLuongXLProvider().GetDonGiaByMoTa(mota);
            int tontai = 0;
            var mt = new MacTauProvider().GetAll();
            foreach (var item in mt)
            {
                if (item.MaLuongXL == dglxl.MaLuongXL)
                    tontai = 1;
                break;
            }
            if (tontai == 1)
            {
                XtraMessageBox.Show(String.Format("Bạn không xóa được đơn giá lương '{0}' vì đơn giá đã được sử dụng", dglxl.MoTa.Trim()), Text, MessageBoxButtons.OK , MessageBoxIcon.Question);
            }
            else if (XtraMessageBox.Show(String.Format("Bạn chắc chắn xoá hạng giá '{0}' không?", dglxl.MoTa.Trim()), Text, MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                var a = new NhatKyDonGiaLuongXLProvider().GetAll();
                foreach (var item in a)
                {
                    if (item.MaLuongXL == dglxl.MaLuongXL)
                        nkdglxlp.Delete(item);
                }
                dglxlp.Delete(dglxl);
                txtMoTa.Enabled = txtLoaiA.Enabled = txtLoaiB.Enabled = txtLoaiC.Enabled = txtDonViTinh.Enabled = dtNgayNhap.Enabled = true;
                txtLoaiAMoi.Enabled = txtLoaiBMoi.Enabled = txtLoaiCMoi.Enabled = dtNgayThayDoi.Enabled = false;
                LoadDataSource();
                clsFuntion.ShowMess(Text, COBAOMessage.XOATHANHCONG);
            }
        }
        #endregion

        private void btnXoaLuoi_Click(object sender, ButtonPressedEventArgs e)
        {
            ButtonEdit ed = gvDonGiaXL.ActiveEditor as ButtonEdit;
            if (ed == null) return;
            if (e.Button.Kind == ButtonPredefines.Delete)
            {                
                var nkdglxl = gvDonGiaXL.GetRow(gvDonGiaXL.GetSelectedRows()[0]) as NhatKyThayDoiGiaXL;
                dglxl = new DonGiaLuongXLProvider().GetDonGiaByMaDG((Guid)nkdglxl.MaLuongXL);
                int count = 0;
                int tontai = 0;
                var a = new NhatKyDonGiaLuongXLProvider().GetAll();
                foreach (var item in a)
                {
                    if (item.MaLuongXL == dglxl.MaLuongXL)
                        count += 1;
                }
                if (count >1)
                {
                    nkdglxlp.Delete(nkdglxl);
                    clsFuntion.ShowMess(Text, COBAOMessage.XOATHANHCONG);
                    
                }
                else
                {
                    var mt = new MacTauProvider().GetAll();                   
                    foreach (var item in mt)
                    {
                        if (item.MaLuongXL == dglxl.MaLuongXL)
                            tontai = 1;
                        break;
                    }
                    if (tontai == 1)
                    {
                        XtraMessageBox.Show(String.Format("Bạn không xóa được đơn giá lương '{0}' vì đơn giá đã được sử dụng", dglxl.MoTa.Trim()), Text, MessageBoxButtons.OK, MessageBoxIcon.Question);
                    }
                    else
                    {
                        nkdglxlp.Delete(nkdglxl);
                        dglxlp.Delete(dglxl);
                        clsFuntion.ShowMess(Text, COBAOMessage.XOATHANHCONG);
                    }
                }

                List<NhatKyThayDoiGiaXL> dtsource = new List<NhatKyThayDoiGiaXL>();
                var b = new DonGiaLuongXLProvider().GetAll();
                foreach (var item in b)
                {
                    dtsource.Add(nkdglxlp.nhomNhatKy(item.MaLuongXL));
                }
                gcDonGiaXL.DataSource = dtsource;
            }
        }

    }
}