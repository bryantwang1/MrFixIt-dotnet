using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MrFixIt.Models;
using Microsoft.EntityFrameworkCore;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace MrFixIt.Controllers
{
    public class JobsController : Controller
    {
        private MrFixItContext db = new MrFixItContext();

        // GET: /<controller>/
        public IActionResult Index()
        {
            return View(db.Jobs.Include(j => j.Worker).ToList());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Job job)
        {
            db.Jobs.Add(job);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //public IActionResult Claim(int id)
        //{
        //    var thisJob = db.Jobs.FirstOrDefault(jobs => jobs.JobId == id);
        //    return View(thisJob);
        //}

        [HttpPost]
        public IActionResult Claim(int id)
        {
            var thisJob = db.Jobs.FirstOrDefault(jobs => jobs.JobId == id);
            thisJob.Worker = db.Workers.FirstOrDefault(w => w.UserName == User.Identity.Name);
            db.Entry(thisJob).State = EntityState.Modified;
            db.SaveChanges();
            return Json(thisJob);
        }

        [HttpPost]
        public IActionResult Working(int id)
        {
            var thisJob = db.Jobs.Include(j => j.Worker).FirstOrDefault(j => j.JobId == id);
            thisJob.Pending = true;
            db.Entry(thisJob).State = EntityState.Modified;
            db.SaveChanges();
            return Json(thisJob);
        }
    }
}
