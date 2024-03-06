Return-Path: <linux-i2c+bounces-2207-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84280873299
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 10:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395041F25D05
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 09:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF195E08B;
	Wed,  6 Mar 2024 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="flWszAUC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94645EE96;
	Wed,  6 Mar 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709717654; cv=none; b=a9SGI9mZKM0b4E4KocEjcHFpMTC+6bfucJLzWcTEXFFFQm6YoMghYVb14s+SAg8JegX4fmZu6zQP5e6uTJm5WYngrAZGyfz9OMYs0ZtacjC1fRlSw490t84UA8PMyIteo2qulc7QqdN3U4M0xnoniRy6BtSlt5O/XsOp+V/bJbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709717654; c=relaxed/simple;
	bh=JinEX41/j7Pb/bWxW54bGmffaAtTNcThK8gdOptLKmY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eF882WGEhiB5jRMSmh9kej6ISIvjqXudnfN1oQJNI0OIQL6cUh27R0qkBfSrcKwhZdUHDMt95q4od46vpDjKr4mB24Jq1VQajIl9DBbRC0WZju9RSO7Ue1wJson3YScNT72vByHxbjGPN20ZGVT5vp67a6fB6oue6Kc1wz41R2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=flWszAUC; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B95DFF80A;
	Wed,  6 Mar 2024 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709717649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od4s/GMAsr52sikJcFgvSYexwtnWDcy7Z22NE3GsHO0=;
	b=flWszAUCdRYte0IftesUvM5oIovUSfZcoWTw88vViiC3zzugdD6VABdpg/qSMIoiriNvEa
	HwQ6CavPBKPEtMWhjiB1Jcx/h+8QmodvIi2fHXR+EHqw0knNc60bHgC9MB/4YwpsxQsc9L
	C3Ay7A2aKHeZTAduHirmc4l7SsHzn9CiWUQXkpVsM9JP3ePCdLebbkVivyjkYGv4zw1ke8
	+hHh9DdtCmExe4sk3tryFL2xap6DbZSDNF4cuFMZclKyl9eZQ22Nqi0Oh6HZzGGIAZmlNG
	JH9RAXidbdI6QKlNno1AjYAmVwYjQr9rrE4mEiX+dQ682P+Hxli1IYdpqvIboA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Mar 2024 10:34:08 +0100
Message-Id: <CZMKBOH0BBTH.MZH1OTAZC7HH@bootlin.com>
Subject: Re: [PATCH v2 00/11] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
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
 <tawfik.bayouk@mobileye.com>, "Jean Delvare" <jdelvare@suse.com>, "Guenter
 Roeck" <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
To: "Andi Shyti" <andi.shyti@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <bhiubxf3vuxfnz4rh75isgy5z5cexa6dnlw733box5ly3h7r5f@yqvzs75d3ykb>
In-Reply-To: <bhiubxf3vuxfnz4rh75isgy5z5cexa6dnlw733box5ly3h7r5f@yqvzs75d3ykb>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Andi,

On Wed Mar 6, 2024 at 2:49 AM CET, Andi Shyti wrote:
> > Th=C3=A9o Lebrun (11):
> >       dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and ex=
ample
> >       dt-bindings: hwmon: lm75: use common hwmon schema
> >       i2c: nomadik: rename private struct pointers from dev to priv
> >       i2c: nomadik: simplify IRQ masking logic
> >       i2c: nomadik: use bitops helpers
> >       i2c: nomadik: support short xfer timeouts using waitqueue & hrtim=
er
> >       i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
> >       i2c: nomadik: fetch i2c-transfer-timeout-us property from devicet=
ree
> >       i2c: nomadik: support Mobileye EyeQ5 I2C controller
> >       MIPS: mobileye: eyeq5: add 5 I2C controller nodes
> >       MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor
>
> what's your plan for this series? If you extract into a separate
> series the refactoring patches that are not dependent on the
> bindings I could queue them up for the merge window.

V3 is ready and will be sent today. I think we can get trailers from
dt-bindings maintainers as the discussion has been caried out on this
revision.

Am I being too optimistic of seeing this series queued before the merge
window?

Thanks Andi,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


