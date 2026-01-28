#!/usr/bin/env python
"""
Script para verificar que la instalación está correcta
"""
import sys
import os

def test_imports():
    """Verifica que todos los módulos se pueden importar"""
    print("🧪 Verificando imports...")

    try:
        import fastapi
        print("  ✅ FastAPI instalado")
    except ImportError:
        print("  ❌ FastAPI no encontrado")
        return False

    try:
        import uvicorn
        print("  ✅ Uvicorn instalado")
    except ImportError:
        print("  ❌ Uvicorn no encontrado")
        return False

    try:
        import pydantic
        print("  ✅ Pydantic instalado")
    except ImportError:
        print("  ❌ Pydantic no encontrado")
        return False

    return True


def test_project_structure():
    """Verifica que la estructura del proyecto es correcta"""
    print("\n📁 Verificando estructura del proyecto...")

    required_paths = [
        "app/__init__.py",
        "app/main.py",
        "app/models/__init__.py",
        "app/models/schemas.py",
        "app/routes/__init__.py",
        "app/routes/operations.py",
        "app/routes/approvals.py",
        "app/services/__init__.py",
        "app/services/database_service.py",
        "app/utils/__init__.py",
        "app/utils/mock_generator.py",
        "app/data/db_mock.json",
        "requirements.txt",
        "README.md",
    ]

    all_exist = True
    for path in required_paths:
        if os.path.exists(path):
            print(f"  ✅ {path}")
        else:
            print(f"  ❌ {path} no encontrado")
            all_exist = False

    return all_exist


def test_app_import():
    """Verifica que la aplicación se puede importar"""
    print("\n🚀 Verificando aplicación FastAPI...")

    try:
        from app.main import app
        print("  ✅ Aplicación importada correctamente")
        print(f"  ℹ️  Título: {app.title}")
        print(f"  ℹ️  Versión: {app.version}")
        return True
    except Exception as e:
        print(f"  ❌ Error al importar aplicación: {e}")
        return False


def test_models():
    """Verifica que los modelos se pueden importar"""
    print("\n📦 Verificando modelos...")

    try:
        from app.models.schemas import (
            BsOperationStatus, BsCreateOperationRequest,
            BsCreateOperationResponse
        )
        print("  ✅ Modelos importados correctamente")
        return True
    except Exception as e:
        print(f"  ❌ Error al importar modelos: {e}")
        return False


def test_services():
    """Verifica que los servicios funcionan"""
    print("\n🔧 Verificando servicios...")

    try:
        from app.services.database_service import DatabaseService
        db = DatabaseService()
        stats = db.get_stats()
        print(f"  ✅ DatabaseService funcional")
        print(f"  ℹ️  Operaciones: {stats['total_operations']}")
        print(f"  ℹ️  Aprobaciones: {stats['total_approvals']}")
        return True
    except Exception as e:
        print(f"  ❌ Error en servicios: {e}")
        return False


def test_mock_generator():
    """Verifica que el generador de datos mock funciona"""
    print("\n🎲 Verificando generador de datos mock...")

    try:
        from app.utils.mock_generator import MockDataGenerator
        gen = MockDataGenerator()

        # Generar datos de prueba
        ruc = gen.generate_ruc()
        account = gen.generate_account_number()
        amount = gen.generate_amount()

        print(f"  ✅ MockDataGenerator funcional")
        print(f"  ℹ️  RUC generado: {ruc}")
        print(f"  ℹ️  Cuenta generada: {account}")
        print(f"  ℹ️  Monto generado: {amount}")
        return True
    except Exception as e:
        print(f"  ❌ Error en generador: {e}")
        return False


def main():
    """Ejecuta todos los tests"""
    print("=" * 60)
    print("  Test de Instalación - API Mock de Aprobaciones")
    print("=" * 60)
    print()

    results = []

    # Ejecutar tests
    results.append(("Imports", test_imports()))
    results.append(("Estructura", test_project_structure()))
    results.append(("Aplicación", test_app_import()))
    results.append(("Modelos", test_models()))
    results.append(("Servicios", test_services()))
    results.append(("Generador", test_mock_generator()))

    # Resumen
    print("\n" + "=" * 60)
    print("  Resumen de Tests")
    print("=" * 60)
    print()

    all_passed = True
    for name, result in results:
        status = "✅ PASÓ" if result else "❌ FALLÓ"
        print(f"  {name}: {status}")
        if not result:
            all_passed = False

    print()
    print("=" * 60)

    if all_passed:
        print("  ✅ ¡Todos los tests pasaron!")
        print("  🚀 El proyecto está listo para usar")
        print()
        print("  Ejecuta: python run.py")
        print("  Y luego visita: http://localhost:8000/docs")
        print("=" * 60)
        return 0
    else:
        print("  ❌ Algunos tests fallaron")
        print("  📝 Revisa los errores arriba y:")
        print("     1. Verifica que instalaste las dependencias: pip install -r requirements.txt")
        print("     2. Verifica que estás en el directorio correcto")
        print("=" * 60)
        return 1


if __name__ == "__main__":
    sys.exit(main())
