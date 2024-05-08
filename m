Return-Path: <linux-i2c+bounces-3466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9B98C0616
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 23:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 519AAB224E7
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 21:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C249E131BB7;
	Wed,  8 May 2024 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kue7+vgY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB213175B;
	Wed,  8 May 2024 21:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202761; cv=none; b=KFITvSIqL6VanpBmAwNNy5XMCf3r4v8pkZ+Wt7rxsiwLwK2hzEV+oqwOT+S0mX+f5ZtjxJiuKdH7Fd+YBQD5VImEI/CAkpc1AAV5gAb3sllbTs4ZFeQYj74z37dCr+3Jeu43io4BwQE4HKINl136woKyXINNHm4u8Zi852w1O34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202761; c=relaxed/simple;
	bh=oGjSk7ruln7zLefMobc9oINUvxZjO/nocXZwgwcXems=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mt8iBMqwIut8S+bTsGbRRwV4oXHHZQTvFafFHL7bLr39Zd4nWBBqNvpB19/0J0JY10dd/Sr0UMU2B2oPkYZpaFo9rM0TFkm6K2NFn9rRLloYpS6Z5rcjpM1geOFtB933t+HRRHncGTPyAPHpHVcKxwXdhOKx0dbfh98yTsbr4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kue7+vgY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so1166555ad.1;
        Wed, 08 May 2024 14:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715202759; x=1715807559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZrJFIbLTxTYrbPISz2hMEePGMl55QlS4SmkJ5sghxc=;
        b=kue7+vgYrS1T3g4S2XoH8JJ58RRaUa6lQwBMb/NcpuMMvV3NGhgrQaomKawOA/jwUI
         mHbJIHhgogvSgWd8B60SvnIbDYYNf7dgpgfZRIJio4qzG0vUGZ4dQ+AbbNQJnUKo3xb8
         4s4NttAiMMQQnNDsY/Xa1i34TaPFY2CmEvFnhtXXn3rEU7ykQTyCsU+AzO6QSzB9VN96
         0+CPP8qruAA8lQy6MN8OUTq/XRHj43LuTuZwXm2AtjWPIOXjxk6Y591msPGqAV8gVrmr
         mN5IqckHL5YmDuoAbq5sTkphrmAzIrsfjg6pzVCWt6KYn/A1Osfv6/a9pobPNjtT682+
         35cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715202759; x=1715807559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZrJFIbLTxTYrbPISz2hMEePGMl55QlS4SmkJ5sghxc=;
        b=kd9EAR1KkzRfsWd0PkMz9z4zCg0gyzoquGZmC4K8jmuMp2rtj1jzMRc4jnWD8x0UPa
         TMajmMGg3emLwgZlejJu3ymBLQhO94ZMZ6uO7A1P23Ig+w+yrKsbqWFuWrgIL9g+Ruc6
         kUeMsXsHMRd+9KwIRAcG4AFJtNlsuP4UvdYC/+NtBXlW/t+ihQPdsb60kmLgjiD61qd8
         AbmRzkh0sEK52dl2lM/zV9eX0XwBPQYOtHgBnF37ScFncnUXBMaJXoGLbIUepFwTWOeu
         dcIC+E/tXUarrVP5I1KFRAtFgjTR42WGe8vjqaBOH6HNcA4bFVrGbIJPMwErtRPX0mgz
         Vj8w==
X-Forwarded-Encrypted: i=1; AJvYcCUzxSgUPfLC1r2G3J9Ipi+xYJiCW/MvnfGUl6Lqwun4CbbC+msZ28gl0I4eD2b4ZIq+Jih5L4tmHN5lRgBcYnHirGKIFF/js+WTSs0Ar0lGJ/9gY2fpehd/fcol5N8DCva1NpRq9UkEDwqMVzYxOqZMBj5RNYMm3P72AvFBh3HO9ppBYPLPLVySqloeARcEU/9QG9r0mhcAiiYAKaYISZ9/GQ==
X-Gm-Message-State: AOJu0YyXne1pzT3YHFR+JmSMkOg4sB3fSWs6CnDDjk1HyvBtP5aV95Qt
	WI1qPwRy8zG9C6vgEyBDrxEXDgP3+53SKW2Ezj7COYGGuzUAn3n2jzX1iPqVw9sqgI2/YuStAR0
	u94EBwAQkMe4ejG5OQ3/cemE55hQ=
