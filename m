Return-Path: <linux-i2c+bounces-2141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DD86FEBE
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 11:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D6A282FC3
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0341250EB;
	Mon,  4 Mar 2024 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ym8KY+n2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6E249FE;
	Mon,  4 Mar 2024 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547299; cv=none; b=clOntgSpgtQOPnrjM+T2zI6NEl3TEwqqe1I4FnaWjHjkla24IdewY2n5T6SULXckVQ4g5Iykx6xpMNSJJEaKgzQwJQGDLn4JprqDvsi8uT4pWutmVUPhNt9RiVFI6Db+pwTyvpMpL2qWqA4qwlwmZKivruOS+CfdK2x40mVd22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547299; c=relaxed/simple;
	bh=l1WERtT5arsgrWURcH/8kAmZA8tXvv8Qm9AF3iNFUnE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WZtDF0PsVwtc0XDWeMPb/G4OA2PTWNqCXQq7YQAKz9Lh8d68pH5UjbUBXikBR/Vm8NPDyEBri/F5pd6PISemdYPV3l+ovsWKzMUQhZe2D6g0t5YdcWkESpGGBt3mZ6o4BnO90WUH/O5lgrzvqQWp8daN5JCLqX2eg9fKn5ylBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ym8KY+n2; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1275A1C0004;
	Mon,  4 Mar 2024 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709547294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwK2LvulJHcbE7EmhorBdfblFEGwYo80VFJJkLx6bEM=;
	b=Ym8KY+n2YskzH42HV2pYni6ovFBEES1RrCl8btmcC5bGzboVaC+z71RtEB0GOGiEYVX7HM
	SV4gJnS44PUjERVjsW1NEqHGR2hbGYkOYE8ifxHS0iJEsncm1w6qMaBKRxMRdxJCgBfAvu
	rao6ZStM6bI9yioHYxMRNbR+P7LgggIZO9jg4NSbdPRDuZrlh3kFDs7e0+lIJngJZgZ/rQ
	ljGLKo/FdYEfyX6HqxXPCKHH9xnI0guJKrtuXPYrvoWsr7qsXL1jx0RD09mJF6EqonEf9b
	0nnWI8iPOODQBB0isjQrT+Oypb/zfx1khrhL+pbIdcZV4x9fTUbmL/BqUqaV+Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Mar 2024 11:14:53 +0100
Message-Id: <CZKVXSULAGXC.1C5PDQJ6KCHN@bootlin.com>
Subject: Re: [PATCH v2 06/11] i2c: nomadik: support short xfer timeouts
 using waitqueue & hrtimer
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
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
 <ZeWRyuN8v-VnraQA@ninjato>
In-Reply-To: <ZeWRyuN8v-VnraQA@ninjato>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Mar 4, 2024 at 10:18 AM CET, Wolfram Sang wrote:
> On Thu, Feb 29, 2024 at 07:10:54PM +0100, Th=C3=A9o Lebrun wrote:
> > Replace the completion by a waitqueue for synchronization from IRQ
> > handler to task. For short timeouts, use hrtimers, else use timers.
> > Usecase: avoid blocking the I2C bus for too long when an issue occurs.
> >=20
> > The threshold picked is one jiffy: if timeout is below that, use
> > hrtimers. This threshold is NOT configurable.
> >=20
> > Implement behavior but do NOT change fetching of timeout. This means th=
e
> > timeout is unchanged (200ms) and the hrtimer case will never trigger.
> >=20
> > A waitqueue is used because it supports both desired timeout approaches=
.
> > See wait_event_timeout() and wait_event_hrtimeout(). An atomic boolean
> > serves as synchronization condition.
> >=20
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Largely:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for the reviews Wolfram.

> Nit:
>
> > -	int				timeout;
> > +	int				timeout_usecs;
>
> I think 'unsigned' makes a lot of sense here. Maybe u32 even?

Yes unsigned would make sense. unsigned int or u32, I wouldn't know
which to pick.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


