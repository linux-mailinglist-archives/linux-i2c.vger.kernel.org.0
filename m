Return-Path: <linux-i2c+bounces-6537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CD5974EFD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF89C281CE7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DB81714DD;
	Wed, 11 Sep 2024 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="RO05Y8dI";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="GMMVHzf+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23A18130D;
	Wed, 11 Sep 2024 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726047989; cv=pass; b=kindbhTAWnP8Cjm9jhl9DqwWWquoPUGa+8qmO4g1GCouJ3yc1ZDe1pFf9lazgqFy5FZACf6prqHXkOA4bNYpdQLqLBrWwWYW8S4MaDyA8anEjqpUZt5uli7GlYG5Ki8/1MceT8QfBvyXALbRpkzTjUILxt63F5lwM/Le2AClAKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726047989; c=relaxed/simple;
	bh=Ex5PUVdz7cSWGNVtfEBwj+0qzoZMp3DV0vE6mQJXipM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ly0vE/0QOq+ILO+wd+QhwZJ+pITP/kERvU2A7FLAxHT9WhJNOm5eKlepSODQz1Gr+Kx9hgYVoHKg3vaeX7cNT8T/YkwJSnQ7DCVmJlgi4y4ze61wCwyXFGBx2x3BmKkDLAFrMSrnYv5lkiUtoCT6eBJ7fsyXlmp0vThOMp9GTeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=RO05Y8dI; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=GMMVHzf+; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1726047616; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c+ud3TAP6wTrtlU0gDf2SJ5Au/QP9LhuibYn3dYKB5G6iMMirDxP9ZAKognktjlHsW
    qzpUxUaJMJ3UnMzLcxDXZZGTDMh9VS2IttzpVYF9tbHQVLrDolkDryvmrnZs4fc/Sc3K
    SuPjnLUURor80dg/9ZA5YBUt1mmh2+UihqaIDi1qnOl03P4KvIoDdBqH9zya07VShwo0
    na7ha1CWyUdvMoUOeBVixeT6EWsyAObdf9jZ6bEcYqeoQHaAGQQ2xf5gTbZiZfCGDywZ
    fziLO/VIoM5Wf6hYvqP7wNOzkircnvBDWsLenS5am3fWEFNs8g3VILQTSmHBgH6ZoPIO
    StbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726047616;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=cyu2cQj6NNncMTzVk18fVI+kmOOoQNcBV6VONOKKTKM=;
    b=epLFdxoCqFj6M+T3PNYuobwD7ns4ZvgR+vblk87wcASmyvdC/pfT6OZWRPbsGNHNRV
    rILOvjL5IBR7wBpe+GnxIgk70TcwlHPaBr9m5zeUQCKjItjGoY3D2XiixtlDgSjHIsuH
    UsyGJahdGwhwPDK8qSfcqX6IVuWfNrSfCmPpLC8PtlS2VaInB77R4VJyrGILgYWGHPD1
    EUiFoiWc/GmA4SHyTPtVDJZDPz7GQqvNYQOR43eS2JN8jKhhr+VbYxteZPm9YiSNmkkG
    JrLHaIl5fvV+KbGA0ksnrKj0zBG8ugbWE5TedidtQuoXJMWDD2182xLztdqfmOmlpP+g
    MzcQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726047616;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=cyu2cQj6NNncMTzVk18fVI+kmOOoQNcBV6VONOKKTKM=;
    b=RO05Y8dIUA+hS87jlLJzymXsIwU4uRytQ/9pVpMPIIVeqrrgq6QSmPNZY8Mc5ywfS8
    qQzurNV3I9tf+R3hT7nrGtjAwNWwfGbD2S6+Bw1sWttsRaDjbn4caX8M+p0nskt6JpgN
    lFzkRCuGVciku7hPKpN5iUHcQ3FIDLA1fx4J25g2UXCMwxmX+02TyHmmrynLgJSQqs9J
    xqeaO2IkUa/4fi1nBCNqZh+nQJZOSou7Jsrz+p2Gfj6JJ/oO9l8sN+9+Y1ZWb+CDx7XZ
    EYqsv/eOlXdzqLAhRMoUR7B1hl4OcgYyOU7g2WVnCT5Oj3luAtCkYwQ6+oRT8EkBLKHZ
    EgRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726047616;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=cyu2cQj6NNncMTzVk18fVI+kmOOoQNcBV6VONOKKTKM=;
    b=GMMVHzf+7fZD5Lexp36PsAIC2ghdL2hSHxZV1ysI6GYfWMc2EAifJIXTk+rsIiHBEe
    NUdqxPsGz6omVdpKwyDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c208B9eFy5S
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 11 Sep 2024 11:40:15 +0200 (CEST)
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
In-Reply-To: <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
Date: Wed, 11 Sep 2024 11:40:04 +0200
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-i2c@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <664241E0-8D6B-4783-997B-2D8510ADAEA3@goldelico.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
To: Reid Tonking <reidt@ti.com>,
 Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3776.700.51)

