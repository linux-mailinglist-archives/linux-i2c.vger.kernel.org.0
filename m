Return-Path: <linux-i2c+bounces-2033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F15DA8692C8
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EC061C21B12
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E9713B790;
	Tue, 27 Feb 2024 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L3nHvMeK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523B78B61;
	Tue, 27 Feb 2024 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041125; cv=none; b=kHkLaD4VVHf8/b8sICjEe7j42wRsna2DOYkWL8zuKA2QUTqcF13Q7XlMuXBNKmBHOJihk5T3JI3p06lHM2QVCbpHwftpi1cPxG6XeqiZI/t2VRbUoYin2JQzVnb+41nKskKZ+2qvwsyRTvAEGbPSPZ/Nu845SQoXxzAYoz0uuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041125; c=relaxed/simple;
	bh=Ad3s8txV/LRKTi3+KCXHUIgZVNfAZ9S2VAZ3ew4nrfE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cOeh57Dc1AWTwyOMGig60WauZRu/SvzKXRAio42hrVkBkOVHHEcEC+FWKmQDrix54IRwaZgF7jquNJYuKAXHP1cGkXyAf6VFLGTsMzkv3wlNwQ3AYSheOEbE0i8sTUsMu/KuhB6uCeBPzEVmV2Sfi7c4Wzroarp51ZOVywUcFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L3nHvMeK; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A454D24000A;
	Tue, 27 Feb 2024 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709041120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ugB9QxiL2b1VXZ64TujSRaUb9sqfq1WG8mbx8ms1t8=;
	b=L3nHvMeKugiy6LAMcXCUL40zZFkFyG3stQRCERhiPdxJe3E0Hmzaxmc4okAgDcBr9U4dce
	MabFzn95ayqAVbsXsICU+hIghagnyW62tfkH76EGxaxLevNTkTGL7T6XXxpG7c70YJRida
	FsCqgDEloarSSvHd4W++4CkZQYK7cLR9DS9kgJNX3q+JzZ5uiocuE4/suGqZXVocBmi8S2
	gL/nime4cLazyjWSWNAtEfsIqac3zN1ZGMiosIt069itDFdoNzDLaRnxFTn69FLMXouH+X
	PzS/pk0jhfoT+W4YHIa8JMziWyCDQXmifs9+5/3Jp5yBpS8z6kKpuNkqLvZG2A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Feb 2024 14:38:39 +0100
Message-Id: <CZFWIJE9978P.G3TZC2YIUST9@bootlin.com>
Subject: Re: [PATCH 09/13] i2c: nomadik: fetch timeout-usecs property from
 devicetree
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Wolfram Sang" <wsa@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>
 <Zd3SJMBp23ybgdsJ@shikoro>
In-Reply-To: <Zd3SJMBp23ybgdsJ@shikoro>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Feb 27, 2024 at 1:14 PM CET, Wolfram Sang wrote:
> > +	/* Slave response timeout */
> > +	if (!of_property_read_u32(np, "timeout-usecs", &timeout_usecs))
> > +		priv->timeout_usecs =3D timeout_usecs;
> > +	else
> > +		priv->timeout_usecs =3D 200 * USEC_PER_MSEC;
>
> I could imagine to add 'transfer_timeout_us' to struct i2c_timings.
> Then, you could use 'i2c_parse_fw_timings' to obtain the value. What
> values/value range do you use here? I can't find them in the DTS
> additions.

That sounds good. I have not used this prop in the DTS as it does not
make much sense for an eval board. The target is production boards.

An order of magnitude is a few transfers every 15ms. It means a timeout
of 15ms divided by "a few". I don't have more precise values, but I
could if you consider it useful.

I've done some testing at 50~100=C2=B5s timeouts and it works as expected. =
At
those values timerslack is important to consider (default of 50=C2=B5s).
This is at 400kHz clock frequency. Keep in mind the controllers support
up to 3.4MHz (not yet upstreamed) so timeouts could in theory go
lower if required by the usecase.

My upcoming question is how to move forward on this series. I can do the
patch to i2c_parse_fw_timings() in the next revision. That way it gets
added alongside the first user of this feature. Would it work for you?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


