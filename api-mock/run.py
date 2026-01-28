#!/usr/bin/env python
"""
Script de inicio para el API Mock de Aprobaciones
"""
import uvicorn

if __name__ == "__main__":
    print("=" * 60)
    print("  Approval Management API Mock - Financiera OH")
    print("=" * 60)
    print()
    print("🚀 Iniciando servidor...")
    print("📍 URL: http://localhost:8000")
    print("📚 Documentación: http://localhost:8000/docs")
    print("📖 ReDoc: http://localhost:8000/redoc")
    print()
    print("Presiona CTRL+C para detener el servidor")
    print("=" * 60)
    print()

    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )
