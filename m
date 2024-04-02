Return-Path: <linux-i2c+bounces-2729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8D8956C8
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 16:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF57A2883BB
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A256612AADD;
	Tue,  2 Apr 2024 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbf79M4R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE6A1292CA;
	Tue,  2 Apr 2024 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068419; cv=none; b=TXmFfAmxYdL8bzN/CYwUvlMjanGMlBlnOxDCCAhwYU0078cYoKRSp4E6HwnSmb6ETiCinPcsFan08mTIsCyf8KL/aAzK8qkW1eR80i7pluE/1sjzW8U4ZTsRGo+vClNoM5lrG6YQpHtQearjK1sp10/oMf3IgI+u0Q9Vzdi6iwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068419; c=relaxed/simple;
	bh=aSQaOTE+ZIyhbMolDHBwgHVisfypMoco354cW+O9h0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gUS30XFMa5pD+emQRyKezRKZ/+dIDm6BXz6F9QoQW2j7vuvwqF6mA63l/cqCerCBKNSyglxn/rgpD42rNzMVNsmPaaXMxo5zhvDSzkSHZqO99/PV9slmk6Y9bgLC+PxX2If6azf6wXjEJfguIJVHmrZ0onjHSFWIbEdvSxcoCXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbf79M4R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712068418; x=1743604418;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aSQaOTE+ZIyhbMolDHBwgHVisfypMoco354cW+O9h0s=;
  b=gbf79M4RntMhfYCfEziEMcrY9ZyI8v1ItOJ78BzVjrmmtammXaIwDNSk
   yayP6G0rF9IzikR15R696fo++xSkE7WVDX1+2rs41wr3zFAy20zOp8GXR
   AaHuImQRb9Uh2nfco1J7ahM93/rrvsVDg87iH2hfLuGsUOIWvGrV5snhU
   4zAtSBkGFUFNtVK40zxZmrxERUvAidkstYbtAojgfjhvz48QpjNe0j3OC
   w2hDizZPa2bF5/80vaLhGSx4b1BSAh1OPx3o7m92Fd/fl+NN+tyNeqXaI
   xwJfcTLGXxNeOtTL5S0430PXn0xVG8HlsSYWTrS314PXk890vJRwEll4k
   w==;
X-CSE-ConnectionGUID: IDfCgtpUSn6LoOR28dacEw==
X-CSE-MsgGUID: PdfE1CzKSz+hjR//1ejHMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32640883"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="32640883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:33:12 -0700
X-CSE-ConnectionGUID: R+tMxtoTQGy/bLwlvTN4xQ==
X-CSE-MsgGUID: zvSAeDA0RYSo2cq4cJymoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="49091987"
Received: from pramona-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.179])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 07:33:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org, open list
 <linux-kernel@vger.kernel.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open
 list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "open list:RADEON and
 AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVER
 FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open
 list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, "open
 list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>, "open
 list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 03/14] drm/gma500,drm/i915: Make I2C terminology more
 inclusive
In-Reply-To: <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-4-eahariha@linux.microsoft.com>
 <87a5mcfbms.fsf@intel.com>
 <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
Date: Tue, 02 Apr 2024 17:32:51 +0300
Message-ID: <87ttkjesx8.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
> On 4/2/2024 12:48 AM, Jani Nikula wrote:
>> On Fri, 29 Mar 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>> in the specification.
>> 
>> gma500 and i915 changes should be split. See MAINTAINERS.
>> 
>> Might also split the i915 changes to smaller pieces, it's kind of
>> random. And the changes here are not strictly related to I2C AFAICT, so
>> the commit message should be updated.
>> 
>> BR,
>> Jani.
>> 
>> 
>
> <snip>
>
> I will split gma500 and i915 into their respective patches if possible in v2.
>
> Can you say more about the changes being "not strictly related to I2C"? My
> heuristic was to grep for master/slave, and look in the surrounding context for
> i2c-related terminology (i2c_pin, 7-bit address, struct i2c_adapter, i2c_bus, etc)
> to confirm that they are i2c-related, then following the references around to
> make the compiler happy. For e.g., I did not change the many references to bigjoiner
> master and slave because I understood from context they were not i2c references.
>
> A couple examples would help me restrict the changes to I2C, since as mentioned in the
> discussion on Wolfram's thread, there are places where migrating away from master/slave
> terms in the code would conflict with the original technical manuals and reduce correlation
> and understanding of the code.

I guess I was looking at the VBT changes in intel_bios.c. Granted, they
do end up being used as i2c addresses. No big deal.

I think I'd expect the treewide i2c adapter changes to land first, via
i2c, and subsequent cleanups to happen next, via individual driver
trees. There's quite a bit of conflict potential merging this outside of
drm-intel-next, and there's really no need for that.

BR,
Jani.




>
> Thanks,
> Easwar
>

-- 
Jani Nikula, Intel

