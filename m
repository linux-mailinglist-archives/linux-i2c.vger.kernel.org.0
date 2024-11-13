Return-Path: <linux-i2c+bounces-7953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D69C6BB1
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 10:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCC42859EB
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A01BDA8D;
	Wed, 13 Nov 2024 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZKEyeK+6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84220165EE3;
	Wed, 13 Nov 2024 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491176; cv=none; b=lIn6DprxnZJuJtYaT48eeegKB3DqPLvno6IUgaMizRuTdUYkrw98h2iSkLwYLiP649XxItOLm+rXq6TIs6fTaPJoZHzhfmuI3qnIFamqrkbmqyEbPswAc2AlKPqBcs7g6nbDlUfcTBnhvdm9ImwomxSzpDHfP7UGRGjemmtxRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491176; c=relaxed/simple;
	bh=apE8jTV/ZkMww8QZb6cSv/1Or8/nWuo6+FYangEzxtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4FclAF9Ptj6lczMMbssUy2ga5ikANBvSUDyoEPYLYgX6IBaO80DSmnz5lCYPK7hokF17N9mVtKHewC62Kug7h/VqOHqDiZRcZSg4uk9KLGh7xJqYa4j69+Zg6zgSG/nTAtm5KjOm3Bm07zWtx1PtI5I8MxO6JUdFDVJFPIM5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZKEyeK+6; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B325FFF806;
	Wed, 13 Nov 2024 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHq+vYIrolU1nZUuSeLnYvUIGG1CZQC1c8NU0N+rIFc=;
	b=ZKEyeK+6V5aRy331CcLZv4lE78JJh8eOCitutwiN/gjfA2MyLxRPJxyzjrZUvfD+58OFwd
	u2wDu+EBSc+OBJN3w/29epRgCBPrlb/h6H/e/moCnbZEGnmtuRGeay2fiUVgWqRp9U2WX4
	PU6m5qhVvh93cDuuTmQYtuFRhN/PNqXH1KFjcPutLbB3b9TLFEa3WkmMLjR4bSwz9C5At9
	SLPa268aBsgfm4Odfu6S46V7BTEH6LmoCP0iqMxPdXwzgCgEtBf3Taja1KXAXp+Prug4v2
	2+VWQXeqU4+/esBoCSJ6oU6satKkWtK4s6koW3E+p761tvCcEwQJ02PGSeYdWg==
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject:
 Re: [PATCH 1/9] dt-bindings: misc: Describe TI FPC202 dual port controller
Date: Wed, 13 Nov 2024 10:46:10 +0100
Message-ID: <4965494.31r3eYUQgx@fw-rgant>
In-Reply-To: <20241108-reimburse-saucy-2682e370469a@spud>
References:
 <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
 <20241108-fpc202-v1-1-fe42c698bc92@bootlin.com>
 <20241108-reimburse-saucy-2682e370469a@spud>
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

On vendredi 8 novembre 2024 19:23:37 heure normale d=E2=80=99Europe central=
e Conor Dooley wrote:
> On Fri, Nov 08, 2024 at 04:36:53PM +0100, Romain Gantois wrote:
=2E..
> > index
> > 0000000000000000000000000000000000000000..ad11abe11e68aa266acdd6b43a5b4=
25
> > 340bbbba8 --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/misc/ti,fpc202.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI FPC202 dual port controller with expanded IOs
> > +
> > +maintainers:
> > +  - Romain Gantois <romain.gantois@bootlin.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-atr.yaml#
>=20
> Gotta say, this looks absolutely nothing like the other i2c-atr user!

Indeed, the critical difference between the two is that the existing
user has a global alias pool whereas this component doesn't. So
the "i2c-alias-pool" property isn't relevant here, and it's currently
the only property defined by the i2c-atr binding.

We did consider defining a per-channel alias pool in the i2c-atr binding
but the results were quite awkward and it didn't seem like this property
belonged in the device tree at all, since the alias values were hardwired
into the FPC202 and were known in advance.

>=20
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,fpc202
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  enable-gpios:
> > +    description:
> > +      Specifier for the GPIO connected to the EN pin.
> > +    maxItems: 1
> > +
>=20
> > +  port0:
> ports usually go in a ports node, and are port@0 not port0. That said,
> these are i2c buses, so the node name would usually be i2c@ for those.
> In fact, given you have i2c-mux as your node name, the binding for that
> expects you to format your child nodes like '^i2c@[0-9a-f]+$'. Is there
> a reason you can't just drop this ports business and go with a pattern
> property here that restricts the pattern to '^i2c@[0-1]$'?

I didn't think of restricting the pattern in this way, that is indeed more
appropriate than using static port names.

Moreover, I don't think that the "i2c-mux" naming is appropriate here,
as the FPC202 isn't a mux at all. I'll look for a better name for the next
iteration.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




