Return-Path: <linux-i2c+bounces-2730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AF89598E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 18:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943411C22D75
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 16:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082C214BF98;
	Tue,  2 Apr 2024 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Rj3Ojj+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA6514B064;
	Tue,  2 Apr 2024 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712074837; cv=none; b=eE+2AOqQZQIwfD6cCNejK1O6ZyzkG8CBeBXcDr5gR65JtsHYe9htaMCNVX4LzwZdEI73oppE1J1nCe7qV2d+rl9q1+Xxx1LnnnDo8M/JdjDtezxnOMxoijHislRHvRX+PUGPpJYXJj+Bjy1Rd/ErA+sDC0CBTHhgudey3pjOmlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712074837; c=relaxed/simple;
	bh=7t81tRuRY2DXAWxIDyrDV45IaZjnq1EEvWtokKa6SOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxSLLWad4CxYzYWNZ6oa8XOPGngtlSgHd0412qvAWB6pTfrA2lc5/8k9ezYQs4dROZW8SaXfymD6Q6c/8PRS8sJL/HtYjFXw4r3nfkUrwQ4bsc28FLU8RAxnvVC+iPVr+cBSkvtrRWLahqHqCMMQ7uWGGS4zfHnePelLh1MyiZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Rj3Ojj+f; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.232.220] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 90A6D20E8BEB;
	Tue,  2 Apr 2024 09:20:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 90A6D20E8BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712074835;
	bh=diMLxdSPqVbdaJFyTeRrOWtjesbV9nks1RgdOComYig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rj3Ojj+f8L4oLg5jPxJITV4lljtaNQ1MZ7dSIzWZF5J+LfZs3X5diAKiUWhTUVFe0
	 FUnY9QuJZFaj3I6g90zBj9Bl1fU2tfaf4JxF0B4epu6O6DxnLXUVrTwkNb92FpwqlH
	 y1p3X2h3VTCj1AN7QMru6U7yC6w74c0lVL9oSGbg=
Message-ID: <fde7a0da-1981-48db-95e2-96d45655c11c@linux.microsoft.com>
Date: Tue, 2 Apr 2024 09:20:33 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 03/14] drm/gma500,drm/i915: Make I2C terminology more
 inclusive
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)"
 <intel-gvt-dev@lists.freedesktop.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-4-eahariha@linux.microsoft.com>
 <87a5mcfbms.fsf@intel.com>
 <7d5e6ed0-ffe9-46c2-b3b4-a4a47c09532e@linux.microsoft.com>
 <87ttkjesx8.fsf@intel.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <87ttkjesx8.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/2/2024 7:32 AM, Jani Nikula wrote:
> On Tue, 02 Apr 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>> On 4/2/2024 12:48 AM, Jani Nikula wrote:
>>> On Fri, 29 Mar 2024, Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>> in the specification.
>>>
>>> gma500 and i915 changes should be split. See MAINTAINERS.
>>>
>>> Might also split the i915 changes to smaller pieces, it's kind of
>>> random. And the changes here are not strictly related to I2C AFAICT, so
>>> the commit message should be updated.
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>
>> <snip>
>>
>> I will split gma500 and i915 into their respective patches if possible in v2.
>>
>> Can you say more about the changes being "not strictly related to I2C"? My
>> heuristic was to grep for master/slave, and look in the surrounding context for
>> i2c-related terminology (i2c_pin, 7-bit address, struct i2c_adapter, i2c_bus, etc)
>> to confirm that they are i2c-related, then following the references around to
>> make the compiler happy. For e.g., I did not change the many references to bigjoiner
>> master and slave because I understood from context they were not i2c references.
>>
>> A couple examples would help me restrict the changes to I2C, since as mentioned in the
>> discussion on Wolfram's thread, there are places where migrating away from master/slave
>> terms in the code would conflict with the original technical manuals and reduce correlation
>> and understanding of the code.
> 
> I guess I was looking at the VBT changes in intel_bios.c. Granted, they
> do end up being used as i2c addresses. No big deal.
> 
> I think I'd expect the treewide i2c adapter changes to land first, via
> i2c, and subsequent cleanups to happen next, via individual driver
> trees. There's quite a bit of conflict potential merging this outside of
> drm-intel-next, and there's really no need for that.
> 
> BR,
> Jani.
> 

Great! Just so I'm clear, do you still want the i915 changes split up more, along with them being
split off from gma500?

Thanks,
Easwar

