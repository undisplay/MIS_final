# Generated by Django 4.1.7 on 2023-03-08 16:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('manager', '0002_contrat_image_sinistre_image_1'),
    ]

    operations = [
        migrations.AddField(
            model_name='sinistre',
            name='image_2',
            field=models.ImageField(blank=True, upload_to='sinistres/%Y/%m/%d/'),
        ),
        migrations.AddField(
            model_name='sinistre',
            name='image_3',
            field=models.ImageField(blank=True, upload_to='sinistres/%Y/%m/%d/'),
        ),
    ]