from django.db import models
from django.contrib.auth.models import AbstractUser 
from django.utils.html import mark_safe

class Utilisateur(AbstractUser):
    # id = models.AutoField(primary_key=True)
    # username = models.CharField(max_length=50)
    # password = models.CharField(max_length=50)
    client = models.ForeignKey('Client', on_delete=models.CASCADE, null=True)

class Client(models.Model):
    # id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    telephone = models.CharField(max_length=20)
    adresse = models.CharField(max_length=100)

class CompagnieAssurance(models.Model):
    # id = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    adresse = models.CharField(max_length=100)
    telephone = models.CharField(max_length=20)

class Contrat(models.Model):
    # id = models.AutoField(primary_key=True)
    image = models.ImageField(upload_to='contrats/%Y/%m/%d/', blank=True)
    type_contrat = models.CharField(max_length=50)
    date_souscription = models.DateField()
    compagnie_assurance = models.ForeignKey('CompagnieAssurance', on_delete=models.CASCADE)
    client = models.ForeignKey('Client', on_delete=models.CASCADE)

    def image_tag(self):
        return mark_safe('<img src="/contrats/%Y/%m/%d/%s" width="150" height="150" />' % (self.image))

class Sinistre(models.Model):
    # id = models.AutoField(primary_key=True)
    image_1 = models.ImageField(upload_to='sinistres/%Y/%m/%d/', blank=True)
    image_2 = models.ImageField(upload_to='sinistres/%Y/%m/%d/', blank=True)
    image_3 = models.ImageField(upload_to='sinistres/%Y/%m/%d/', blank=True)

    def image_tag(self):
        return mark_safe(
            '<img src="/contrats/%Y/%m/%d/%s" width="150" height="150" />' % (self.image_3)
            +'<img src="/contrats/%Y/%m/%d/%s" width="150" height="150" />' % (self.image_1)
            +'<img src="/contrats/%Y/%m/%d/%s" width="150" height="150" />' % (self.image_2)
        )

    date_sinistre = models.DateField()
    montant_facture = models.DecimalField(max_digits=10, decimal_places=2)
    montant_indemnite = models.DecimalField(max_digits=10, decimal_places=2)
    type_prejudice = models.CharField(max_length=100)
    contrat = models.ForeignKey('Contrat', on_delete=models.CASCADE)
