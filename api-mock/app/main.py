from fastapi import FastAPI, Header, Request,HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from contextlib import asynccontextmanager
from pydantic import BaseModel
from typing import Optional
import uvicorn

from app.routes import operations_router, approvals_router,auth
from app.services import DatabaseService

# Metadata para la documentación de OpenAPI
TITLE = "Approval Management API - Plataforma del Empleador"
DESCRIPTION = """
API Mock para gestión centralizada de aprobaciones en la Plataforma del Empleador.

Este es un **API Mock** que simula el comportamiento del API real sin lógica de negocio.
Los datos son generados automáticamente y persisten en un archivo JSON simulado.

## Características

* **Gestión de operaciones** - Crear, listar, consultar y cancelar operaciones de aprobación
* **Gestión de aprobaciones** - Firmar operaciones (aprobar/rechazar) y consultar estado
* **Persistencia simulada** - Base de datos JSON para mantener estado entre peticiones
* **Datos realistas** - Generación automática basada en los schemas de OpenAPI

## Tags

* **Operations** - Gestión de operaciones pendientes de aprobación
* **Approvals** - Gestión de firmas y aprobaciones individuales
"""
VERSION = "1.0.0"
CONTACT = {
    "name": "Financiera Oh - Plataforma del Empleador",
    "email": "api-support@financieraoh.com"
}
LICENSE_INFO = {
    "name": "Proprietary",
    "url": "https://financieraoh.com/licenses"
}

class LoginRequest(BaseModel):
    codDocumento: str
    numDocumento: str
    contrasenia: str
    totp: str

@asynccontextmanager
async def lifespan(app: FastAPI):
    """Gestión del ciclo de vida de la aplicación"""
    # Startup
    print("🚀 Iniciando API Mock de Aprobaciones...")
    print("📊 Base de datos simulada: app/data/db_mock.json")

    # Verificar que la base de datos existe
    db_service = DatabaseService()
    stats = db_service.get_stats()
    print(f"✅ Base de datos inicializada - Operaciones: {stats['total_operations']}, Aprobaciones: {stats['total_approvals']}")

    yield

    # Shutdown
    print("👋 Cerrando API Mock de Aprobaciones...")


# Crear aplicación FastAPI
app = FastAPI(
    title=TITLE,
    description=DESCRIPTION,
    version=VERSION,
    contact=CONTACT,
    license_info=LICENSE_INFO,
    lifespan=lifespan,
    docs_url="/docs",
    redoc_url="/redoc",
    openapi_url="/openapi.json"
)

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # En producción, especificar orígenes permitidos
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Middleware para logging de requests
@app.middleware("http")
async def log_requests(request: Request, call_next):
    """Middleware para registrar todas las peticiones"""
    print(f"📥 {request.method} {request.url.path}")

    # Procesar request
    response = await call_next(request)

    print(f"📤 {request.method} {request.url.path} - Status: {response.status_code}")
    return response


# Incluir routers
app.include_router(operations_router, prefix="/v1")
app.include_router(approvals_router, prefix="/v1")

app.include_router(auth.router, prefix="/v1")

@app.post("/v1/auth/ctaemp/login", tags=["Auth Cta Emp"])
async def login_cta_emp(request: LoginRequest, x_api_key: Optional[str] = Header(None, alias="x-api-key")):
    print(f"📡 LOGIN CTA EMP - Recibido")
    print(f"🔑 Headers: x-api-key={x_api_key}")
    print(f"📦 Body: {request}")

    
    if request.contrasenia == "123456":
        print("✅ Login Exitoso (Simulado)")
        return {
            "message": "Login exitoso",
            "data": {
                "id": "user_001",
                "name": "admin foh",
                "email": "adminfoh@financieraoh.pe",
                "documentNumber": request.numDocumento,
                "documentType": "DNI",
                "role": "ADMIN",
                "token": "mock-jwt-token-123456",
                "refreshToken": "mock-refresh-token"
            }
        }
    else:
        print("❌ Login Fallido")
        raise HTTPException(status_code=401, detail="Credenciales inválidas")
    

@app.post("/v1/totp/enroll", tags=["TOTP"])
async def enroll_totp():
    """
    Simula el enrolamiento del token.
    Devuelve una 'semilla' (Secret) fija para que la App genere los números.
    """
    print("🔐 Solicitud de enrolamiento TOTP recibida")
    return {
        "base32Secret": "JBSWY3DPEHPK3PXP", #  es la clave secreta simulada
        "algorithm": "SHA1",
        "digits": 6,
        "period": 30
    }

@app.post("/v1/totp/validate", tags=["TOTP"])
async def validate_totp(request: Request):
    """
    Simula la validación.
    En este Mock, SIEMPRE dice que el código es correcto (True).
    """
    body = await request.json()
    print(f"🔢 Validando TOTP: {body}")
    
    
    return True



# Endpoint raíz
@app.get("/", tags=["Root"])
async def root():
    return {"status": "running", "version": VERSION}

# Endpoint para obtener el token de sesión 
@app.get("/v1/api/session-token/{dni}", tags=["FaceTec Bypass"])
#async def get_session_token(dni: str, is_key: str = Header(..., alias="is-key")):
async def get_session_token(dni: str, is_key: str = Header(None, alias="is-key")):#Paso directo
    """
    Bypass: Simula la obtención de un token de sesión de FaceTec.
    Requiere el Header 'is-key' proporcionado por InSolutions.
    """
    return {
        "code": "0",
        "message": "Operación exitosa.",
        "data": {
            "token": "token-auditoria-bypass-oh",
            "sessionToken": "session-token-generado-por-python-mock"
        }
    }

# Endpoint para enrolamiento/validación 3D 
@app.post("/v1/api/identity/facial-enrollment-3d", tags=["FaceTec Bypass"])
#async def facial_enrollment(request: Request, token: str = Header(...)):
async def facial_enrollment(request: Request, token: str = Header(None)): # Paso directo
    """
    Bypass: Recibe los datos biométricos 
    y devuelve éxito automático para permitir avanzar al flujo de documentos.
    """
   
    return {
        "code": "0",
        "message": "Operación exitosa.",
        "data": {
            "success": True,
            "livenessCheck": True,
            "wasProcessed": True,
            "scanResultBlob": "VALOR_scanResultBlob_MOCK_OH",
            "ageEstimateGroupEnumInt": 2,
            "retryScreenEnumInt": 1
        }
    }
# Endpoint de salud
@app.get("/health", tags=["Health"])
async def health_check():
    """Health check endpoint"""
    db_service = DatabaseService()
    stats = db_service.get_stats()

    return {
        "status": "healthy",
        "service": "approval-management-api-mock",
        "version": VERSION,
        "database": {
            "type": "json",
            "status": "connected",
            "stats": stats
        }
    }


# Handler de excepciones global
@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    """Handler global para excepciones no capturadas"""
    print(f"❌ Error no capturado: {str(exc)}")

    return JSONResponse(
        status_code=500,
        content={
            "success": False,
            "message": "Error interno del servidor",
            "errors": [
                {
                    "code": "INTERNAL_SERVER_ERROR",
                    "message": str(exc)
                }
            ]
        }
    )
@app.post("/v1/auth/logout", tags=["Auth Bypass"])
async def logout():
    """
    Bypass: Simula el cierre de sesión y limpieza de tokens.
    """
    print("🚪 Sesión finalizada por el usuario") 
    return {"code": "0", "message": "Sesión cerrada correctamente."}

# Función para ejecutar el servidor
def run_server():
    """Ejecuta el servidor Uvicorn"""
    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )


if __name__ == "__main__":
    run_server()
