Return-Path: <linux-i2c+bounces-1819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301A8578A4
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A081F22E9C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C14A1B962;
	Fri, 16 Feb 2024 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I9OgeOob"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2E1B941;
	Fri, 16 Feb 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708075027; cv=none; b=mopLckpfrn+iwJxqCJqmf8MlIz4K66wibN6/LIbbdJNLrDEwRcdCw35urToq8UKiDkJU+vX10V0i0t1jZ9xlkaoY1pCS3Wx2KT00xaPeBm8lSQLaOgXMKOaFFOAIL/2qDwZT0RDIiH6ZT74LyIAMjQAv2eKYhglRPahG4F1lg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708075027; c=relaxed/simple;
	bh=knQb6WdfHntiaYWe1pTnj/8jQXTGcQ1QPPfOu5SCjG0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=raQYZzYZpNZKlA8pc1pmM9QMC2xAPXiVXLjQIWFkSLK68VoljLpXKsUH2Vtimac0zpPA3fq0UB6cAiSbV/oejyO+TCapWrKSkopsZ9wYgiXaz9DxeUxRazhfm/+ZDJJbMij5HWi7WEVST2yoh37vENgdGaSym7Z9i2lSgiDPLKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I9OgeOob; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E7B2E000C;
	Fri, 16 Feb 2024 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708075016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQdI8Zrzs9kwj/PfuUOcwe/1YQf/eV/Bz9uqQisZoKk=;
	b=I9OgeOobZzRaooIv6wdlB3NjJehUtglDnRE6VN/4DfqvdnnFZMCvv6RM2wLYVGlZ3oFrRc
	GMl/fM4t/cMqlyDon/tfQK6c3SZmIH1SiwNn1dXN+bpaq6la3naR3OMZt45jhtQc3cXmuD
	92n4tBheAXzxd1RdvazlCDealn3xvzW6d1ivDuXKVgsjenXyY9o3MGWwhh8lZ9EMp6bEsu
	Nm0XhFN0TiUF/WQEO4D8OdKVi9ui2i0SVYvf2DTG+y0I88XhDtaCzL8Kxp1pkqnYSog1Uy
	CktNJKi4ZZRbAv9cajIfsuq/4m+2LUu8JY3EksFepWeO4xLh1S6jfU8ZRSdOYg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 10:16:54 +0100
Message-Id: <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Rob Herring" <robh@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
In-Reply-To: <20240216022704.GB850600-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 3:27 AM CET, Rob Herring wrote:
> On Thu, Feb 15, 2024 at 05:52:08PM +0100, Th=C3=A9o Lebrun wrote:
> > Expose I2C device timeout configuration from devicetree. Use =C2=B5s as=
 time
> > unit and express it in the name.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml =
b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > index 16024415a4a7..e6b95e3765ac 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > @@ -70,6 +70,10 @@ properties:
> >      minimum: 1
> >      maximum: 400000
> > =20
> > +  timeout-usecs:
>
> Use standard unit suffixes.
>
> We already have at least 2 device specific timeout properties. This one=
=20
> should be common. That means you need to add it to i2c-controller.yaml=20
> in dtschema. GH PR or patch to devicetree-spec list is fine.

i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree this
prop has no reason to be compatible-specific.

Feedback from dt-bindings and I2C host maintainers would be useful: what
should the property be named? Having the unit makes it self-descriptive,
which sounds like a good idea to me. timeout-usecs, timeout-us, another
option?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

