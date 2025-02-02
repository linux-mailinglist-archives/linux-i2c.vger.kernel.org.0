Return-Path: <linux-i2c+bounces-9254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E8CA25060
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 23:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7477E3A3AC5
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 22:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6536214A65;
	Sun,  2 Feb 2025 22:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="Rlxuis1Y";
	dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="1GoOv2h7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520972147E4;
	Sun,  2 Feb 2025 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738536153; cv=pass; b=CBSF2Gl7EtEpDgbXf/0ypqhOWU3mqeXDGmQfHjmocp+63qVNwuvqfGVpmCNwttG1ibv/vwK0B0RzJ/IAiKif+av7iO5ffWTWneyhndyRqXviIxWabtp2YxNVO7CEmavZJm47MFMRURSxhjQ52wdJxkzyRMVXPgxoBhoyTzwj4aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738536153; c=relaxed/simple;
	bh=KBi7v959dUqFOoTOMGHA62AcL+AohG5IKbbsc/q7PlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nb1zJrnr9JpnMeWozuEu42YpCLe3kIMNDNnyWvRVmnY7+ZchKPJJB7FkoXgOntqMSp0KncPHsjRcMRLQTJKj2N7VnK/jJtwC6uUEG5WIvjt9AGWiKo8MhOh46ChfCt+IW+vtDEH2G5d2j2fstRYrTPmjZtj66hbSPLoA99etFPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jm0.eu; spf=none smtp.mailfrom=jm0.eu; dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=Rlxuis1Y; dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=1GoOv2h7; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jm0.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jm0.eu
ARC-Seal: i=1; a=rsa-sha256; t=1738536141; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LI3FbNR3GfXrWvBWFjutrPVBaPpmw8T3xWQIxQFvAjojZxi2c5aW7bqluJXylH8VO5
    EW8cG1PbfSBunwVQsHzXXoIyTZYmeoESlCEEOr3tJ0CAqtR4+r3g6opoHLopxSFAnxIP
    gxtJ0iGkCbUhfHLLgYA1+WXgNHOHPfMmrKjKqDf1Wyr5XUGdt/scRPZP6g6VXkcoQjvu
    6I9nyOVrpzb0bPyN+uQlF3J/7yKat3Ndb7z7YOwoAKvHYFcWM+iEaSmUiEUsHgDKpaei
    8PgfQRZm7HW6cErpn1QufOzfb9TvozbnUno2yiq3qRhuyGv/duf9GEewZMPmWnvDuyLJ
    b8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738536141;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Ehu0h3bGNDE8Cs/BEcu5x3Xbazqpd/Tk1ONCmP8AXRM=;
    b=Cp9E3+32+HFtZizlTjpKbv+yPpBl7GLEi+3iOVm25dtKWIEoUPeCl0vQc3xSpPpXHF
    qeKnV1huNyOLD6Jzbxiy8asGfMGuOtANiKw1hnfGl87SA0V9NCFGbfWDLAvXj+2qRDpT
    Se9ScUeBTGPcphcWyrpOXEdH3B+Y3CDNRGmWhpI41uQOjh26JlcmfLXeDYbLk2KscTvB
    KMrdALB3/Kt8hJVXbgOm+B2l4e1qQUOkzcQWbXTlX+eubzi5wxVx8PS077XAO7AdXFL6
    1VtnmJqLc+90wlDyY7GUKKfVIuMbPgdz0Cjq7AS5xsYJYrRoUXfoUtIJi+D9a6FJHjlF
    qfBw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738536140;
    s=strato-dkim-0002; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Ehu0h3bGNDE8Cs/BEcu5x3Xbazqpd/Tk1ONCmP8AXRM=;
    b=Rlxuis1YD/LzllRlw8WHFz1+agDAQHO3xb/3pxRIbBcxc85wvEYgJZPx53S8Vtemyq
    5gUtXocO3UsieS4E92+aZIFppTbF8RrVfEIDR/BnyTfZRrSXPteOqei6z7RhLb/G7KDA
    nvBYr3GpqI/1aHayzKG3T5xoL9ATkaZ3K+de3Qa1c86sW2SrwZHlM3Q2gXDXMJ6FK7Qd
    3c4aWNR7us6xUDvgYIs/THIb9Wxl+E7VNVZKOaWBzEOLo90a6EuIfDmMm8JwVqRvfQsW
    f5g2G/2nFgQoMuGPXFQ15TM62NNVnf7eydITn+ML+qMBVJI9z7I5Yb4wBKMx7VEUp/ID
    uiNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738536140;
    s=strato-dkim-0003; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=Ehu0h3bGNDE8Cs/BEcu5x3Xbazqpd/Tk1ONCmP8AXRM=;
    b=1GoOv2h7TkxFyjsQVvwY3Z7e8RqOs+clsX/k09zAVexioTdazRR0ASR0QgSL0i6E8G
    p5RdN3ePXBnMqRt2moBw==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQvpoIkZXd2bnDIrOV8VCY="
