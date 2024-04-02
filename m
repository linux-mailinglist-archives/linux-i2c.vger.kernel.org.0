Return-Path: <linux-i2c+bounces-2732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27381895A46
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 18:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96D30B29F5B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 16:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F01A159911;
	Tue,  2 Apr 2024 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giZqpaKN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286CD158214;
	Tue,  2 Apr 2024 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076791; cv=none; b=d5uDs+OzPHuMraDHsxs8OMpEHbbXCMY2vLmA0KRNfbnnveH5sTK6mLV6ZLN5lXtQKdVVS/mxXZT9K1JHZHhCBNiKsizj+74GCs4AGJRYDLWfffKmLzFoXqrT73jcBZRgHCez6R6/+FEgf4tCbF4D20MUBCxhFCUUZVIN7Pizp4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076791; c=relaxed/simple;
	bh=+OIETa7FqtPMYZEyetZK7bSBPqtgACHlQcapBmBrB1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ol5krmBNOBdFkOvhZGk/CyDxwWGdcqk65b9xio3lxK7YQdaS9lUrZ+Es0nXigRM0T5VSnlCpQwMz7dwKK79jM0d88Z4iNyaheVzwM9WIjms9Gql0lQRVhIoryy9HFZ6/uD4egtG0fd4H8KJL1PDdVC9v7BlqsCVR5D1upXEDHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giZqpaKN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712076789; x=1743612789;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=+OIETa7FqtPMYZEyetZK7bSBPqtgACHlQcapBmBrB1s=;
  b=giZqpaKNWgSAvu6O+6L2jjJf7Vrt6DV6RiQPrKgsBLlfRpTQr94fywYp
   uo3DuTKh4Ai12EHgCxv860EMUnrxS+KzMrP2Q5K/0Ddgg5crBI2gPXi0O
   YpG3RKISSor5XjQFZX1luwB5YffcahoXNBa4ZMCDZjOGOH820sN/nr6Br
   YoDWFWYHGl6iOCLGgCMyqaFnDCjA3LWTIYm9rCxqtwZBbOWzoAev59/y9
   dXd96fwrkbmJo5nM3SYmYaNgUr0MCCo3+B1PVUyGfIDscSRuARJN0qNiq
   VtvwBi3flwgQ6qy9nV6a6oXnRtOR5bWaRxsmTEr+97mHOKdQZffInul9r
   Q==;
X-CSE-ConnectionGUID: FCLUtvWbTD+JY0eydun9UA==
X-CSE-MsgGUID: oHPpQ1bBT7+4ujOXPxdlXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7107283"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7107283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 09:53:08 -0700
X-CSE-ConnectionGUID: ffg8/aPXSdikW95Gpql1bg==
X-CSE-MsgGUID: UqZyC5N1Sx2Vz2k/GRMH4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18552508"
Received: from pramona-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.179])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 09:53:02 -0700
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
In-Reply-To: <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-4-eahariha@linux.microsoft.com>
 <87a5mcfbms.fsf@intel.com>
 <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
 <87ttkjesx8.fsf@intel.com>
 <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
Date: Tue, 02 Apr 2024 19:52:48 +0300
Message-ID: <87o7aremfz.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
> On 4/2/2024 7:32 AM, Jani Nikula wrote:
>> On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>> On 4/2/2024 12:48 AM, Jani Nikula wrote:
>>>> On Fri, 29 Mar 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>>> in the specification.
>>>>
>>>> gma500 and i915 changes should be split. See MAINTAINERS.
>>>>
>>>> Might also split the i915 changes to smaller pieces, it's kind of
>>>> random. And the changes here are not strictly related to I2C AFAICT, so
>>>> the commit message should be updated.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>
>>> <snip>
>>>
>>> I will split gma500 and i915 into their respective patches if possible in v2.
>>>
>>> Can you say more about the changes being "not strictly related to I2C"? My
>>> heuristic was to grep for master/slave, and look in the surrounding context for
>>> i2c-related terminology (i2c_pin, 7-bit address, struct i2c_adapter, i2c_bus, etc)
>>> to confirm that they are i2c-related, then following the references around to
>>> make the compiler happy. For e.g., I did not change the many references to bigjoiner
>>> master and slave because I understood from context they were not i2c references.
>>>
>>> A couple examples would help me restrict the changes to I2C, since as mentioned in the
>>> discussion on Wolfram's thread, there are places where migrating away from master/slave
>>> terms in the code would conflict with the original technical manuals and reduce correlation
>>> and understanding of the code.
>> 
>> I guess I was looking at the VBT changes in intel_bios.c. Granted, they
>> do end up being used as i2c addresses. No big deal.
>> 
>> I think I'd expect the treewide i2c adapter changes to land first, via
>> i2c, and subsequent cleanups to happen next, via individual driver
>> trees. There's quite a bit of conflict potential merging this outside of
>> drm-intel-next, and there's really no need for that.
>> 
>> BR,
>> Jani.
>> 
>
> Great! Just so I'm clear, do you still want the i915 changes split up more, along with them being
> split off from gma500?

If we can merge the i915 changes via drm-intel-next, it's probably fine
as a big i915 patch. Just the gma500 separated. (The struct
i2c_algorithm change etc. necessarily has to go via I2C tree of course.)

BR,
Jani.



>
> Thanks,
> Easwar

-- 
Jani Nikula, Intel

