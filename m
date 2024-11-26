Return-Path: <linux-i2c+bounces-8217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11FD9D930A
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D731B22CDB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1881B195FEF;
	Tue, 26 Nov 2024 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UV0soPZa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB8156F5D;
	Tue, 26 Nov 2024 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608354; cv=none; b=oy9ZbwwcOj9m+zrnQNaHUxizZMNopHULP+c4Vh+hYCuEjs6LCDldfOUFCk1PeB9ykvDv0SXI378gEoOEOwC68u1AK5B3ChwfKl+iZ5QRzyRz8Y4OOKRZbq6ugHW2daEuLAdILxak8z+Y/NfWM2EuoLUFNn+2wT8OcV6rfdgaGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608354; c=relaxed/simple;
	bh=Y42E/QO3V4YcRW8jtGRayQIynrxPs9EN6UefWWgvGw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkvqtx8AsB8YOkqIaSEPrrJipbSwuhfDRYIFh+t2iuxtggrMDa3kKJO1yDF4QxaUBRLragldGJVQ34qJfZpdq+8Sm4HpPAKO+QV2MUwURMo6dtaBWgFv50xFr+9jO7APONAHuoIVHsToLYLwp8+q7mWnQfprudktjXWT832IAc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UV0soPZa; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21B381BF203;
	Tue, 26 Nov 2024 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732608344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0qCH4y8UnX7RVCEVSY+xvJHRehSPxeI6t2xRPVWVbg=;
	b=UV0soPZa4irSyzwY0MuvDGxpfwt7Vx5HQDxngsHiWF0BcLV2n6PnqYf0Uylo4lnTwo5Kf1
	8F3WZm2gI89kxV+AX0idfsGM3SN9cgwunF7R6miGuCFnI+T+d5CSFrsHaL4qfv7ltn/ROt
	x/57ojKCgOB0nDtRzmtC5f/otQeWvCFJbofygBgPlrS30zEMgVLSLGUR3Dn5uNuBqgNaR/
	iNRa4sywUyaKFgLMXzeDl+z+a74crBtFbSA0b3PUvK0LG9j9zyIR3h6Rv4p8YOt1sMJMvC
	Pm7mMd3TVVaank70g6Olhj0nIYLDdF/OGEz+8x+A2cZ4G9Vem2KYrl7ikNT2pg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v3 1/9] dt-bindings: misc: Describe TI FPC202 dual port controller
Date: Tue, 26 Nov 2024 09:05:42 +0100
Message-ID: <2072150.UuDqf3iUMg@fw-rgant>
In-Reply-To: <20241125-overhand-economist-5a3fc6339265@spud>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-1-34e86bcb5b56@bootlin.com>
 <20241125-overhand-economist-5a3fc6339265@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hello Conor,

On lundi 25 novembre 2024 19:26:35 heure normale d=E2=80=99Europe centrale =
Conor Dooley wrote:
> On Mon, Nov 25, 2024 at 09:45:15AM +0100, Romain Gantois wrote:
> > The FPC202 dual port controller serves as a low speed signal aggregator
> > for
=2E..
> > +
> > +required:
> > +  - compatible
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - i2c@0
> > +  - i2c@1
>=20
> btw, why are both downstream ports required?

It's because both downstream ports are always present in an FPC202 unit
so in my opinion, it doesn't make sense to describe an FPC202 with only one
downstream port.

I suppose you could also consider that ports would only be described in the=
 DT
if they were connected to something in the hardware, but I don't think it w=
ould
make sense to use an FPC202 in this way. After all, the whole point of this
component is to act as an I2C ATR and low-speed signal aggregator for
downstream devices which would have address collisions if you placed them
on the same I2C bus.

But then again, you could consider that DT bindings should only describe wh=
at is
possible, and not only what makes sense as a use case. I don't really know =
how to
answer this question myself, so I'll refer to the maintainers' opinions.

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




