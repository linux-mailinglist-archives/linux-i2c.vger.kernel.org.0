Return-Path: <linux-i2c+bounces-196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9727EE745
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 20:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFEC31C20878
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 19:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071123A8E9;
	Thu, 16 Nov 2023 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1T7TJ9l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE7CD52
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 11:15:30 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1f4bbf525c7so566029fac.0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 11:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162129; x=1700766929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrT52wuzqJEA/NKzytgl6uhJdsSSy1qeuj6M28CmNKE=;
        b=V1T7TJ9lQe4EmmahsUSlZAn/dJKFNKSScuwVyZM7Tqd5TqO0RCg79QnY959r8gRrXu
         YmiklGxcBen9x0xm/4PFTxHNfEzb3qMhFGRg0RIGrIb6nCybcB9ztmjaJn4G7IGnj1uC
         v6Fdomhn1Uxa6TW7hQ1K9IR1t7V72vw33KHqpsEz04o65kUtm1y4/e4VvTzqt9IPBc86
         nmxbExV8SrzpBh/7Ztxlqim3fXZKbRsoMbYON+Y2oTdvnViznGo7gMMQbNNhq6j3jDJb
         gSacgSNsvOm10VF4M3qaLKJ8Awa4o6J1uWuggPpZPNrCF3g+o+UbCfHuFx4IMns0r2LY
         OtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162129; x=1700766929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrT52wuzqJEA/NKzytgl6uhJdsSSy1qeuj6M28CmNKE=;
        b=AkQ4toY5FgjN/dfixFUxARtlcFxKCEfbkHpu/S1oydfmi1JUdIFG0K4u38h7mGcKdu
         vwr5R1t3hPB16iGrWqxeNboZmoc1wNBnW30U8nxCvN+C1g8aUsKxVlRgSrWAjT/7E3NW
         ncqBYcnqyLp27Xm2whThOoTPMK0I3sAMsGiYC9WzWOCHp9U9+PrVqedyn+7BEW3ygUO9
         NXKxZE0gn3Gn4A6QL57FXZfeH/jma+U/9Z4RAAaQtG/mDtNKc4w8KWM79CL5SSyN2KdX
         YYwvCbgajKm6tPTbrOsH+ZOl4GeOV1xlF6i4Oa/T3t4ph7WDNPVwyB7b7hW3nyqCvvt+
         iwnQ==
X-Gm-Message-State: AOJu0Ywu9erg5jnEv7Af323KqE7srxFUsN6KZ8UuUt1npNliEdQlM9Ea
	io1GjRjPwXxGJlDOPkFD4bQBP1HTmxkL9dNlW0I=
X-Google-Smtp-Source: AGHT+IEEVyfMLpaqabnwIIa7eFVc0DcJwSI3o3KzHkulFTuCGoTzFHhmdC1gw1/qtIymgg8GAkfktThR+JudbyajZhs=
X-Received: by 2002:a05:6870:95a4:b0:1e9:e8c7:bef6 with SMTP id
 k36-20020a05687095a400b001e9e8c7bef6mr1394483oao.18.1700162129700; Thu, 16
 Nov 2023 11:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
In-Reply-To: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:15:18 -0500
Message-ID: <CADnq5_OURY17Oih9iiCA9byL=UNK05P5m-Bry8KuA2tW=VVF7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Remove I2C_CLASS_SPD support
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Wolfram Sang <wsa@kernel.org>, "open list:AMD KFD" <dri-devel@lists.freedesktop.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 6:37=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> I2C_CLASS_SPD was used to expose the EEPROM content to user space,
> via the legacy eeprom driver. Now that this driver has been removed,
> we can remove I2C_CLASS_SPD support. at24 driver with explicit
> instantiation should be used instead.
>
> If in doubt this patch could be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via the i2c tree if you prefer.

Alex

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   | 1 -
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 1 -
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 1a6675d70..bc56a29e6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1527,7 +1527,6 @@ static int aldebaran_i2c_control_init(struct smu_co=
ntext *smu)
>         smu_i2c->port =3D 0;
>         mutex_init(&smu_i2c->mutex);
>         control->owner =3D THIS_MODULE;
> -       control->class =3D I2C_CLASS_SPD;
>         control->dev.parent =3D &adev->pdev->dev;
>         control->algo =3D &aldebaran_i2c_algo;
>         snprintf(control->name, sizeof(control->name), "AMDGPU SMU 0");
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 82c4e1f1c..c0e62bab9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -2720,7 +2720,6 @@ static int smu_v13_0_0_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v13_0_0_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index 891605d49..9de91bd77 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -1884,7 +1884,6 @@ static int smu_v13_0_6_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v13_0_6_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> --
> 2.42.1
>

