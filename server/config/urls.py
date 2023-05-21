from django.conf import settings
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.views.generic import TemplateView

DEBUG = getattr(settings, 'DEBUG', False)
PREVIEW = getattr(settings, 'PREVIEW', False)


def get_template_name():
    if not DEBUG or DEBUG and PREVIEW:
        return 'client/index.html'
    return 'index.html'


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', TemplateView.as_view(
        template_name=get_template_name()), name='index'
    )
]

if DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT
    )
