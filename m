Return-Path: <linux-i2c+bounces-12243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCEB212AB
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 18:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F7C1611F2
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 16:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361612BE637;
	Mon, 11 Aug 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="S+112Bm1";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="pknGW+py"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058329BDB1
	for <linux-i2c@vger.kernel.org>; Mon, 11 Aug 2025 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754931454; cv=pass; b=e6TVPNBSBmeSmrawvPL7quhPVZHhn4Nl0TTuyLHIZJCcFFCWr4Rto1fsuvK1FP0gnKY4V6ZKD96o24Guw26n7K/t5QfGSSJDwCgLt2p0O4QxsgZSjoMWFigY7Qeu8FKmR6ak8VR5NCyiMQiFGdtxRinLTquhLN2IzVbf6+h34m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754931454; c=relaxed/simple;
	bh=S4d6lUauKiLAjxjjc0O+HQqoG9EEEDfb69SWiRd0b5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUB3LLWQb8Rn75I2YuITngvhD0YxSasQGGfxnj3OkJrOyLx4zh+GrbYMSqF8kQwdClc9x7uUlVzu2PoiO2Ci+NXmz/CXFplZIg224GnQhALT5JESYYeW3kYHDKsFEVhD9gq5XOoU2ChljIs/95RknaPZO2ezW8l0fOMTdo7q2NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=S+112Bm1; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=pknGW+py; arc=pass smtp.client-ip=81.169.146.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
ARC-Seal: i=1; a=rsa-sha256; t=1754931422; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Lfw3xhcT9e6Bv/tFrVbfmfVMXrmLMvIMUgG7mXTPmEZpaYSlZ8UpQxNIuzviMFMGyM
    KAlFZo9CCgnEUWnXBGZ9fWIAfVbYUDmcua0qDwe9s/kX+FrGHCetR8jORnCshCiKxRIc
    GgY2HBiVX3dD/DCpr2jbbOaHYKdZxR/grzRFl308JkUESh1pEmIm9aZqCyA0Z3/Ss/2D
    YKjJxnbTXI89X3r9Yz5JzvMOuEQ4anfhCdTtCt9IfjgoRfrkmx4ayXmA9PQ7igCMiydq
    Tau6XbgfAa27FOA3fS3UCrX16ehJ5nE2wZvM4Fb/2pACCOSJ//az5g77udBAyvSngVJo
    7V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754931422;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tru+5MX/zJL5yTAewuscQjg5+n2+3GfPhnXXJk3grEM=;
    b=ayp0DflGPYpEvy+i8uI9xvuJp8StcomzRReLOEQ33/Q3M2Q6F0FHNDW+a5/HbTPNru
    i5/jxFbfi8L9RY5J8YmPuXQqHuGr4j7AQsSgtImrqBWWeFfsaJfFjSL7rgbH8bYyReI1
    3Xrr0da3hSYFLhUMj4QFriJsr06SNkI0xZeYr9D0zG3+WX0rW3Lc8lWflkxqlA/d6H8Y
    ReV2Nq01+qZWf2KQ8ZQ5OIQVlWG6kaMpa0chKYFUdupRNeNx8SLtnbSs/ZUYc3L3ht/Q
    8mT0KGKS/gwTI6QfWDkTGXstT2glVMIy0Qx8hIyIvS7OouZQ1975NO4nDLjHJUr0Ed+h
    eQOA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754931422;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tru+5MX/zJL5yTAewuscQjg5+n2+3GfPhnXXJk3grEM=;
    b=S+112Bm1mdbtr0garHnXK5JDGLGSnPCvGFT6lK9gkoaqRt4TzwjyWWaGV9bJMSkUVS
    FxRrRCLJk1O76xr/k+6HFMInHm2yf6p/BP4qOf1lNKz+Bh2RmRY89gLhm1fgw+CXFtJ6
    kKzYfuaDdCYkwFTrJHBM1kSjEN5FIUItjChRUkhAZr0irfMmHeFvTpCHgU7SdB41ZD9S
    VxCbWFcuflib4tF8Hco3qT+Hb4UcGMP5bnly5cfALUzqDwYVCZ2e5yoNArDJxRa6fZVC
    0QrhqDqVCE1wdzzjO84v1GPtjWj+0GXi+PMX4mn6Jlr5D2h8LKlzSFr4RWKXsIwQ+ecc
    Vbtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754931422;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tru+5MX/zJL5yTAewuscQjg5+n2+3GfPhnXXJk3grEM=;
    b=pknGW+pyQwNG08NReh2VUn37gevhUkAdcLJ9869doyIbSywRStSDkwPlE8lwh4g7Ds
    UItxZWsSi42H03p4CaAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqk+SEbqP8NhOCyDhaDCIbC4OSPncFYTSyvQv/KQ=="
