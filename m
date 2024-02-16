Return-Path: <linux-i2c+bounces-1824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84087857A28
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 230A3B21393
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6CB20B04;
	Fri, 16 Feb 2024 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eh8YJm3k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DE1C2AF;
	Fri, 16 Feb 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708078762; cv=none; b=dV56Z1DjEMxCvK0jaCVbyiuAI6K9XgrGPttnwe/h4qqE++n6PB6PqCBn2PkwK3sNac68TAIsMstAuxMJsIbMWbOPjb3YV/o2hb/wv3mXEbgbXllzNTs170No7zICOREkUKQxump2TaP2Rm+IJw+M1FOaRjCVB5NYVxua9mLKi/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708078762; c=relaxed/simple;
	bh=HpbFXax0SSZwQVzKfKJjbyz8O1acvNAm90x+8EqL0dg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=UXlGn+LINLvs6qy5+eTEWEFOLPOgPbaUYXP7avCiXw6v1tPgvjN/QnThwuOe1jmRkN2uYHoNRZtpBQs5LJvyVjSo5JgPn/6t3MZOYDpZcmOccjnvB4PauVVFYy23Gg+iy/QAymIxZU2B2PA+W82ea2rhPjacyv1/36waSqnC+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eh8YJm3k; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C906C000B;
	Fri, 16 Feb 2024 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708078703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkIxqpdXEsO6giA3YQnaxtDqAl6uPWLK8CAbLV3KLI0=;
	b=eh8YJm3kUD1UuhBwS35H7wRNZy4ZF6hgzNJpUu35b50ZAg+V/H/jT5FrzGVZeywZdOFVOO
	qWjMGMJ7YUoXZn4AdzwFlqvvxO0Yjhj/5X0cybxa1eMp7xSASJLcuroACW1ofq4QybyH61
	bahy1K3tVUurkVZo8QX307ELC4hrLQHabc/teilfUjUvRoy9M3KJCDb+Mk84nOBbi29KSG
	Vej84jav2Q1yR90dBRgocxHeSc7JasGEuswPpI/CQ+PUfkTgYJaMtyYo7HwXDCj6QEW8t8
	KSY5nkRoXwlm4mDG0JETgFIxMUtBDEvL/Cca2D++XD/DWFc9Ip8rXsxO3THTvA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 11:18:22 +0100
Message-Id: <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
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
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
 <20240216022227.GA850600-robh@kernel.org>
In-Reply-To: <20240216022227.GA850600-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 3:22 AM CET, Rob Herring wrote:
> On Thu, Feb 15, 2024 at 05:52:09PM +0100, Th=C3=A9o Lebrun wrote:
> > Add EyeQ5 bindings to the existing Nomadik I2C dt-bindings. Add the two
> > EyeQ5-specific properties behind a conditional. Add an example for this
> > compatible.

[...]

> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mobileye,eyeq5-i2c
> > +    then:
> > +      properties:
> > +        mobileye,olb:
> > +          $ref: /schemas/types.yaml#/definitions/phandle
> > +          description: A phandle to the OLB syscon.
>
> Define properties at the top-level and then restrict them in if/then=20
> schemas.

Noted, thanks.

> > +        mobileye,id:
> > +          $ref: /schemas/types.yaml#/definitions/uint32
> > +          description: Platform-wide controller ID (integer starting f=
rom zero).
>
> instance indexes are a NAK. You can use i2cN aliases if you must.
>
> Why do you need it? To access OLB? If so, add cell args to the OLB=20
> phandle instead.

Why we do what we do: I2C controller must write a 2 bit value depending
on the bus speed. All I2C controllers write into the same register.
Index is used to compute the shift.

mobileye,olb is a phandle to a syscon. I'll be using i2cN aliases I
guess.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

