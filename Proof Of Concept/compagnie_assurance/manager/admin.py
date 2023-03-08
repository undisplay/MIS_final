from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

# Register your models here.
# vim: set fileencoding=utf-8 :
from django.contrib import admin

import manager.models as models


class UtilisateurAdmin(UserAdmin):

    list_display = (
        'id',
        'client',
        'is_superuser',
        'username',
        'first_name',
        'last_name',
        'is_staff',
        'is_active',
        'date_joined',
        
    )
    list_filter = (
        'is_superuser',
        'is_staff',
        'is_active',
    )
    raw_id_fields = ('groups', 'user_permissions')


class ClientAdmin(admin.ModelAdmin):

    list_display = ('id', 'nom', 'telephone', 'adresse')
    list_filter = ('id', 'nom', 'telephone', 'adresse')


class CompagnieAssuranceAdmin(admin.ModelAdmin):

    list_display = ('id', 'nom', 'adresse', 'telephone')
    list_filter = ('id', 'nom', 'adresse', 'telephone')


class ContratAdmin(admin.ModelAdmin):

    list_display = (
        'id',
        'type_contrat',
        'date_souscription',
        'compagnie_assurance',
        'client',
        'image_tag'
    )
    list_filter = (
        'date_souscription',
        'compagnie_assurance',
        'client',
        'id',
        'type_contrat',
    )


class SinistreAdmin(admin.ModelAdmin):

    list_display = (
        'id',
        'date_sinistre',
        'montant_facture',
        'montant_indemnite',
        'type_prejudice',
        'contrat',
        'image_tag'
    )
    list_filter = (
        'date_sinistre',
        'contrat',
        'type_prejudice',
    )


def _register(model, admin_class):
    admin.site.register(model, admin_class)


_register(models.Utilisateur, UtilisateurAdmin)
_register(models.Client, ClientAdmin)
_register(models.CompagnieAssurance, CompagnieAssuranceAdmin)
_register(models.Contrat, ContratAdmin)
_register(models.Sinistre, SinistreAdmin)
