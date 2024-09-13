Return-Path: <linux-i2c+bounces-6717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3B978017
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7014B2140C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78F81DA2E9;
	Fri, 13 Sep 2024 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="qROEtxLq";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="wtIxstYr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730251DA11B;
	Fri, 13 Sep 2024 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230920; cv=pass; b=SB3y40Znn5ytePMZL1+2qQOZ+B+YnwxpDcGU8WeiHEPzmOu4Wc2bv4iF5cSTC59fQAolNgNRMLYbcyRmxl5fWfrFDD0iAtF1V36JX3TQZMQi6MdKOhsC3cmFEz2NO6vPsiM64w3PQyI1ZcjtoHcn6RVKu7PJjBGnT187p6cl8xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230920; c=relaxed/simple;
	bh=K5tHopPEnvWTtLvSEJXNwldJF8FZ/4EFw9xR7f6BvhA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iNAPTFf4Bzddv8pGZqBbx8eXS/OzgxmxrRWT++5HkXA+GhoXqdVCwDUuzcG8UF0Gphw9X9hrVgbdW8nAUqmrSH8CAWDtA/I48VrIMCmT65cg4f74Ip/d2FcHOGGlQgxw/fe1bZ1egFm+PbSTUGmrtOc+1pvjXyashSv+Vo9FhSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=qROEtxLq; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=wtIxstYr; arc=pass smtp.client-ip=85.215.255.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1726230550; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=frtfbA3TeDZrjV+1iKtlARh5m0LS5iFb7kx8dI2sYb5741in8C8Y4xrKOTqTH2K28N
    KcHzoyWUekzxJQH4K609p/Mms7XcGCvqFejurgtX/BT4PKicjV9vwQolNU9lspiU9YRn
    9r4qc6l8/Ss3BgAO0Uh5uRPAOpzeul84fGJoEVQfObTP8d96uZqo8E+3weiRHqfLPhH7
    6AIL9+tXMP9pgR94cCqvvttX5h85YMTf9Hque9LQFXZuhHZefgtJ76ZfoPeVN6xUk21X
    wPpyh0ZFYYTcaRX3t8mQZ5lpj/jDhwRVTcnnAb2H4tOVuIfZLMO3+q15yTvUbT8yi8vu
    mo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726230550;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7Eo6x2aHQQjJ5Gij8iyMaSMyOkSoHvbaiv8ybxaTLT0=;
    b=FviP4clJiu2RKRrwc/j6DyXPNI9+C1cKVBoZtNDUp01vlT1cmi24x/hSqbQ/72CEHo
    79iiZ4sH7Gwnj8I8VBUCS7lFlgKculMYdqgosBIZexmApVp3xfTTAQ7p98XiJusLtooU
    LWMw91Q2XOD4tKUPQFpW2ElbPujUJ1f6o+jYADtXBY6GGYmuhgoDnoj7Y1Zp/eKJpyo/
    GoLQ0i1HmWV4/eb4O2XL2ywAukReP5R4Kwq2t8YKA4ZbljdVc5Mc6gTxWLcqb85EhNwA
    d9YvjEDMBBN1W4Fb02VvxJAeqAq1Xa7ecYymtrF5xHaGjIaxDEWKxYp2sZw2oaAtpArO
    5DNA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726230550;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7Eo6x2aHQQjJ5Gij8iyMaSMyOkSoHvbaiv8ybxaTLT0=;
    b=qROEtxLqKZBRreaxLJvZAwJOM98OGXM7BA/x9x6J3HIaxDM+8we/XWgLVTrTOphlWu
    uL4GTdyd+U7TLcTWnumh5oDDnfQn4afWEv+6n3EmM4XgrvkBt13sHS3xZ5iOVrPl2Qi6
    5cwquFH9LUOJh4TE0eQ59ijJfKwswVtedFOEwgM5/t9tCyhGrKOdvt3O8Rx6T6Mn0jot
    qwp5djZz0Dy77mVTv8UntCTB+C3NKG9MAulCGm8q19aumGnyrQIA5BxptKpsLpCUwE1i
    bZvAiCMgj9897YZiJpScOuwV4y6nzx5XVRLsDj++EhqrBlfjacxuY5oID1YGpS4Xfatw
    +CLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726230550;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7Eo6x2aHQQjJ5Gij8iyMaSMyOkSoHvbaiv8ybxaTLT0=;
    b=wtIxstYr6G5nJVfDjr+8+mMfFfH9KbwQ9UL/1/Stexq5Z/YcdGX9B72XtLoObIl2j0
    L41scKMCI5VtpEelEICA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfjAZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c208DCTA9P6
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 13 Sep 2024 14:29:10 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20240913140934.29bb542b@akair>
Date: Fri, 13 Sep 2024 14:28:59 +0200
Cc: Reid Tonking <reidt@ti.com>,
 Tony Lindgren <tony@atomide.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <0903DB3E-1A44-44BB-87DC-01C65B97AE4E@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
 <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
 <20240913140934.29bb542b@akair>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3776.700.51)

Hi,


> Am 13.09.2024 um 14:09 schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> Am Wed, 11 Sep 2024 11:40:04 +0200
> schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:
> 
>> Hi,
>> 
>>> Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
>>> 
>>> On 10:43-20230428, Tony Lindgren wrote:  
>>>> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:  
>>>>> On 4/27/2023 1:19 AM, Reid Tonking wrote:  
>>>>>> Using standard mode, rare false ACK responses were appearing with
>>>>>> i2cdetect tool. This was happening due to NACK interrupt
>>>>>> triggering ISR thread before register access interrupt was
>>>>>> ready. Removing the NACK interrupt's ability to trigger ISR
>>>>>> thread lets register access ready interrupt do this instead.  
>>>> 
>>>> So is it safe to leave NACK interrupt unhandled until we get the
>>>> next interrupt, does the ARDY always trigger after hitting this?
>>>> 
>>>> Regards,
>>>> 
>>>> Tony  
>>> 
>>> Yep, the ARDY always gets set after a new command when register
>>> access is ready so there's no need for NACK interrupt to control
>>> this.  
>> 
>> I have tested one GTA04A5 board where this patch breaks boot on
>> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc
>> series).
>> 
>> The device is either stuck with no signs of activity or reports RCU
>> stalls after a 20 second pause.
>> 
> cannot reproduce it here.

That is good for you :)

> I had a patch to disable 1Ghz on that
> device in my tree. Do you have anything strange in your
> tree?

No, and the omap3 is running with 800 MHz only.

I haven't tested on another board but the bug is very reproducible
and I was able to bisect it to this patch, which makes the difference.

So there may be boards which happily run with the patch and some
don't. Maybe a race condition with hardware.

But I think the assumption that "ARDY always gets set after a new
command when register access is ready so there's no need for NACK
interrupt to control this" may not hold in all situations. Potentially
if a new command is never ready.

BR,
Nikolaus




