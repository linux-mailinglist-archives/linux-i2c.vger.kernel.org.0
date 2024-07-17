Return-Path: <linux-i2c+bounces-5008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB39338D9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2024 10:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266B42846CF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2024 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13F125624;
	Wed, 17 Jul 2024 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q8RMbd3X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A91CAA4;
	Wed, 17 Jul 2024 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721204405; cv=none; b=KT0BigP3rZ8uuZ4gx/LQ3UeF+dasWLObD+t33igVRaH7gdUlu7wq0x0Aw+PFyVhRIdvUVdr9NcL7GPhoMe4mwnQiyc8ebwhgNKRXdqVUaIzhMgYWfl1QjMa47je0ubAEZLIDpMXY2u/fkX4IpcuAIMePQ6UsyTk2wJxxnMQhNwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721204405; c=relaxed/simple;
	bh=2CLtcxjWryy+ZrxMy3V6QLAyq9Tcxt0Pcwt6s+Wmc1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBcSA844G4wn2Pa3dZeboTJKFdsOBmK0hfbggFabnGmDfv89VkY9rOQdLlnKedbdKJwmRiaWksLg5lHzgAsoAnYRATRpIOlFqjm1YtxUbAfnC+mILlhQMBoA53kGc2502CjVx7H/nn4mu0h25tSgWkB0PkLied8Cj5mD0LQWF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q8RMbd3X; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 255A8FF803;
	Wed, 17 Jul 2024 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721204394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYy4jlSppC2pcc6cg+3nF/8GvPZv6nmewlb2L7o9Nw8=;
	b=Q8RMbd3XCm3mkOoSML4rikXKiJwOmxmdsX2NkXlZwRplYxuKqVu6DdyLJ7G/4YQS4TR3e0
	tQ9HYyVU0QaJ7mJKdjZ58+NY03/Y4pQSR1nheyy9/gpjRgXyPcN/SYNbnfEvcXYx78cKK1
	DspBdEnmtUUE2Vh7fB3axwb52s022qgb/fQK8B7JQxuL+DVdX8knHLZC7Oxu4B+r0HSgWa
	t6AmHSpNSofRHkmWqrwexOh4wFUvNGOiGe2R2Gz1nk0z8FDgM9iuuAszfZbHO/r1L/BknS
	0yhBDc0k6PoqJGn8/jBTZsc9id1S9XZ4jdCo9jE7HgZr9sw+Ct/c9wyvI/5QfA==
Date: Wed, 17 Jul 2024 10:19:48 +0200
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
Message-ID: <20240717101948.2e99f472@xps-13>
In-Reply-To: <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
	<20240709114302.3c604ef3@xps-13>
	<20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
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

> > > > Overall I think the idea of getting rid of these misc/ drivers is g=
oes
> > > > into the right direction, but registering directly into NVMEM makes
> > > > more sense IMO.   =20
> > >=20
> > > So you propose to have two places for the partition handling (one for
> > > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > > directly? =20
> >=20
> > Why two places for the partitions handling? Just one, in NVMEM. Also =20
>=20
> Without checking the details I think that converting the MTD
> partitioning code into NVMEM partitioning code is a bigger task. As you
> said below there are many legacy code paths you need to consider so they
> still work afterwards as well.
>=20
> > usually EEPROMs don't require very advanced partitioning schemes,
> > unlike flashes (which are the most common MTD devices today). =20
>=20
> As said in my cover letter EEPROMs can become quite large and MTD
> supports partitioning storage devices which is very handy for large
> EEPROMs as well.

Did you had a look at nvmem-layouts ? In particular the fixed-layout.

Is there anything you would like to achieve already that is not
possible with nvmem but is with mtd?

Thanks,
Miqu=C3=A8l

