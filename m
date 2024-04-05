Return-Path: <linux-i2c+bounces-2787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B336389A341
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 19:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5373CB23DC1
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 17:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136BE172BBA;
	Fri,  5 Apr 2024 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="C0d1SRjy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B606171665;
	Fri,  5 Apr 2024 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712336948; cv=none; b=lZgEAcJpi0EuTYhG3IP8tS2jmzCzAhuK4F1nWZDxCx39bre0U8T8Bz6XFlweZN13a/tP/kCn+nlwK75ov5Mcz5iyTyratYW9BtS38wdheL4b5L8QGaankWXrenimTwGzIB7leCyt5bSLksnZyjtu78zcmDqQyyciX5LOifrhvXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712336948; c=relaxed/simple;
	bh=OM9kF5Ok4AlVSJh6BtuRbZ33DwIULAuWvK9ebNB9Dws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fSJvLFf80fPSM9ButAafmech00q3dOui1oiC/4+t3xAKfI6OGHWLlJL25IOB4dYjTl+MVTLWdC+JeyDBldC0/y+5IEqW5yIMJgLBpNC5H0s5sc3Lu70KVztPhjPpJxTV7ZQeBIoUCH29p/qBOVpPS2lrexbWBJN4MslsiHLO+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=C0d1SRjy; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.217.16] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id C079220E98C5;
	Fri,  5 Apr 2024 10:09:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C079220E98C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712336947;
	bh=8/pqkmLMlPcre5fV5qkvKEs/2rR9bcZxNm4kNFHWSjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=C0d1SRjyurGtxNvhWTTmtbPSCA+yIp/OoN3XC/p90jKg2/Te57kQIcZHNpxQ3N2VQ
	 sXQcWE6qovKVAf63szhiTG9qVBhLM1mFp1anVH+P8e81uOq0H+Hm08czNqSAQAwLsT
	 RqFrEA3QupgZYOJZGbxAxqLnmILZ6wWm5h9HB87o=
Message-ID: <3bd8d2f6-dfe1-479f-bff1-f2921b1940ed@linux.microsoft.com>
Date: Fri, 5 Apr 2024 10:09:05 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 00/14] Make I2C terminology more inclusive for I2C
 Algobit and consumers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <ffumcagmzdstcf3qcn3f26555pnu7i6azjppciyd4zvcoit7pv@vu262tsfnqyr>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <ffumcagmzdstcf3qcn3f26555pnu7i6azjppciyd4zvcoit7pv@vu262tsfnqyr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 4/5/2024 3:18 AM, Wolfram Sang wrote:
> Hello Easwar,
> 
> On Fri, Mar 29, 2024 at 05:00:24PM +0000, Easwar Hariharan wrote:
>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of the
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
> 
> I really appreciate that you want to assist in this task to improve the
> I2C core. I do. I am afraid, however, that you took the second step
> before the first one, though. As I mentioned in my original cover
> letter, this is not only about renaming but also improving the I2C API
> (splitting up header files...). So, drivers are not a priority right
> now. They can be better fixed once the core is ready.
>

Sorry, got excited. :) There were drivers I'd been part of that I specifically
wanted to fixup, but then the scope grew to other users of algobit.

> It is true that I changed quite some controller drivers within the i2c
> realm. I did this to gain experience. As you also noticed quite some
> questions came up. We need to agree on answers first. And once we are
> happy with the answers we found, then IMO we can go outside of the i2c
> realm and send patches to other subsystems referencing agreed
> precedence. I intentionally did not go outside i2c yet. Since your
> patches are already there, you probably want to foster them until they
> are ready for inclusion.

Sorry, I don't quite follow what you mean by foster in this context. Are
you asking me to hold off on merging the series, or to follow through on
getting it merged?

 Yet, regarding further patches, my suggestion
> is to wait until the core is ready. That might take a while, though.
> However, there is enough to discuss until the core is ready. So, your
> collaboration there is highly appreciated!
> 
>> The last patch updating the .master_xfer method to .xfer depends on
>> patch 1 of Wolfram's series below, but the series is otherwise
>> independent. It may make sense for the last patch to go in with
> 
> Please drop the last patch from this series. It will nicely remove the
> dependency. Also, like above, I first want to gain experience with i2c
> before going to other subsystems. That was intended.
>

Will do, thanks!

> All the best and happy hacking,
> 
>    Wolfram
> 


