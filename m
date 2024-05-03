Return-Path: <linux-i2c+bounces-3393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE48BB13D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 18:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416802816F2
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 16:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFE1156C6B;
	Fri,  3 May 2024 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rkGr+1kX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A6156883;
	Fri,  3 May 2024 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714754936; cv=none; b=f2mrXmtqKGvkwLvg5nxf2daDQVVQEWf2Puuuehw9Frl32b2syOX4vl424PjlK0FBh3ZTu4Pq/JLljKjz2BhAHB3LHksv4sGq3vLFny84w8uMpDiw1RIsZSSZ8dQRS2VUQui/12v9fSW2wrO3bRtl+K2r5NbdRwKivBzUQqxLbEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714754936; c=relaxed/simple;
	bh=CspOZzK8dhzgARH67jnkfnWSdxxjtsk7C78dj0N5S78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2Qx5FXL0MG35FSMYjA1+54oAFZ/pe68crPJiMuY/fZMXwIyQChbQAIt+CdSV9JzL7FSNZzTnwQOr9WfZG52ZgqkR8ZFvMXzcQM8C5cj3KPNGpcXHi/gkEjzvPL4yz8Oq2TyQZwibiQpRTSXPjw+oEpsRBGH4G44vlCIj6z+UoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rkGr+1kX; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.65.224.148] (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id ED65B20B2C82;
	Fri,  3 May 2024 09:48:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED65B20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714754934;
	bh=GAu8Rak4A+pCgzw/uvyDGmtVcqwJgPNajSTWUoSmEQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rkGr+1kX0SctOUPwkhdrQ4qFQeA027/UkwhMstN1oK11s07V0R7Wi7aRofjAnlC1w
	 NT0xX9K1RqDBBTorM82GqIiYoTbasEg2t4t6Fe9M8VXV9I+qcP4kpK+ALqrx64mma1
	 /QTPAvj8aVxAk84+SPJbJzAv82Hdw3+D0Hq7DSGc=
Message-ID: <6256cc5a-9ff0-4a1f-8eba-f70b7c571631@linux.microsoft.com>
Date: Fri, 3 May 2024 09:48:53 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] fbdev/viafb: Make I2C terminology more inclusive
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>,
 "open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-13-eahariha@linux.microsoft.com>
 <271ad513-0ea1-45df-ba0f-51582474ff34@suse.de>
 <076e0a0d-ad26-490e-9784-300ed52637ca@linux.microsoft.com>
 <f1eccd9d-885f-4508-9325-3454ecc35eae@suse.de>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <f1eccd9d-885f-4508-9325-3454ecc35eae@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/2024 12:39 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.05.24 um 00:26 schrieb Easwar Hariharan:
>> On 5/2/2024 3:46 AM, Thomas Zimmermann wrote:
>>>
>>> Am 30.04.24 um 19:38 schrieb Easwar Hariharan:
>>>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>>>> with more appropriate terms. Inspired by and following on to Wolfram's
>>>> series to fix drivers/i2c/[1], fix the terminology for users of
>>>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>>>> in the specification.
>>>>
>>>> Compile tested, no functionality changes intended
>>>>
>>>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>>>
>>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>
>> Thanks for the ack! I had been addressing feedback as I got it on the v0 series, and it seems
>> I missed out on updating viafb and smscufx to spec-compliant controller/target terminology like
>> the v0->v1 changelog calls out before posting v1.
>>
>> For smscufx, I feel phrasing the following line (as an example)
>>
>>> -/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, host,
>>> +/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, *controller*,
>> would actually impact readability negatively, so I propose to leave smscufx as is.
> 
> Why? I don't see much of a difference.
> 
>>
>> For viafb, I propose making it compliant with the spec using the controller/target terminology and
>> posting a v2 respin (which I can send out as soon as you say) and ask you to review again.
>>
>> What do you think?
> 
> I think we should adopt the spec's language everywhere. That makes it possible to grep the spec for terms used in the source code. Using 'host' in smscufx appears to introduce yet another term. If you are worried about using 'I2C controller' and 'controller' in the same sentence, you can replace 'I2C controller' with 'DDC channel'. That's even more precise about the purpose of this code.

Great, thanks! That was exactly my concern, I will fix up smscufx and send a v2.

Thanks,
Easwar


