Return-Path: <linux-i2c+bounces-3464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9238C007D
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 16:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DA361C2173F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 14:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1700F86652;
	Wed,  8 May 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7yLjqRt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD81A2C05;
	Wed,  8 May 2024 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179994; cv=none; b=PmdMzzLvAKkJLnU0RyqX7I3KP41hqRYC9mWPO2QI0wb/tMP3eTHxvXXwpiOOzcZlWNRBTnoUhBcL5qAXl2ZoygheyAAE0STF49aoJIq3gm1NW4yFJFcqx9gYcmh2x3he9OScgJpDaLIWJGLTKaNw4i8UXRcPMTr3sWn+WvJ07p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179994; c=relaxed/simple;
	bh=i7gM/7ceVH9GiM9FWWHzRT6IIxXyMDrp9l4NDFUyGpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHybyXdr1wqlGiit1N6veHHqYLOWD0dl6ukXwzWZBBw0L9xt1GRH4ryDMZsaxSMcnFSs8X+SQapLrR8Y2uJ1j/qUyubt7maDC+x3yQ1qliKDPOjlKSzhJTS7jY+4vtm/tTqTrcF47f4i8gUmNv1hhYGVyY/jVntJtOQJHKEUTKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7yLjqRt; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ed96772f92so32715835ad.0;
        Wed, 08 May 2024 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715179993; x=1715784793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vhaN0DvnzEE7UFS6Z8+WhLp7dcxsndKh+qCCeMmpD4=;
        b=U7yLjqRtQKqqdAd33VZJDPfeEcqw/m2dM6/xn7KJ8n8bmLZzzHbZdYPGdU5PSJVrqZ
         Y1qwUPDlzdjFyzRtIe1ixjfgdwUY4nSYz1/GgAqIK80hX5fEs9AxXD0DM9oQpiKOf/L3
         Q+n0UAbuj8jAl+wEVBwcaHwtqMAIaXb1tImf0KQNGAuBXz9hZdJBW3pOmN6sdiNENOLq
         Yg3GcxQZINpjHEmcRudEIbaFddGz7bKsDcdBElHTwt0JHbM/j9tNqRnNcXUaVxbL9rY2
         1N83cyciiHT8N9glyn0NZ41Nc+4hQjW0xBZvw3pDgi0L61yQZInf/Es1S+H97mINS1Pp
         yqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715179993; x=1715784793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vhaN0DvnzEE7UFS6Z8+WhLp7dcxsndKh+qCCeMmpD4=;
        b=o5vZ6dXJTRtj/vQ+uPkC1JLujCmoNh3NsDBKHpR0IQB8/kflYk8Esnr+69Wd1EDfq0
         OE6zkAFka8sVyR5fcPMIwdm4dIUMAPt8MYMYCanVifo/PUNiSsDY8DOsfDGh6MNTw5Cb
         tT8JNA82RfyYmIa6oU0e/4zhMw4rNAT6RppJ+EjZoz/8O+4ZBhoOBm3vJfDZS1VkhX97
         XP0rZ/BYys/fjJi1h7YkKve6B7eFd/lgJGM5WmHZJlLbgi8YqDiX9tJPmC/4UO7u8mYR
         9pZ/IOeMOdsB9g+S06UbtmLvFImdDlhW84pBuyTxPDcwPk82Cupu1o35yTpUb/5KOAuk
         bIDw==
X-Forwarded-Encrypted: i=1; AJvYcCVxKvFb6MRVhZSmWa5LhHpKC4hwcq99/Uca8lvphgfZilTuUz4OV4kh49NKhxirKdoO3EMOuKoJJJDpv9tiPbYqNCxZT/sjyIYdP/VsUb10smQmdMwnJBI1JeLeyrXkYCj5nRUp3g/Q7weaVi5rsw7rxCrEUh/uqmMoDFO2LMG6+qWSk4J70qMMCUgWb8akxpgcFTDalo4NGYal3xdzT8jxUg==
X-Gm-Message-State: AOJu0YxlrzZobEMPVzRj2HQnvfc8WolnooEn87JblYjZPbrppOpeO6xH
	Sqoe1Kcc1Rz+HdBto1q+u/p7i6EORwfdMtV7K/ZKbcShmYvLgXEVQODcHzbVVK9UurnXkdphE3m
	zzdolIbuAFNU668le4I6AVwPLZ4U=
X-Google-Smtp-Source: AGHT+IGL3PYhnDLj6ks3jqYaCF3oC5CbXYK5TPhVcB57zpPxv4lXUjO9ZJm3pfZo093/G3vsqtu6vNgRmORCuwy8WGQ=
X-Received: by 2002:a17:902:ec89:b0:1e2:a61d:905 with SMTP id
 d9443c01a7336-1eeb078ef79mr30093575ad.63.1715179992582; Wed, 08 May 2024
 07:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com> <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
In-Reply-To: <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 May 2024 10:53:00 -0400
Message-ID: <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] drm/amdgpu, drm/radeon: Make I2C terminology
 more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, 
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>, 
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Evan Quan <evan.quan@amd.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, Candice Li <candice.li@amd.com>, 
	Ran Sun <sunran001@208suo.com>, Alexander Richards <electrodeyt@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
	Ruan Jinjie <ruanjinjie@huawei.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>, 
	Sohaib Nadeem <sohaib.nadeem@amd.com>, Charlene Liu <charlene.liu@amd.com>, 
	Tom Chung <chiahsuan.chung@amd.com>, Alan Liu <haoping.liu@amd.com>, 
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>, George Shen <george.shen@amd.com>, 
	Aric Cyr <aric.cyr@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, 
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone <dillon.varone@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>, 
	Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
	Darren Powell <darren.powell@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, Le Ma <Le.Ma@amd.com>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 2:32=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
> > I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/s=
lave"
> > with more appropriate terms. Inspired by and following on to Wolfram's
> > series to fix drivers/i2c/[1], fix the terminology for users of
> > I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> > in the specification.
> >
> > Compile tested, no functionality changes intended
> >
> > [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang=
-engineering.com/
> >
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
> >  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
> >  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
> >  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
> >  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
> >  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
> >  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
> >  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
> >  .../display/include/grph_object_ctrl_defs.h   |  2 +-
> >  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
> >  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
> >  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
> >  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
> >  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
> >  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
> >  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
> >  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
> >  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
> >  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
> >  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
> >  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
> >  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
> >  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
> >  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
> >  28 files changed, 93 insertions(+), 93 deletions(-)
> >
>
> <snip>
>
> Hello Christian, Daniel, David, others,
>
> Could you re-review v2 since the feedback provided in v0 [1] has now been=
 addressed? I can send v3 with
> all other feedback and signoffs from the other maintainers incorporated w=
hen I have something for amdgpu
> and radeon.

This seems like a lot of churn.  Additionally, a bunch of these
headers are shared with other OSes, so it's possible some of the
changes may end up getting reverted accidently when we sync up or we
may add new headers in new code with the old nomenclature and then
we'd need to make sure to adjust it to make sure everything was
aligned again.  I would just as soon leave things as is, but I'm open
to acking them if there is a strong desire to update things.

Alex

