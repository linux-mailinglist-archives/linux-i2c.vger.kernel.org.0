Return-Path: <linux-i2c+bounces-3412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E28BB534
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 23:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF762831CF
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 21:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8AD51C2B;
	Fri,  3 May 2024 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="R95ODi0E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E654F88C;
	Fri,  3 May 2024 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770258; cv=none; b=jSM59hrgP4VABD28zjgdicY86hAo9yJ9S8+DQlip9f/fi3ayInjZbJP6h671jaf+NVdADGuanC/zsoekjJQrnXY7iUR+fZ7Y2r8I8PIlFU90+zKoosq5Egl2AtBJZb09tveoBcWH9K15FaZDxKF6MC9jaQJwYeeqqeTGywM1wC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770258; c=relaxed/simple;
	bh=Nbscw4yqCbNyXzKumjiJ6SnfGBiOJh1OdsY1PrcQhD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYHbhLiYZr+vjwqN3i1sGHdg+JvQ2FpS1OyuPO6BT5zF1RR9Q1LN94ec70RakJ0cxtfYK1KC8um4aT/WGnwx+XprqzW8mlXNabmmDgO6haAYAA0+SN4Ijg4UA3KFO5yL9PKK+awIaYiIwr4z+UbJZBKwOkjRHtB71qxxImIB8/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=R95ODi0E; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.192.193] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63C2320B2C82;
	Fri,  3 May 2024 14:04:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63C2320B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714770255;
	bh=9otFudNnFQ6Fo0AyB5+q1vjaZY01jz77AOepixB8ajU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R95ODi0EifMs1TvCW5Xi0ANNjrXhlylciEvEb+9fFDkejLw2UxdIH3aGbHKy7QAHQ
	 NWlrzEfHb6xtWLUH40yuYEifdcRcVe9EtnlzXoUvrNfv8Q272I9YgK7RtIx4+a2iR3
	 bBhVE+Q3+pDSWqYdVXn/BDnCIJulJzU3uuDx3v5E=
Message-ID: <4f1e429c-794b-457c-ab1d-85eb97dc81c3@linux.microsoft.com>
Date: Fri, 3 May 2024 14:04:15 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/i915: Make I2C terminology more inclusive
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
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Zhi Wang <zhiwang@kernel.org>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-4-eahariha@linux.microsoft.com>
 <ZjU8NB-71xWI2X73@intel.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <ZjU8NB-71xWI2X73@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/2024 12:34 PM, Rodrigo Vivi wrote:
> On Fri, May 03, 2024 at 06:13:24PM +0000, Easwar Hariharan wrote:
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
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> It looks like the ack is not needed since we are merging this through
> drm-intel-next. But I'm planing to merge this only after seeing the
> main drivers/i2c accepting the new terminology. So we don't have a
> risk of that getting push back and new names there and we having
> to rename it once again.

Just to be explicit, did you want me to remove the Acked-by in v3, or will you when you pull
the patch into drm-intel-next?

> 
> (more below)
> 
>> Acked-by: Zhi Wang <zhiwang@kernel.org>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Jani, what bits were you concerned that were not necessarily i2c?
> I believe although not necessarily/directly i2c, I believe they
> are related and could benefit from the massive single shot renable.
> or do you have any better split to suggest here?
> 
> (more below)
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
>>

<snip>

>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index c17462b4c2ac..64db211148a8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -4332,7 +4332,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
>>  									connector->tile_group->id);
>>  
>>  	/*
>> -	 * EDP Transcoders cannot be ensalved
>> +	 * EDP Transcoders cannot be slaves
> 
>                                      ^ here
> perhaps you meant 'targeted' ?
> 
>>  	 * make them a master always when present

<snip>

This is not actually I2C related as far as I could tell when I was making the change, so this was more of a typo fix.

If we want to improve this, a quick check with the eDP v1.5a spec suggests using primary/secondary instead,
though in a global fashion rather than specifically for eDP transcoders. There is also source/sink terminology
in the spec related to DP encoders.

Which would be a more acceptable change here?

Thanks,
Easwar

