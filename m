Return-Path: <linux-i2c+bounces-4789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA292B43D
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 11:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D66001F240B8
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 09:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161FE1553B3;
	Tue,  9 Jul 2024 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pS12M/hF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5415534D;
	Tue,  9 Jul 2024 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518192; cv=none; b=Tbd6w/9fSNdSwg6Jz8VSg96E1yofs0zXMD/LraWqwQt9x2H1lEC+V9mTpDBhU01fn0600RWDHqnotmBvL8QDLAbOgXEyaoQn0gCoAydj762dlpCweQX3b5eHJjp2EwAl+kptOEqzanbNuCCGWuzLc2nuzCZB0WGRAMeitasGiaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518192; c=relaxed/simple;
	bh=Z0HcHq7yzl+7AelddnrRR87bt+aU2j10VpepG5UbVu4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QiIvcl/KpeNm9lruFLKb7tmg/xYQRtik47v1Jh1DKMPp2Rj87zK5Lm/Im0TFsXN/vvQ9QqCwiU6VOcHmG+o82smL97vjmK6BOD/Y1TMkrZLHdiEGyZKiC4kAyMOH8YHtBE2kwehQ+TN7HofP/6r3uJNvBcDBrWrXBcrCSgQ4U/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pS12M/hF; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 896761BF20E;
	Tue,  9 Jul 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720518188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVMmtSjwlNQmVjxtUeUdR3iKhz4W+lQLl2pkn1Xk12k=;
	b=pS12M/hFFtUvUahs26E5vD/JZJjIQ8CmyPf5kCaaSJzFbR3RDeMCaG4WkQ18U83Kje7Xfl
	AyN919sqdbsVTsmreQhwHSygXqgRJ0kdPQ5zjcJUGtxlT4Ho9p8ijdF8YfTeIO6HFDK7eO
	9ZWZUOd5wpLbo4/rkrKRN8+RnXilQYghyruJzJG1B0By1AlkPDEswaoM56ChbKqR9xzmtO
	jhtQebyqSJwnet2P69DvwaCq24fYzhp/MVzppGLvK1eJdhxGBanp5/LzDMV65mb+L+itk6
	lQKaVcgNUEyq8U3sZF8TqV+3RTbRtu+1Gi6vNNP28kc9H4uebjsO4mk9Ei94yg==
Date: Tue, 9 Jul 2024 11:43:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>, Pratyush Yadav
 <pratyush@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240709114302.3c604ef3@xps-13>
In-Reply-To: <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Marco,

> > > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggestin=
g adding
> > > > >> EEPROMs to MTD [1]. The main purpose would have been unifying th=
e EEPROM
> > > > >> drivers under a single interface. I am not sure what came of it =
though,
> > > > >> since I can't find any patches that followed up with the proposa=
l.   =20
> > > > >
> > > > > That discussion led to drivers/nvmem after I started to work on
> > > > > some early prototype, and Srinivas took over that work.   =20
> > > >=20
> > > > So would you say it is better for EEPROM drivers to use nvmem inste=
ad of
> > > > moving under MTD?   =20
> > >=20
> > > I thought so at the time, but that was more than 10y ago, and I have
> > > followed neither nvmem nor MTD since so I don't really have an opinion
> > > there.
> > >=20
> > > It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> > > and MTD can be used as an nvmem provider too, so it's not clear to me
> > > why we would want to create yet another variant.
> > >=20
> > > But again, you shouldn't really ask me in the first place :)
> > >=20
> > > I'm sure Miquel, Srinivas, and surely others, are much more relevant =
to
> > > answer that question. =20
> >=20
> > More relevant, I doubt, but just a feeling: EEPROMs have their own
> > subsystem now, NVMEM, which, as Maxime said, was initially written for
> > that very specific case. EEPROMs don't have the complexity of MTD
> > devices, and thus pulling the whole MTD subsystem just for getting
> > partitions seems counter intuitive to me. You can definitely "split"
> > EEPROM devices with NVMEM as well anyway. =20
>=20
> I asked for feedback on my RFC [1] and all I got was to merge both
> drivers into one and make the driver backward compatible, which I did by
> this commit.

I'm sorry for not bringing this earlier.

> > Overall I think the idea of getting rid of these misc/ drivers is goes
> > into the right direction, but registering directly into NVMEM makes
> > more sense IMO. =20
>=20
> So you propose to have two places for the partition handling (one for
> MTD and one for NVMEM) instead of one and moving the code into NVMEM
> directly?

Why two places for the partitions handling? Just one, in NVMEM. Also
usually EEPROMs don't require very advanced partitioning schemes,
unlike flashes (which are the most common MTD devices today).

> That doesn't sound right to me either. Also I don't get the
> point why EEPROMs can't be handled by the MTD layer?

They can, but should they? Just compile the two layers and observe
the size difference. MTD is complex and old, carries a lot of history,
and the user interface is also not straightforward because you need to
handle pages, blocks, erases, bitflips, ECC stats, OOB bytes and
positions, two OTP areas... None of that exists in the EEPROM world. So
why would you want to register into MTD and pull a huge subsystem while
there is a much more recent, simpler and way lighter subsystem fitting
much better your device?

> The layer already
> supports devices of type MTD_RAM which are very simple and don't require
> an erase-op at least I don't see one.

MTD_RAM has been there forever, probably for "bad" reasons. BTW there
has been an attempt at removing it which was reverted in _2006_ and then
felt into the cracks:
21c8db9eff95 ("[MTD] Restore MTD_ROM and MTD_RAM types")

Thanks,
Miqu=C3=A8l

