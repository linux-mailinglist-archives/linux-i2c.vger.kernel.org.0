Return-Path: <linux-i2c+bounces-1825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C201857A34
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267D928183F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B4E250EC;
	Fri, 16 Feb 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DyJfAxjd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E152249F7;
	Fri, 16 Feb 2024 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708078978; cv=none; b=Xh2MrBfWSoMM560MED92OSz4RxPNI981x+Trrat2VtHRHB7ah3U/FTkr8gYwEGSpJgDrSZF4xU9hwmHnRQqt0N1ywBRq+6jKPF3NL8zJqKsDUtBIb8t6kjHNrNMVbpGUmdAjPQ0uduRHviBfRNZfnyxKJ+OFpiR0dzsFD45XMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708078978; c=relaxed/simple;
	bh=HeSGSQVwC2e7+nlpcBwsLIRYXCWaQQRngc+oE9w2mvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HdSvAYyCUsJNsLn92uegjrjxNw4gdp9wTTCMMiYAdW7p08MLlePKe1HIA2nWRt3cs7UTIHrlhPzR6Nh5Oxm4ErIjiPoe/ECq7jvBg9vPrGNJvYlsaDk1nL4gG2Z8QWuOlqP5Fd3W3cO4dFEcNP3H7wR3Ry17+rJDs9ZzZkTfcTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DyJfAxjd; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6663C0003;
	Fri, 16 Feb 2024 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708078973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HeSGSQVwC2e7+nlpcBwsLIRYXCWaQQRngc+oE9w2mvg=;
	b=DyJfAxjdi08vp9LIfnECrRRUnorgFy99suv0KKA6+B/6JlvhpiG76lS4/f4wXLr2e4dFC4
	ZA5psWc3OgwcVZrZn2mh0kccQUVTQIa5nonzAZVkJSBTGf37wIMLTNmCTP4s0dEdZKw9YY
	Lrfjtz6muN4TWshQ7DatmrFKKtKzac2J4zpH5iVEKlB9uu9RpW1I5nG6JJsxdJvO8Arn0P
	s5TiqGJlAsyeyiZI/8a0jf5bvaWyY5PYBnahidwi6NtHjRiH33v3VWby88DVpChSCcXHfm
	e9j/gdbLMbm8WYDikd7U2lLDHzdQy+9u5wupV+X7Qw3HYrE51ik0X7C91+6+hg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 11:22:52 +0100
Message-Id: <CZ6FGNCLDNBQ.1ZTPRHJ71KRJK@bootlin.com>
Subject: Re: [PATCH 03/13] dt-bindings: hwmon: lm75: add label property
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>, "Guenter
 Roeck" <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com>
 <3e541dd7-90d8-43d1-a5b5-260828ac2a86@linaro.org>
 <ebd2be9f-fbad-4295-b74d-35647d08ee76@linaro.org>
In-Reply-To: <ebd2be9f-fbad-4295-b74d-35647d08ee76@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 9:00 AM CET, Krzysztof Kozlowski wrote:
> On 16/02/2024 08:41, Krzysztof Kozlowski wrote:
> > On 15/02/2024 17:52, Th=C3=A9o Lebrun wrote:
> >> Declare optional label devicetree property. Show usage in one example
> >> with dummy name.
> >>
> >> To: Jean Delvare <jdelvare@suse.com>
> >> To: Guenter Roeck <linux@roeck-us.net>
> >> Cc: <linux-hwmon@vger.kernel.org>
> >> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >> ---
> >=20
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
>
> Although you might need to re-work this patch if this gets accepted:
>
> https://lore.kernel.org/linux-devicetree/20240216-dt-bindings-hwmon-commo=
n-v1-0-3c2c24ff1260@linaro.org/T/#m341d8f47ca5badd2637cd662fb331f144e16a54c

Cool that this is made generic. Do not hesitate to Cc me in follow-ups.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

