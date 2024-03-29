﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using COBAO.DAL;

namespace COBAO.BLL
{
    public class HanhTrinhProvider: COBAOProvider<HanhTrinh>
    {

        public override void Insert(HanhTrinh entity)
        {
            Guid? mahanhtrinh = entity.MaHanhTrinh;
            Db.sp_InsertHanhTrinh(entity.SoCoBao, entity.MaGa, entity.TrangThaiGa, entity.NgayDen,entity.GioDen, entity.NgayDi,entity.GioDi, entity.ThoiGianDung, entity.MaTinhChat, ref mahanhtrinh);
        }

        public override void Update(HanhTrinh entity)
        {
            Db.sp_UpdateHanhTrinh(entity.MaHanhTrinh, entity.SoCoBao, entity.MaGa, entity.TrangThaiGa, entity.NgayDen, entity.GioDen, entity.NgayDi, entity.GioDi, entity.ThoiGianDung, entity.MaTinhChat);
        }

        public override void Delete(HanhTrinh entity)
        {
            Db.sp_DeleteHanhTrinh(entity.MaHanhTrinh);
        }

        public override List<HanhTrinh> GetAll()
        {
            return Db.sp_SelectHanhTrinhsAll().ToList();
        }

        public override bool IsExisted(HanhTrinh entity)
        {
            return Db.HanhTrinhs.Any(ht => ht.SoCoBao.Equals(entity.SoCoBao) && ht.MaGa.Equals(entity.MaGa));
        }
        public List<HanhTrinh> GetHanhTrinhByTheoCoBao(CoBao entity)
        {
            return Db.sp_SelectHanhTrinhsByAndSoCoBao(entity.SoCoBao).ToList();
        }
        public List<HanhTrinh> nhomHanhTrinh(string socobao)
        {
            try
            {
                var listHanhTrinh = (from lht in Db.HanhTrinhs
                                     where lht.SoCoBao.Equals(socobao)
                                     orderby lht.NgayDi ascending
                                     select lht).ToList();
                return listHanhTrinh;
            }
            catch (Exception)
            {
                return null;
            }

        }
    }
}
