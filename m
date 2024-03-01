Return-Path: <linux-i2c+bounces-2089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FFA86DE78
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 10:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CEC1C226CF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 09:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25A96A8BB;
	Fri,  1 Mar 2024 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V1LViLZC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82369312;
	Fri,  1 Mar 2024 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709286076; cv=none; b=EKAjEdxKt/4kiMLrQ9rcSfzx637J1x6tK4KMmBua2jkz9ywBkQe27//dJcm9hZNtt6F3dKO/PWmnrzDd+O4rEHQWh9jfnJLD451W95Mi1Q5h3NOZ6VkGLqUdNwbkuIVWu8Utu/Mk+sNvEAylu7yUDRb2zOPiEVotdU55Gwb/chM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709286076; c=relaxed/simple;
	bh=DlbN+IlGSuSBoRTtcplLOGm6dVJxnsnj3N4h136wbCk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CJIbvgHow/Y8rdNuFRQWCdcSdZksArRqVB0cdnluPkqlFI6WENzR07XjY4MVYpVhrAUyA1B2tjiD3rgaCOTh9lNxur/bvAuncrFMMIa1DnK1yRgH/mWrienWoPYhJHDcb3bxZVXUTihnAb8gIuGf7P/KUgWADcwah/EgJvx+qok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V1LViLZC; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55480C000F;
	Fri,  1 Mar 2024 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709286071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlbN+IlGSuSBoRTtcplLOGm6dVJxnsnj3N4h136wbCk=;
	b=V1LViLZCbMkJd3hJlK1iz6yXpb8XMcGqdCRu1BKJp8BPvkkRpWcWMZ4ZUMJzm+o9OSkVuC
	vDJxfa1Yl/JUuYQuDktcTAMGc9QFw82RijvEgEHYRAm7PwqgTwczmOc9p0AnbTzlRWlaKK
	bG6sGLHFdpeEx1rK/jPzV1AdzrE4ILid1ukjZcihAkdaUf1joaZtm1lI9YZnE2+sdqmSFk
	mq3Y/tqm6Q6FaK2+zUAj04GGjT2aj5E9cUx5aFVmqR4UNdGfgGu7lp50dKghbQ1miji6qk
	jxe8aP1sD1Rd3Y4pTkf80z0VHNhwkrimOYXfRMtDVxdXlKl1riZ05FKG8CRS3A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Mar 2024 10:41:08 +0100
Message-Id: <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: lm75: use common hwmon
 schema
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>,
 <linux-hwmon@vger.kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
In-Reply-To: <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> > On 29/02/2024 19:10, Th=C3=A9o Lebrun wrote:
> >> Reference common hwmon schema which has the generic "label" property,
> >> parsed by Linux hwmon subsystem.
> >>
> >=20
> > Please do not mix independent patchsets. You create unneeded
> > dependencies blocking this patch. This patch depends on hwmon work, so
> > it cannot go through different tree.

I had to pick between this or dtbs_check failing on my DTS that uses a
label on temperature-sensor@48.

> > If you insist to combine independent patches, then at least clearly
> > express merging strategy or dependency in patch changelog --- .

I do not know how such indirect conflicts are usually resolved. Hwmon
can take it but MIPS might want to also take it to have valid DTS.

Any advice?

> For my part I have to say that I don't know what to do with it.
> Rob's robot reported errors, so I won't apply it, and I don't
> feel comfortable giving it an ack either because of those errors.

Can reproduce the error when patch "dt-bindings: hwmon: add common
properties" is not applied. Cannot reproduce when patch is applied.
Commit d590900b62f0 on hwmon-next. Cannot reproduce with hwmon-next as
parent.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


