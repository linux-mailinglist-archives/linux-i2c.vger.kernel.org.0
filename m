Return-Path: <linux-i2c+bounces-1897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E305585E3DC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 17:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83EB81F22740
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 16:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC045839EB;
	Wed, 21 Feb 2024 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SfJ0k8TL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE7C82D99;
	Wed, 21 Feb 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708534698; cv=none; b=cMNgn2I/LfhA41dGSfwsYBnY8L8AwTTUyd+8b1Gzo2lsLtgiS7Nve2FWtwdZ45Rxity2ffWd7zF7VO4VoDpFRqUTHU/+IUuXcmn5+Kfu/2PcRdVCZniMAqXY/z16xNTOj0LOyR5gWHURrgodWfgyeyH/ojBr2A1E5bmEoKDRb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708534698; c=relaxed/simple;
	bh=wty1BLxtNSbJqrHVxaApJzAOEfZH1zGeAlvur02vYvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kThnPf+sQpn4+haKgkZ6CYnyBlgxOB6Ej7q1FS+TmYCGoYxlePcHjVnggyAt1dljoRdNGcL3xRspFJMWYzDNb3wgkminYuOaAhUvta6uzA00QU4I1BoZEOamslW4sSCggoRUATPTzBQnTRw5zPzAZcvYB6udNs0Bv3Le/NGNDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SfJ0k8TL; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 635216000C;
	Wed, 21 Feb 2024 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708534694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wty1BLxtNSbJqrHVxaApJzAOEfZH1zGeAlvur02vYvI=;
	b=SfJ0k8TLbTGFe6vYyZiRNzhgl7QOjFdxgoS6K+byz3NEqavL3nTTuDDhrg3ngPUhK3anxM
	6KzhhiLlqKkNS1JagCdArjvU2lSR1DuzKGWLYlsvRNlv5G6vMUvkHqxHNW6Js++uVze4LH
	5Gi6LGEM3pwpq53tW63VvZoIbmx0hf4vH2UMT+91JnWUNM8rKJvbo9GhGuzbtggd9DXR52
	8Fk5vtUDsHzsigFox75xnFxUjnEZywaEKh5SX2euXoCrw6pNFw12B1317QGh8zgV+NPEqH
	YZl7UBNflE8i9AaSwJ6FlhnYKvLArPDe5L7bi/DxQD+9VcvWL9afKVHjmuq6fA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Feb 2024 17:58:13 +0100
Message-Id: <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Cc: "Rob Herring" <robh@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Linus Walleij"
 <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
In-Reply-To: <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:29 PM CET, Th=C3=A9o Lebrun wrote:
> On Mon Feb 19, 2024 at 3:06 PM CET, Linus Walleij wrote:
> > On Fri, Feb 16, 2024 at 10:16=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@=
bootlin.com> wrote:
> > > i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree thi=
s
> > > prop has no reason to be compatible-specific.
> > >
> > > Feedback from dt-bindings and I2C host maintainers would be useful: w=
hat
> > > should the property be named? Having the unit makes it self-descripti=
ve,
> > > which sounds like a good idea to me. timeout-usecs, timeout-us, anoth=
er
> > > option?
> >
> > Use i2c-transfer-timeout-ms in my opinion, so it us crystal clear
> > what that property is for.
>
> Using =C2=B5s (microseconds) would be OK? I'm not sure yet about the exac=
t
> timeout desired but a one millisecond granularity might not be enough
> for the Mobileye usecase.
>
> Expect incoming patches to use the I2C controller in Fast Mode Plus
> (1Mbps) and High Speed Mode (3.4Mbps). Gotta go fast!
>
> > As Rob mentioned this isn't in the kernel schemas but in dtschema, so
> > you need to patch this:
> > https://github.com/robherring/dt-schema
>
> Indeed. The other question if we do microseconds is the
> suffix: -us, -usecs, -microseconds, etc? I picked -usecs for my v1, but
> a grep tells me I am the only user of this suffix. -us is much more
> common.
>
> BTW i2c-controller.yaml already has a =C2=B5s timeout:
> i2c-scl-clk-low-timeout-us

Note: I've sent a draft patch to dt-schema. See:
https://github.com/devicetree-org/dt-schema/pull/129

Feedback from I2C maintainers would confirm or infirm that this goes in
the right direction.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

