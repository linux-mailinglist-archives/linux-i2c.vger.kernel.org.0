Return-Path: <linux-i2c+bounces-4585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534CF9240FD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 16:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B29C28324D
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 14:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1247D1BA084;
	Tue,  2 Jul 2024 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0rEUcXO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459A1E50F;
	Tue,  2 Jul 2024 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930867; cv=none; b=B2DGg+mkBkgfRWtwT/rOfL+23KQbOpma86bOszuAkwmNT5AH8XEW0dsffna5GzbmIg2yN0tZLyrnJZFBhgH0kXFfcwDoHpvcbHuuViLA4gjleiWboNeuSJYWzqCEVQLDUgpR0Q7sqbXheW6Hf5NPwDrT1hHdze1gfldysZvNT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930867; c=relaxed/simple;
	bh=98l+a3pWB42qJAPZ0GCAZ++B7ulUfPolVvoVx0ArV80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qit8F30uoJg2MF60bi3eSI9lPFVpNP2tHV11eRSOiUCG94fiIs3ZRLW2tmluX5k0yS0Q+eFpEWPjwfmMVkoPxH63YirAIvHAIybeYaAr0ob4G6sLHwaaLf/XK41oOzZjg89D/dXkecZlIK7YsnqSpL/qUfAZURP4Q8QhTrgjIE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0rEUcXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D1C116B1;
	Tue,  2 Jul 2024 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719930867;
	bh=98l+a3pWB42qJAPZ0GCAZ++B7ulUfPolVvoVx0ArV80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0rEUcXOsmoKrUeeA1jklOR1g18AnF0Flxfk/JNfZrjZqFZs0wqyXic4zXwXwSGdj
	 aLsOouz97xRzytjtZK2aq10SqTea7EC19f/UFenwnER62QLyQ6Lcj6yWGfHLN2AbNG
	 Hg+15ZtFlABzxtZ2uNC3Gni4U+sPwMMrT0t0Xb9CTTA8wHTk8+nS5pPm9BMfqNnK8S
	 BpoxZ8ZYdvrIHqwSMXp+L00o9v1Lps4Wu1Nqgg5yFxjX09CTCMdCgxemgE797kH2/b
	 eLr0VOBUH/xaIpNk0zQetIDIfIJly0q2Dvnl0sHjtWFEjUn2t5bms0jug9msMi6A7N
	 lZZiwIZkpMCRw==
Date: Tue, 2 Jul 2024 16:34:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gypj655hqo5gwvn3"
Content-Disposition: inline
In-Reply-To: <mafs0ed8byj5z.fsf@kernel.org>


--gypj655hqo5gwvn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 04:15:20PM GMT, Pratyush Yadav wrote:
> On Tue, Jul 02 2024, Maxime Ripard wrote:
>=20
> > On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
> >> On Mon, Jul 01 2024, Tudor Ambarus wrote:
> >>=20
> >> > On 7/1/24 2:53 PM, Marco Felsch wrote:
> >> >> EEPROMs can become quite large nowadays (>=3D64K). Exposing such de=
vices
> >> >> as single device isn't always sufficient. There may be partitions w=
hich
> >> >> require different access permissions. Also write access always need=
 to
> >> >> to verify the offset.
> >> >>=20
> >> >> Port the current misc/eeprom/at24.c driver to the MTD framework sin=
ce
> >> >> EEPROMs are memory-technology devices and the framework already sup=
ports
> >> >
> >> > I was under the impression that MTD devices are tightly coupled by e=
rase
> >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after =
all?
> >>=20
> >> I was curious as well so I did some digging.
> >>=20
> [...]
> >>=20
> >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting addi=
ng
> >> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPR=
OM
> >> drivers under a single interface. I am not sure what came of it though,
> >> since I can't find any patches that followed up with the proposal.
> >
> > That discussion led to drivers/nvmem after I started to work on
> > some early prototype, and Srinivas took over that work.
>=20
> So would you say it is better for EEPROM drivers to use nvmem instead of
> moving under MTD?

I thought so at the time, but that was more than 10y ago, and I have
followed neither nvmem nor MTD since so I don't really have an opinion
there.

It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
and MTD can be used as an nvmem provider too, so it's not clear to me
why we would want to create yet another variant.

But again, you shouldn't really ask me in the first place :)

I'm sure Miquel, Srinivas, and surely others, are much more relevant to
answer that question.

Maxime

--gypj655hqo5gwvn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQP7wAKCRDj7w1vZxhR
xelSAQDyHdp3qs5OhZUbyv1sIG+7PHV3rzbQJu5zbjdgtcsnUwD/Vd5FuxDSVZrq
YEHzmHdDyuPknfgYexiAvC7jtdFIlwk=
=B/wG
-----END PGP SIGNATURE-----

--gypj655hqo5gwvn3--

