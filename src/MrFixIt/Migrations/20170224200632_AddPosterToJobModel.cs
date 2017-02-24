using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MrFixIt.Migrations
{
    public partial class AddPosterToJobModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "PosterId",
                table: "Jobs",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Jobs_PosterId",
                table: "Jobs",
                column: "PosterId");

            migrationBuilder.AddForeignKey(
                name: "FK_Jobs_AspNetUsers_PosterId",
                table: "Jobs",
                column: "PosterId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Jobs_AspNetUsers_PosterId",
                table: "Jobs");

            migrationBuilder.DropIndex(
                name: "IX_Jobs_PosterId",
                table: "Jobs");

            migrationBuilder.DropColumn(
                name: "PosterId",
                table: "Jobs");
        }
    }
}