Received: from [192.168.1.165]
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id z9f73c112MgK3OM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 2 Feb 2025 23:42:20 +0100 (CET)
Message-ID: <ad0fe7ca-fb6c-4c19-b4b3-0f29ddaa92c3@jm0.eu>
Date: Sun, 2 Feb 2025 23:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andreas Kemnade <andreas@kemnade.info>, Reid Tonking <reidt@ti.com>,
 Tony Lindgren <tony@atomide.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
 <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
 <20241106102342.393abe25@akair>
 <23103A2E-1BAF-4914-A580-2E118539AD00@goldelico.com>
 <C6D6088E-6A2E-4984-894A-2B0EA5A4EFF2@goldelico.com>
Content-Language: en-US
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Autocrypt: addr=josua.mayer@jm0.eu; keydata=
 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
In-Reply-To: <C6D6088E-6A2E-4984-894A-2B0EA5A4EFF2@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 06.11.24 um 16:09 schrieb H. Nikolaus Schaller:
>
>> Am 06.11.2024 um 13:16 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>
>>
>>
>>> Am 06.11.2024 um 10:23 schrieb Andreas Kemnade <andreas@kemnade.info>:
>>>
>>> Am Wed, 11 Sep 2024 11:40:04 +0200
>>> schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:
>>>
>>>> Hi,
>>>>
>>>>> Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
>>>>>
>>>>> On 10:43-20230428, Tony Lindgren wrote:
>>>>>> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:
>>>>>>> On 4/27/2023 1:19 AM, Reid Tonking wrote:
>>>>>>>> Using standard mode, rare false ACK responses were appearing with
>>>>>>>> i2cdetect tool. This was happening due to NACK interrupt
>>>>>>>> triggering ISR thread before register access interrupt was
>>>>>>>> ready. Removing the NACK interrupt's ability to trigger ISR
>>>>>>>> thread lets register access ready interrupt do this instead.
>>>>>> So is it safe to leave NACK interrupt unhandled until we get the
>>>>>> next interrupt, does the ARDY always trigger after hitting this?
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tony
>>>>> Yep, the ARDY always gets set after a new command when register
>>>>> access is ready so there's no need for NACK interrupt to control
>>>>> this.
>>>> I have tested one GTA04A5 board where this patch breaks boot on
>>>> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc
>>>> series).
>>>>
>>>> The device is either stuck with no signs of activity or reports RCU
>>>> stalls after a 20 second pause.
>>>>
>>> Reproduced some problem here:
>>> i2cset 1 0x69 0x14 0xb6 (reset command for gyro BMG160)
>>> [  736.136108] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0,
>>> stop: 1
>>> [  736.136322] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
>>> either with this patch applied:
>>> ... system mostly hangs, i2cset does not return.
>>> with it reverted:
>>> ... most times I see after this:
>>> [  736.136505] omap_i2c 48072000.i2c: IRQ (ISR = 0x0002)
>>> and i2cset says:
>>> i2cset: write failed: Remote I/O error
>>>
>>> ... sometimes:
>>> omap_i2c 48072000.i2c: IRQ (ISR = 0x0004)
>>> and i2cset is successful.
>>>
>>> Other register writes seem to work reliably, just the reset command.
>>> I had tested with bmg driver disabled earlier,
>>> so it did not come to light.
>> Indeed, I can confirm with your sequence (and bmg driver voluntarily
>> disabled so that the effect just comes from the i2c bus & client chip).
>>
>> 1. echo blacklist bmg160_i2c >/etc/modprobe.d/test.conf
>> 2. reboot & login:
>> 3.
>>
>> Last login: Wed Nov  6 11:24:37 UTC 2024 on ttyO2
>> root@letux:~# dmesg|fgrep bmg
>> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
>> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
>> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
>> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
>> --- hangs for some seconds ---
>> [  109.664245] rcu: INFO: rcu_preempt self-detected stall on CPU
>> [  109.670318] rcu:     0-...!: (2100 ticks this GP) idle=7e74/1/0x40000004 softirq=9248/9248 fqs=0
>> [  109.679260] rcu:     (t=2100 jiffies g=11389 q=33 ncpus=1)
>> [  109.684753] rcu: rcu_preempt kthread timer wakeup didn't happen for 2099 jiffies! g11389 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
>> [  109.696685] rcu:     Possible timer handling issue on cpu=0 timer-softirq=4004
>> [  109.704010] rcu: rcu_preempt kthread starved for 2100 jiffies! g11389 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
>> [  109.714935] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
>> [  109.724517] rcu: RCU grace-period kthread stack dump:
>> [  109.729797] task:rcu_preempt     state:I stack:0     pid:15    tgid:15    ppid:2      flags:0x00000000
>> [  109.739593] Call trace:
>> [  109.739593]  __schedule from schedule+0x3c/0x64
>> [  109.747039]  schedule from schedule_timeout+0xa8/0xd4
>> [  109.752349]  schedule_timeout from rcu_gp_fqs_loop+0x148/0x370
>> [  109.758514]  rcu_gp_fqs_loop from rcu_gp_kthread+0xec/0x124
>> [  109.764373]  rcu_gp_kthread from kthread+0xfc/0x108
>> [  109.769500]  kthread from ret_from_fork+0x14/0x28
>> [  109.774444] Exception stack(0xf0041fb0 to 0xf0041ff8)
>> [  109.779754] 1fa0:                                     00000000 00000000 00000000 00000000
>> [  109.788330] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [  109.796905] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [  109.803863] CPU: 0 UID: 0 PID: 3210 Comm: loginwindow Not tainted 6.12.0-rc6-letux+ #169
>> [  109.803894] Hardware name: Generic OMAP36xx (Flattened Device Tree)
>> [  109.803894] PC is at handle_softirqs+0x84/0x300
>> [  109.803924] LR is at handle_softirqs+0x54/0x300
>> [  109.803955] pc : [<c0133c3c>]    lr : [<c0133c0c>]    psr: 60070113
>> [  109.803955] sp : f0001fa0  ip : 844ce392  fp : c0f02080
>> [  109.803985] r10: f0651be0  r9 : c1008d28  r8 : f0651be8
>> [  109.803985] r7 : c0f02d40  r6 : 00000200  r5 : c0e91600  r4 : c0e91600
>> [  109.803985] r3 : 2e70d000  r2 : 00000000  r1 : c0e91600  r0 : c23cad00
>> [  109.804016] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>> [  109.804016] Control: 10c5387d  Table: 82b70019  DAC: 00000051
>> [  109.804016] Call trace:
>> [  109.804046]  handle_softirqs from __irq_exit_rcu+0x6c/0xb4
>> [  109.804077]  __irq_exit_rcu from irq_exit+0x8/0x10
>> [  109.804077]  irq_exit from call_with_stack+0x18/0x20
>> [  109.804138]  call_with_stack from __irq_svc+0x98/0xcc
>> [  109.804138] Exception stack(0xf0651b60 to 0xf0651ba8)
>> [  109.804168] 1b60: c2c8f300 f0651ce0 c085aec0 c2c8f300 00000000 00000019 00000000 00000000
>> [  109.804168] 1b80: f0651be8 00000000 f0651be0 00000000 ffffffff f0651bb0 c02ba850 c085aec0
>> [  109.804199] 1ba0: a0070113 ffffffff
>> [  109.804199]  __irq_svc from sock_poll+0x0/0xbc
>> [  109.804229]  sock_poll from do_sys_poll+0x2a8/0x460
>> [  109.804260]  do_sys_poll from sys_poll+0x74/0xe8
>> [  109.804290]  sys_poll from ret_fast_syscall+0x0/0x54
>> [  109.804290] Exception stack(0xf0651fa8 to 0xf0651ff0)
>> [  109.804321] 1fa0:                   0000409b 00162f90 beeb07cc 00000001 ffffffff 00000000
>> [  109.804321] 1fc0: 0000409b 00162f90 b61c3080 000000a8 00000000 00162f9c 00163f90 beeb0874
>> [  109.804351] 1fe0: 000000a8 beeb07a8 b6a83bd7 b6a057e6
>>
>>
> After reverting this patch, I get some sporadic write errors but no kernel crashes:
>
> root@letux:~# while true; do i2cset -y 1 0x69 0x14 0xb6 && echo good; done
> Error: Write failed
> good
> Error: Write failed
> good
> good
> good
> good
> Error: Write failed
> good
> Error: Write failed
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> good
> Error: Write failed
> good
> ^C
> root@letux:~#
>
> So there are chips (like BMG160) which might block the SDA/SCL lines in a
> strange way where the patched i2c driver fails instead of timing out and
> reporting an error.
>
> Therefore, I'd suggest to revert it or find a proper fix.

I just came across this in 6.12.9, as well as 5.4.243 which pulled in 
this patch.
Affected is omap3-gta04a5.dts which worked perfectly fine at 5.4.242.

Please revert until a solution has been found.