X-Google-Smtp-Source: AGHT+IHxDh3V7MlhtBOeSZmaUOUREgbpbUX+stT5ktTHA7M8CkQTRfPTcAkO7AsXwTWHGXOdozSH9iqT5gOxtlkl7Mw=
X-Received: by 2002:a17:902:b110:b0:1e4:b4f5:5cfa with SMTP id
 d9443c01a7336-1eeb03a05d3mr37380885ad.27.1715202759142; Wed, 08 May 2024
 14:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com> <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
 <CADnq5_NpxPM-FTcCchdBMRng=6xdM03s93XEX2_8fx44MRVYag@mail.gmail.com> <2654ad6e-66b7-4698-94da-892cc9d0802c@linux.microsoft.com>
In-Reply-To: <2654ad6e-66b7-4698-94da-892cc9d0802c@linux.microsoft.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 May 2024 17:12:26 -0400
Message-ID: <CADnq5_PAr6GHEBuStcJ6KVBS+mg64koqJwTDcz+7UcaEy_P_qA@mail.gmail.com>
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

On Wed, May 8, 2024 at 4:12=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 5/8/2024 7:53 AM, Alex Deucher wrote:
> > On Tue, May 7, 2024 at 2:32=E2=80=AFPM Easwar Hariharan
> > <eahariha@linux.microsoft.com> wrote:
> >>
> >> On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
> >>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master=
/slave"
> >>> with more appropriate terms. Inspired by and following on to Wolfram'=
s
> >>> series to fix drivers/i2c/[1], fix the terminology for users of
> >>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exis=
ts
> >>> in the specification.
> >>>
> >>> Compile tested, no functionality changes intended
> >>>
> >>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sa=
ng-engineering.com/
> >>>
> >>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> >>> ---
> >>>  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
> >>>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
> >>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
> >>>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
> >>>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
> >>>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
> >>>  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
> >>>  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
> >>>  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
> >>>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
> >>>  .../display/include/grph_object_ctrl_defs.h   |  2 +-
> >>>  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
> >>>  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
> >>>  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
> >>>  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
> >>>  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
> >>>  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
> >>>  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
> >>>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
> >>>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
> >>>  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
> >>>  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
> >>>  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
> >>>  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++--------=
--
> >>>  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
> >>>  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
> >>>  28 files changed, 93 insertions(+), 93 deletions(-)
> >>>
> >>
> >> <snip>
> >>
> >> Hello Christian, Daniel, David, others,
> >>
> >> Could you re-review v2 since the feedback provided in v0 [1] has now b=
een addressed? I can send v3 with
> >> all other feedback and signoffs from the other maintainers incorporate=
d when I have something for amdgpu
> >> and radeon.
> >
> > This seems like a lot of churn.  Additionally, a bunch of these
> > headers are shared with other OSes, so it's possible some of the
> > changes may end up getting reverted accidently when we sync up or we
> > may add new headers in new code with the old nomenclature and then
> > we'd need to make sure to adjust it to make sure everything was
> > aligned again.  I would just as soon leave things as is, but I'm open
> > to acking them if there is a strong desire to update things.
> >
> > Alex
>
> The way I see it, this is a small downpayment on the debt we have built u=
p so far. Internship
> programs like LF Outreachy to get more underrepresented groups involved i=
n open source are trying to
> change the open source community culture to be more inclusive, but simult=
aneously rely on the culture
> being welcoming enough as well.
>
> I do see the challenge involved in preserving the changes and ensuring no=
 new code is added with
> outdated nomenclature (but see [1]), but culture changes one person at a =
time, and I'd encourage the community
> to do the work needed so we can move past our (mostly) inadvertent role i=
n perpetuating it.
>
> That's my 2c (or your sub-unit currency of choice).

Fair enough.
Acked-by: Aex Deucher <alexander.deucher@amd.com>

>
> Easwar
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D49decddd39e5f6132ccd7d9fdc3d7c470b0061bb

