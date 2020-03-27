Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8815A1959CD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 16:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgC0P1s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 11:27:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38999 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgC0P1r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 11:27:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id p10so11881848wrt.6;
        Fri, 27 Mar 2020 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p68q7FxdWefV2R5Th1a0xfEDj3RdF6HgiFTN3ydE1vM=;
        b=refdVySVw7A/pjOV9Yp6LwkjoZ3kUkwdbrOU9RndbtuC/4tsonratdUUCGBoTCY2SA
         Yf6Po0lnXZFYZbqtXd7skSJWJuJbf/o6e937mRCKZoGUDJYNRZMLP+WymMaSNhbjmmbS
         fIHfwH93KIL3cNCGlTm12gf4Su6YRF0RHYHOLIXOaycGKIco23qMNSAerS83e3cx7FDd
         fQK5X7RjeRBcM41vyHmxrkpqjvoc4FQmKzz4VPHUBKSiP/0moJoylxpFDAG2jjHmOjgj
         zxnDw4oXb0xWHMdKgtF7LHKxv5DKm9vKVCTQZAaDhh0VY+MbLfK0jxZP3N0+Fh6V8L+d
         Fx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p68q7FxdWefV2R5Th1a0xfEDj3RdF6HgiFTN3ydE1vM=;
        b=j8AxawuObKpGuA+N0pG2BS6S8HKNUmsV2TET7bEiunrsFhLyKfiRCHpJZPukzQ8pBy
         lZp+ou4Lv9oIDhTkZ/E1wdE/OgpbnmBDZ9i8yqqeanFi9aojiVsdCRZEGR4fbgea2px7
         CfB+haabmmZqDGv7x4xPAdfpG44Vo4B0AY/JwFStbLHu38OJqYdL1P4Ew8igTKPNpqpS
         N9iIlokWaWKYW6zH5K3IaptdpI91DwYfEyYDhZQdcmi2poNXvKi+qYtHjFAD2g5xOuZ/
         crg5eU09ICUpn4VcAeA7uoHSDKyCBWtG8vRgnhQfFChRQ0yJY3DQel9MjMP7oqwURYRQ
         haZg==
X-Gm-Message-State: ANhLgQ0SerxTaEcaeACTIfgP1Vu9FnN1wFSvFPn6hh5eqi/+IW0Q7MLG
        Ueev3edW+FhH3x3wwOcdXUzZPka/C/Zfub94Bp03uA==
X-Google-Smtp-Source: ADFU+vsH3mqpR9Tp9Tb+v4FFlhiStOYYETN7n0scypKKrukFU3p0H5RC7vLX/Vov04v2FyQ0XBN+26FQKXcaZao+8qQ=
X-Received: by 2002:a5d:6187:: with SMTP id j7mr16239644wru.419.1585322866189;
 Fri, 27 Mar 2020 08:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
 <20200326211005.13301-7-wsa+renesas@sang-engineering.com> <CADnq5_P07b-A-VawLTgiTMSdifxMbWS5kgQV_+0Bw2x_DQHATQ@mail.gmail.com>
 <20200327152535.GA2191@ravnborg.org>
In-Reply-To: <20200327152535.GA2191@ravnborg.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 27 Mar 2020 11:27:35 -0400
Message-ID: <CADnq5_O-pXK1FeT1NfGBdXYZbqF6jmyXJNPgJt5qLaYMLiZy_Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 27, 2020 at 11:25 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Fri, Mar 27, 2020 at 10:25:16AM -0400, Alex Deucher wrote:
> > On Thu, Mar 26, 2020 at 5:35 PM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > >
> > > Move away from the deprecated API.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > patches 1,6, are:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Should we commit all to drm-misc-next?

I'm fine to see it go through whatever tree makes sense.

Alex


>
>         Sam
>
>
> >
> > > ---
> > >  drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
> > >  drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> > > index 848ef68d9086..5d2591725189 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> > > @@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
> > >                                                                     ucOverdriveThermalController];
> > >                         info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
> > >                         strlcpy(info.type, name, sizeof(info.type));
> > > -                       i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                       i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                 }
> > >         }
> > >         num_modes = power_info->info.ucNumOfPowerModeEntries;
> > > @@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
> > >                                 const char *name = pp_lib_thermal_controller_names[controller->ucType];
> > >                                 info.addr = controller->ucI2cAddress >> 1;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                         }
> > >                 } else {
> > >                         DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> > > diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> > > index c3e49c973812..d3c04df7e75d 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_combios.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> > > @@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> > >                                 const char *name = thermal_controller_names[thermal_controller];
> > >                                 info.addr = i2c_addr >> 1;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                         }
> > >                 }
> > >         } else {
> > > @@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
> > >                                 const char *name = "f75375";
> > >                                 info.addr = 0x28;
> > >                                 strlcpy(info.type, name, sizeof(info.type));
> > > -                               i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
> > > +                               i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
> > >                                 DRM_INFO("Possible %s thermal controller at 0x%02x\n",
> > >                                          name, info.addr);
> > >                         }
> > > --
> > > 2.20.1
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
