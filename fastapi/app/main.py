from fastapi import FastAPI
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from fastapi.middleware.cors import CORSMiddleware

DATABASE_URL = "mysql+mysqlconnector://root:password@mysql/sakila"

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=['*'],
    allow_methods=["GET", "POST", "OPTIONS"],
    allow_headers=["*"],
    expose_headers=["*"]
)

@app.head('/')
@app.get("/")
async def root():
    return {"message": "Howdy"}

@app.head('/getCustomers')
@app.get("/getCustomers")
def getCanadianCustomers():
    engine = create_engine(DATABASE_URL)
    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

    session = SessionLocal()
    try:
        result = session.execute(text("""
            SELECT *
            FROM customer
            ORDER BY last_name, first_name
        """))
        customers = [
            {"customer_id": row[0], "store_id": row[1], "first_name": row[2], "last_name": row[3], "email": row[4],
             "last_updated": row[8]} for row in result]
        return customers
    finally:
        session.close()
