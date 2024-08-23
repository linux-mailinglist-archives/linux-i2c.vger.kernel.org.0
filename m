Return-Path: <linux-i2c+bounces-5762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB595D1AC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B84B1C23D22
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A50188CA7;
	Fri, 23 Aug 2024 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EQgdhHc1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBDC18952D;
	Fri, 23 Aug 2024 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427482; cv=none; b=l0NMMv12Ba+zI22IPkE5OSWp9VGpRgLLQdTeluidchyM7G91Ug8CwaFfDtbTPJmD5YkSBc4Ht0V3rSJjb3UHW2YxfymSb3a4cCAehRIoGnLIUUrgOk00J3LSAToO/wB+3RC4YQaMupy0ChkiWm6vF3pXPFbSjvlzlmGiMAlQdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427482; c=relaxed/simple;
	bh=zCxIRWkih4tuPLzhcTwAD0rHAXZgw44YpE8z23P2up4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+qf/KQNk5gHVD/FU2KPbNY61/0xuYy18WOCCEcHsfPJjRyKik/1S7fAhEZCNFKlOPpe1i0qyMBUwvZ0DqI1RDen16WH1hK6OWUYIkZJO3l2GS5iE+AGRbNRyV13DfpNKHBalUA7C1s2mZU9l3Ay8nbbE8fnhTyGZosxtS9MVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EQgdhHc1; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCDC41BF206;
	Fri, 23 Aug 2024 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724427477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CutgodhxN+FJr5V+VHWsJBhY68LFF7RKhgiCY4alWI=;
	b=EQgdhHc1vU0jHveAWULFKVBKA5K/Reu7E11e/ThNq9x2gK+seD0B13sWiulonMlwdOssZ+
	k+eOdW0o2tv4Ud7+Sc+JOMrfETHvLbvlgyy+kMY6NXxlMbsUmLZ7/FAN5WXqj27n4bSlr+
	dmDpxLQ/Z+1AQ01pr9Z1lBOL3BCycoIwydon6a7UJIbtuAqynLhzcVgS7Tyw1JXQgEmX0x
	VOnCrmUGt8M8ZePqnH/ue6a4gvzyEDN1u3bA6Elhg+jRCgsbvMd5Mx/JhrjqIxq4e6ckw+
	detDzZoFkx9y82FATvoOoDjp178jqdsLKA7rVAVuQiUuWcQl3YXaclc2dwkXfg==
Date: Fri, 23 Aug 2024 17:37:48 +0200
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
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev, Michael Walle
 <michael@walle.cc>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240823173748.2b3a364a@xps-13>
In-Reply-To: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
References: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
	<20240709114302.3c604ef3@xps-13>
	<20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
	<20240717101948.2e99f472@xps-13>
	<20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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

m.felsch@pengutronix.de wrote on Thu, 18 Jul 2024 11:17:53 +0200:

> Hi Miquel,
>=20
> On 24-07-17, Miquel Raynal wrote:
> > Hi Marco,
> >  =20
> > > > > > Overall I think the idea of getting rid of these misc/ drivers =
is goes
> > > > > > into the right direction, but registering directly into NVMEM m=
akes
> > > > > > more sense IMO.     =20
> > > > >=20
> > > > > So you propose to have two places for the partition handling (one=
 for
> > > > > MTD and one for NVMEM) instead of one and moving the code into NV=
MEM
> > > > > directly?   =20
> > > >=20
> > > > Why two places for the partitions handling? Just one, in NVMEM. Als=
o   =20
> > >=20
> > > Without checking the details I think that converting the MTD
> > > partitioning code into NVMEM partitioning code is a bigger task. As y=
ou
> > > said below there are many legacy code paths you need to consider so t=
hey
> > > still work afterwards as well.
> > >  =20
> > > > usually EEPROMs don't require very advanced partitioning schemes,
> > > > unlike flashes (which are the most common MTD devices today).   =20
> > >=20
> > > As said in my cover letter EEPROMs can become quite large and MTD
> > > supports partitioning storage devices which is very handy for large
> > > EEPROMs as well. =20
> >=20
> > Did you had a look at nvmem-layouts ? In particular the fixed-layout. =
=20
>=20
> Yes I had a look at nvmem-layouts and we use them within a
> mtd-partition. Using them instead of a mtd-partition is not sufficient
> since they:
>  1) don't support user-space write (I send a patch for it but it doesn't
>     seem to be accepted soon).

Yes, this needed improvements maybe but was not refused either.

>  2) If write would be supported the user-space need to write the
>     complete cell e.g. no partial writes.

Maybe that can also be brought to nvmem. Again, nvmem was introduced
for handling EEPROMs in the first place.

Anyway, if other people in Cc: want to share some thoughts, they are
also welcomed, I don't want to block this series for bad reasons. I'm
also adding Michael Walle in Cc: who might have an opinion on that.

Link: https://lore.kernel.org/linux-mtd/20240701-b4-v6-10-topic-usbc-tcpci-=
v1-4-3fd5f4a193cc@pengutronix.de/

Thanks,
Miqu=C3=A8l

