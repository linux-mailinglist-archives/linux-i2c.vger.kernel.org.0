Return-Path: <linux-i2c+bounces-7843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBC9BF143
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E77D1F222EE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 15:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D0A201273;
	Wed,  6 Nov 2024 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="ZQ60evlK";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="2lit4CXs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DBD1D958E;
	Wed,  6 Nov 2024 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905798; cv=pass; b=Zx/OCo0scdpoqgr/ydk7/x+Jo+jBLgpJ+HXrZ5eXfGuGzE7u/BnAreu0eTqdHtCeQpd1yUAU/2YM/EGRlbMElWIDD2l8QwhBhcfCjK0CLepUZiBEZaN/Ud7dkbe6pgFb97dfK7onTEEyfKjIsv8HSYFf9ichMprx1lfMLlWJ0EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905798; c=relaxed/simple;
	bh=VLUf+0ohTL2CernqI4nW6w++EEvpqWcuO6oWMjXliic=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KDC8WvHDTk0558PqFsK+13PJLCmuMS6K3a/huuD9E0v7vwHcHZemSxPiGeyfq2Ho2nOc+31D7Q8u+T23yOHzgaZgSzPgBe4pxkZYDm2FjddOg+YDLlbaCvnSWoMLmGgVt3Cuc0DFJaiw4c5N64DcdVxXOdQOEBTrlr9i73kNiUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=ZQ60evlK; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=2lit4CXs; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1730905783; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iI6snnAtSLkd7F6lKnu2dNoxoj65gtpeqxkA7T5AeAkm5WN+GDkIV6TZNjIiPTZ7fF
    L0+bvxF+EAZ71GCme6oJfIqUzDH5RecUVVKwNeRYpuK+tjAB22ajc26n+EwnwR/vskMJ
    YJditNfnPSOP2OiuWpHh7fuWALcBnZg4uIl1T6FVy9k6eQSFycBgLgBE5ZV5pzsZvjvB
    G7wdWSfoIKVFRGjONbB3//W4sCJ2O+VdZCfR7a0te2nTnmtn2QbpumcqMRXqKDnyatrq
    O9vJYP+evp+/5JfOnXAkKMiSje7vt5gcvW7TZmwZjlSFRyesRm3RGyyogxkM1Z/uYrrh
    46xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730905783;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=06WLTlqbDUwROEY/Xfm1g8FflNeAMk8wJAUj29W0awg=;
    b=YJ2E3eJWJXceU5b/uBrSJ0pnsGnwHjvjJJu10tiyW4VjxR+GAdn+xAjQ/0c3m+hejZ
    sMNi8dTtUnMfOhM0uVfW1jy6kPorOcUv0qXDfE6xWAcSRL7oyvvyuDSz8+AOVqRbYzCG
    j1RupwDqtcBUcbKx6zGMmKsId+pTVMcef/Q68nAOYlyi3OxMKgkxZ7y77J0XAfl4RODh
    LcuVO5chXH2k0dKpKDqUhR2J3TvCav2lCjtvXxCQHPTdi+d1pa0fpChHI5pS54aePJhR
    aE/DX+/HqrDbdFwhk6IIzZIAVnkAdY0ivk+OtJMH9n/lEzUrNAnFFe4Vv5DWXfD/nbFN
    EXEg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730905783;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=06WLTlqbDUwROEY/Xfm1g8FflNeAMk8wJAUj29W0awg=;
    b=ZQ60evlKaVUFL7XK0Fl1uv3ScCabglBsmtBihYJKdWWczkbupzuVAv3rk3Xehk4N5R
    T3tsTkLv9POtNupev/e1Tjed0SpXvyMlpjQVTeB0WpT424DTtEGHcQogye1zE64e7PUG
    KQVZnJlKoX6LCll99Aju2nAUe+7OlyhFC/DmzoHukBbConxLRFmuVVBmLQl/B8SCMfpM
    P144g6g2dh8NRjT3gERXGou641Ep4EXxtZKAaw9I+Vt6xRvlyyzxIl1OjgGn/hXPjdxz
    U/i+oH/fgXmgfy61tkgnfHUenzBvrCr3nZpG2X4LGz2jnNMxtXZW2jzUul/z0rL585r8
    9wqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730905783;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=06WLTlqbDUwROEY/Xfm1g8FflNeAMk8wJAUj29W0awg=;
    b=2lit4CXse20R0t+9nachLiDsBTDJugxkR7WcsSQEq093Lt9CEGlm0/Os+3Pl87Jk5/
    IUutGls6CdDQuChi5jDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
    with ESMTPSA id Qb7e400A6F9h5mi
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 6 Nov 2024 16:09:43 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <23103A2E-1BAF-4914-A580-2E118539AD00@goldelico.com>
Date: Wed, 6 Nov 2024 16:09:32 +0100
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6D6088E-6A2E-4984-894A-2B0EA5A4EFF2@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
 <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
 <20241106102342.393abe25@akair>
 <23103A2E-1BAF-4914-A580-2E118539AD00@goldelico.com>
