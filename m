Return-Path: <linux-i2c+bounces-1826-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A258B857A3F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2842878D9
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D57E28E26;
	Fri, 16 Feb 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JStXjQwk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6042E28DDB;
	Fri, 16 Feb 2024 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708079172; cv=none; b=QL//gJDRwG8NAUU76Pr+pig4jOq/mqom2W0htnZldxluq323/z3HA601bGlgqlvm4LHym76CumXYTaz/xj1caxh1pe9U4QynP0UWV0l8NHzcEgmPTIDP8Qik4vmX5SkryMa7tL1xHRPygBt7LJM6AYkWhCGE94iH5MXZlxzyCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708079172; c=relaxed/simple;
	bh=+pkZefiPmfNLRzzUaA7n5y6qDHZMRJRXzHgd4nb5GWI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=nw/bjA+16XiDCQIbECPFzNwqW97PjD29kba0yVRYar/4dYF5A2FzJrghQJGL672mCQwHyIYCW+AZKzOrinlmeqK69QRmKSN6/4QtTKGlVC5HZ9m+Hidhv0YMks53QnG9i3qCIQyrHapYZ3it6axIyfLHtZszKCRsZwOgSUQDP5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JStXjQwk; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C30BCFF808;
	Fri, 16 Feb 2024 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708079167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+pkZefiPmfNLRzzUaA7n5y6qDHZMRJRXzHgd4nb5GWI=;
	b=JStXjQwkH8ZEt3ydGXVRwZp6IkCy5Zb/CKP5zP2BZwV1waZcrgBbRQ1po2x6JlAl4Itmei
	e24H/RGyChLjiA1UQe8aWbD06HYzzIK2PmACcN2dS4hdovnrnjX+il83nu9n/1/Fj0EUNr
	DuEQ6s7HjJya1vYAA1KXYWWQW6cY9eRNTBZXPiT+rmisBFEcJWmE+e4+6GQ4P36zFAce/0
	10oc8yiNhMWpISFBt273Za7EdagZ38B71U8e9xztbG20jWbgAQEUTiKVRUGc6CE3orTQBk
	A921fyqr3AuzC2aRVrmIH7KoatrVo2RMPzF+QGpzuX0suvp5/oViWbtnjXYtqw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 11:26:05 +0100
Message-Id: <CZ6FJ3Z78VWO.242BXKNE6RCUV@bootlin.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 13/13] MIPS: mobileye: eyeq5: add resets to I2C
 controllers
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-13-19a336e91dca@bootlin.com>
 <42b7e3bb-a152-4ded-91f3-fb8043a7f413@linaro.org>
 <CZ6DTGBC02P7.1RHCB4E64N88A@bootlin.com>
 <c478bb6f-49b8-4251-99e9-46b4c9510953@linaro.org>
In-Reply-To: <c478bb6f-49b8-4251-99e9-46b4c9510953@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 10:17 AM CET, Krzysztof Kozlowski wrote:
> On 16/02/2024 10:05, Th=C3=A9o Lebrun wrote:
> > Hello,
> >=20
> > On Fri Feb 16, 2024 at 8:59 AM CET, Krzysztof Kozlowski wrote:
> >> On 15/02/2024 17:52, Th=C3=A9o Lebrun wrote:
> >>> Add resets properties to each I2C controller. This depends on the
> >>> reset-eyeq5 platform reset controller driver.
> >>>
> >>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >>> ---
> >>
> >> This should be squashed with previous patch adding i2c controllers.
> >> Don't add incomplete nodes just to fix them in next patch.
> >=20
> > The goal was to isolate reset phandles to a single patch. The series
>
> That was what you did, not the goal. If that's the goal, then it is
> clearly wrong.
>
> > with this patch dropped works because resets in their default state are
> > deasserted, so this isn't a fix. And it allows testing the series on
> > hardware with only the base platform series, which I found useful.
>
> Series or half-of-series? Anyway, commits must be logical chunks, so one
> chunk is to add I2C controllers, not "part of I2C controllers". DTS is
> also independent of drivers (and it will go via different trees!), so
> whatever dependency you think of, it does not exist.

My reasoning was focused on my point-of-view as a contributor and tester
of the series. Your explanation makes sense; I had never thought this
through from the maintainer's POV.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

