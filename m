Return-Path: <linux-i2c+bounces-8308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E759E1985
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 11:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15313B434FC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 09:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E14B1E0084;
	Tue,  3 Dec 2024 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="paEb+1ar"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF3E15B12F;
	Tue,  3 Dec 2024 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218605; cv=none; b=GdhOiKWcMTiGGbESGe4QcVJ8mlZ9Lzw3hMPHOrJO0y/A+FAAhoZ88Dt2aPTUvp5CSXKzygeRq+oiuHvYvekw7Ae5TZQs6WA7zt7YPIQ8NGarnMcum6RuVS04E+ZaCDx98q+Mkt9Kz0LsM4uI7fJlopN2788ByjY9OLU4ipCOBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218605; c=relaxed/simple;
	bh=3g/ljEh3uQFMyxIBjzs+bKk0sfi5M7AzABU9s7ppRgY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+/40b+i240VNi4mZQ/ItE4tU7KbBhDxZOzqZ86XLtTxPqxD0cBfQfFCckzgXUx39txXwT6Jr2zMKniBeEMZhUo5DzNr+pHqDKciHv9WMd68Vj+WpVtEMtPR1Qh9Ht9SoFcee9gGQFBNPZ2rc10tkyroKx6twbIqeTm0A/64le4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=paEb+1ar; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDFC520004;
	Tue,  3 Dec 2024 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733218599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evN0b4VZuIGuuKZVaNXifjQ0jSIg1lbtlgCrPHgk+go=;
	b=paEb+1arAqWh3ezz5jP6PScUVFdriBZ5JaZ5mgW20tnsGAxJlyMAnAgJ3KJWV00WuhNejH
	CZIaDsIbzxqOn0+b2FV1GMdN8Iewg4+KePow51A7zZVQOYwcTtQ76NxJ9i5iB6fkzV18MU
	Il0uWVs2Xve0masd3AnViaEmFORqcWYIjKOkCwJqyxjnaQT6vF6b5AkAi/TkFSlUTQcJw6
	ToHrVMhV3EAsNbLKtlJhjjjGxiiplOhIpMBXnJfww7/hkk/5Vbvz2kILpsSHqfjWWB39Bm
	Ad2uXML+Z7ie4uxtJjwcZ4OWZ8zv0HjWB8tbWVZlVT3aStiZi3+RxE3pkjdcwQ==
Date: Tue, 3 Dec 2024 10:36:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 linux-gpio@vger.kernel.org, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan
 Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v3 0/9] misc: Support TI FPC202 dual-port controller
Message-ID: <20241203103636.32c80ce0@booty>
In-Reply-To: <2843405.KjTqZUKg7o@fw-rgant>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
	<0a125973-fd33-455d-a3ab-fba3357155ee@ideasonboard.com>
	<2843405.KjTqZUKg7o@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Romain, Tomi,

On Tue, 03 Dec 2024 09:42:07 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Tomi,
>=20
> On vendredi 29 novembre 2024 13:01:58 heure normale d=E2=80=99Europe cent=
rale Tomi Valkeinen wrote:
> > Hi,
> >=20
> > On 25/11/2024 10:45, Romain Gantois wrote: =20
> > > Hello everyone,
> > >=20
> > > This is version three of my series which adds support for the TI FPC2=
02
> > > dual-port controller. This is an unusual kind of device which is used=
 as a
> > > low-speed signal aggregator for various types of SFP-like hardware po=
rts.
> > >=20
> > > The FPC202 exposes an I2C, or SPI (not supported in this series) cont=
rol
> > > interface, which can be used to access two downstream I2C busses, alo=
ng
> > > with a set of low-speed GPIO signals for each port. It also has I2C
> > > address
> > > translation (ATR) features, which allow multiple I2C devices with the=
 same
> > > address (e.g. SFP EEPROMs at address 0x50) to be accessed from the
> > > upstream
> > > control interface on different addresses.
> > >=20
> > > I've chosen to add this driver to the misc subsystem, as it doesn't
> > > strictly belong in either the i2c or gpio sybsystem, and as far as I =
know
> > > it is the first device of its kind to be added to the kernel.
> > >=20
> > > Along with the FPC202 driver itself, this series also adds support for
> > > dynamic address translation to the i2c-atr module. This allows I2C ad=
dress
> > > translators to update their translation table on-the-fly when they re=
ceive
> > > transactions to unmapped clients. This feature is needed by the FPC202
> > > driver to access up to three logical I2C devices per-port, given that=
 the
> > > FPC202 address translation table only has two address slots. =20
> >=20
> > While the FPD-Link devices are quite different than the TPC202, I wonder
> > what's the difference wrt. the ATR... Afaics, the difference is that the
> > FPC202 has 2 slots whereas UB960 has 8. So if you have 3+ remote devices
> > on FPC202, you get problems, or if you have 9+ devices on UB960, you get
> > problems.
> >=20
> > Yet this series adds a I2C_ATR_FLAG_DYNAMIC_C2A flag which the driver
> > needs to set, and the i2c-atr has different code paths depending on the
> > flag. In other words, either the driver author (if it's a hardcoded
> > flag) or the driver (if it's set dynamically) is assumed to know how
> > many remote devices there are, and whether that flag is needed.
> >=20
> > On the other hand, if I consider I2C_ATR_FLAG_DYNAMIC_C2A meaning that
> > the device can support dynamically changing the ATR, then it makes more
> > sense, and also UB960 should set the flag.
> >  =20
>=20
> Indeed, the need for dynamic address translation isn't solely determined =
by
> the ATR model. It's also determined by the number of logical I2C devices
> connected to the downstream ports. In that sense, hardcoding the flag in =
the
> ATR driver doesn't seem completely appropriate.
>=20
> However, you could reasonably imagine that some future ATR models won't
> support hot-swapping aliases at runtime. In this case, this flag will be
> necessary at the very least as a capability flag i.e. "this ATR model can=
 do
> dynamic translation but it's not necessarily activated by default".
>=20
> > But then I wonder, do we even have cases with ATRs that need to be
> > programmed once at init time, and cannot be changed afterwards? If not,
> > then the I2C_ATR_FLAG_DYNAMIC_C2A can be the default, and the
> > non-I2C_ATR_FLAG_DYNAMIC_C2A code can be dropped. Actually, even the
> > current upstream i2c-atr is dynamic in a sense: the clients are attached
> > via the i2c_atr_bus_notifier_call(), one by one.
> >  =20
>=20
> Indeed, if an ATR component doesn't support hot-swapping of aliases, then
> it will be broken anyway if a device attaches after the ATR's been initia=
lized.
> Maybe we should just assume that all supported ATR's should be capable of
> modifying their translation table after initialization then.

I think this is a reasonable assumption, and so we should not implement
support for "non-dynamic ATRs" unless (until?) there is a valid use
case.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

