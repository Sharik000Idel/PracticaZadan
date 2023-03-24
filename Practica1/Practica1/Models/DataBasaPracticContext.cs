using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Practica1
{
    public partial class DataBasaPracticContext : DbContext
    {
        public static DataBasaPracticContext _context;
        public DataBasaPracticContext()
        {
        }

        public DataBasaPracticContext(DbContextOptions<DataBasaPracticContext> options)
            : base(options)
        {


        }

        public static DataBasaPracticContext GetContext()
        {
            return _context == null ? new DataBasaPracticContext() : _context;
        }
        public virtual DbSet<Bran> Brans { get; set; } = null!;
        public virtual DbSet<Model> Models { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=qwer;Username=postgres;Password=root");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Bran>(entity =>
            {
                entity.HasKey(e => e.IdBrands)
                    .HasName("Brans_pkey");

                entity.Property(e => e.IdBrands)
                    .ValueGeneratedNever()
                    .HasColumnName("ID_Brands");
            });

            modelBuilder.Entity<Model>(entity =>
            {
                entity.HasKey(e => e.IdModels)
                    .HasName("Models_pkey");

                entity.Property(e => e.IdModels)
                    .ValueGeneratedNever()
                    .HasColumnName("ID_Models");

                entity.Property(e => e.BrandId).HasColumnName("Brand_ID");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Models)
                    .HasForeignKey(d => d.BrandId)
                    .HasConstraintName("Models_Brand_ID_fkey");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
