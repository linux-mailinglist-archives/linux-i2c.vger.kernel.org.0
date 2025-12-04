Return-Path: <linux-i2c+bounces-14394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B49CA2C61
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 09:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FC8C301D0D2
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EC5398F82;
	Thu,  4 Dec 2025 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BaVTv6rc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A3217F27
	for <linux-i2c@vger.kernel.org>; Thu,  4 Dec 2025 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836216; cv=none; b=nLNp5UupKvBBND7QgO7HBGOQII2pzx+eR9uFqRyPHJ2tJrJeXF5G2qrpw1AdLilHCS6WoL19hqP41GN7t2ogz127Uy0i2WAih4kIHn+XYjkFuSSuksed3hWxGj4kCOP4cuy7XNRfFe+OB+xemmKkypj8Ne/31NmjJZUaHzO474U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836216; c=relaxed/simple;
	bh=PBqHVl89VO5kWueOyW8krV36UzqYbqbHnFu6R2WlmXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qa3Nzh91JeW+1ecdOysvJvkYFnWMnvouqCaCN/EGwda1Z4/oA360lHyITIMmNzt6mjTZCLGeF1h5cqkd8b2S2b3ceGhgN6LxGTzQbGjCisOQu2yJoehiO7Xx734nhjFGsBM4brrZnD6VshZQ0ZvZKhJuQyTBBRsRqWOlXke/2Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BaVTv6rc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 928344E41A23;
	Thu,  4 Dec 2025 08:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 655CF6068C;
	Thu,  4 Dec 2025 08:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5E1211921FA4;
	Thu,  4 Dec 2025 09:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764836211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QO7KRtA5uIdpxLcOIs8l1kl0Fm67eo/lupIarBigM1I=;
	b=BaVTv6rc3EtT0zdadVqYYAlViy6rZN0D2I0kymA6hAw9HegCchEyZjbk94U/i5Uq8wTctW
	f9BPhKHLDSct0WDdX3Vjpw96fQylDD/dd0+gI3Xb0TBCEs4+6Om0dhmm4Pd7oUcueIfiVS
	DSaaTPelYQ4uELRcGsAIQtGznzi8VDgDFhd09nTJZ95sHT2zzXsuoWRzkLPdDTLHGVZZqh
	H1nmRGCEcxGTrybDt+1PB9QVQTEUyu/ZN9VXLBJjkhPrTI2ZYVQPUo1MYWFyhiffev19y3
	yVgVU+aHp7e8LkbaQEJK3tYJhxv76f7X9pUVthUP9sSOmLgqNm48xbz/V2coJg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject:
 Re: [PATCH v4 0/7] i2c: designware: Improve support of multi-messages
 transfer
Date: Thu, 04 Dec 2025 09:16:46 +0100
Message-ID: <4840417.vXUDI8C0e8@benoit.monin>
In-Reply-To: <gbuthxg24mqk3ofvnyqabwfxhwjwemrdtdowluvwub7odsm36u@jutqnsrthvv2>
References:
 <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
 <gbuthxg24mqk3ofvnyqabwfxhwjwemrdtdowluvwub7odsm36u@jutqnsrthvv2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Andy,

On Wednesday, 3 December 2025 at 19:36:04 CET, Andi Shyti wrote:
> Hi Beno=C3=AEt,
>=20
> >       dt-bindings: i2c: dw: Add Mobileye I2C controllers
> >       i2c: designware: Optimize flag reading in i2c_dw_read()
> >       i2c: designware: Sort compatible strings in alphabetical order
> >       i2c: designware: Add dedicated algorithm for AMD NAVI
>=20
> I merged to i2c/i2c-host until here.
>=20
> >       i2c: designware: Implement I2C_M_STOP support
>=20
> I'd like to check this a little better.
>=20
> >       i2c: designware: Use runtime PM macro for auto-cleanup
> >       i2c: designware: Support of controller with IC_EMPTYFIFO_HOLD_MAS=
TER disabled
>=20
> I will shift the last three patches for the next release. Is it
> OK with you?
>=20
Yes, no problem.

> Andi
>=20

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