Hi,

> Am 28.04.2023 um 20:30 schrieb Reid Tonking <reidt@ti.com>:
>=20
> On 10:43-20230428, Tony Lindgren wrote:
>> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:
>>> On 4/27/2023 1:19 AM, Reid Tonking wrote:
>>>> Using standard mode, rare false ACK responses were appearing with
>>>> i2cdetect tool. This was happening due to NACK interrupt triggering
>>>> ISR thread before register access interrupt was ready. Removing the
>>>> NACK interrupt's ability to trigger ISR thread lets register access
>>>> ready interrupt do this instead.
>>=20
>> So is it safe to leave NACK interrupt unhandled until we get the next
>> interrupt, does the ARDY always trigger after hitting this?
>>=20
>> Regards,
>>=20
>> Tony
>=20
> Yep, the ARDY always gets set after a new command when register access =
is ready so there's no need for NACK interrupt to control this.

I have tested one GTA04A5 board where this patch breaks boot on =
v4.19.283 or v6.11-rc7 (where it was inherited from some earlier -rc =
series).

The device is either stuck with no signs of activity or reports RCU =
stalls after a 20 second pause.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.19.284-letux+ (hns@iMac.fritz.box) (gcc =
version 4.9.2 (GCC)) #13659 SMP PREEMPT Tue Jun 6 13:29:28 CEST 2023
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), =
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing =
instruction cache
[    0.000000] OF: fdt: Machine model: Goldelico GTA04A5/Letux 2804
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0xbe800000
[    0.000000] On node 0 totalpages: 261632
[    0.000000]   Normal zone: 1536 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 196608 pages, LIFO batch:63
[    0.000000]   HighMem zone: 65024 pages, LIFO batch:15
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp =
192mhz_clk)
...
[    6.994384] input: TSC2007 Touchscreen as =
/devices/platform/68000000.ocp/48072000.i2c/i2c-1/1-0048/input/input6
[    7.092163] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: Initialized =
TWL4030 USB module
[    7.104370] bmp280 1-0076: 1-0076 supply vddd not found, using dummy =
regulator
[   28.092681] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[   28.099060] rcu:     Tasks blocked on level-0 rcu_node (CPUs 0-0): =
P1220
[   28.105804] rcu:     (detected by 0, t=3D2102 jiffies, g=3D957, q=3D32)=

[   28.111877] udevd           R  running task        0  1220      1 =
0x00000000

or another one:

[   28.025939] rcu: INFO: rcu_preempt self-detected stall on CPU
[   28.031951] rcu:     0-...!: (2100 ticks this GP) =
idle=3D126/1/0x40000004 softirq=3D1484/1484 fqs=3D0=20
[   28.040863] rcu:      (t=3D2100 jiffies g=3D1037 q=3D26)
[   28.045593] rcu: rcu_preempt kthread starved for 2100 jiffies! g1037 =
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[   28.056365] rcu: RCU grace-period kthread stack dump:
[   28.061645] rcu_preempt     I    0    10      2 0x00000000

My guess is that the assumption that there is a new command after NACK =
may be wrong, depending on what i2c operations are ongoing.
I once had a hint that it could be related to twl4030 power management =
code. Where I could imagine it may do locked i2c access.
Unfortunately I did not save that boot log stack dump.

Reverting this patch for either v4.19.238 or v6.11-rc7 makes the device =
boot again.

Any proper fix (beyond revert) is welcome.

BR,
Nikolaus=

