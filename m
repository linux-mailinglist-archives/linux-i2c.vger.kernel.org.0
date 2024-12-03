Return-Path: <linux-i2c+bounces-8307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122E9E17AB
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 10:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABC1BB3441A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 08:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D681DFDB2;
	Tue,  3 Dec 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K/1+7Yd1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939D71DE3B9;
	Tue,  3 Dec 2024 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216349; cv=none; b=qFAqQu61N6niAeUYW3ks6/kaVj+1EtpA/w1Cjaq08KkXT304Vw6V/ih4P/8PUoXFEWZQkkXobxakdnK5+qcc1vvC/RXbuLmPli6PdEA/V/mnjbtuMPEC6d9ITR9kwQV4pD2sGWKUaMhM/trSKDyshFde66R7q/16JCuu63+shrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216349; c=relaxed/simple;
	bh=AXohgFBDfSQ80DP0PaKhMEukCXRSu69hXmxjxJQKr2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jR7n2nNm2E/4k5iKsCJQeqqD9kKOX7nxktdk8ncA8Ys8164ijSUBjVgE5dugKfEjEfZG3r/ECm4oltgwEForOtaLKp723swJSy/9wWfhnuMYbWLEQh8+swBfRQ+PUNzubW/AnjUAVrfnkLK4kKXUWOrnj+ui+bYp/yhtuLJj220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K/1+7Yd1; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DE924000C;
	Tue,  3 Dec 2024 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733216344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipAWjKWXEBKTkDDGzjyfQHhzJCH217f8pclyvAEW6h8=;
	b=K/1+7Yd1DLpLGHd0KB+FNn/0V8VphLlsBeWugnSPlrTb0Fy2mqkkkbtu0+A/UqmpJvYidi
	s/scVc4ktaMe6ApyWwYNDb4qQRwFa4DtnVo5XIzEfUL85dAVnGFDc9re2jC7hGElZJom06
	m5cbX7JbPnkCkDXDiT2M6fD0zjjB6580mXX1hLgJAle4t9ZtbPrMVE1PwtibvdBmDNfv5d
	yqH3/1oCRpuR5jOscqenNCxTS9rhG4MhNjeGaXAr0/9nT/gC3Bo664C2AVx0Gy5AaxGrAk
	S8XnXBgxSqiCeyJ6qMYRUeF2GHLIqnxPaXK9h0Q7GVkP9bVkcE541CFpuxpvvg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH v3 8/9] i2c: Support dynamic address translation
Date: Tue, 03 Dec 2024 09:59:03 +0100
Message-ID: <21399801.1it9Cbg30u@fw-rgant>
In-Reply-To: <141bbac1-5289-4335-a566-387721439bef@ideasonboard.com>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-8-34e86bcb5b56@bootlin.com>
 <141bbac1-5289-4335-a566-387721439bef@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hi,

On vendredi 29 novembre 2024 10:54:35 heure normale d=E2=80=99Europe centra=
le Tomi Valkeinen wrote:
> Hi Romain,
>=20
=2E..
> > ATR channel's translation table whenever an I2C transaction with unmapp=
ed
> > clients is requested.
> >=20
> > Add a mutex to protect alias_list. This prevents
> > i2c_atr_dynamic_attach/detach_addr from racing with the bus notifier
> > handler to modify alias_list.
> >=20
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> > ---
> >=20
> >   drivers/i2c/i2c-atr.c         | 244
> >   ++++++++++++++++++++++++++++++++----------
> >   drivers/media/i2c/ds90ub960.c |   2 +-
> >   include/linux/i2c-atr.h       |  13 ++-
> >   3 files changed, 202 insertions(+), 57 deletions(-)
>=20
> This fails with:
>=20
> WARNING: CPU: 1 PID: 360 at lib/list_debug.c:35
> __list_add_valid_or_report+0xe4/0x100
>=20
> as the i2c_atr_create_c2a() calls list_add(), but i2c_atr_attach_addr(),
> which is changed to use i2c_atr_create_c2a(), also calls list_add().
>=20
> Also, if you add i2c_atr_create_c2a() which hides the allocation and
> list_add, I think it makes sense to add a i2c_atr_destroy_c2a() to
> revert that.
>=20

Sure, I just thought that it was safer to have an explicit "kfree" in the
code, as it would be clear that the c2a pointer shouldn't be used after thi=
s.
But setting the pointer to NULL after calling i2c_atr_destroy_c2a() would
essentially achieve the same thing, so I'll be going with your suggestion.

> There's also a memory error "BUG: KASAN: slab-use-after-free in
> __lock_acquire+0xc4/0x375c" (see below) when unloading the ub960 or
> ub953 driver. I haven't looked at that yet.
>=20

I don't have the hardware to actually reproduce this but I'll see if I can
find out what the problem is by reading the code.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




