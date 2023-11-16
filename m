Return-Path: <linux-i2c+bounces-195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1487EE73E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 20:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4008B281061
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 19:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C647C3A8E6;
	Thu, 16 Nov 2023 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moYr9IiP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D04ED4D;
	Thu, 16 Nov 2023 11:14:41 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1eb39505ba4so629149fac.0;
        Thu, 16 Nov 2023 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700162080; x=1700766880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWiF1WqqxyBapoclv3EkYIJfdBOsrn+v/ULRkmttT6o=;
        b=moYr9IiPXFWERTQv6eglElnLYVjZ5hcPGBk0/J1sioYVqam6KKdNuQF/9CWF5Pgjl5
         bEORdNyCP7qbUSpAJvgQ2hYLW+vMiEvRKsFqM3aEHKtYMYQ9iE4LZeZvBUGFrsnc7j0/
         bGFNOA3A4khFk47pdRUsNo3ZoEb27lbUEyu5/vKxDGttQky+9o0k8g1itBv3NM4TRnyf
         dyEIBPhA/ijxszwUUkJkheeDaYRCrYDtJCxHdguiW1ZFIRkcm7uc3zTj4JevN18cEHAn
         gMwtP2TbBGvnAii9jtcoUBwPv2BGsgN0SE6XlIcU375bIF+h034MxzRqr4cuPKYv+xXZ
         0Bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162080; x=1700766880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWiF1WqqxyBapoclv3EkYIJfdBOsrn+v/ULRkmttT6o=;
        b=KWj3y4HoRteqL3/ISAJRoH4QGhWQ5jAej7FjTNwpgQ6CmTJOYzfIsHHc8DnuGW6S9P
         RDd01QPNXP5EHo4TbqkJSCoS1UtshlihsKqE9Iugisljy/nBVrpjk8YVEG65HEqtjoQA
         zG9rA/7+s9DgC1tfvRexHNxDpKYp1SmVleH3FJNQIlT4O0ZaRUzxzW8eRM5VMU4+2rf6
         48pFg2FPCAP4EIh/PVLC3B/Dd3tJIO3fbl3DL4hul4sBcxDVkB4zHmCg6B5gCIEMS/ar
         sL/ERfcvQd/Egy5SSF24bMKNxJF62lpvWucWBg++zVqRPq+8PnXPXSU7IZ8ssPPlKYRD
         g5Rg==
X-Gm-Message-State: AOJu0Yy2vk90z6FLNdDQr4RIW36TG32VnEKLJ7P55vaMdDMQhm/tQIOX
	fFZMYTAEmAKZ+9n1EqBNUPPWnVTef59JQaqVn+Y=
X-Google-Smtp-Source: AGHT+IEY+u54FfeNJdJrCOSqzUm/T+8SHxcra/gAeZNjk67vEALsXeSBFNp0n26t+lFgh7s8dBMuraIGNmmWWVYZMEk=
X-Received: by 2002:a05:6870:bb19:b0:1e9:9179:4c6f with SMTP id
 nw25-20020a056870bb1900b001e991794c6fmr21555134oab.49.1700162080572; Thu, 16
 Nov 2023 11:14:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113112344.719-1-hkallweit1@gmail.com> <20231113112344.719-20-hkallweit1@gmail.com>
In-Reply-To: <20231113112344.719-20-hkallweit1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 14:14:29 -0500
Message-ID: <CADnq5_O66nHTSuLNfu42bPYZ_4ZOeoq7UzpxiWfGuixbgSyJvg@mail.gmail.com>
Subject: Re: [PATCH 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 6:24=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index f3680f4e6..ac901f4b4 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
>         if (!aux->ddc.algo)
>                 drm_dp_aux_init(aux);
>
> -       aux->ddc.class =3D I2C_CLASS_DDC;
>         aux->ddc.owner =3D THIS_MODULE;
>         aux->ddc.dev.parent =3D aux->dev;
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 0e0d0e76d..4376e2c1f 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_d=
p_mst_port *port)
>         aux->ddc.algo_data =3D aux;
>         aux->ddc.retries =3D 3;
>
> -       aux->ddc.class =3D I2C_CLASS_DDC;
>         aux->ddc.owner =3D THIS_MODULE;
>         /* FIXME: set the kdev of the port's connector as parent */
>         aux->ddc.dev.parent =3D parent_dev;
>

