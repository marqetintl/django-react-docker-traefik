from django.conf import settings


def settings_context(request):
    if not settings.DEBUG:
        return {}

    return {
        'DEBUG': settings.DEBUG,
        'PREVIEW': settings.PREVIEW,
    }