To: Andreas Kemnade <andreas@kemnade.info>,
 Reid Tonking <reidt@ti.com>,
 Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)



> Am 06.11.2024 um 13:16 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 06.11.2024 um 10:23 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>=20
>> Am Wed, 11 Sep 2024 11:40:04 +0200
>> schrieb "H. Nikolaus Schaller" <hns@goldelico.com>:
>>=20
>>> Hi,
>>>=20
>>>> Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
>>>>=20
>>>> On 10:43-20230428, Tony Lindgren wrote: =20
>>>>> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]: =20
>>>>>> On 4/27/2023 1:19 AM, Reid Tonking wrote: =20
>>>>>>> Using standard mode, rare false ACK responses were appearing =
with
>>>>>>> i2cdetect tool. This was happening due to NACK interrupt
>>>>>>> triggering ISR thread before register access interrupt was
>>>>>>> ready. Removing the NACK interrupt's ability to trigger ISR
>>>>>>> thread lets register access ready interrupt do this instead. =20
>>>>>=20
>>>>> So is it safe to leave NACK interrupt unhandled until we get the
>>>>> next interrupt, does the ARDY always trigger after hitting this?
>>>>>=20
>>>>> Regards,
>>>>>=20
>>>>> Tony =20
>>>>=20
>>>> Yep, the ARDY always gets set after a new command when register
>>>> access is ready so there's no need for NACK interrupt to control
>>>> this. =20
>>>=20
>>> I have tested one GTA04A5 board where this patch breaks boot on
>>> v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc
>>> series).
>>>=20
>>> The device is either stuck with no signs of activity or reports RCU
>>> stalls after a 20 second pause.
>>>=20
>> Reproduced some problem here:
>> i2cset 1 0x69 0x14 0xb6 (reset command for gyro BMG160)
>> [  736.136108] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: =
0x0,
>> stop: 1
>> [  736.136322] omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0010)
>> either with this patch applied:
>> ... system mostly hangs, i2cset does not return.
>> with it reverted:
>> ... most times I see after this:
>> [  736.136505] omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0002)
>> and i2cset says:
>> i2cset: write failed: Remote I/O error
>>=20
>> ... sometimes:
>> omap_i2c 48072000.i2c: IRQ (ISR =3D 0x0004)
>> and i2cset is successful.
>>=20
>> Other register writes seem to work reliably, just the reset command.
>> I had tested with bmg driver disabled earlier,
>> so it did not come to light.
>=20
> Indeed, I can confirm with your sequence (and bmg driver voluntarily
> disabled so that the effect just comes from the i2c bus & client =
chip).
>=20
> 1. echo blacklist bmg160_i2c >/etc/modprobe.d/test.conf
> 2. reboot & login:
> 3.=20
>=20
> Last login: Wed Nov  6 11:24:37 UTC 2024 on ttyO2
> root@letux:~# dmesg|fgrep bmg
> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
> root@letux:~# i2cset -y 1 0x69 0x14 0xb6
> --- hangs for some seconds ---
> [  109.664245] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  109.670318] rcu:     0-...!: (2100 ticks this GP) =
idle=3D7e74/1/0x40000004 softirq=3D9248/9248 fqs=3D0
> [  109.679260] rcu:     (t=3D2100 jiffies g=3D11389 q=3D33 ncpus=3D1)
> [  109.684753] rcu: rcu_preempt kthread timer wakeup didn't happen for =
2099 jiffies! g11389 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
> [  109.696685] rcu:     Possible timer handling issue on cpu=3D0 =
timer-softirq=3D4004
> [  109.704010] rcu: rcu_preempt kthread starved for 2100 jiffies! =
g11389 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
> [  109.714935] rcu:     Unless rcu_preempt kthread gets sufficient CPU =
time, OOM is now expected behavior.
> [  109.724517] rcu: RCU grace-period kthread stack dump:
> [  109.729797] task:rcu_preempt     state:I stack:0     pid:15    =
tgid:15    ppid:2      flags:0x00000000
> [  109.739593] Call trace:=20
> [  109.739593]  __schedule from schedule+0x3c/0x64
> [  109.747039]  schedule from schedule_timeout+0xa8/0xd4
> [  109.752349]  schedule_timeout from rcu_gp_fqs_loop+0x148/0x370
> [  109.758514]  rcu_gp_fqs_loop from rcu_gp_kthread+0xec/0x124
> [  109.764373]  rcu_gp_kthread from kthread+0xfc/0x108
> [  109.769500]  kthread from ret_from_fork+0x14/0x28
> [  109.774444] Exception stack(0xf0041fb0 to 0xf0041ff8)
> [  109.779754] 1fa0:                                     00000000 =
00000000 00000000 00000000
> [  109.788330] 1fc0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
> [  109.796905] 1fe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
> [  109.803863] CPU: 0 UID: 0 PID: 3210 Comm: loginwindow Not tainted =
6.12.0-rc6-letux+ #169
> [  109.803894] Hardware name: Generic OMAP36xx (Flattened Device Tree)
> [  109.803894] PC is at handle_softirqs+0x84/0x300
> [  109.803924] LR is at handle_softirqs+0x54/0x300
> [  109.803955] pc : [<c0133c3c>]    lr : [<c0133c0c>]    psr: 60070113
> [  109.803955] sp : f0001fa0  ip : 844ce392  fp : c0f02080
> [  109.803985] r10: f0651be0  r9 : c1008d28  r8 : f0651be8
> [  109.803985] r7 : c0f02d40  r6 : 00000200  r5 : c0e91600  r4 : =
c0e91600
> [  109.803985] r3 : 2e70d000  r2 : 00000000  r1 : c0e91600  r0 : =
c23cad00
> [  109.804016] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  =
Segment none
> [  109.804016] Control: 10c5387d  Table: 82b70019  DAC: 00000051
> [  109.804016] Call trace:=20
> [  109.804046]  handle_softirqs from __irq_exit_rcu+0x6c/0xb4
> [  109.804077]  __irq_exit_rcu from irq_exit+0x8/0x10
> [  109.804077]  irq_exit from call_with_stack+0x18/0x20
> [  109.804138]  call_with_stack from __irq_svc+0x98/0xcc
> [  109.804138] Exception stack(0xf0651b60 to 0xf0651ba8)
> [  109.804168] 1b60: c2c8f300 f0651ce0 c085aec0 c2c8f300 00000000 =
00000019 00000000 00000000
> [  109.804168] 1b80: f0651be8 00000000 f0651be0 00000000 ffffffff =
f0651bb0 c02ba850 c085aec0
> [  109.804199] 1ba0: a0070113 ffffffff
> [  109.804199]  __irq_svc from sock_poll+0x0/0xbc
> [  109.804229]  sock_poll from do_sys_poll+0x2a8/0x460
> [  109.804260]  do_sys_poll from sys_poll+0x74/0xe8
> [  109.804290]  sys_poll from ret_fast_syscall+0x0/0x54
> [  109.804290] Exception stack(0xf0651fa8 to 0xf0651ff0)
> [  109.804321] 1fa0:                   0000409b 00162f90 beeb07cc =
00000001 ffffffff 00000000
> [  109.804321] 1fc0: 0000409b 00162f90 b61c3080 000000a8 00000000 =
00162f9c 00163f90 beeb0874
> [  109.804351] 1fe0: 000000a8 beeb07a8 b6a83bd7 b6a057e6
>=20
>=20

After reverting this patch, I get some sporadic write errors but no =
kernel crashes:

root@letux:~# while true; do i2cset -y 1 0x69 0x14 0xb6 && echo good; =
done
Error: Write failed
good
Error: Write failed
good
good
good
good
Error: Write failed
good
Error: Write failed
good
good
good
good
good
good
good
good
good
good
good
good
good
good
good
good
Error: Write failed
good
^C
root@letux:~#=20

So there are chips (like BMG160) which might block the SDA/SCL lines in =
a
strange way where the patched i2c driver fails instead of timing out and
reporting an error.

Therefore, I'd suggest to revert it or find a proper fix.

BR and thanks,
Nikolaus



