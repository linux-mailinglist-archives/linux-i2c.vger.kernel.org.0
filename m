Return-Path: <linux-i2c+bounces-8374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A869E9490
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 13:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D9A7161CDC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 12:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D26224894;
	Mon,  9 Dec 2024 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lkLPGtuJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1F184545;
	Mon,  9 Dec 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748172; cv=none; b=AqeAKvlAb5tFMzJHC8UXKwHI7PwQH5oDWzXtVfouuUe1WqoBtcEj9axZM4xK5aZ5yMgxoQ8oq90hKakGPKGCvOVoQ/cFbJR3I4PknhEqARTLbQOiBmuxozRAm0UoY4KyKA4TYvKPzzzaxT3DFJXWDO+ATEoXtQVBuFj6Xd14rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748172; c=relaxed/simple;
	bh=RQrfWmo4OTsSJ/kPbJNVpBZAz5FRd3GqPzJiPkdi6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5pQEBOWNb/gf/WkzE0feSebva3rtQDbrM90+WJit3PnRvMwaFqKueI5KKEeE0BNiG5rIr/UUidZVzg7YdwdwklMgHQTZd5QkQbZmH3tk7ql4vt5KEXkUm4+PJ8bHJqmGoEAujUYcLtz5UKswH5AI1Buk1abxwc8ZfpE79u8osI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lkLPGtuJ; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 5353FC0F10;
	Mon,  9 Dec 2024 12:42:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A2011BF203;
	Mon,  9 Dec 2024 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733748152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmWNpmDB2L6Ktl0LzB1M24Lop3ag8dWEwbvJgygrndU=;
	b=lkLPGtuJmohDKLCRhYFzRQNNYRhSi2WALq49ASl+yflenUQahjVdkz9DvEadX3HcT1vMo9
	rWqSytJYK5p6kGoTKTXWrwiA7PjoKOWVgQxubgMrtPWBTmlB4mhuxU8euFJ1bfVSTiY8DK
	Eqc6poaKfSGVy/GRIJVy79ZJg3+AJYrk+NUYpQjoxlY8yy4IvhLn2SuXkFfs+gZ65jv+F3
	H6S8lMWa6b4Gj/2q6FVR/7rnIWaLyThJwXsIX2QkuOVm5hJuNhJRjI9lsBG3idPXXRDTVe
	5q7GhzXzteeuN10P47mSPd/diAjb0lzixf4x0DXwdAkbXLMladlDtxUMjqjYkA==
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
Date: Mon, 09 Dec 2024 13:42:29 +0100
Message-ID: <3255950.5fSG56mABF@fw-rgant>
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

Hi Tomi,

On vendredi 29 novembre 2024 10:54:35 heure normale d=E2=80=99Europe centra=
le Tomi=20
Valkeinen wrote:
> Hi Romain,
>=20
> On 25/11/2024 10:45, Romain Gantois wrote:
> > The i2c-atr module keeps a list of associations between I2C client alia=
ses
=2E..
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
> There's also a memory error "BUG: KASAN: slab-use-after-free in
> __lock_acquire+0xc4/0x375c" (see below) when unloading the ub960 or
> ub953 driver. I haven't looked at that yet.

I think I've found what's causing this KASAN splat.  i2c_atr_del_adapter is
freeing it's alias pool before setting atr->adapter[chan_id] to NULL. So
there's a time window during which bus notifications can trigger a call
to i2c_atr_attach_addr, leading to a UAF on the alias pool struct.

I'll fix this in v4.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




