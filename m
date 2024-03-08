Return-Path: <linux-i2c+bounces-2280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489098760B6
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 10:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734DA1C21B60
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44DE53377;
	Fri,  8 Mar 2024 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dIMn+Hks"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E052F95;
	Fri,  8 Mar 2024 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709889408; cv=none; b=fcxzD3FwMZa4rPev3GTwB8VXPAh4q4vCzwJE86h8VQ9pxg+N8YnaZA5GHyov7KQ9vdCrYofk+U+6yVu6wTKFckKrdtD6grYXcx9+CMfSKvGrrVAZEsiQkqYefLSi2sOf3IwTa95s0HxDQQGl8jG7Nu2C/KdjhLm4lhnvk5kn0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709889408; c=relaxed/simple;
	bh=xbVhZnJdLgAXSnZlSiHw/Fm8YwHdcJLQZLzGDlbumec=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=sOkrgOzjKa6ghXeExyM3q/cgWCQrpV+f8jup95Frl7pKjawieMt1vv5Alx0RBy8lBNkICUJyRQ/v1hJ6X313xMBqTJ0TqpLda18O4LYG1FLUBWb8w8sI1QsTAwAUMZvcEmdv27PY5+7jeHw+tSwOPJB9QybTnvU/gLRnQxReCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dIMn+Hks; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF36F2000B;
	Fri,  8 Mar 2024 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709889403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/eUvvh3JLX5kacQMX2jRA//mYfxfj755OY+r82KgEE=;
	b=dIMn+Hks7A6pLjEQgAaTNQSMOrYLL1yAQ7Cq7N9THIxDan38wv2QLOt7iLPwLriXl/bhMA
	f1obrhB1UvqQwpGDnbA52fSBK56DtwxpVreXh0EGatGiDV/mymaWca1s3Njckz4FY583h4
	WpAJRR9/Rsm/Irt/BVEHCl1WcUy7hVMKz3I40Q0OcOQVecXKKvdMrqOwzQuYWAa4g1UTX3
	p4r5CLXElTeG2KGd5+fnScBog5l1LkUmnUFhuAsn4QTif+3dubjg8NxxRB5p9cKzS5tGNy
	O4oCFsor/bG5brACEA35oTPDjxAAOvuGSfk/g5fYkU7Dz3oUiFYihe0/46bn5Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Mar 2024 10:16:42 +0100
Message-Id: <CZO97FHGERJG.37RVSW2CIYP7R@bootlin.com>
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
 <xy2nxcjxkw6pkprrjx2sol62xvq2nr3ukdwpn4h3wuwpnnu43j@2djyqtkdpcwc>
In-Reply-To: <xy2nxcjxkw6pkprrjx2sol62xvq2nr3ukdwpn4h3wuwpnnu43j@2djyqtkdpcwc>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Andi,

On Fri Mar 8, 2024 at 12:11 AM CET, Andi Shyti wrote:
> Hi Theo,
>
> ...
>
> > +static inline u8 nmk_i2c_readb(const struct nmk_i2c_dev *priv,
> > +			       unsigned long reg)
> > +{
> > +	if (priv->has_32b_bus)
> > +		return readl(priv->virtbase + reg);
> > +	else
> > +		return readb(priv->virtbase + reg);
> > +}
>
> you forgot to remove the else... not a problem, it's coherent
> with its writeb counterpart.

Yes I enjoy symmetry. :-)

[...]

> Looks good!
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks Andi! Any chance of seeing this series queued for v6.9?

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


