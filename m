Return-Path: <linux-i2c+bounces-8239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9209DA3C5
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 09:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE65F16672A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D1C183CD1;
	Wed, 27 Nov 2024 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QsCPjwDS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787DD13C816;
	Wed, 27 Nov 2024 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695639; cv=none; b=IWyl9P6ayG/V8IZGkUFPG+Urq7/ddRQR5tAdr5hAQUM7VbXeBhthTuo8VMR+XyJWJlJlWE9CV24dfUEMjYYWeOhXi+OVUAkYt4nQaJ32TB5TEYjuQ6jsqazE9+cJreUQ6/nXXOVCmob/stcX7fJ4KL1pT71WYJQvdEAR4WkjsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695639; c=relaxed/simple;
	bh=TJMspgLIAfQfEO+bmJU8NLexuKEQCktJ3J1jXkLkl+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctxrpY5nig3Tu8CpjK2XzlVopaSInuKf5TBTrtUQMMkIEIStBry8Iw1KpCYsk3rNyRF6IXtpErJpGBlrVpZE6FtqRkhN0O+lv4JRmk5MVFmF0aAP4vIgher4KN7krvTbtEv0L/ISUBvdyzLVjCjugr9y4z+EfWA6+uAdPHb6u4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QsCPjwDS; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 196281C0006;
	Wed, 27 Nov 2024 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732695628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJMspgLIAfQfEO+bmJU8NLexuKEQCktJ3J1jXkLkl+k=;
	b=QsCPjwDSdqfFGctHU8kmHHbZbQAC0XTlMYph8wEKJXseCnyHu4P/M9cWTHdgspaKSo3rJQ
	cPJ3m9s8zgkluTc0foCsaK88Vt12KrOgohLdeuvGjIlaxdt+lnkB4TYP0yOPgn8n61uQXN
	HJfr5umpbJVT0RqMzXh0jtx+hSqLYOGwNfCnfDNukNggy0BxOFkZyQL4YTU9z/tozLazhf
	6hJvFVBKEIVg5et/KmPw+IcEz9LLv2myfrwlYCyatUVat65i0gQGCL+fsIxFA07eZirZny
	yg2dFGJVrf9OpHN1Ej3Z5Tr2bFib2aSOkCINjOE3oRN9oMOGG+ijwKyk+Xdz5w==
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
Date: Wed, 27 Nov 2024 09:20:26 +0100
Message-ID: <3923123.7gsWKXV4c1@fw-rgant>
In-Reply-To: <20241126-precinct-corrode-516d3a476479@spud>
References:
 <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com> <2072150.UuDqf3iUMg@fw-rgant>
 <20241126-precinct-corrode-516d3a476479@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

On mardi 26 novembre 2024 19:09:43 heure normale d=E2=80=99Europe centrale =
Conor Dooley wrote:
> On Tue, Nov 26, 2024 at 09:05:42AM +0100, Romain Gantois wrote:
> > Hello Conor,
=2E..
> >=20
> > But then again, you could consider that DT bindings should only describe
> > what is possible, and not only what makes sense as a use case. I don't
> > really know how to answer this question myself, so I'll refer to the
> > maintainers' opinions.
> I don't really know what how this device works, which is why I am asking
> questions. If there is no use case were someone would only wire up one
> of the downstream ports then making both required is fine. I was just
> thinking that someone might only hook devices up to one side of it and
> leave the other unused entirely. Seemed like it could serve its role
> without both sides being used based on the diagram in
> https://docs.kernel.org/i2c/i2c-address-translators.html
> unless it is not possible for the atr to share the "parent" i2c bus with
> other devices?

It is possible for the FPC202 to share it's parent bus with other devices. =
And I
guess you could wire up only one port and use the component as a simple
address translator and GPIO aggregator.

So indeed, requiring both ports to be described seems unnecessary.

Thanks,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




