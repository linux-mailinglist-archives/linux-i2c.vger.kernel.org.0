Return-Path: <linux-i2c+bounces-2676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B47892394
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 19:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ACE21C22044
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C662145C15;
	Fri, 29 Mar 2024 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="pXGtnHj3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26134225A8;
	Fri, 29 Mar 2024 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711738286; cv=none; b=UAlb+3EXqVNo6T6D8sRiILvBAGrMUWclut0sx3HXq5xEjcC4EebwPlOvFT8XaLPYXERk4Gc2lIcNKBqGSRuiJbUEbRRBFEOr6GsYGVHKaJMkC4aXe02APKrxfvCvLN4xo+m8LoZm6naPWDVOT1FlWXxl0D1KtOvDTyLuA+C8cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711738286; c=relaxed/simple;
	bh=Ys+kBNBHijzDi2YWXzThWwp5KAH+FSeQOJSrMGqWnb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2xo8iMtj5HnHCWnpW+bi1CfAIrq4TzNnxD8dSVG24rNIw6touU/R6DhpGysdaPNbHvSxoBgNyBIyyI6gSk/aNL4OxgLPwCwn5jtKD7fNwccTsYEZt2Gspz6oa9RGBXajeQDGqItxh7Nu5LRrUSufuumYg/ybmuv1HCqTHQxojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=pXGtnHj3; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.128.229] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3DC7F20E6F42;
	Fri, 29 Mar 2024 11:51:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3DC7F20E6F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711738284;
	bh=/pwtgF4mJa43U7u8eGPihHXysR53d8MYCc7SQXhSzb8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXGtnHj3DxKqLXh0cvZCSvcaLvUsOJN/dP3lwRNbukpYU9EaB53wcWvXKvtfs1jy5
	 bJOw7CGRycUoouJw+APpXY6nb+neaFD76BLiDLQVXc02pqRxYlxecAeIpSrNcIxic/
	 vz7SB5uqZmwS7X85Y0Jv1eOtFAQjodiyD0paH60Y=
Message-ID: <a667a8b9-f7c3-4cb3-9a19-858f10d8bb9d@linux.microsoft.com>
Date: Fri, 29 Mar 2024 11:51:21 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology more
 inclusive
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
 Alexander Richards <electrodeyt@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Alan Liu <haoping.liu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Sohaib Nadeem <sohaib.nadeem@amd.com>, Lewis Huang <lewis.huang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Jun Lei <jun.lei@amd.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Le Ma <Le.Ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Darren Powell <darren.powell@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
 <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/2024 10:38 AM, Andi Shyti wrote:
> Hi,
> 

<snip>

> 
>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>> in the specification.
>>>
>>> The specification talks about:
>>>
>>>  - master -> controller
>>>  - slave -> target (and not client)
>>>
>>> But both you and Wolfram have used client. I'd like to reach
>>> some more consistency here.
>>
>> I had the impression that remote targets (i.e external to the device) were to be called clients,
>> e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
>> I chose the terminology according to that understanding, but now I can't find where I got that
>> information.
> 
> The word "client" does not even appear in the documentation (only
> one instance in the i3c document), so that the change is not
> related to the document as stated in the commit log. Unless, of
> course, I am missing something.
> 
> I'm OK with choosing a "customized" naming, but we need to reach
> an agreement.
> 
> I raised the same question to Wolfram.
> 
> Thanks,
> Andi

I don't have a preference between using target and client. As I mentioned in the thread fork, my
information came entirely from Wolfram's cover letter and patch messages. I'll follow along with
whatever you and Wolfram settle on.

Thanks,
Easwar


