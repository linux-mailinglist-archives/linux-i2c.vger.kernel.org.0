Return-Path: <linux-i2c+bounces-2101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C853886E4AC
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 16:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2ED284F2B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C8070CD2;
	Fri,  1 Mar 2024 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gnZwGnhu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC456EF1F;
	Fri,  1 Mar 2024 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709308064; cv=none; b=qUbe0nE1n+sVpRrFgABydTMgtDUzpXJVqxjEeyTKtMrT7oSfH2yEXwUHFD0K8Mk5kzRMD0QxF4QbrLm6A6y1jEHGmUQJmTdsCUBZloiovxVRHXemT+ggQUMak4qZxTkmKfe1BM7PT9QEf/F/I572tE2SBS8vDVUxUzrGlIYNAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709308064; c=relaxed/simple;
	bh=/lpcu1cwKToP1YTl3Vb9NOZDrttRJdM4V2OIwh/bNeU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=keZvwJL6Q/t51SQg4uQwu+uibwAaFqnC3GZdC45RJ6OvdrgYZxxQiJdApzbgbq5pHkkQzhRnqpRTtsrnkO9ikknkdisNLPyhXwVG683nlgSlh88M3NZe4YCzdcKVTGe0aMEvGxAVHS3OFifcR9AOai+VKq2VsTGoPbW/tiWAwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gnZwGnhu; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDC736000D;
	Fri,  1 Mar 2024 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709308055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uE39Tdusc2iOYu8yciRGo5J13AkSfvwvY5k+yQjJTiM=;
	b=gnZwGnhuFM4BkMTf3c2iQy2zn50vixMSBMJd1pZ/Uj585gJ7pwh7Rj/65XsyYXnpMcTQHD
	urBkPI0KQ73Hber0gd+u09Ddbmb0+a+todMeqWvN4hzfA04RUhlZ5vHV/ajeY7MO7Ob52o
	OgcyZbXgdDgVOuzBVzyjReeWYF0viu1xoCD9M7u6Z5H1gnweu9zhfCCCbC/WG1dGnJ66M+
	uIV698Tbs/E0E2rlyjFlfqzzzA2O4hEg5xyY1bky16X2ad7VFBVXvNhaKiNor8AQaJDzpV
	kWc6TZWTcHnksWEwM5rsFy45QORQxBFeYpwzqXBzjo/7E8Y9nW4yRMHIO0Gc5Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Mar 2024 16:47:34 +0100
Message-Id: <CZIJ4VQULK8C.QA1KAO3BTVR0@bootlin.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: i2c: nomadik: add
 mobileye,eyeq5-i2c bindings and example
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
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-1-b32ed18c098c@bootlin.com>
 <20240301151146.GA2114576-robh@kernel.org>
In-Reply-To: <20240301151146.GA2114576-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 1, 2024 at 4:11 PM CET, Rob Herring wrote:
> On Thu, Feb 29, 2024 at 07:10:49PM +0100, Th=C3=A9o Lebrun wrote:
> > Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the
> > EyeQ5-specific property behind a conditional. Add an example for this
> > compatible.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 48 ++++++++++++++=
++++++--
> >  1 file changed, 44 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml =
b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > index 16024415a4a7..2d9d5b276762 100644
> > --- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> > @@ -14,9 +14,6 @@ description: The Nomadik I2C host controller began it=
s life in the ST
> >  maintainers:
> >    - Linus Walleij <linus.walleij@linaro.org>
> > =20
> > -allOf:
> > -  - $ref: /schemas/i2c/i2c-controller.yaml#
> > -
> >  # Need a custom select here or 'arm,primecell' will match on lots of n=
odes
> >  select:
> >    properties:
> > @@ -24,6 +21,7 @@ select:
> >        contains:
> >          enum:
> >            - st,nomadik-i2c
> > +          - mobileye,eyeq5-i2c
> >    required:
> >      - compatible
> > =20
> > @@ -39,6 +37,10 @@ properties:
> >            - const: stericsson,db8500-i2c
> >            - const: st,nomadik-i2c
> >            - const: arm,primecell
> > +      # The variant found on Mobileye EyeQ5
>
> Kind of obvious from the compatible string, but maybe you are keeping=20
> the existing style...

I indeed kept the existing style.
Ping me if you want this removed!

> > +      - items:
> > +          - const: mobileye,eyeq5-i2c
> > +          - const: arm,primecell
> > =20
> >    reg:
> >      maxItems: 1
> > @@ -55,7 +57,7 @@ properties:
> >        - items:
> >            - const: mclk
> >            - const: apb_pclk
> > -      # Clock name in DB8500
> > +      # Clock name in DB8500 or EyeQ5
> >        - items:
> >            - const: i2cclk
> >            - const: apb_pclk
> > @@ -70,6 +72,16 @@ properties:
> >      minimum: 1
> >      maximum: 400000
> > =20
> > +  mobileye,olb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: Phandle to OLB system controller node.
> > +          - description: Platform-wide controller ID (integer starting=
 from zero).
>
> Rather than a made up ID, just store the shift value you ultimately=20
> need.

Issue with storing the shift value is that you also need to know what
value to put in that field. It's an enum mapping the I2C speed which
isn't found in DT.

> These properties are fragile because they break if anything that's not=20
> defined in DT changes whether that's register offset, bit offset,=20
> bitfield size or values. Or also if there are additional fields to=20
> access.

My take is that it is better to have it all either in DT or in driver.
Having a mix of both is a mess when debugging. If something breaks it
is a driver bug; such bugs get fixed in driver code. That way DT
doesn't know about it and doesn't have to be changed.

Putting shifts in DT is an abstraction that ends up being unhelpful. You
split hardware knowledge half in DT (register offset and/or mask), half
in driver (value to put in the field). We'd rather have it all in
driver code.

Next hardware revision will be more complex with potentially fields
split across registers. A shift value wouldn't cut it. A new
compatible + made up ID allows accomodating for that. That way we have
homogeneity across compatibles.

Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


