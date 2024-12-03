Return-Path: <linux-i2c+bounces-8305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B999E1608
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 09:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380C1283FD2
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 08:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AE51DA63F;
	Tue,  3 Dec 2024 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D4u4DAer"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4012198A0E;
	Tue,  3 Dec 2024 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215334; cv=none; b=T88M/zsOT+GDDBgYEatH2adTSGBXiFyUkYGvpuKxrVUY9G6pbWDNgYmoqOuzk2sBV8sILV9uYWph8TD337udvE1mOJU5RkrS+MG0sMWm/fM2LcgN9SXXGUvtRy04yR9XbgY+1iu7XLlaoRo7sKEv4/Xvj8JBHGYtuIFBRmugLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215334; c=relaxed/simple;
	bh=1LL0a0VvGUs2KJHR20ihr44gH9CEmZgb7sSztgcg4sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APSc38NuiWh+ICZEpzbSuv/jFLRuA8ttww53SABaV59khbEQqLyHOUoVHUBagZFpHNOWsp0H7yoHTMlH5LM+DSPlWYrUkFY6n2rWeb9H6ZJin3db1iCHq0Mcnukdyu12bLSDTPLLjBRzUiYk2+erbWWN16rEDWJIha2xaBK5v8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D4u4DAer; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97D551C0002;
	Tue,  3 Dec 2024 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733215329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LL0a0VvGUs2KJHR20ihr44gH9CEmZgb7sSztgcg4sk=;
	b=D4u4DAertPFx/SADXzplx4K/IDuHU1eCM1Gw4x5xPjt+Wd96ykLaFN/WBzNal36E4INFc4
	SvJ77zuvPBkPaTBtJfN/WIyfxQk4JGMXaEc+oEt2/WB5QafkRwJVAkKac2culVtSLUUrKR
	dAcgKl+0DFEBlEBlVH4NOIsBn2gFw/Elv2bCuBvRaVkDQzH4Godc2Q1ByX4gn2r1h146uk
	uu/E5WeI+PF4Fgr279+Fn8HnMw7M8vo8Bifz6V1g4m5uBUBJhHGwncpbRKheyugnZpkzT/
	2LgQ9CWC1q8kfTVvuGgH57LxYRMs8kxCOJi9uiXO0qKRw38nmqG1SHZ517W4Nw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v3 0/9] misc: Support TI FPC202 dual-port controller
Date: Tue, 03 Dec 2024 09:42:07 +0100
Message-ID: <2843405.KjTqZUKg7o@fw-rgant>
In-Reply-To: <0a125973-fd33-455d-a3ab-fba3357155ee@ideasonboard.com>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <0a125973-fd33-455d-a3ab-fba3357155ee@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hi Tomi,

On vendredi 29 novembre 2024 13:01:58 heure normale d=E2=80=99Europe centra=
le Tomi Valkeinen wrote:
> Hi,
>=20
> On 25/11/2024 10:45, Romain Gantois wrote:
> > Hello everyone,
> >=20
> > This is version three of my series which adds support for the TI FPC202
> > dual-port controller. This is an unusual kind of device which is used a=
s a
> > low-speed signal aggregator for various types of SFP-like hardware port=
s.
> >=20
> > The FPC202 exposes an I2C, or SPI (not supported in this series) control
> > interface, which can be used to access two downstream I2C busses, along
> > with a set of low-speed GPIO signals for each port. It also has I2C
> > address
> > translation (ATR) features, which allow multiple I2C devices with the s=
ame
> > address (e.g. SFP EEPROMs at address 0x50) to be accessed from the
> > upstream
> > control interface on different addresses.
> >=20
> > I've chosen to add this driver to the misc subsystem, as it doesn't
> > strictly belong in either the i2c or gpio sybsystem, and as far as I kn=
ow
> > it is the first device of its kind to be added to the kernel.
> >=20
> > Along with the FPC202 driver itself, this series also adds support for
> > dynamic address translation to the i2c-atr module. This allows I2C addr=
ess
> > translators to update their translation table on-the-fly when they rece=
ive
> > transactions to unmapped clients. This feature is needed by the FPC202
> > driver to access up to three logical I2C devices per-port, given that t=
he
> > FPC202 address translation table only has two address slots.
>=20
> While the FPD-Link devices are quite different than the TPC202, I wonder
> what's the difference wrt. the ATR... Afaics, the difference is that the
> FPC202 has 2 slots whereas UB960 has 8. So if you have 3+ remote devices
> on FPC202, you get problems, or if you have 9+ devices on UB960, you get
> problems.
>=20
> Yet this series adds a I2C_ATR_FLAG_DYNAMIC_C2A flag which the driver
> needs to set, and the i2c-atr has different code paths depending on the
> flag. In other words, either the driver author (if it's a hardcoded
> flag) or the driver (if it's set dynamically) is assumed to know how
> many remote devices there are, and whether that flag is needed.
>=20
> On the other hand, if I consider I2C_ATR_FLAG_DYNAMIC_C2A meaning that
> the device can support dynamically changing the ATR, then it makes more
> sense, and also UB960 should set the flag.
>=20

Indeed, the need for dynamic address translation isn't solely determined by
the ATR model. It's also determined by the number of logical I2C devices
connected to the downstream ports. In that sense, hardcoding the flag in the
ATR driver doesn't seem completely appropriate.

However, you could reasonably imagine that some future ATR models won't
support hot-swapping aliases at runtime. In this case, this flag will be
necessary at the very least as a capability flag i.e. "this ATR model can do
dynamic translation but it's not necessarily activated by default".

> But then I wonder, do we even have cases with ATRs that need to be
> programmed once at init time, and cannot be changed afterwards? If not,
> then the I2C_ATR_FLAG_DYNAMIC_C2A can be the default, and the
> non-I2C_ATR_FLAG_DYNAMIC_C2A code can be dropped. Actually, even the
> current upstream i2c-atr is dynamic in a sense: the clients are attached
> via the i2c_atr_bus_notifier_call(), one by one.
>=20

Indeed, if an ATR component doesn't support hot-swapping of aliases, then
it will be broken anyway if a device attaches after the ATR's been initiali=
zed.
Maybe we should just assume that all supported ATR's should be capable of
modifying their translation table after initialization then.

> If we just have .attach_addr()/.detach_addr(), and call those on demand,
> and perhaps use LRU to handle the ATR table, it would maybe work for
> both FPC202 and FPD-Link just fine.
>=20
> So TLDR: do we even need any kind of special "dynamic atr"-feature for
> FPC202, or is it really just a small improvement to the current i2c-atr
> and applies to all ATR devices?
>=20

In any case, it's a necessary improvement for the FPC202 case, but it could
indeed apply to all ATR devices. Maybe we should just enable dynamic
translation by default.

However, I don't quite understand what you mean by "calling attach/detach()
on demand", my current understanding is that we should call attach from
the bus notifier and from the ATR I2C transaction handler. Do you mean that
these callbacks should be called from other parts of the kernel?

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




