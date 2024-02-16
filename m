Return-Path: <linux-i2c+bounces-1818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3285787D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C2A92869A0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915A01B81B;
	Fri, 16 Feb 2024 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Msa0LS+8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEA91C288;
	Fri, 16 Feb 2024 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708074339; cv=none; b=p9McfrcZKUGKEFZYI7FO3cko/dGdhgQ7iEw3yuwKWrSjNo9cFKRP6cZsIESDV1R+KXia3JNW8zPAZosiVvYds0cyobX35odsGNKxZTIi0v7Bu2/+PrOPSPWzUhpTUeBEwGe6o8b8Z/VuKAHDFTs8FI8WLAav9P5e3wdLwkcUJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708074339; c=relaxed/simple;
	bh=CQwhrTeWOnWyMnxH79QH+r74JpqB84pPIFxNLj4LUJw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=np0q81iGW9OJV+JTeMapsLC0aWeqbLWBh0YHNxXtb3k7w04/MCsXWl1h+YdAMaBieQXE0wRakBc6rqqVEw0yjsVXBjzUTtlXshpYofulcR+6UIWtoRDju/YBhadg6j9ucuAnPVCb3oh9evZyyd84EztOnX1r5P8gFrYi60H5jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Msa0LS+8; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10FA8C0007;
	Fri, 16 Feb 2024 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708074334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQwhrTeWOnWyMnxH79QH+r74JpqB84pPIFxNLj4LUJw=;
	b=Msa0LS+8ofaQ0R4t/+bCkMl6Px0kx3f2rn8mJ+mg2kOFtYyumrYsagmxr6Y5pgBNEFKvE8
	6r7XlqtE8cIuoxTytvqcem1LzwgLkB/rvoto8rppBVzTkENj2XiWrza+phhuoLI0YcoKwf
	3A9XHMjd0wgu9ooKUTR7VkAb1seK9OY6yO1tRYi/3AovjcIY/nyEozFIYcCRc+3fZRrsfL
	KJv2ZMzjh4bBUOCeEk1g47dCsFsQn8qdVMWuDWNeaCfWnyQkWlLSyV7yfYAsCq8I52YaUR
	EUGUrwDnUm6UFqiLeEYIXdxY6YYCG0EoCSH00Ap8nLQUPjNrkHIwHKUFMXMOhQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 10:05:33 +0100
Message-Id: <CZ6DTGBC02P7.1RHCB4E64N88A@bootlin.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 13/13] MIPS: mobileye: eyeq5: add resets to I2C
 controllers
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-13-19a336e91dca@bootlin.com>
 <42b7e3bb-a152-4ded-91f3-fb8043a7f413@linaro.org>
In-Reply-To: <42b7e3bb-a152-4ded-91f3-fb8043a7f413@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 8:59 AM CET, Krzysztof Kozlowski wrote:
> On 15/02/2024 17:52, Th=C3=A9o Lebrun wrote:
> > Add resets properties to each I2C controller. This depends on the
> > reset-eyeq5 platform reset controller driver.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
>
> This should be squashed with previous patch adding i2c controllers.
> Don't add incomplete nodes just to fix them in next patch.

The goal was to isolate reset phandles to a single patch. The series
with this patch dropped works because resets in their default state are
deasserted, so this isn't a fix. And it allows testing the series on
hardware with only the base platform series, which I found useful.

Noted, I'll be squashed for next revision.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