Received: from [IPV6:2001:16b8:5039:2800:ccef:2896:9625:9203]
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c17BGv1EYY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 11 Aug 2025 18:57:01 +0200 (CEST)
Message-ID: <5e0a55a9-10ff-4594-aada-34eb31b2d8aa@xenosoft.de>
Date: Mon, 11 Aug 2025 18:59:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-pasemi messages since kernel 6.16
To: Sven Peter <sven@kernel.org>
Cc: linux-i2c@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
References: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
 <d4b0a847-0617-4735-b6a1-ff5375f166bd@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <d4b0a847-0617-4735-b6a1-ff5375f166bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11 August 2025 at 06:12 pm, Sven Peter wrote:
> hi,
> 
> On 10.08.25 18:47, Christian Zigotzky wrote:
>> Hello Sven,
>>
>> Since the kernel 6.16 we have the following messages during the boot.
>>
>> [    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
>> [    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 
>> 0x08210100 (xfstatus 0x00000001)
>> [    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
>> [    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 
>> 0x08210100 (xfstatus 0x00000001)
>> [    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
>> [    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 
>> 0x08210100 (xfstatus 0x00000001)
>>
>> What exactly do these messages mean?
> 
> Do you just see these messages or are there also any other issues like a 
> device on the i2c bus not working anymore when it worked fine before?
> We added some additional logging recently and I suspect that this has 
> always been happening and no one noticed.
> 
> 
> 
> Sven
> 
> 

Hello Sven,

Thank you for your answer.

I just see these messages. There aren't any other issues.

Further information:

$ cat /proc/version
Linux version 6.12.22-powerpc64-smp (geeko@buildhost) 
(powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU ld (GNU Binutils; 
devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 SMP Tue Apr  8 
09:47:26 CEST 2025

$ sudo dmesg | grep -i i2c
[    5.032840] i2c_dev: i2c /dev entries driver
[    5.440998] i2c i2c-9: Detected TI TMP423 chip at 0x4c

$ sudo i2cdetect -l
[sudo] password for christian:
i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter
i2c-10	i2c       	PA Semi SMBus adapter (0000:00:1c.1)	I2C adapter
i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter
i2c-8	i2c       	card0-DP-1                      	I2C adapter
i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter
i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter
i2c-11	i2c       	PA Semi SMBus adapter (0000:00:1c.2)	I2C adapter
i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter
i2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter
i2c-9	i2c       	PA Semi SMBus adapter (0000:00:1c.0)	I2C adapter
i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter
i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter


$ cat /proc/version
Linux version 6.16.0-powerpc64-smp (geeko@buildhost) 
(powerpc64-suse-linux-gcc (SUSE Linux) 11.5.0, GNU ld (GNU Binutils; 
devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 SMP Mon Jul 28 
06:44:21 CEST 2025

$ sudo dmesg | grep -i i2c
[sudo] password for christian:
[    3.381852] i2c_dev: i2c /dev entries driver
[    3.591326] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    3.604687] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.623181] i2c i2c-9: Detected TI TMP423 chip at 0x4c
[    3.640313] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    3.653561] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.667314] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    3.680416] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.694312] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    3.708309] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    3.721268] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.735309] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    3.748276] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.762309] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    3.775289] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.789309] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    3.802265] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.816315] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    3.830308] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    3.843392] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.857308] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    3.870637] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.884307] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    3.897148] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.911309] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    3.924874] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)
[    3.939307] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    9.335546] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 
0x08210100 (xfstatus 0x00000001)

sudo i2cdetect -l
[sudo] password for christian:
i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter
i2c-10	i2c       	PA Semi SMBus adapter (0000:00:1c.1)	I2C adapter
i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter
i2c-8	i2c       	card0-DP-1                      	I2C adapter
i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter
i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter
i2c-11	i2c       	PA Semi SMBus adapter (0000:00:1c.2)	I2C adapter
i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter
i2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter
i2c-9	i2c       	PA Semi SMBus adapter (0000:00:1c.0)	I2C adapter
i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter
i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter

Cheers,
Christian

