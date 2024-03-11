Return-Path: <linux-i2c+bounces-2325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC0877C13
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 10:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7096DB210EA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 09:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF9C15E9C;
	Mon, 11 Mar 2024 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LBBKZCWg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED3A17548;
	Mon, 11 Mar 2024 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147590; cv=none; b=WFBJZQiRCbimRTaQb0A+3TtyN+x7zmpCzjliTM2QLTg5NPkgGWAFk4jNYVtxspjm6gPVoPeZO6XlVTCgT4Y68xsZoVnCVRezCBqdGdGFnxcaJEBiuxCSAFSshI0josbuBN96u14OSQm9hASl+tG02YgiXUXaxCFHUOIGQrX0P2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147590; c=relaxed/simple;
	bh=8HAWZFFWAlCxhMwlNt2FrCFBXJMqPsmESdj1whgbCKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=fE3SbZeKS8vS/KZ4NYVPXoQobAV30yKGJk2ehKggERajI9WVsVYSvHTyYEHHLEARP5gH0bVl6/rffNiJod8BhMNASoPbg/VGfYSD67ALh0ckj9dS64S0msn7Y+CkBNcd8Z6sJpmuY0EAffkmx0Hj9MJsZpHBPtK/OlLXyUYyRmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LBBKZCWg; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13ACD1C000C;
	Mon, 11 Mar 2024 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710147579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+STwbzW/7mrHsTmrWjA6MMULIW/HeJ9kGi1WDLYRtc=;
	b=LBBKZCWgbwH3SqwCmfAsnPMEDylrTy7wvt/RQEkUxdx+h+qK7ytt5PhVsQpojO7OgLIzjn
	2Z8UN1PVIRdoq9LC0yP6/iUXmFj5dW7ZxhaeGaYq/Igo3GKk9gcw4FSdmU83sgHTzeIGVE
	WWIWVbqwpAGFu4jxbQB6v9RCN+EQYkWvu8G59c6JztUk2YtWQFAcm/0avOWZJ9inM8SOkH
	W7C0asW1hjva2jgdM8xZjQ/665HcUKfeiEkJly23f/yWhlG8qvwSxZBLdLfkJ48h2vLVbO
	saag18ZGmADjoovOzjoBwkeHFaG7Tded1dOD6IFl8BOF85BstJw+ODQYyV52lw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Mar 2024 09:59:36 +0100
Message-Id: <CZQSPYZUWFGD.1ZLSA295LSM77@bootlin.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, "Gregory Clement"
 <gregory.clement@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andi Shyti" <andi.shyti@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v3 08/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
X-Mailer: aerc 0.15.2
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>
 <yyyhx62wcvro2zrkxmj6g3esg32zh62f4spox7txv4ghc74ewo@lzduga5d4wzi>
In-Reply-To: <yyyhx62wcvro2zrkxmj6g3esg32zh62f4spox7txv4ghc74ewo@lzduga5d4wzi>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 8, 2024 at 11:54 PM CET, Andi Shyti wrote:
> Hi Theo,
>
> > +static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 =
val,
> > +				unsigned long reg)
>
> If you don't mind, I fixed this checkpatch warning while
> applying:
>
> CHECK: Alignment should match open parenthesis
> #103: FILE: drivers/i2c/busses/i2c-nomadik.c:247:
> +static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 va=
l,
> +                               unsigned long reg)

Indeed I do not mind. Thanks for the work!
Do ping me if any follow-up is required.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


