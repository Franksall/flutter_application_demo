from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel

router = APIRouter(prefix="/auth", tags=["Authentication"])

class LoginRequest(BaseModel):
    documentType: str    
    documentNumber: str  
    password: str

@router.post("/login")
async def login(request: LoginRequest):
    # Diccionario simulando tu base de datos de usuarios
    users_db = {
        "12345678": {
            "id": "1",
            "name": "Juan Carlos Miranda",
            "password": "123456",
            "requiresFacialVerification": True
        },
        "87654321": {
            "id": "2",
            "name": "María Elena Torres",
            "password": "password",
            "requiresFacialVerification": False
        },
        "ABC123456": {
            "id": "3",
            "name": "Diego Vasquez Medrano",
            "password": "123456",
            "requiresFacialVerification": True
        }
    }

    user = users_db.get(request.documentNumber)

    if user and request.password == user["password"]:
        return {
            "success": True,
            "message": "Login exitoso",
            "data": {
                "id": user["id"],
                "documentNumber": request.documentNumber,
                "documentType": request.documentType,
                "name": user["name"],
                "token": f"token-fake-{user['id']}",
                "requiresFacialVerification": user["requiresFacialVerification"]
            }
        }
    
    raise HTTPException(status_code=401, detail="Credenciales incorrectas")