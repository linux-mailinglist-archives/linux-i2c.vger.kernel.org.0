Return-Path: <linux-i2c+bounces-2674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CF8922D6
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6BA1C235AE
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82655136665;
	Fri, 29 Mar 2024 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="cX2kQ6f7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA1C1C0DD4;
	Fri, 29 Mar 2024 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733908; cv=none; b=sAtvxwdYpkoyUPS6jJ92ZkZ6hJkF548GKZ74QjRpiNOVEwjCVYsK969Yo1ThaEpoJspl+Li+ggibESCxumNTbpKh4bU9o6tqDqhtqaiSyVxPo9sXL3yiXKzCjwBWLhMnYsFX/AWtPt7ZBfL2dtU9ASq78XXpgi70gtmITIbjIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733908; c=relaxed/simple;
	bh=q/8RTlTCNVVq2gV/jmDeJz3eDbWffIS/IhFa2nYJb/Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XAHlQdVXu8/yU8G2dxzx4bjjQBnRpJPWh3KsJ/nfMBCyRELQHrNcMFJ9EthjNOPzJKtYEWUY2p0hzsjtnylmssZBpxj8/KcE130pr/I+coOdv4Ky4KDQ9/DsduulEaxkTBOJKkCzVFMFX2D4K75pOAMVVvglfRZVIRtCbjnyPdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=cX2kQ6f7; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.128.229] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8A372201F16E;
	Fri, 29 Mar 2024 10:38:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8A372201F16E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711733906;
	bh=8tbmpJNBNI1k4VwDOIxfkmsXDU989tyOYol27bNqXbk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=cX2kQ6f74T2I03q55Vd7kF3+Ls664raID5hfw7D0UiNwgBbbYkRGavQTlFAnCbM9L
	 kqCM/BoF10ug6vQ7GnbaoopFkzr692jiKyEuH/t4hii+FxMUY4ZI5aXzomIEuN7X2P
	 bcPCAeq2cVRN3AzaLSxywZzWIrVSy1L+jsCYyD5A=
Message-ID: <5181b1e8-032d-473b-92f3-0402bebad1b4@linux.microsoft.com>
Date: Fri, 29 Mar 2024 10:38:23 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology more
 inclusive
From: Easwar Hariharan <eahariha@linux.microsoft.com>
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
Content-Language: en-CA
In-Reply-To: <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/2024 10:28 AM, Easwar Hariharan wrote:
> On 3/29/2024 10:16 AM, Andi Shyti wrote:
>> Hi Easwar,
>>

<snip>

>>
>> The specification talks about:
>>
>>  - master -> controller
>>  - slave -> target (and not client)
>>
>> But both you and Wolfram have used client. I'd like to reach
>> some more consistency here.
> 
> I had the impression that remote targets (i.e external to the device) were to be called clients,
> e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
> I chose the terminology according to that understanding, but now I can't find where I got that
> information.
> 
> Thanks,
> Easwar

Ah, it was in Wolfram's individual commit messages "They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target")."

Thanks,
Easwar

