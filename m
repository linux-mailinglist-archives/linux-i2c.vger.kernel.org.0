Return-Path: <linux-i2c+bounces-9298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A8A27C50
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 21:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E29F3A0360
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 19:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F12185A8;
	Tue,  4 Feb 2025 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9KFP4zm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B829158558;
	Tue,  4 Feb 2025 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699200; cv=none; b=iwOxwFAs2z6H1g7xn0nslaPGHwsr51/SXfORUbkBJpblxub3mHb1w6n+PftmtY2Cmq9UtD3t75fhqF2lbLt7qNVkEg/GjU092jSaiD/BoxDfq9S4fGRFHJFnFwQTZwKZcRPZJ2p7slKe4OLDzKB3JBeYRv5sKZR57Wg4anItkG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699200; c=relaxed/simple;
	bh=FI1b3cRWO0hKx3US474N8G8wfAFghI5E0KmOQlLbftA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTvoKkkZn2gGDj9f6r5+BZmlKgUCRdggg415O2RzwA6/qxuAR7Qrcsltg70rXg4dK6ZOVlwpUS6MmvQr+kCuT9/orXa6g5nIR8rI5XlAWzZ9kC0Yu75QtsMd0RGNqlX9boTIaJo4KlR1VEdkdu3N4jxapB//+UkNGA7WJwUNzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9KFP4zm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso44918695e9.2;
        Tue, 04 Feb 2025 11:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738699196; x=1739303996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Acdu3F34ZwXb2ZANcqhpUzzlIsJoGdAX61oVl4ufjzc=;
        b=R9KFP4zmPHgtJ06GsfO0EL2zBT/K2ZmDxNbfIo047WUyZljKZ0mqKSvrYJjiDGxPLY
         oWOODx4wESiq60W9tI6AhVyTGC+ADE+5cqjw+KRK7xS1QKvSTTcLF48YyN8RmNBlKw2h
         1OuWI3IJ4Wo0IlzL+vU5ZHtVZIDkLlY+L6SrBoVcvUbywiF9tTIHKim0uIdyfCJpf5Zr
         LGmzGFTORSzUtDox7Jso0QyCfCjqNgGjyt1dQY3aA+CHHMaLEvPpZnFhkul3KY3/rOa2
         pESYSrZntT0IYS/3m4qJIb91tp0t4Lj3KM+gKmZUdq8QN8nFcUZ8nqLX0xkASjwQtqJB
         Kj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699196; x=1739303996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Acdu3F34ZwXb2ZANcqhpUzzlIsJoGdAX61oVl4ufjzc=;
        b=RBwvJ3OmR4BREDmwNkni4PAQCF7nneVTuO3x9alZXKJTRw0rCchGjR8/IQXvsUw19/
         PxS+adcxoU1sie0L010vuCvbuGMFx7xIvCKWQEZp57Y7A51nQ8qekmr6c7WWaMHdaQhZ
         ZQ3XM+83tPUPHSRGODLnvYJeeYg3ef7ZO2T9wobA5xXP9q776fSvA9lc+V8sR362PMyE
         Xxnp7bwxdBlJ/S1D2ferXixocVlFIabDVaPpKxTSxsXLt94xvWNkWyr9W9k+7yNMfdCI
         EpxOFcXIwOJUlnAfMP+5nwhllFFO2yyUH/++7OY+HXwcDC0VFHKUliP2SxOV03JA0ksb
         CsUg==
X-Forwarded-Encrypted: i=1; AJvYcCUdOpYCEdgacbV9C6GjSmoIANZihkwkDyW1sIZ5gUxcy54tWg4gvzzRVARAK3eF52bXGv94z6qVe9A=@vger.kernel.org, AJvYcCXmr3Jbw3ehjysVVq9ms62LVrAHOam42jm0Ou3H2cUumBiMZVYaNH0rlW96/VJLYLf6GAnrpmJFW7lYfG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzERmjDQ+VoE0zvswbdbGG1QP/maDnafyM3wjo9tFRRixN0i4up
	vAQoMLq4G4t3j4MnZeRL2FxKp7B0772LKHWmcsCDYwqjGR6w13yM
