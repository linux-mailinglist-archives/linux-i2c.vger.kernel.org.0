Return-Path: <linux-i2c+bounces-5085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8F94040E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 04:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B968F1F217B3
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 02:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABB8BE4A;
	Tue, 30 Jul 2024 02:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="neZhOk35"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C441465A7;
	Tue, 30 Jul 2024 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305015; cv=none; b=rrJ6ExKoA1OAO6ZgiSYCvyM8bSOXvhr8riYPvxc4iuISdKHxfghyXgoXE1cSpfuWFcBOzL0D3opQwnkDbTwLNhoIrXJN8uXW8tvOOKgQHTHgLa1rVdpUP09RMuNvcZaZHQi5RffnGG9SFCEFUCYfPxsPlDVVDmsSaz83s3ydgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305015; c=relaxed/simple;
	bh=5gJuI16tBQK0NwhmwPpGqD5+uu0a+NDMtcA4FN2ggb4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CH9FEdmYw/eShApdyen3YDJVVEYpPhM3DBq6ZEJ2f4NtoQ43MWia9DweTQ4O1Eg76WzkkjT16l5PffdUqpbvUEPSqFuf3dyPCvFJoQIF/HrQ1lR5Ee9MPzyCXGnCvfbXnW5iukjuSF6yXpFHaL10g7GApTOnAmyTXCZNNbqEFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=neZhOk35; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id AA20620B7165;
	Mon, 29 Jul 2024 19:03:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA20620B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722305013;
	bh=T8coAm5q0CSJOJYA2CaVwB4weZg41nUZwF8ur3BSbes=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=neZhOk35gk3ArYbtwdYJiUYeUVpuCtaY75cRf6NPYFuCU9VOeKeGpDeKezrD9B75g
	 knbZhVGSCoxH74cXLYqoX+XaHjuC7NBlApoV0P0k/GaThp9LMi7YNSKLf+QoAv54J7
	 96LjXOX3kwzeSxTrZgVlYlVUSCcHbvT/YRzfWBpg=
Message-ID: <c8023385-8fb8-432c-acf6-10e9a2894e2a@linux.microsoft.com>
Date: Mon, 29 Jul 2024 19:03:28 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, Wenjing Liu <wenjing.liu@amd.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Samson Tam <samson.tam@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bob Zhou <bob.zhou@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Le Ma <le.ma@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Li Ma <li.ma@amd.com>,
 Ran Sun <sunran001@208suo.com>, Evan Quan <evan.quan@amd.com>,
 Candice Li <candice.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Umio Yasuno <coelacanth_dream@protonmail.com>, Alvin Lee
 <alvin.lee2@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Darren Powell <darren.powell@amd.com>, Qingqing Zhuo
 <Qingqing.Zhuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Alex Hung
 <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Alexander Richards <electrodeyt@gmail.com>
Subject: Re: [PATCH v4 1/6] drm/amdgpu, drm/radeon: Make I2C terminology more
 inclusive
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-2-eahariha@linux.microsoft.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240711052734.1273652-2-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/2024 10:27 PM, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
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

Hi Alex, Christian, Xinhui, David, Daniel, others

This is the only patch in the series not merged into a tree. Is
something needed from me to move this forward?

Thanks,
Easwar

