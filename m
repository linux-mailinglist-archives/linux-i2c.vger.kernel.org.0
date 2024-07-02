Return-Path: <linux-i2c+bounces-4581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A95C4923FB1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 15:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60AB528B87A
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0F21B5808;
	Tue,  2 Jul 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meadaPSQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0881BA2D;
	Tue,  2 Jul 2024 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928615; cv=none; b=CvsY0D5naOAUym5X9jzeVP+icECA9Gj13TkUg7LPEVBhd+d9Sa2Y4A+B/zAa8MIrvUKRknZcIYhv1rBb7OmitGRTu7b8pERWqDjmobT4dO7dW7jiL0wxx5dnHEMu5k7iffoHLsECAxmrAvdsXZ4PVr4/kQf4y4ikw+m0YUJ19Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928615; c=relaxed/simple;
	bh=2C/dfpjesDaWHRmIpWeBPH1MXFkYQjqK4EO539CJrjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rR+tUmmzs88bOyXaCgcR80WqbJcKsX8UFUfwurwdN/T35g/vYjOo4i0Ff7pDiIvO/0y5X1TiELjpAfD9Axr/4YLzQmVT1XL/Pp7vwmvEnDyxI5oLoDv/ma29Cw9HF4XauGLDGLEKyh+Wd7BMIQNwlVp9cqq/yxUderqBt1FvpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meadaPSQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FE2C116B1;
	Tue,  2 Jul 2024 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719928615;
	bh=2C/dfpjesDaWHRmIpWeBPH1MXFkYQjqK4EO539CJrjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meadaPSQglu7unL8Z8Z6MQ46aSSUX2EWfgybQ2BFIt3Ue5V5SIZc+X0BTwR/tBvjK
	 +O0zcbbp3j5JiED8Vvia52Mzo1OnlxmuPoAVRp24Px95+mOxM4ochB6CF+2Ys5XJZn
	 gHmylmK9JYVBc/NkxY+xyi999zbhxd//O7pM66+tl29RLZqsIb54WGzfnk6jrX0AAt
	 CeIvMC80ssIF3uXW+mFr3SUAP9KueCGRZqxxEZqxJqGla7fCByIBJZeuDswyeZCfvt
	 3ukRRa1SerrwIeO9oFt9iNIbpSj0T+u6Nnp213aKUip7Euj+RtteCYlKfCc8G/nPHv
	 QlyaKoAcXcV+g==
Date: Tue, 2 Jul 2024 15:56:52 +0200
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
Message-ID: <20240702-congenial-vigilant-boar-aeae44@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wpznzlm3ricogeh2"
Content-Disposition: inline
In-Reply-To: <mafs0ikxnykpr.fsf@kernel.org>


--wpznzlm3ricogeh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
> On Mon, Jul 01 2024, Tudor Ambarus wrote:
>=20
> > On 7/1/24 2:53 PM, Marco Felsch wrote:
> >> EEPROMs can become quite large nowadays (>=3D64K). Exposing such devic=
es
> >> as single device isn't always sufficient. There may be partitions which
> >> require different access permissions. Also write access always need to
> >> to verify the offset.
> >>=20
> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
> >> EEPROMs are memory-technology devices and the framework already suppor=
ts
> >
> > I was under the impression that MTD devices are tightly coupled by erase
> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?
>=20
> I was curious as well so I did some digging.
>=20
> The Kconfig help says:
>=20
>     Memory Technology Devices are flash, RAM and similar chips, often
>     used for solid state file systems on embedded devices [...]
>=20
> The FAQ on the MTD documentation [0] says:
>=20
>     Unix traditionally only knew block devices and character devices.
>     Character devices were things like keyboards or mice, that you could
>     read current data from, but couldn't be seek-ed and didn't have a siz=
e.
>     Block devices had a fixed size and could be seek-ed. They also happen=
ed
>     to be organized in blocks of multiple bytes, usually 512.
>=20
>     Flash doesn't match the description of either block or character
>     devices. They behave similar to block device, but have differences. F=
or
>     example, block devices don't distinguish between write and erase
>     operations. Therefore, a special device type to match flash
>     characteristics was created: MTD.
>=20
>     So MTD is neither a block nor a char device. There are translations to
>     use them, as if they were. But those translations are nowhere near the
>     original, just like translated Chinese poems.
>=20
> And in the section below, it lists some properties of an MTD device:
>=20
>     - Consists of eraseblocks.
>     - Eraseblocks are larger (typically 128KiB).
>     - Maintains 3 main operations: read from eraseblock, write to
>       eraseblock, and erase eraseblock.
>     - Bad eraseblocks are not hidden and should be dealt with in
>       software.
>     - Eraseblocks wear-out and become bad and unusable after about 10^3
>       (for MLC NAND) - 10^5 (NOR, SLC NAND) erase cycles.
>=20
> This does support the assumption you had about MTD devices being tightly
> coupled with erase block. It also makes it quite clear that an EEPROM is
> not MTD -- since EEPROMs are byte-erasable.
>=20
> Of course, the existence of MTD_NO_ERASE nullifies a lot of
> these points. So it seems the subsystem has evolved. MTD_NO_ERASE was
> added by 92cbfdcc3661d ("[MTD] replace MTD_RAM with MTD_GENERIC_TYPE")
> in 2006, but this commit only adds the flag. The functionality of "not
> requiring an explicit erase" for RAM devices has existed since the start
> of the git history at least.
>=20
> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
> drivers under a single interface. I am not sure what came of it though,
> since I can't find any patches that followed up with the proposal.

That discussion led to drivers/nvmem after I started to work on
some early prototype, and Srinivas took over that work.

Maxime

--wpznzlm3ricogeh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQHJAAKCRDj7w1vZxhR
xcDlAP9DQxX4F3MhMtO+FlHTFu+wxuxX+ZgAUtWf1AzFSKdAXwD/Vb6XmtdU4OXO
fQTMfYwmoIMqez6M7+ko/r2XXgK7BQ4=
=KD1l
-----END PGP SIGNATURE-----

--wpznzlm3ricogeh2--