X-Gm-Gg: ASbGncuWLS4egxGZCNfDCpNIUIiS9wT6UjBb4Q3/oa3NRPzmHlUl+oKnyskiQPeAdLN
	y2ORqg3LcCJs2gozC1/PXGsnT9KpUQFXzzL4I3k+G0IHWULA4HaK+oUP4RDmailVgfmDeAEc0hF
	XIv9qrYSy5DEHoV/01p+jl2erIj34dL1j43c4E9uFzc84UBfk87KZ9aD5cJKxEnlebMKSUwlR6c
	194nTZ0z3Bf/PgullbA25UtmGougqnO7q3oDlywEyu/yYYjzxNKFiRQqd/4Plj3Cq1rz/QGPVpm
	yKb/TpVyNNHqsPX8r3vzppfoIL7LXLRSVsYwoHOg4uEXhTkFszOiqvnU94LO3GaCUGSoGEg/33H
	IoW3VkAXcUJdR5dsUawawAQiE/GzYSiq9RVkJ7VmO0u2JKuSfwljkdhsKGVXVi+blSNrA9vLpvc
	IEru/Z
X-Google-Smtp-Source: AGHT+IFyOvVcVYFBFivoQdZg/7cF7hL0tg4Vqf5y0A5OqPkw/9AKkP9h1U99sTJMiJhiiqsbN6AM7w==
X-Received: by 2002:a05:600c:3d96:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-438dc41d7b0mr207447395e9.26.1738699196230;
        Tue, 04 Feb 2025 11:59:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:b3d9:8600:21e9:f8e3:9d4:22be? (dynamic-2a02-3100-b3d9-8600-21e9-f8e3-09d4-22be.310.pool.telefonica.de. [2a02:3100:b3d9:8600:21e9:f8e3:9d4:22be])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e245f49dsm199410435e9.35.2025.02.04.11.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:59:55 -0800 (PST)
Message-ID: <705ea273-f0b5-45cb-a710-dc1c3031cc10@gmail.com>
Date: Tue, 4 Feb 2025 21:00:12 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
 <ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>
 <20250204162442.25e72682@bootlin.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20250204162442.25e72682@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 16:24, Herve Codina wrote:
