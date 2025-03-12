Return-Path: <linux-i2c+bounces-9800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B6A5D956
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 10:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F1AC7A7D25
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 09:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E36D23A9B2;
	Wed, 12 Mar 2025 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eINzvCc6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D223A9AA;
	Wed, 12 Mar 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771574; cv=none; b=AX0vtAEpZuEviG6Neu5rcpywQENW+WyY71N+7UG8B9iBxyOYr7dKNKMwMie+g7gAYFkFDhsXqv/BftOdZA1Q9K5M57rnS32iEp1SkIcdMDg5D6378hY1lq22H0zvMP/zSFF96SsSLteCTsxwDYtWgH5NG+j2yxf7ADk2piJXYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771574; c=relaxed/simple;
	bh=Nmm8VgtieAQ4FAI9YKaspzHqrPuXV2aoYQj/SLIoIBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mTJkYSyn//APSSyHn5z3RWG5t3DV3v3IHQT6kq+r85fmheC4A3rXJv9Qw848fIFP+LZArTtOQG5nEdVlxGalQTmdb26kO3WiFjvnrA+Bm/ImfZRldVItPI0c+JwoOaKEmV2IvoCXUb7N6NeIxL9AzTztKEkR3zIY5FHhXIhKD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eINzvCc6; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52C9PhRU1462281
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 04:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741771543;
	bh=GYK+ovr4hj8awrE0zu1FagYt/ssvw4mcYqybiZ+cfmE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eINzvCc68vBAG+l4XyhOrpkJMPebu3M+z0Sm3dMtsSk+BX+BCPLf+YCVGRGjPfsz1
	 fMsDeBLYCBAZ/h79owlmgOIH8eXwDl+WBUoyPP8IGaZCse3MKNVKFTc0Affxpfen0v
	 m/ZE9Y2flNLBft1NVGN9f4zGlxIGLOy+9kOGekSc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52C9PhtT041708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 04:25:43 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 04:25:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 04:25:43 -0500
Received: from [10.24.72.128] (psdkl-workstation0.dhcp.ti.com [10.24.72.128])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52C9PcE3030236;
	Wed, 12 Mar 2025 04:25:39 -0500
Message-ID: <91b9752c-38e9-453d-90cb-3466e18a15b6@ti.com>
Date: Wed, 12 Mar 2025 14:55:38 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
To: Andi Shyti <andi.shyti@kernel.org>, Nishanth Menon <nm@ti.com>
CC: Andreas Kemnade <andreas@kemnade.info>, <vigneshr@ti.com>,
        <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jmkrzyszt@gmail.com>, <reidt@ti.com>,
        <wsa@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
References: <20250228140420.379498-1-andreas@kemnade.info>
 <20250311123947.jce4i5heeufzwmji@serotonin>
 <t43j7wmwsqvs5f6utld72enobqwkendgtpzfu3mth3bdgpxhsh@qeok5d2ujdm2>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <t43j7wmwsqvs5f6utld72enobqwkendgtpzfu3mth3bdgpxhsh@qeok5d2ujdm2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 12/03/25 03:55, Andi Shyti wrote:
> Hi,
> 
> On Tue, Mar 11, 2025 at 07:39:47AM -0500, Nishanth Menon wrote:
>> On 15:04-20250228, Andreas Kemnade wrote:
>>> On the GTA04A5 writing a reset command to the gyroscope causes IRQ
>>> storms because NACK IRQs are enabled and therefore triggered but not
>>> acked.
>>>
>>> Sending a reset command to the gyroscope by
>>> i2cset 1 0x69 0x14 0xb6
>>> with an additional debug print in the ISR (not the thread) itself
>>> causes
>>>
>>> [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
>>> [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
>>> [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
>>> [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
>>> [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
>>> [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
>>> [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
>>> repeating till infinity
>>> [...]
>>> (0x2 = NACK, 0x100 = Bus free, which is not enabled)
>>> Apparently no other IRQ bit gets set, so this stalls.
>>>
>>> Do not ignore enabled interrupts and make sure they are acked.
>>> If the NACK IRQ is not needed, it should simply not enabled, but
>>> according to the above log, caring about it is necessary unless
>>> the Bus free IRQ is enabled and handled. The assumption that is
>>> will always come with a ARDY IRQ, which was the idea behind
>>> ignoring it, proves wrong.
>>> It is true for simple reads from an unused address.
>>>
>>> To still avoid the i2cdetect trouble which is the reason for
>>> commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings"),
>>> avoid doing much about NACK in omap_i2c_xfer_data() which is used
>>> by both IRQ mode and polling mode, so also the false detection fix
>>> is extended to polling usage and IRQ storms are avoided.
>>>
>>> By changing this, the hardirq handler is not needed anymore to filter
>>> stuff.
>>>
>>> The mentioned gyro reset now just causes a -ETIMEDOUT instead of
>>> hanging the system.
>>>
>>> Fixes: c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
>>> CC: <stable@kernel.org>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>> This needs at least to be tested on systems where false acks were
>>> detected.
>>
>> At least on BeaglePlay, I have not been able to reproduce the original
>> bug which was the trigger for commit c770657bd261
>>
>> I also ran basic boot tests on other K3 platforms and none seem to show
>> regressions at the very least.
>>
>> Tested-by: Nishanth Menon <nm@ti.com>
> 
> Thanks for testing it! I asked some OMAP folks to check this
> patch, but no one took action. With Nishanth's test, I can now
> sleep soundly. :-)
> 
> Merged to i2c/i2c-host-fixes.
> 
> Thanks,
> Andi
> 

I see that the patch got merged so don't know if this is useful at all 
at this point, but yeah looks good to me. Apologies for the slow 
response. Nishanth, Thanks for testing it too!

Reviewed-by: Aniket Limaye <a-limaye@ti.com>

Thanks,
Aniket

