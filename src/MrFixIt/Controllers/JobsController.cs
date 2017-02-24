using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MrFixIt.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace MrFixIt.Controllers
{
    [Authorize]
    public class JobsController : Controller
    {
        private MrFixItContext db = new MrFixItContext();

        // GET: /<controller>/
        public IActionResult Index()
        {
            return View(db.Jobs.Include(j => j.Worker).Include(j => j.Poster).ToList());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Job job)
        {
            string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            ApplicationUser user = db.Users.FirstOrDefault(u => u.Id == userId);
            job.Poster = user;
            db.Jobs.Add(job);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            var thisJob = db.Jobs.FirstOrDefault(j => j.JobId == id);
            return View(thisJob);
        }

        [HttpPost]
        public IActionResult Edit(Job job)
        {
            db.Entry(job).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //public IActionResult Delete(int id)
        //{
        //    return RedirectToAction("DeleteConfirmed", new { jobId = id });
        //}

        [HttpPost]
        public IActionResult Delete(int id)
        {
            var thisJob = db.Jobs.FirstOrDefault(j => j.JobId == id);
            db.Remove(thisJob);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Claim(int id)
        {
            var thisJob = db.Jobs.FirstOrDefault(j => j.JobId == id);
            thisJob.Worker = db.Workers.FirstOrDefault(w => w.UserName == User.Identity.Name);
            db.Entry(thisJob).State = EntityState.Modified;
            db.SaveChanges();
            return Json(thisJob);
        }

        [HttpPost]
        public IActionResult Working(int id)
        {
            var thisJob = db.Jobs.Include(j => j.Worker).FirstOrDefault(jj => jj.JobId == id);
            thisJob.Pending = true;
            db.Entry(thisJob).State = EntityState.Modified;
            db.SaveChanges();
            return Json(thisJob);
        }

        [HttpPost]
        public IActionResult Complete(int id)
        {
            var thisJob = db.Jobs.Include(j => j.Worker).FirstOrDefault(j => j.JobId == id);
            thisJob.Completed = true;
            db.Entry(thisJob).State = EntityState.Modified;
            db.SaveChanges();
            return Json(thisJob);
        }
    }
}