> Hi,
> 
> Got a deadlock issue with this patch in v6.14-rc1.
> 
> On Fri, 1 Nov 2024 23:09:51 +0100
> Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> So far a list is used to track auto-detected clients per driver.
>> The same functionality can be achieved much simpler by flagging
>> auto-detected clients.
>>
>> Two notes regarding the usage of driver_for_each_device:
>> In our case it can't fail, however the function is annotated __must_check.
>> So a little workaround is needed to avoid a compiler warning.
>> Then we may remove nodes from the list over which we iterate.
>> This is safe, see the explanation at the beginning of lib/klist.c.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v3:
>> - protect client removal with core_lock mutex
>> ---
>>  drivers/i2c/i2c-core-base.c | 52 ++++++++++++-------------------------
>>  include/linux/i2c.h         |  3 +--
>>  2 files changed, 17 insertions(+), 38 deletions(-)
>>
> ...
> 
>> @@ -1780,8 +1752,10 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>>  	 * we can't remove the dummy devices during the first pass: they
>>  	 * could have been instantiated by real devices wishing to clean
>>  	 * them up properly, so we give them a chance to do that first. */
>> +	mutex_lock(&core_lock);
>>  	device_for_each_child(&adap->dev, NULL, __unregister_client);
>>  	device_for_each_child(&adap->dev, NULL, __unregister_dummy);
>> +	mutex_unlock(&core_lock);
>>  
> 
> Calling __unregister_client() with core_lock mutex held leads to a deadlock
> in my case:
> 
>     # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/unbind
>     [  242.928264] 
>     [  242.929779] ============================================
>     [  242.935092] WARNING: possible recursive locking detected
>     [  242.940406] 6.14.0-rc1+ #22 Not tainted
>     [  242.944245] --------------------------------------------
>     [  242.949556] sh/299 is trying to acquire lock:
>     [  242.953915] ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0x44/0x1b0
>     [  242.961689] 
>     [  242.961689] but task is already holding lock:
>     [  242.967524] ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0xa0/0x1b0
>     [  242.975285] 
>     [  242.975285] other info that might help us debug this:
>     [  242.981814]  Possible unsafe locking scenario:
>     [  242.981814] 
>     [  242.987732]        CPU0
>     [  242.990179]        ----
>     [  242.992625]   lock(core_lock);
>     [  242.995686]   lock(core_lock);
>     [  242.998748] 
>     [  242.998748]  *** DEADLOCK ***
>     [  242.998748] 
>     [  243.004666]  May be due to missing lock nesting notation
>     [  243.004666] 
>     [  243.011455] 5 locks held by sh/299:
>     [  243.014946]  #0: ffff000079a533f0 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x1c4/0x398
>     [  243.022976]  #1: ffff000005c29088 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0xf8/0x1c8
>     [  243.031962]  #2: ffff000000c240f8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x48/0x250
>     [  243.041645]  #3: ffff8000818b82e0 (core_lock){+.+.}-{4:4}, at: i2c_del_adapter+0xa0/0x1b0
>     [  243.049845]  #4: ffff000079f24908 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x48/0x250
>     [  243.059522] 
>     [  243.059522] stack backtrace:
>     [  243.063883] CPU: 2 UID: 0 PID: 299 Comm: sh Not tainted 6.14.0-rc1+ #22
>     [  243.070502] Hardware name: GE HealthCare Supernova Patient Hub v1 (DT)
>     [  243.077032] Call trace:
>     [  243.079481]  show_stack+0x20/0x38 (C)
>     [  243.083152]  dump_stack_lvl+0x90/0xd0
>     [  243.086819]  dump_stack+0x18/0x28
>     [  243.090140]  print_deadlock_bug+0x260/0x350
>     [  243.094332]  __lock_acquire+0x113c/0x2180
>     [  243.098346]  lock_acquire+0x1c4/0x350
>     [  243.102015]  __mutex_lock+0x9c/0x500
>     [  243.105599]  mutex_lock_nested+0x2c/0x40
>     [  243.109528]  i2c_del_adapter+0x44/0x1b0
>     [  243.113371]  i2c_mux_del_adapters+0xa0/0x100
>     [  243.117649]  pca954x_cleanup+0x98/0xd0
>     [  243.121406]  pca954x_remove+0x38/0x50
>     [  243.125078]  i2c_device_remove+0x34/0xb8
>     [  243.129007]  device_remove+0x54/0x90
>     [  243.132590]  device_release_driver_internal+0x1e8/0x250
>     [  243.137824]  device_release_driver+0x20/0x38
>     [  243.142101]  bus_remove_device+0xd4/0x120
>     [  243.146116]  device_del+0x14c/0x410
>     [  243.149612]  device_unregister+0x20/0x48
>     [  243.153540]  i2c_unregister_device.part.0+0x50/0x88
>     [  243.158427]  __unregister_client+0x74/0x80
>     [  243.162530]  device_for_each_child+0x68/0xc8
>     [  243.166811]  i2c_del_adapter+0xb8/0x1b0
>     [  243.170653]  i2c_imx_remove+0x4c/0x190
>     [  243.174412]  platform_remove+0x30/0x58
>     [  243.178167]  device_remove+0x54/0x90
>     [  243.181751]  device_release_driver_internal+0x1e8/0x250
>     [  243.186982]  device_driver_detach+0x20/0x38
>     [  243.191172]  unbind_store+0xbc/0xc8
>     ...
> 
> When I unbind the i2c SoC adapter driver, i2c_del_adapter() is indeed called
> recursively. The first call is for the 30a40000.i2c SoC adapter and the
> second one for an i2c mux connected on the i2c bus.
> 
> My device-tree looks like this:
> 	i2c@30a40000 {
> 		compatible = "fsl,imx8mp-i2c", "fsl,imx21-i2c";
> 		...
> 		i2c-mux@70 {
> 			compatible = "nxp,pca9543";
> 			...
> 			i2c@0 {
> 				...
> 				touchscreen@2a {
> 					compatible = "eeti,exc80h60";
> 					...
> 				};
> 			};
> 			
> 			i2c@1 {
> 				...
> 			};
> 		};
> 	};
> 
> 
> Should the core_lock mutex be taken when both __unregister_client() and
> __unregister_dummy() are called ?
> 

Thanks for the report! I just submitted a fix, for now as RFC.
If fixes the deadlock and uses a new approach to prevent the race
which caused us to acquire the core lock in few place.
Could you please re-test?

> Best regards,
> Hervé Codina

Heiner

