Return-Path: <linux-i2c+bounces-2754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7AC897587
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 18:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBEAB28DA03
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 16:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6D21514EC;
	Wed,  3 Apr 2024 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="enc6td2/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8815514C58A;
	Wed,  3 Apr 2024 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712162667; cv=none; b=nhTNRSV7xxoJ/IvNkGllDjOJJWWzfecBBLKHXLyhOv+2UEgHuk2w7eCc90A+81hdWQOI+l8SbpiiVGrzGE3GzMz82ed/+kDpUTOyMHwHSqOlIfYr3/oz657PqDyO7gHhsJxEeEQbJNLMCbae8QWe9trJgoKp1WsL0FcB3xSkS00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712162667; c=relaxed/simple;
	bh=E/xU54rEeo/oDDTNeLyTGcgPNTZZ5c2Rcpkp/VoXpog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pD5TQx9Pm3ronVSBxEpVwlifgVb8FO2guqkwjLjq8K6g25kobPztvPB0ueCqdz/+WnwhiICvWRF1GC6QusT0fggjJWO0PJwNhPWyA+oWqFv12mQXjgFiaV/YOX3n2ub6uxwu9hC8CU4d5kJaZrXuKbVwZG0EN/kJK7WYDghhKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=enc6td2/; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.216.231] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id DEC6420E8CB1;
	Wed,  3 Apr 2024 09:44:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEC6420E8CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712162666;
	bh=JXwsd2AxoIuTbqYYBsm2eaH2T3RMwYhW+EuWf51ajaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=enc6td2/9wYk/5AJ75GJ+d2KStC4HCCxos5X3NVTZDD2/oIurKS5e5aSfxG20NTAn
	 i6QoaGybHsOcc9F8ukHIPO521Uu8BoKDrrjEMr1X1WvCtk0DqcVkd5bYcJVQCFeQeI
	 efLmLz3IHfJYxowLOTc8KrIggtvkr42zcNpYJ/Ys=
Message-ID: <2d2a22a5-25cf-4b15-904e-7928a92d6ff5@linux.microsoft.com>
Date: Wed, 3 Apr 2024 09:44:24 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 01/14] IB/hfi1, IB/qib: Make I2C terminology more
 inclusive
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
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
 <20240329170038.3863998-2-eahariha@linux.microsoft.com>
 <20240403083025.GT11187@unreal>
 <0214214a-73c4-46b4-a099-189036954aa1@cornelisnetworks.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <0214214a-73c4-46b4-a099-189036954aa1@cornelisnetworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/2024 8:54 AM, Dennis Dalessandro wrote:
> 
> On 4/3/24 4:30 AM, Leon Romanovsky wrote:
>> On Fri, Mar 29, 2024 at 05:00:25PM +0000, Easwar Hariharan wrote:
>>> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
>>> with more appropriate terms. Inspired by and following on to Wolfram's series
>>> to fix drivers/i2c[1], fix the terminology where I had a role to play, now that
>>> the approved verbiage exists in the specification.
>>>
>>> Compile tested, no functionality changes intended
>>>
>>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> ---
>>>  drivers/infiniband/hw/hfi1/chip.c           |  6 ++--
>>>  drivers/infiniband/hw/hfi1/chip.h           |  2 +-
>>>  drivers/infiniband/hw/hfi1/chip_registers.h |  2 +-
>>>  drivers/infiniband/hw/hfi1/file_ops.c       |  2 +-
>>>  drivers/infiniband/hw/hfi1/firmware.c       | 22 ++++++-------
>>>  drivers/infiniband/hw/hfi1/pcie.c           |  2 +-
>>>  drivers/infiniband/hw/hfi1/qsfp.c           | 36 ++++++++++-----------
>>>  drivers/infiniband/hw/hfi1/user_exp_rcv.c   |  2 +-
>>>  drivers/infiniband/hw/qib/qib_twsi.c        |  6 ++--
>>>  9 files changed, 40 insertions(+), 40 deletions(-)
>>
>> hfi1 and qib work perfectly fine with the current terminology. There is
>> no need to change old code just for the sake of change.
>>
>> Let's drop this patch.
> 
> Agreed.

Will drop in v1.

Thanks,
Easwar

