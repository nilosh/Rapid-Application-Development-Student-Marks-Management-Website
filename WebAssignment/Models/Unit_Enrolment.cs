//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAssignment.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class Unit_Enrolment
    {

        [Display(Name = "Unit Code")]
        [Required(ErrorMessage = "Unitcode cannot be empty!")]
        [RegularExpression(@"^[A-Za-z]{3}\d{4}$", ErrorMessage = "Unitcode doesn't match the required format! (Format: AAA-1111)")]
        public string UnitCode { get; set; }

        [Display(Name = "Year")]
        [Required(ErrorMessage = "Year cannot be empty!")]
        [Range(2000, 2050, ErrorMessage = "Invalid Year!")]
        [RegularExpression(@"^\d{4}$", ErrorMessage = "Invalid Year Format! (Format: YYYY)")]
        public int Year { get; set; }

        [Display(Name = "Semester")]
        [RegularExpression(@"^\d{3}$", ErrorMessage = "Invalid Semester Format! Must be numeric and a length of 3")]
        [Range(000, 200, ErrorMessage = "Invalid Semester!")]
        public int Semester { get; set; }

        [Display(Name = "Assessment 1 Score")]
        [Required(ErrorMessage = "Assessment Mark cannot be empty!")]
        [Range(0, 20, ErrorMessage = "Invalid Assessment Mark! Maximum possible weight is 20")]
        public int Assessment_1 { get; set; }

        [Display(Name = "Assessment 2 Score")]
        [Required(ErrorMessage = "Assessment Mark cannot be empty!")]
        [Range(0, 20, ErrorMessage = "Invalid Assessment Mark! Maximum possible weight is 20")]
        public int Assessment_2 { get; set; }

        [Display(Name = "Exam")]
        [Required(ErrorMessage = "Final Exam Mark cannot be empty!")]
        [Range(0, 60, ErrorMessage = "Invalid Assessment Mark! Maximum possible weight is 20")]
        public int Final_Exam { get; set; }

        public int Enrolment_ID { get; set; }

        [Display(Name = "Student ID")]
        [Required(ErrorMessage = "Student ID cannot be empty!")]
        [RegularExpression(@"^[0-9]{8}$", ErrorMessage = "Student ID must contain 8 digits!")]
        public string StudentID { get; set; }
    
        public virtual Unit Unit { get; set; }

        public virtual Student Student { get; set; }

    }
}
