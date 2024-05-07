Return-Path: <linux-i2c+bounces-3459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B3D8BEB74
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 20:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFAD1B2B4C5
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 18:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039F016D9A9;
	Tue,  7 May 2024 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DzBShiH1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7E716D4C6;
	Tue,  7 May 2024 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715105779; cv=none; b=DzWWAQKBxAfwwHtekB48haxJVaJ4et38nNJuX0qd3ii8sgChbVc4iSqog2meIu1CGJOVVZWf2U7KYEzGqwyKUDDfUYLTeqHix5aMG8CXDgf4iLGyalHwluXAJubbzKMTwJdBGYcATg00O6ZbQKm5QmCSSYJOEeQ1GOP1EmN9ixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715105779; c=relaxed/simple;
	bh=wWjeFhQmx4RAgiRysXr20ZnNZGZCeLrDNtRy30798z4=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:To:
	 In-Reply-To:Content-Type; b=sSepa0NwLUDU/MCedXw2OgFvVEKQbKUrg7RRPQqmWLqWDmqCLBsKJ+r2A1DL4qEzwKGE8cdjqDHLI9gTjXf7X6NixhrhvNa/jGikC50zQZWxvuUBHBGDEO2+1CiCOcq914sgwjUBvKzOrH6uyoCHMhlU4GW/kRjcfstEyIhwu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DzBShiH1; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 62C1B20B2C82;
	Tue,  7 May 2024 11:16:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 62C1B20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715105777;
	bh=PBRGTo20ufCiYvX5W3y8n5KQS3c/rPiOhM35HSOsaRQ=;
	h=Date:Subject:Cc:References:From:To:In-Reply-To:From;
	b=DzBShiH152LXFot+KucPmQbM03mnN+laHxZysZ8V2qQxlMhZsTtUKqypgwJBIJvdJ
	 n4Dz3w5CxX9vwpxTmKdIir2/VI20bIqZRRAfX/Mkdm6k/UIvMPkOxKqoliWGntbNPc
	 Ks6+pWYVRh/88H64gqZiZ1m1bIkwqOD3hIiBq8OM=
Message-ID: <0a6d4fa9-169f-425b-93d6-04314c617090@linux.microsoft.com>
Date: Tue, 7 May 2024 11:16:15 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] drm/amdgpu, drm/radeon: Make I2C terminology
 more inclusive
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
 Alexander Richards <electrodeyt@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Heiner Kallweit <hkallweit1@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Samson Tam <samson.tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone
 <dillon.varone@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Asad kamal <asad.kamal@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Darren Powell <darren.powell@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Le Ma <Le.Ma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-2-eahariha@linux.microsoft.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20240503181333.2336999-2-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/2024 11:13 AM, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  8 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 10 +++----
>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.c     |  8 +++---
>  drivers/gpu/drm/amd/amdgpu/atombios_i2c.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c    | 20 ++++++-------
>  .../gpu/drm/amd/display/dc/bios/bios_parser.c |  2 +-
>  .../drm/amd/display/dc/bios/bios_parser2.c    |  2 +-
>  .../drm/amd/display/dc/core/dc_link_exports.c |  4 +--
>  drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c  |  4 +--
>  .../display/include/grph_object_ctrl_defs.h   |  2 +-
>  drivers/gpu/drm/amd/include/atombios.h        |  2 +-
>  drivers/gpu/drm/amd/include/atomfirmware.h    | 26 ++++++++---------
>  .../powerplay/hwmgr/vega20_processpptables.c  |  4 +--
>  .../amd/pm/powerplay/inc/smu11_driver_if.h    |  2 +-
>  .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
>  .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
>  .../pmfw_if/smu11_driver_if_sienna_cichlid.h  |  2 +-
>  .../inc/pmfw_if/smu13_driver_if_aldebaran.h   |  2 +-
>  .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  2 +-
>  .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  2 +-
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c |  4 +--
>  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  8 +++---
>  drivers/gpu/drm/radeon/atombios.h             | 16 +++++------
>  drivers/gpu/drm/radeon/atombios_i2c.c         |  4 +--
>  drivers/gpu/drm/radeon/radeon_combios.c       | 28 +++++++++----------
>  drivers/gpu/drm/radeon/radeon_i2c.c           | 10 +++----
>  drivers/gpu/drm/radeon/radeon_mode.h          |  6 ++--
>  28 files changed, 93 insertions(+), 93 deletions(-)
>

<snip>

Hello Christian, Daniel, David, others,

Could you re-review v2 since the feedback provided in v0 [1] has now been addressed? I can send v3 with
all other feedback and signoffs from the other maintainers incorporated when I have something for amdgpu 
and radeon.

Thanks,
Easwar

[1] https://lore.kernel.org/all/53f3afba-4759-4ea1-b408-8a929b26280c@amd.com/

