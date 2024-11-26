Return-Path: <linux-i2c+bounces-8221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEF9D935F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D311656BB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC84A18E37B;
	Tue, 26 Nov 2024 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YmbKyh5p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489A214A85;
	Tue, 26 Nov 2024 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610102; cv=none; b=jO6EjQuc9QQfp0gyNOMUM1uYPPjycLO6KZc0erRkVuQQQHCMDoy5JCP/rljqsjmf1Zhth/NB+t6SyR/Nr35kWnNwEgfdt/bPO9SqZsCsJtYDQ8e6ZxuWP2DPDKEi4q61ChSGyHVAHzxe4Gcjyb+YCd9EyVEJkyOKnoqHuXHSTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610102; c=relaxed/simple;
	bh=wrM64kXGyv26/D/dbqSSBKOKXCtgHryqtTBPiFzFEMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPowOmr/8gpWZjYBN4rgqZbs9r4ZkcqQ8e+1e4eA4jDYtqduV6XRTh4Htijfheerc8wmUgDny+0338syiPENt2QZLXnxoewsrvM2ZNYjAJS8SeoOYnDTV60Lm2wdTFWz0Xl1HAt5MRwr1J0B7YLTMSg5bUFW9jTUiLsdHXgdJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YmbKyh5p; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51A7B1BF204;
	Tue, 26 Nov 2024 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732610098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqOYy2xOguRQjKOynye5nFjBYjyGMq4SzxNEKO0qSuM=;
	b=YmbKyh5po4Dhh7M/vSsD7hw/+SLYoZQBiE+l43bSE/ZqYCqlbo1TfdpKrzj8jwIwpTFS1N
	6n8ZsnKNrTJ6RpBu6deaMwHaSUJ6OOtUnaqvPl+O5DwrB+HbmQIVZkkny1mSTNmjVNnB/f
	xCY/P6M8V5K57ADvR2XmzW3KZKzpPk867QO0dqu2LpV4zZ+v3GLK/6SDNsSmqDkIsj1cUk
	OXoYGLIEAgLX7NXZEt2Bv1Ikn9cmSDfWEGiBuK6dgK0b7rxu8jqIxJLJssZjy/8s/B+4vh
	lH1Ir3vPIKnp2M+CGxRnZ50CXDV98tW2UqKCoUa3B2vegv3vXJ///pemNUhzaQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject:
 Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested ATRs
Date: Tue, 26 Nov 2024 09:34:56 +0100
Message-ID: <7074006.bC9N32Mljn@fw-rgant>
In-Reply-To: <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
References:
 <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hello Tomi,

On vendredi 22 novembre 2024 13:26:19 heure normale d=E2=80=99Europe centra=
le Tomi Valkeinen wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
>=20
> i2c-atr translates the i2c transactions and forwards them to its parent
> i2c bus. Any transaction to an i2c address that has not been mapped on
> the i2c-atr will be rejected with an error.
>=20
> However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
> gets a transaction to an i2c address that is not mapped in the parent
> i2c-atr, and thus fails.
>=20
> Relax the checks, and allow non-mapped transactions to fix this issue.

I have a series in the review pipeline which adds optional support for dyna=
mic=20
I2C ATR address translation. If this option is enabled, then transactions o=
n any
unmapped address are assigned an alias on-the-fly. This feature is required=
 to
handle alias shortages on some hardware setups:

https://lore.kernel.org/all/20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com/

Letting all non-mapped transactions through would conflict with my series, =
since
these two scenarios would be indistinguishable:

case 1:
transaction with 3 messages is requested, msg1 -> 0x50; msg2 -> 0x51; msg3 =
=2D> 0x56
alias pool can only hold 2 mappings at a time, so transaction cannot go thr=
ough

case 2:
transaction with 3 messages is requested, msg1 -> 0x50; msg2 -> 0x51; msg3 =
=2D> 0x50
alias pool can hold 2 mappings at a time, so transaction can go through

Could you perhaps introduce an ATR flag which would enable/disable letting =
all unmapped
messages through? I have something similar in patch 8 of my FPC202 series:

https://lore.kernel.org/all/20241125-fpc202-v3-8-34e86bcb5b56@bootlin.com/

There could be a flag named "I2C_ATR_FLAG_NESTED_ATR", which would be enabl=
ed in i2c_atr_new():

```
@@ i2c_atr_new()

if (is_an_atr(parent))
	atr->flags |=3D I2C_ATR_FLAG_NESTED_ATR;
```

Please let me know what you think.

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




