Return-Path: <linux-i2c+bounces-816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D06813D43
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 23:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626CE1C21E46
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 22:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB8367206;
	Thu, 14 Dec 2023 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="IMWJZBmt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692182C69D;
	Thu, 14 Dec 2023 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-187-191.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.191])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D39A420034;
	Fri, 15 Dec 2023 06:21:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702592469;
	bh=BGWPGfhl0ltwnlLE/nuPazf5YbLmd4b70ljGryNav64=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IMWJZBmtSZGz8fkLlX/NAMm/kPBlN1o06WmMS40kxpap8N23ucFlz0CsPwOLaEKK/
	 xMU3VCpaU72AIa+e8JbmcCL2FJOxa+/Y9kQCOsCSY+oFD/AEVCI4dxVGSAkMHhbubn
	 2/hPvLvNg5JNAlqNXTUmx9JomL2xwv9OF5MYmKaL5jYPtPzvVMSZyCKigNeFTf93BA
	 NA/cFW43MWxHVkgeFMmTDEh+vgM0OjDh0NKNvZh271S8Ve2HIwfU5jKZ90eyseTHiZ
	 tJsuMEKHJQpBNQLH3bZZ9KNddteV2ouDQ4GCA81DmsUnKgM3KI9uNVJnPkUp2rtJSW
	 MG+4P0YfwWZsg==
Message-ID: <54cba87a0df233b8762e43b742afe8e44a77a60c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission
	 <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, 
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Date: Fri, 15 Dec 2023 08:51:03 +1030
In-Reply-To: <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
	 <20231211102217.2436294-3-quan@os.amperecomputing.com>
	 <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> On Mon, 2023-12-11 at 17:22 +0700, Quan Nguyen wrote:
> > Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
> > interrupt handler") acknowledges most interrupts early before the slave
> > irq handler is executed, except for the "Receive Done Interrupt status"
> > which is acknowledged late in the interrupt.
> > However, it has been observed that the early acknowledgment of "Transmi=
t
> > Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
> > be raised in READ REQUEST state, that shows the
> > "Unexpected ACK on read request." complaint messages.
> >=20
> > Assuming that the "Transmit Done" interrupt should only be acknowledged
> > once it is truly processed, this commit fixes that issue by acknowledgi=
ng
> > interrupts for both ACK and NACK cases late in the interrupt handler.
> >=20
> > Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in=
 interrupt handler")
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>=20
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

So I just booted this series on v6.7-rc5 under qemu v8.2.0-rc4 and
found this:

```
$ qemu-system-arm \
	-M ast2600-evb \
	-kernel build.aspeed_g5/arch/arm/boot/zImage \
	-dtb build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb \
	-initrd ~/src/buildroot.org/buildroot/output/images/rootfs.cpio.xz \
	-nographic 2>&1 \
	| ts -s
...
00:00:03 [    1.089187] Freeing initrd memory: 3308K
00:00:05 smbus: error: Unexpected send start condition in state 1
00:00:05 smbus: error: Unexpected write in state -1
00:00:06 [    3.685731] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 register=
ed, irq 48
00:00:06 [    3.688918] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 register=
ed, irq 49
00:00:06 [    3.692326] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 register=
ed, irq 50
00:00:06 [    3.693757] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registe=
red, irq 51
00:00:06 [    3.695070] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registe=
red, irq 52
00:00:06 [    3.696184] aspeed-i2c-bus 1e78a780.i2c-bus: i2c bus 14 registe=
red, irq 53
00:00:06 [    3.697144] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 registe=
red, irq 54
00:00:06 [    3.699061] aspeed-video 1e700000.video: irq 55
00:00:06 [    3.699254] aspeed-video 1e700000.video: assigned reserved memo=
ry node video
00:00:06 [    3.702755] aspeed-video 1e700000.video: alloc mem size(24576) =
at 0xbc000000 for jpeg header
00:00:06 [    3.706139] Driver for 1-wire Dallas network protocol.
00:00:07 smbus: error: Unexpected send start condition in state -1
00:00:07 smbus: error: Unexpected write in state -1
00:00:10 smbus: error: Unexpected send start condition in state -1
00:00:10 smbus: error: Unexpected write in state -1
00:00:12 smbus: error: Unexpected send start condition in state -1
00:00:12 smbus: error: Unexpected write in state -1
00:00:14 smbus: error: Unexpected send start condition in state -1
00:00:14 smbus: error: Unexpected write in state -1
00:00:17 smbus: error: Unexpected send start condition in state -1
00:00:17 smbus: error: Unexpected write in state -1
00:00:18 [   14.080141] adt7475 7-002e: Error configuring attenuator bypass
00:00:19 smbus: error: Unexpected send start condition in state -1
00:00:19 smbus: error: Unexpected write in state -1
00:00:21 smbus: error: Unexpected send start condition in state -1
00:00:21 smbus: error: Unexpected write in state -1
00:00:24 smbus: error: Unexpected send start condition in state -1
00:00:24 smbus: error: Unexpected write in state -1
```

The smbus errors do not occur if I revert this patch.

Can you look into qemu to see if it's a bug in the aspeed i2c
controller model's state machine?

Cheers,

Andrew

