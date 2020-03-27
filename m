Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5901958E7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 15:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgC0OZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 10:25:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34146 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0OZa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 10:25:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id 65so11672224wrl.1;
        Fri, 27 Mar 2020 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=peP7S2GwPuZ1IKo8FYOZ1jeo4ELir9xxjxU6GqZTgX4=;
        b=StriVB/9TjnZWqc9kH0lHNwEqOCxpb0m9aQdojCVw1TQU0oy/QZmPbaIfR9bNuuDue
         7QSZAxlsnLBkfPYxxgTtuTR7SG4++YVzHqCtUdty6s6uiOdYYad77k+0Xw9ASLhjFAAm
         ay5WyECrlMw2Zm2a/hdNBiz8O01W0fYEyoGhfJ8zJLc35IS25jRq/W8EnoIxlLXuIgiW
         V1SW9UcztB62fpCyNNq7iXdVJh4K+Zc68m3LvFEQECRHDZzeIjsZiGDE2NW0a6PXcRRq
         OCYALWXPpOprqJaK8D3HOoOH8pGbJ6wveEo4cTPqYtePW5d1v4IWdsTgpPwJCfJidDUl
         5JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=peP7S2GwPuZ1IKo8FYOZ1jeo4ELir9xxjxU6GqZTgX4=;
        b=dSz+k0TKUeKj25fxOFLpomp8IIb3GbRqn8oY7PB8lBx0VT4spAii/UFvhfOs6FD+js
         qwcjq/pC41uhiRFoo1T48sE0ug7YPTkecSXZjPcFyTNDSxTY/TILVVqHFlohehysu+dq
         v5DH00bpJuxwHqasJstPJWEtRoh0ylAEGGgB12QnLagiunM3Ku7y9vsBKnia9tULH1Sf
         DoLGsI029dBqsRTP0Kk7y0R56mcg7ujHfuGnJsVzWgpEsTY8efEKAd59lCZskrjLbQxd
         ui6GoWLLWEctKrI6tRCCqKlWqVu3e2vILf48tWKjXI/dv/nW+tMSAjq2JoB58WTseDDm
         PoaA==
X-Gm-Message-State: ANhLgQ0iWCb64s57HqnAInFUMUZ3LN+YhzNBUf1M5ZMTbwldYb5t8/v8
        wsGfcRFnMnipylNrL33Vnt5Hb3ZBGKTO93sdA+E=
X-Google-Smtp-Source: ADFU+vsXiZ0/Ce9a1O/msDlNwkE/7qgqmUo4B7/lmX8Z7cLom/fYyI4rkhFAI0E0S/gHRNqEyYdwzjZyyssYophWnCs=
X-Received: by 2002:a05:6000:111:: with SMTP id o17mr15146245wrx.111.1585319127768;
 Fri, 27 Mar 2020 07:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com> <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 27 Mar 2020 10:25:16 -0400
Message-ID: <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 26, 2020 at 5:35 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Move away from the deprecated API.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

patches 1,6, are:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> index 848ef68d9086..5d2591725189 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
>                                                                     ucOverdriveThermalController];
>                         info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
>                         strlcpy(info.type, name, sizeof(info.type));
> -                       i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                       i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                 }
>         }
>         num_modes = power_info->info.ucNumOfPowerModeEntries;
> @@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
>                                 const char *name = pp_lib_thermal_controller_names[controller->ucType];
>                                 info.addr = controller->ucI2cAddress >> 1;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                         }
>                 } else {
>                         DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> index c3e49c973812..d3c04df7e75d 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
>                                 const char *name = thermal_controller_names[thermal_controller];
>                                 info.addr = i2c_addr >> 1;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                         }
>                 }
>         } else {
> @@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
>                                 const char *name = "f75375";
>                                 info.addr = 0x28;
>                                 strlcpy(info.type, name, sizeof(info.type));
> -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
>                                 DRM_INFO("Possible %s thermal controller at 0x%02x\n",
>                                          name, info.addr);
>                         }
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
