Return-Path: <linux-i2c+bounces-1870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A985A5E6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 279C11F251B8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18418376E2;
	Mon, 19 Feb 2024 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y+Ri8PbE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF737160;
	Mon, 19 Feb 2024 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353002; cv=none; b=B32Y8fyB4wy0oN6faDdxxHC2zN6nT9jKMxDek8p/cW36xCDYmlOh6UDaPGSLD3t2F5H3xAeZlCRF0zLQl53Jto2BBJuc8TAuIYuWV2OFItinSPeSFxYeTM8GFnUSqFW1+oz64Iacqq73UjXhMveLd3aTaZYWwJ5BNGnWuOoDtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353002; c=relaxed/simple;
	bh=jSJtb19xo6U4wrKlOqq7IbDHuxWUa9am9jpce38A2yU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=SOCZ5/inIpBqG5OXC7zIdmxNls9ThlbbSIDYI95iNpTyhduuYYAjdVC2mdDsoCAt/rlRbRfRnYJw3sRmJUUWY7qub/Z49V/4lYwoB3uFMdewtOLRaCHg12sevJj71sVv52HpIhRpvtTVH+8swtGLaOkIzZbeOyz3+5bRv1NkGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y+Ri8PbE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E74DE1BF209;
	Mon, 19 Feb 2024 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708352998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jSJtb19xo6U4wrKlOqq7IbDHuxWUa9am9jpce38A2yU=;
	b=Y+Ri8PbEfAVqHYxOyn7iqdOjgEFwTTgLg0MONT5WYr9Pt6gbz+NqkpWDcV/ZjfYuInJ9PT
	dopPyvTqtIusrhbip7t5fiYVk+sTGQktlAk8uT7Qg0QfMV8xXxjgWQZ4ip+gFuj6pY0IPt
	5M/K17pKPtqTOdeueh+LFKt6b5PLLEkrGV0FVcmKJCsN3oChUhbPa2JUZyilf+xSyn1et+
	UzAlUgnQjMAigrc2fnsfdl4zlWDCZjsucLO3uEgvwKlnZGmhqAKcPQZIqO6iWoHBESoJEU
	uKb6etT9INEcZyxkGvsGiWPO8I87me5hCW8S1QAyHAuVcxUARUStsP1mtLPcdg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 15:29:57 +0100
Message-Id: <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
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
To: "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
In-Reply-To: <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:06 PM CET, Linus Walleij wrote:
> Hi Th=C3=A9o,
>
> thanks for your patch!
>
> On Fri, Feb 16, 2024 at 10:16=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bo=
otlin.com> wrote:
>
> > i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree this
> > prop has no reason to be compatible-specific.
> >
> > Feedback from dt-bindings and I2C host maintainers would be useful: wha=
t
> > should the property be named? Having the unit makes it self-descriptive=
,
> > which sounds like a good idea to me. timeout-usecs, timeout-us, another
> > option?
>
> Use i2c-transfer-timeout-ms in my opinion, so it us crystal clear
> what that property is for.

Using =C2=B5s (microseconds) would be OK? I'm not sure yet about the exact
timeout desired but a one millisecond granularity might not be enough
for the Mobileye usecase.

Expect incoming patches to use the I2C controller in Fast Mode Plus
(1Mbps) and High Speed Mode (3.4Mbps). Gotta go fast!

> As Rob mentioned this isn't in the kernel schemas but in dtschema, so
> you need to patch this:
> https://github.com/robherring/dt-schema

Indeed. The other question if we do microseconds is the
suffix: -us, -usecs, -microseconds, etc? I picked -usecs for my v1, but
a grep tells me I am the only user of this suffix. -us is much more
common.

BTW i2c-controller.yaml already has a =C2=B5s timeout:
i2c-scl-clk-low-timeout-us

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

------------------------------------------------------------------------


