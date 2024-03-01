Return-Path: <linux-i2c+bounces-2095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99C86E306
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5762C282C46
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 14:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516026F065;
	Fri,  1 Mar 2024 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lM8WOcga"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4D6EB79;
	Fri,  1 Mar 2024 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709302199; cv=none; b=Bnr+UEKrpR+zxXLtrTwVnvOHztgPC91VTycKlvI0Z647OM3EQE0aO85tLkok+WoSrPeY9u+CO0lhavSV1QgFy46KaValqC4gN+6MsglXfylqJA3zVXh0WaKjC+DleYkESf5uTUH8NQj4bPvBfophCVq6/wheNXWYRUJs75UwNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709302199; c=relaxed/simple;
	bh=8SNJXFocJybYWAAETOVv1TEYZIaxUQ2TZ7T/99SzvUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=srbN0GoqR3vjHiwd0qlYeYq1QyOaa+cIbnLw5DOe9lwqF788cGrnWnRMiy7neEkw/f06SqsZqfO8Yp5JCvC1h6/vLLSyY+xOnJtTz7I/SlBw/qn1qE9LfGKmJLyVDfUeKiIjXA7Tsi5mqeurSeNl8jBBjln1gd7YGZPt+mrCNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lM8WOcga; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D87D22000E;
	Fri,  1 Mar 2024 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709302192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SNJXFocJybYWAAETOVv1TEYZIaxUQ2TZ7T/99SzvUM=;
	b=lM8WOcgal/GAYSfmKYiFd2PrZduh0Lidq2w93U4R1WOTMwx/ACXg69RwP2dvQzAZTxAJl6
	Zs66mf73xi1zf52UoZjbjgVdcvDR4eoKiUP0LLqhlJ0JBTD+32HlN0d6wpTJJR/gLbBS25
	DiKMiQYvPJdsDD4+FMQv7Lgw/GS3mGL4tqUZ9IuyKnRToydRSFcooe9I/+jLR0F9tAcDBk
	efI9Yh3S7GoL/2YisW39jiAPrD7NLU9TO54NyC+qq2vlc7IwyGlnD32y54WAlHGyVhbobT
	y59JAMOCS5ZkmdDuV26TmP0tuft5/+QEFB/sEQTG+se6yxzqUPv1MyaUlFtIWQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Mar 2024 15:09:50 +0100
Message-Id: <CZIH21XQPA24.17TEKSPWLL7KR@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
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
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Guenter Roeck"
 <linux@roeck-us.net>, "Linus Walleij" <linus.walleij@linaro.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-2-b32ed18c098c@bootlin.com>
 <6749c8df-c545-4aca-bc18-4dfe9c9f15b0@linaro.org>
 <d78fd3ca-ed0b-40e5-8f8f-21db152a7402@roeck-us.net>
 <CZIBCBQ2IB0E.2N3HAVO0P2SHT@bootlin.com>
 <f802a1e0-cedd-488a-a6fb-df793718d94b@linaro.org>
 <CZICOX6DR0SA.O876YRG8P03C@bootlin.com>
 <d0826186-ac2a-4229-abd2-1be33fc177d6@linaro.org>
In-Reply-To: <d0826186-ac2a-4229-abd2-1be33fc177d6@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 1, 2024 at 12:35 PM CET, Krzysztof Kozlowski wrote:
> On 01/03/2024 11:44, Th=C3=A9o Lebrun wrote:
> > On Fri Mar 1, 2024 at 11:13 AM CET, Krzysztof Kozlowski wrote:
> >> On 01/03/2024 10:41, Th=C3=A9o Lebrun wrote:
> >>> On Fri Mar 1, 2024 at 7:53 AM CET, Guenter Roeck wrote:
> >>>> On 2/29/24 22:37, Krzysztof Kozlowski wrote:
> >>>>> On 29/02/2024 19:10, Th=C3=A9o Lebrun wrote:
> >>>>>> Reference common hwmon schema which has the generic "label" proper=
ty,
> >>>>>> parsed by Linux hwmon subsystem.
> >>>>>
> >>>>> Please do not mix independent patchsets. You create unneeded
> >>>>> dependencies blocking this patch. This patch depends on hwmon work,=
 so
> >>>>> it cannot go through different tree.
> >>>
> >>> I had to pick between this or dtbs_check failing on my DTS that uses =
a
> >>> label on temperature-sensor@48.
> >>
> >> I don't see how is that relevant. You can organize your branches as yo=
u
> >> wish, e.g. base one b4 branch on another and you will not have any war=
nings.
> >=20
> > That is what I do, I however do not want mips-next to have errors when
> > running dtbs_check. Having dtbs_check return errors is not an issue?
>
> You should ask your maintainer, but I don't understand how this is
> achievable anyway. Subsystem bindings *should not* go via MIPS-next, so
> how are you going to solve this?

I thought it'd go in hwmon-next and be picked up by mips-next as well.
It's clear now that the right approach is to send the lm75.yaml patch
alone.

I'll wait some more before sending a new revision that drops this
lm75.yaml patch.

Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


