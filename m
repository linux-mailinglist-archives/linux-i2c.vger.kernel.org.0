Return-Path: <linux-i2c+bounces-1871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BE85A5F4
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADBDEB2131A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD8F1E88D;
	Mon, 19 Feb 2024 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kC7uVdmQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F151DDD5;
	Mon, 19 Feb 2024 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353110; cv=none; b=V3EGEvzHoOdySDZeqousIvQ55ZF8yz0JAsE4B7EPl2wrFxIug6TYDVsTXItGeX59ty8I4VHnxSkq8AGsH6c6jfa4GrntW9WvOWiqMHpwrtNHzV+zmDTlQG7CeU7G/5Ye92nG+6Vlqkr99Zs7ZXdryyLQyMmxkw5SDCNoPsHwmoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353110; c=relaxed/simple;
	bh=hKfqt+6AH9WiehjZH1IaTO+O21L0m+AX+DTUgObkBAY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TXtWzg/yICbzsBN49fh6U8KD0zvgyQhbOw9OSVOtPuwyQ42indSK83PcpB0dD2VzKcDkBlxTlCQdf8e7f4vQU7Jvi1M8667WB+EBfXeI6ovrr5yF0N9DAW/+PdMyZUy1kGLH72TTBA/qy1x+e3VEKvm0i7nbboZklhW/jyAnCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kC7uVdmQ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F9441C0012;
	Mon, 19 Feb 2024 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708353106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKfqt+6AH9WiehjZH1IaTO+O21L0m+AX+DTUgObkBAY=;
	b=kC7uVdmQuKOY2GZO7/+U8nGkDmIS2gUMSAn6I3uoBiu8m1t7O7ruLaNdalx34aTxFThyby
	4xEjQzka7TB8XMIdmRxWxQw3OWpVgOT5vk695IlP4IdxkXuFPU4ApdZhDB5Kl+CVQpr+RC
	ZVvauYyA3BM0jtZ8FruNvEisL5LZS9HTI5K9Sa6dgtv2w/u3zzhXJBYg9iPSh+l2eXSZJn
	3GvZd2GHfFANPZX8zWkS4LXroL2RmFjaem7TJvuJaX7ZRN/WCZfspHigpm5MWOb8kbXvhz
	jo71SgSyaCFgtWRj/NFHARZzLGnwwSOQ8EVbfHSHGPu9KBuRop9FCd/wV0uXpA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 15:31:45 +0100
Message-Id: <CZ94MU7BQIOE.2KYB4TWVOJISN@bootlin.com>
Subject: Re: [PATCH 07/13] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Rob Herring"
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
To: "Linus Walleij" <linus.walleij@linaro.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-7-19a336e91dca@bootlin.com>
 <CACRpkdYC=vVBA-s6GmsaED=NdXfsr0JDzzF+x8q8C3tqQ0F8YQ@mail.gmail.com>
In-Reply-To: <CACRpkdYC=vVBA-s6GmsaED=NdXfsr0JDzzF+x8q8C3tqQ0F8YQ@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:19 PM CET, Linus Walleij wrote:
> On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
> > Replace the completion by a waitqueue for synchronization from IRQ
> > handler to task. For short timeouts, use hrtimers, else use timers.
> > Usecase: avoid blocking the I2C bus for too long when an issue occurs.
> >
> > The threshold picked is one jiffy: if timeout is below that, use
> > hrtimers. This threshold is NOT configurable.
> >
> > Implement behavior but do NOT change fetching of timeout. This means th=
e
> > timeout is unchanged (200ms) and the hrtimer case will never trigger.
> >
> > A waitqueue is used because it supports both desired timeout approaches=
.
> > See wait_event_timeout() and wait_event_hrtimeout(). An atomic boolean
> > serves as synchronization condition.
> >
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Part of me want to go and fix completions to handle hrtimer timeouts
> for submicrosecond timeouts, BUT I realized that this is a bit thick
> request for a simple driver, so just a suggestion for something we could
> do one day. This is fine with me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Indeed having to switch to another abstraction because we desire another
timeout method is nonsensical. Completion supporting hrtimeouts would
make sense. As you said though, this is too much for a simple driver.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

------------------------------------------------------------------------


