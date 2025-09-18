FROM docker.io/piatrikadocker/pbts-backend:dev-latest

WORKDIR /code

# Bake project code into the image
COPY PBTS_base_project/              /code/
COPY PBTS_breeding_app/Breeding/     /code/Breeding/
COPY PBTS_trials_app/Trials/         /code/Trials/
COPY PBTS_ds_app/DSapp/              /code/DSapp/
COPY PBTS_base_project/DBapp/        /code/DBapp/

# Default settings module (can be overridden in ECS env)
ENV DJANGO_SETTINGS_MODULE=Piatrika.settings

EXPOSE 8000
CMD ["python", "/code/manage.py", "runserver", "0.0.0.0:8000"]
