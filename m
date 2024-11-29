Return-Path: <linux-i2c+bounces-8261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6749DC320
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 12:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A6A163DF8
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 11:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062C119C54C;
	Fri, 29 Nov 2024 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gY6cN+Sr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA0199FDE;
	Fri, 29 Nov 2024 11:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732881238; cv=none; b=VUV5uHeqedg018SjY7xU1Lz9ip26C2UL8xopy1QY2o+MKKiBq+jyJ3yAo8VQXnG79XdKIM46h2lWWGLz5ns2+lr4yodFKCUQnEIE3/Jkk7PGgY/hlw64CwDncVJwIH+sUxS6Ln5GaZGhX8RT3ji4PgpoC0CxJ19OxTytkg2jUhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732881238; c=relaxed/simple;
	bh=FKTtTzKPitKQekXQRY8q7c7YHDt5xU6Tmh7mEm/rn7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cv7mqqR1qVqZZfA443Mlh/PpHsc4EOdbzLXkOgn3sXBHUt/U68lANx0SNCGhIIWKrzV7Bs4XzhUJ1oo/vuk7HJhBqCGbeV1C5f68PWR+MD6tlorjA7aWO5y1F3Gc+OFCbjlqxXPeEm5pP0vb8gdOK1r3YOc5J9aV13eJVTkgxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gY6cN+Sr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F23F1240004;
	Fri, 29 Nov 2024 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732881228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcmStz0km1pUl2gTG3edWWHjVxRxTo+//f8yA/6DdOY=;
	b=gY6cN+SrmCBU2oBvBzJxjUijMcDzcoUUVaxRG1FfXiRQJXf0LtsPJfuodLNTns62fGCTC8
	vaEzrdSEqXe4E7dFwx3zF4Kd+XU/k6btMVPNuqVTzSrR6vlsVigEnvgOHEYso6BKG41GAM
	DKP2amGC3OKkhaxylGOuMkcKHmkV48vARdHR35I+R0y2Ug7chdDDho09w6Qfc65Cja7wjd
	0YO1sTUIcapzyTIgGlBR1WlrUn20+LNHZRcW4GpBeJI3+jVhE7SsI9QcV4CPovw5dogw9X
	/9vfyFQkdsQEPTpWDL6egCnijFq+wb9Zl7HYStwSmJJqAXbre7651tDwBNZnKw==
Date: Fri, 29 Nov 2024 12:53:45 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Matti Vaittinen
 <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241129125345.3cf2fde4@booty>
In-Reply-To: <7074006.bC9N32Mljn@fw-rgant>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
	<7074006.bC9N32Mljn@fw-rgant>
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

Hello Tomi, Romain,

+Cc Matti

On Tue, 26 Nov 2024 09:34:56 +0100
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hello Tomi,
>=20
> On vendredi 22 novembre 2024 13:26:19 heure normale d=E2=80=99Europe cent=
rale Tomi Valkeinen wrote:
> > From: Cosmin Tanislav <demonsingur@gmail.com>
> >=20
> > i2c-atr translates the i2c transactions and forwards them to its parent
> > i2c bus. Any transaction to an i2c address that has not been mapped on
> > the i2c-atr will be rejected with an error.
> >=20
> > However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
> > gets a transaction to an i2c address that is not mapped in the parent
> > i2c-atr, and thus fails.
> >=20
> > Relax the checks, and allow non-mapped transactions to fix this issue. =
=20
>=20
> I have a series in the review pipeline which adds optional support for dy=
namic=20
> I2C ATR address translation. If this option is enabled, then transactions=
 on any
> unmapped address are assigned an alias on-the-fly. This feature is requir=
ed to
> handle alias shortages on some hardware setups:
>=20
> https://lore.kernel.org/all/20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com/
>=20
> Letting all non-mapped transactions through would conflict with my series=
, since
> these two scenarios would be indistinguishable:
>=20
> case 1:
> transaction with 3 messages is requested, msg1 -> 0x50; msg2 -> 0x51; msg=
3 -> 0x56
> alias pool can only hold 2 mappings at a time, so transaction cannot go t=
hrough
>=20
> case 2:
> transaction with 3 messages is requested, msg1 -> 0x50; msg2 -> 0x51; msg=
3 -> 0x50
> alias pool can hold 2 mappings at a time, so transaction can go through
>=20
> Could you perhaps introduce an ATR flag which would enable/disable lettin=
g all unmapped
> messages through? I have something similar in patch 8 of my FPC202 series:
>=20
> https://lore.kernel.org/all/20241125-fpc202-v3-8-34e86bcb5b56@bootlin.com/
>=20
> There could be a flag named "I2C_ATR_FLAG_NESTED_ATR", which would be ena=
bled in i2c_atr_new():
>=20
> ```
> @@ i2c_atr_new()
>=20
> if (is_an_atr(parent))
> 	atr->flags |=3D I2C_ATR_FLAG_NESTED_ATR;
> ```

As I discussed on another branch of this thread, after Tomi's
explanations I think the flag is the correct solution because disabling
the checks in i2c_atr_map_msgs() is useful for a specific
implementation of the GMSL deserializer, but armful is other cases.

About the implementation, I think we should not use something like
is_an_atr(parent). First, it would potentially need to recursively
climb the parent tree, and handling all combinations of
ats/mux/whatever would be very complex. But even more because it is not
needed. Tomi explained the use case is for the GMSL deser being the
"parent ATR" (even though it is not physically an ATR) and the GMSL
serializer the "child ATR", and the change in this patch is only needed
for the parent ATR AFAICU. So the GMSL deser driver could
unconditionally set the flag, and no other driver should ever set it.
Tomi, do you think this is correct?

Based on the above,  i2c_atr_new() or other parts of the i2c-atr code
are unable to self-detect whether the flag should be set or not. That
would mean we have a new user for the 'flags' field of i2c_atr_new()
that Romain proposed [0].

Finally, I think the name should not mention "nested ATR" but rather
tell what it does, like I2C_ATR_FLAG_PASS_THROUGH.

So, that's my random thoughts, what do you think about this?

[0] https://lore.kernel.org/linux-i2c/20241125-fpc202-v3-8-34e86bcb5b56@boo=
tlin.com/

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

