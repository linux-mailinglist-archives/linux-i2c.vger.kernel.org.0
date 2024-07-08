Return-Path: <linux-i2c+bounces-4751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D238929C61
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 08:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17ED6280E60
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 06:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C88171D2;
	Mon,  8 Jul 2024 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PzOy6Z2W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5146B1171D;
	Mon,  8 Jul 2024 06:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720421097; cv=none; b=L8I+/4PV/fc/Xp85ejoSA9P4q4md7O1jmOA6k4B0wRZKoOAFZQMe1z7eA0z/q/zCSqeSLRfFnk2J8EpiEt7wDktMYgLh3D+t2+LD7Mk0pnfikq4AdL9JUZVpah0b6Cm+6XFmLhTiy69v0bpPFHrgGoNHw7Lz9hFxnyy1I6e7kEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720421097; c=relaxed/simple;
	bh=EqDlk82dE7XS0/JGyUAUcCtCsFHxwVbAJvsEIiMzMrs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lB7ncdu4H92hljLvLomFhCNSXzlRKANIQYx3y0Afv377oux+58S5vdUUB+T8By9yHlAWS2nprSgZRgCgSWdDWamFs2Rw0J03bba2g988CLlPzrArfyJ+WNMWMP1ZJTKM22HRsuIo4AcxeiyfX86j3YRqNd2h3EeCKkdsW028B0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PzOy6Z2W; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 817CBE0006;
	Mon,  8 Jul 2024 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720421086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN45r2MzRBKAE4raZ17kWauJPTnIek3N3oaVcC2BO/g=;
	b=PzOy6Z2WDoUDIURvXSdTtpzbHX3JQqR2TwTpbeUTnfB6vX3dNcZ37ATxjxBqYPJmXyybOW
	/cSvPuilXVhZeR7B2dXURK6eJ39WhH4IRmB3cgvultxkXbdYRWIJAVPOSzfOAYpJjJ6yjj
	T4otuw7FybtaZrQhYLIzqq3zUvj4Jc9ZhqWNxjCSwxjRvmd7Z4M+rCx4VXtxp9PGAb8E1q
	oZ1dnF7ScZhNf1MbVD05qQH3qQWLfMAQwFkOz4wVja8KUEs30B2F3BIx4guMRdC+Ulvnk+
	YXsH623cgVPmDlxftJRPmEBJAk7rpJRwu3UnaQOHOTk3BC9lbm01fchVhlirnQ==
Date: Mon, 8 Jul 2024 08:44:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Marco Felsch <m.felsch@pengutronix.de>, Richard
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
Message-ID: <20240708084440.70186564@xps-13>
In-Reply-To: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
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

Hi,

> > >> >> Port the current misc/eeprom/at24.c driver to the MTD framework s=
ince
> > >> >> EEPROMs are memory-technology devices and the framework already s=
upports =20
> > >> >
> > >> > I was under the impression that MTD devices are tightly coupled by=
 erase
> > >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices afte=
r all? =20
> > >>=20
> > >> I was curious as well so I did some digging.
> > >>  =20
> > [...] =20
> > >>=20
> > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting ad=
ding
> > >> EEPROMs to MTD [1]. The main purpose would have been unifying the EE=
PROM
> > >> drivers under a single interface. I am not sure what came of it thou=
gh,
> > >> since I can't find any patches that followed up with the proposal. =
=20
> > >
> > > That discussion led to drivers/nvmem after I started to work on
> > > some early prototype, and Srinivas took over that work. =20
> >=20
> > So would you say it is better for EEPROM drivers to use nvmem instead of
> > moving under MTD? =20
>=20
> I thought so at the time, but that was more than 10y ago, and I have
> followed neither nvmem nor MTD since so I don't really have an opinion
> there.
>=20
> It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> and MTD can be used as an nvmem provider too, so it's not clear to me
> why we would want to create yet another variant.
>=20
> But again, you shouldn't really ask me in the first place :)
>=20
> I'm sure Miquel, Srinivas, and surely others, are much more relevant to
> answer that question.

More relevant, I doubt, but just a feeling: EEPROMs have their own
subsystem now, NVMEM, which, as Maxime said, was initially written for
that very specific case. EEPROMs don't have the complexity of MTD
devices, and thus pulling the whole MTD subsystem just for getting
partitions seems counter intuitive to me. You can definitely "split"
EEPROM devices with NVMEM as well anyway.

Overall I think the idea of getting rid of these misc/ drivers is goes
into the right direction, but registering directly into NVMEM makes
more sense IMO.

Thanks,
Miqu=C3=A8l

