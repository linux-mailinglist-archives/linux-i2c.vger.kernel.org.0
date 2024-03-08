Return-Path: <linux-i2c+bounces-2279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFA87606E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1B32820C6
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E235103F;
	Fri,  8 Mar 2024 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fSSGiIhj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F4DCA78;
	Fri,  8 Mar 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888266; cv=none; b=kHLjeExHCwntr0r21LX/1Rju1gnNEiCwvcAplwvwOik1QarbgFwgzTEKV72bC3yZrn8jqpoQsRsq/9Wy0RxrWrTWdxz7Eg94Ld+RDEWDe6ADSExpA3myzAjM4LqUvylUMOC7hoy3aeutIGOz/9NQs9sCUPmzGNjEoPZvI3WskuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888266; c=relaxed/simple;
	bh=uJ3EyYuTfpSTSeJvokr2q70eVIcyAYGuvsrPShpdwLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AZEHgHB44XTx9/E95N6crSAygnvzRIGRDAx1aYnLluSLKW8Py/r+/8eZf9MdByx86ZVPeC7yCi+oO/yOZ7+SzYuXkC7ivYiJ7sA+jxvW0jxMfOxQqyk6n60zXEdpCmCmZcpuBgnY4SyxnBDi2hYftFk5TPFLIecwvfVA5LCXIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fSSGiIhj; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261D5240012;
	Fri,  8 Mar 2024 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709888260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wpE0Hg9jSaOaaAHVX5lz1UQTKT/gbia9ZxM7ce23zk=;
	b=fSSGiIhjdhlTXL7ypsCX8Q/rGBtXrmUC+3UmYox8nwCoFM+QtNq05DuKpwfjwAgwjDeQ87
	+dMbqmsTqmv9bjhkIPw9lxpasMEL+liUQNJiyBxSqUmQPn6N8D3J6H3pRZTYZR16dDW/i3
	DyzzmTr6FT60wlkCts2xU9tP5muwJW0cJ9ir5wCQzVcqdjmWNdiPt4WFI4frZq99DYk5iL
	PANweUx4Sw3BBo8Hw9VVbo3IAE+k8kTSxQ99WCJUs1dxkCVHK6oHdkfzh44hEPN2xLxQCi
	yAonmeerihXrGFRu/4e0+DKdlgKHApehOnlARjjGme2WUhMTfqZzaVO2P1rr5Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Mar 2024 09:57:39 +0100
Message-Id: <CZO8SUELNP4R.230VKX59UIHC8@bootlin.com>
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
Subject: Re: [PATCH v3 03/11] i2c: nomadik: simplify IRQ masking logic
X-Mailer: aerc 0.15.2
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>
 <422szb2dtgnq56xznfqsqtqs3dai2jipnntrp6yb2og353whs7@g4ia5ynnmqu6>
In-Reply-To: <422szb2dtgnq56xznfqsqtqs3dai2jipnntrp6yb2og353whs7@g4ia5ynnmqu6>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Mar 8, 2024 at 12:01 AM CET, Andi Shyti wrote:
> Hi Theo,
>
> On Wed, Mar 06, 2024 at 06:59:23PM +0100, Th=C3=A9o Lebrun wrote:
> > IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ_MAS=
K
> > removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserved
> > options including top bits. Keep the latter.
> >=20
> > 31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
> >   30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
> > --- IRQ_MASK: --------------------------------------------------
> >       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
> > 0 0 0
> > --- I2C_CLEAR_ALL_INTS: ----------------------------------------
> >       1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
> > 0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0
> >=20
> > Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> You did answer my question in v2, thanks, Theo!

Oops my mailer syntax is telling me that the lines starting with '---'
might cause issue as it might mark the end of commit messages. I'll fix
that in next revision. If it gets applied before that it should be
checked that part of the message doesn't get lost.

Thanks Andi,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


