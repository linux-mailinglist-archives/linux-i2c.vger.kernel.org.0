Return-Path: <linux-i2c+bounces-8422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA29EB4A4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BCF1617A3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F74F1B982E;
	Tue, 10 Dec 2024 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LDjxTAfi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956F1B425E;
	Tue, 10 Dec 2024 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844093; cv=none; b=P4Mgj5pNYL3ciQasgMZzJoo98q0YqfGMtHLOvMcebBpuJoMepWt0puc7mVgQVXZJTNAdQHLkEkXbzTCfcOpfI87xltemzTpFFjIrh7MnB4M2g85leX6oXH+z/rYj8qqMCYA4EMYbrA+zORloeTklnAHOASND+sH87P7p5wbGUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844093; c=relaxed/simple;
	bh=3GlGE3KlJLpLrehcIsMPjWrvW8X2DBShR7lNXEMAm0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7LVhjBAn8+cFDGMI7cs9a4kml2FrW4raHuBov9+q4cnsZv9lB2+wHixPgl/91ukwl6AfMP4i2Je1u3sfmysr+WtHY78uNbEk6jZjLj4rBr4MVJvyJwMLo1Zb1mmTeR8uZW6R0cZDtQUwBwxacRmRB/y+/RG79rlXQON+j1qHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LDjxTAfi; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C26571C0008;
	Tue, 10 Dec 2024 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733844081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kr3K+pxKkOvGHu/heW337Yn2yGQRwqjuj8j4+9JVtbE=;
	b=LDjxTAfieZOp7wsnn6XgpYGnEuIkCG0kUWiIOtieTECJVGWvH2/+nlQdaWMGi8YkOfzemE
	phU2Hn98XIyZ6kQ4fjHG1+Ovx5S70Ce9TJW3RpXo8Iz6bNxDRyqUOF4vx82rgJSNAM6rjA
	1CzL5Nc5VVSEDjbzcwCz5P4xvadcnIplFi0FEdNNMwHzIBCDZZensz04jrEFPE0l3YVbcK
	3YKzWcdC1j37yJ4fufVA+41aqPpWCX5mVhUqugj7V+8VCs3Ci2pFC2hZJHm4eGBlKl5EMM
	4nkiUeML5dbaJaQrHVUsKwsbVO4bQuFwjaAauF4LMPiBYHREHX9xz0x/SaF1ZA==
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
Date: Tue, 10 Dec 2024 16:21:19 +0100
Message-ID: <2099546.fqZRxdAdAU@fw-rgant>
In-Reply-To: <3255950.5fSG56mABF@fw-rgant>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <141bbac1-5289-4335-a566-387721439bef@ideasonboard.com>
 <3255950.5fSG56mABF@fw-rgant>
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

On lundi 9 d=C3=A9cembre 2024 13:42:29 heure normale d=E2=80=99Europe centr=
ale Romain=20
Gantois wrote:
> Hi Tomi,
>=20
=2E..
> > This fails with:
> >=20
> > WARNING: CPU: 1 PID: 360 at lib/list_debug.c:35
> > __list_add_valid_or_report+0xe4/0x100
> >=20
> > as the i2c_atr_create_c2a() calls list_add(), but i2c_atr_attach_addr(),
> > which is changed to use i2c_atr_create_c2a(), also calls list_add().
> >=20
> > Also, if you add i2c_atr_create_c2a() which hides the allocation and
> > list_add, I think it makes sense to add a i2c_atr_destroy_c2a() to
> > revert that.
> >=20
> > There's also a memory error "BUG: KASAN: slab-use-after-free in
> > __lock_acquire+0xc4/0x375c" (see below) when unloading the ub960 or
> > ub953 driver. I haven't looked at that yet.
>=20
> I think I've found what's causing this KASAN splat.  i2c_atr_del_adapter =
is
> freeing it's alias pool before setting atr->adapter[chan_id] to NULL. So
> there's a time window during which bus notifications can trigger a call
> to i2c_atr_attach_addr, leading to a UAF on the alias pool struct.

It seems like my initial theory was wrong. The bus notifier wouldn't trigge=
r=20
after the adapter has been removed.

However, the "alias_pool->shared" flag is not set anywhere in the i2c-atr=20
module! So a more likely theory is that the common alias pool is being
freed when the first channel is deleted. Thus, the second channel is
still referencing a freed alias pool during it's deletion, hence the UAF.

Properly setting the "shared" flag of alias pools owned by the i2c_atr stru=
ct
should fix this.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




