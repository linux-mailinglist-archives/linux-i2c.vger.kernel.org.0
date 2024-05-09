Return-Path: <linux-i2c+bounces-3475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9C8C13A4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2024 19:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F40381F21D6B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2024 17:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9476FDF58;
	Thu,  9 May 2024 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAoumEpv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A38DDDA
	for <linux-i2c@vger.kernel.org>; Thu,  9 May 2024 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274947; cv=none; b=Pw2BHU5o2PwFqy8nG7cCGYyUnbDL73Ii8Kfpn6uftZpSSTodQmkbqcnKutQVzeh82qdXRklTSIPKg4F21XeYaqn8OXwZT4K51WavXoXBwb9tUYiUbWVLDbRWcc6cJfLGpLdI1OrkiUZ+OMKNUspIEb1QNICC12gYxsXd+x6ELXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274947; c=relaxed/simple;
	bh=Bm9qS6RJzPqGMpeuSMQdFOP5yRJF/Z0XksjLUXanrNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DM6I5TYC8Gta4a3W/62muP7XkvkAqe3IAoeP85nKOjRr1jgr30k+1QQFmpwTwUzMCDmNsUajM7M/q8s9VEskUvIl/G3eRy9MtcbTbOcQzmva48cGRc1WlMTegCRl1X8rwyHleO/LVslAkAEcbUHlmcGFS8+jmqJekyeNyWb/fGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAoumEpv; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b2733389f9so458759eaf.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 May 2024 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715274945; x=1715879745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZiLZP5/kk1vwmeb8DDi1DAoGL+kKQ0mz5pqsLRVAiQ=;
        b=aAoumEpvLuH2/Bci/CvTthqqEKv6FzbPhyNK19yUCLr5ePGLSr0u8x/Puk/RJj4tBD
         SMSNCvSuzCPCWllsgdZPMEnxHRh9yQ6k6TYHeBejErghLYmwhrscUxBT8rUCmptt/w5c
         uwFSLb8e57sFhisyUM/4ny2TSUG745B1Y+jWv/gAG4ZXELrcQmFqjWR5ebUVULMMqOe9
         Cspuk8yzDoAUcSvkA/c+wDh0H6mcDkmu0tWTXUjGktOv875jb59kKbRvNVFvbc6Gwwfo
         YJS1GtN9CZIfNVWRJlhhqf2FS/zdaPUuQ5XkqDHeai1pH46E0/g/w8T4olyxMaJ6FhXs
         Le8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715274945; x=1715879745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZiLZP5/kk1vwmeb8DDi1DAoGL+kKQ0mz5pqsLRVAiQ=;
        b=VkFP1J0ETMoCBubEIRuRqqx6hi+3uUco1YKzNqOlu7raIgFK73wj6WIL4DHIoOmNVk
         NIM4tkX+UIupQlBbfeI05r9k1RO6C5/KDRblEyX1nKuSxFkvbIVI4AEEk5lp/M1eUKzD
         nzDHuGBfWl/8+XeAlTXQdGSQwfLn+H4g3byV6elO6AFU+z2kUttk4HH1He+QMr98N15Q
         NtxFlxrAEv1mS4eoqx/ML8qWbhSCBj64aTqOW/DAqzlJmDuqFzw5p5Z4k9VWkvJvMXZl
         hk3WxyWqvh6AXFoDl8mXI9x1To3v2fYhBNxxYnIRtaie9msvQol/S+sbOi3CAI3yhhP0
         v1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMi1tggSQBvIWP40SlqiXgAXvNse1J7Q1KyGf7rovYLvwdCAQrKY4vA+X1wpJyywY4M83i+XMjqVsiotH54XuwlrK8bCbnwaHQ
X-Gm-Message-State: AOJu0YxQpLV2bTKX8yq3bllkuTYq79K8COLgTj5DE/uCb1+JGgUTFqbi
	uvIq+IExjjr8ePMiHhVOvVYcnrQ0LkDgd1QW/hrT/cFkcl0rLdQjPA23U/PYdP90cq/4IKW1wg/
	Hw9R/dk3Go999NTHn5cNQQL4IHM0=
X-Google-Smtp-Source: AGHT+IFjOz6jnY4i1OrbGHKdaDsm499HKePTZlD2L0qp+QR8Q9Mn7Vch8xVCZnWFEm9GLy0s0Bh0wQ4Age78L8ztfQg=
X-Received: by 2002:a05:6358:430f:b0:186:1b7f:e885 with SMTP id
 e5c5f4694b2df-193bb656d21mr4476955d.17.1715274944693; Thu, 09 May 2024
 10:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
In-Reply-To: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2024 13:15:32 -0400
Message-ID: <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.co=
m> wrote:
>
> Support for I2C_CLASS_SPD  is currently being removed from the kernel.
> Only remaining step is to remove the definition of I2C_CLASS_SPD.
> Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> here.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and applied.

Thanks!

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index 0d5ad531c..fb6f3bbe2 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@ -1616,7 +1616,6 @@ static int smu_v14_0_2_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v14_0_2_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> --
> 2.45.0
>

