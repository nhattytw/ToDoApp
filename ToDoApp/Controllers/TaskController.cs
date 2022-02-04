using ToDoApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity.Validation;

namespace ToDoApp.Controllers
{
    public class TaskController : Controller
    {
        ToDoListEntities _contexts;
        public TaskController()
        {
            _contexts = new ToDoListEntities();
        }
        // GET: Task
        public ActionResult Index(string search = "")
        {
            ViewBag.search = search;
            var task = _contexts.ToDoLists.Where(temp => temp.ToDoName.Contains(search)).ToList();
            return View(task);
        }
        public ActionResult Details(long id)
        {
            var task = _contexts.ToDoLists.Where(temp => temp.ToDoID == id).FirstOrDefault();
            return View(task);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(ToDoList task)
        {
            if (ModelState.IsValid)
            {
                _contexts.ToDoLists.Add(task);
                _contexts.SaveChanges();
                try
                {
                    _contexts.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    throw;
                }
                return RedirectToAction("index");
            }
            else
            {
                return View();
            }
        }

        public ActionResult Edit(long id)
        {
            var exsitingTask = _contexts.ToDoLists.Where(temp => temp.ToDoID == id).FirstOrDefault();
            return View(exsitingTask);
        }

        [HttpPost]
        public ActionResult Edit(ToDoList task)
        {
            if (ModelState.IsValid)
            {
                var exsitingTask = _contexts.ToDoLists.Where(temp => temp.ToDoID == task.ToDoID).FirstOrDefault();
                exsitingTask.ToDoName = task.ToDoName;
                exsitingTask.ToDoDescription = task.ToDoDescription;
                exsitingTask.CreationDate = task.CreationDate;
                exsitingTask.Priority = task.Priority;
                exsitingTask.Status = task.Status;

                try
                {
                    _contexts.SaveChanges();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    throw;
                }
                return RedirectToAction("index");
            }
            else
            {
                return View();
            }

        }

        public ActionResult Delete(long id)
        {
            var task = _contexts.ToDoLists.Where(temp => temp.ToDoID == id).FirstOrDefault();
            _contexts.ToDoLists.Remove(task);

            try
            {
                _contexts.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                throw;
            }

            return RedirectToAction("index");
        }
    }
}
