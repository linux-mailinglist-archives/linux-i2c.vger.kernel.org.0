Return-Path: <linux-i2c+bounces-199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D07EE75D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 20:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E06E2B20A8E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 19:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2383C486;
	Thu, 16 Nov 2023 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z37LPrxr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7587D4B;
	Thu, 16 Nov 2023 11:18:34 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f4a9dd83d6so637780fac.0;
        Thu, 16 Nov 2023 11:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162314; x=1700767114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STPFJgJTmWckMd9fvN+D7up8AUbhHF9YB+XgQB9vdw4=;
        b=Z37LPrxru/exN/dkbMPtlXMvs7FGglc+OY2J+O7rmINn6cu6kvVmNQA1Tv2qC3qhKn
         ibT/2JKfh68Nff48B9pthxuYp3nVP7Coe2UD92guTvWeNU5/5TynoT3VEA9/ELN36UWF
         FWN1faWIq6eU4prLN3R2Py/R35PxKCaeM6y3z7loKZfCaPbr7YapdgG37XAOcYtHXjiY
         H1y2OjVyCQt0KdgofUPsF4/X5URpwodqiLL+PQS1UrgR1ImQ8AQOZrkfDh/Bm+K7DhUk
         TMS1SqpQWuja2nJtlmv3C+g/Yb+cQRUlzRvNlt4yKPX7J52rr8TByM6RLrpCXHVLxbFU
         Q4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162314; x=1700767114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STPFJgJTmWckMd9fvN+D7up8AUbhHF9YB+XgQB9vdw4=;
        b=ZV6LWUjnGQaV0LZ4m4+oMDwkLpAisl3sEFxa+KLYzgoCMcrOoDqOQY4Uu6NCGhFxBl
         7lXb8A84F/Hv4VwTuFuvckwo4Ljt40DQq2GR+8wvuNz8jEvtMxV4BFWpO0uDSM7I9EAU
         lSdM8Ty8HXYq+sV0sknFpAM/5eKBnM+WBSHl8E+hxi4ZzA4ySXBE/A2SQFYoEDVvSyBI
         hxJ0GEJoCg9RKsKUoCdJQEyf6MiaR8BsKEORvaJJOkyD7qdEhw+39q967X2i6P7ADVMH
         gNkfJws00LzBmf3SJ1/RtzpKHLF8qBXNKIA6BxtsQNfmS8hwG82s/DR63RWqsq1UiQol
         4rlg==
X-Gm-Message-State: AOJu0YygPMfXiEnCc4z5g1vsuGbzpw3ZntQB70xY2Zc3hTIbvL2RtkJh
	G7ZcJ9xMUBdRytZAFi29pG3MCCnVGZAZU9hLYos=
X-Google-Smtp-Source: AGHT+IH3DRdTfKoOMyMOzkQDCigyhHbNJcoUpI6PmnvC7T6AkuKRO4z5Oxn0dWHKqFPRDwgDEBJUuRuS8SdMX1s4iaI=
X-Received: by 2002:a05:6870:169b:b0:1ef:bfd8:90d1 with SMTP id
 j27-20020a056870169b00b001efbfd890d1mr20538538oae.22.1700162314073; Thu, 16
 Nov 2023 11:18:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com> <20231113112344.719-4-hkallweit1@gmail.com>
 <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
In-Reply-To: <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:18:23 -0500
Message-ID: <CADnq5_NjZkGLz-J39h_6djdgaD8zT3_pEq4iy5FfcYTz646SFg@mail.gmail.com>
Subject: Re: [PATCH 03/20] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:
 remove I2C_CLASS_DDC support
To: Harry Wentland <harry.wentland@amd.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>, Leo Li <sunpeng.li@amd.com>, 
	dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 12:50=E2=80=AFPM Harry Wentland <harry.wentland@amd=
.com> wrote:
>
> Please just use "drm/amd/display:" as tag in the commit subject.
>
> With that fixed, this is
> Acked-by: Harry Wentland <harry.wentland@amd.com>
>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Feel free to take this via the i2c tree if you prefer.

Alex

> Harry
>
> On 2023-11-13 06:23, Heiner Kallweit wrote:
> > After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> > olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> > Class-based device auto-detection is a legacy mechanism and shouldn't
> > be used in new code. So we can remove this class completely now.
> >
> > Preferably this series should be applied via the i2c tree.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 6f99f6754..ae1edc6ab 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
> >       if (!i2c)
> >               return NULL;
> >       i2c->base.owner =3D THIS_MODULE;
> > -     i2c->base.class =3D I2C_CLASS_DDC;
> >       i2c->base.dev.parent =3D &adev->pdev->dev;
> >       i2c->base.algo =3D &amdgpu_dm_i2c_algo;
> >       snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c h=
w bus %d", link_index);
> >
>

