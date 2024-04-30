Return-Path: <linux-i2c+bounces-3356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E228B8202
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 23:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D10EFB2185A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 21:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7641BED70;
	Tue, 30 Apr 2024 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="dsoh69Pe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278481E52C;
	Tue, 30 Apr 2024 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714513223; cv=none; b=fD1lLi0XJxU4B1BqBr3yDiGtXcJaqVzfrl8L9Tmm8QZbe0JZvqImqxlG1SIAq7FWoxXJ1NFSOLhLD/JPkDE3b8uI8RmyKp5pCbbIz7eOmPSlZPcy7uPEchW7rJiOEuGHPtbUwiVp6dBiOXAqxfdx1okv7WmPdMv2sJv0G1F7mhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714513223; c=relaxed/simple;
	bh=Mrs/Piw8jse4ek5sQYu6v7Fpg89TSqWrpsLnLI2WElU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqv/+ta/HVir39jC1ikuZoSUTuIiP04N7Kf/RRI7D+oWSwO3c+FIu8BhzGjZOzI6kEIkpSZG5ptD1Sy2sZpuGjmEdY/QalrU/MfynklI+c8RgTiXcaa2kTloNVPFJV6YWqYP+xTEdwe71AUhYEOnl8b3sXQWHaVJhVItce1cbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=dsoh69Pe; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.32.120] (unknown [20.236.11.185])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2953021112E1;
	Tue, 30 Apr 2024 14:40:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2953021112E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714513221;
	bh=N5FvQ/TypNHdjNMqYFIqXh66AahkR8SgB9HzMwk5dOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dsoh69PeBK5TTLU3vn54yAjgk6HEgw6uX5/96K1j6MEq+uhUAt3mt7u2D+71GOFNI
	 WvGANH7w+I/8RenBbMN5ykkWz3Uk5CrLxIasJ2xUAitAkekfx5YEX9aKxDjas/zyYs
	 t0b5kEvCuz8TxGtWmnMzMga/jwInlSVIoFyEUWbA=
Message-ID: <92189a8c-00dc-4b79-8fd0-3670b80d0db2@linux.microsoft.com>
Date: Tue, 30 Apr 2024 14:40:18 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/12] drm/i915: Make I2C terminology more inclusive
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-4-eahariha@linux.microsoft.com>
 <ZjFUwjMFMcvJr5KI@intel.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <ZjFUwjMFMcvJr5KI@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/2024 1:29 PM, Rodrigo Vivi wrote:
> On Tue, Apr 30, 2024 at 05:38:02PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> I'm glad to see this change!
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> ---
>>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
>>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
>>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
>>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
>>  drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
>>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
>>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
>>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
>>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
>>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
>>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
>>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
>>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
>>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
>>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
>>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
>>  19 files changed, 119 insertions(+), 119 deletions(-)
> 
> The chances of conflicts are high with this many changes,
> but should be easy enough to deal with later, so feel free
> to move with this i915 patch on any other tree and we catch-up
> later.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

Thanks for the review and ack! I actually thought that this might end up going in as individual
patches via the various respective trees since it's now completely independent of Wolfram's enabling
series with the drop of the final patch that was treewide.

What do you think?

Thanks,
Easwar


