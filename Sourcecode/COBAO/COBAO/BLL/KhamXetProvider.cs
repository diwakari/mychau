﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using COBAO.DAL;
namespace COBAO.BLL
{
    public class KhamXetProvider:COBAOProvider<KhamXet>
    {
        public override void Insert(KhamXet entity)
        {
            Guid? maKhamXet = entity.MaKhamXet;
            Db.sp_InsertKhamXet(entity.MaDM, entity.MaNV, entity.NgayGioBatDau, entity.NgayGioKetThuc,  entity.ThoiGianKhamXet, entity.GioCaBa, ref maKhamXet);            
        }

        public override void Update(KhamXet entity)
        {
            Db.sp_UpdateKhamXet(entity.MaKhamXet, entity.MaDM, entity.MaNV, entity.NgayGioBatDau, entity.NgayGioKetThuc, entity.ThoiGianKhamXet, entity.GioCaBa);
        }

        public override void Delete(KhamXet entity)
        {
            Db.sp_DeleteKhamXet(entity.MaKhamXet);
        }

        public override List<KhamXet> GetAll()
        {
            return Db.sp_SelectKhamXetsAll().ToList();
        }

        public override bool IsExisted(KhamXet entity)
        {
            throw new NotImplementedException();
        }
        public List<KhamXet> GetKhamXetByTheoDauMay(DauMay entity)
        {
            return Db.sp_SelectKhamXetsByAndMaDM(entity.MaDM).ToList();
        }
        public List<KhamXet> GetKhamXetByTheoNhanVien(NhanVien entity)
        {
            return Db.sp_SelectKhamXetsByAndMaNV(entity.MaNV).ToList();
        }
        public int giokhamxet(string mataixe, int thang, int nam)
        {
            try
            {
                long giokhamxet = (from khamxet in Db.KhamXets
                                   join chitiet in Db.ChiTietKhamXets on khamxet.MaKhamXet equals chitiet.MaKhamXet
                                      where (khamxet.NgayGioKetThuc.Month == thang && khamxet.NgayGioKetThuc.Year == nam
                                           && chitiet.MaTaiXe == mataixe)
                                      select (long)khamxet.ThoiGianKhamXet).Sum();
                return (int)giokhamxet / 60;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
