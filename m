Return-Path: <linux-i2c+bounces-7685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1ED9B7FBF
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 17:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35BA51F21AA2
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 16:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DBB1BC062;
	Thu, 31 Oct 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pVHehoUF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C180C1B6539;
	Thu, 31 Oct 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391252; cv=none; b=NVSQFjpI9laTsaML2NBYN4wJcizBbjbawTeq9G5qKayNKfyfPd6ljgz+9ivz5fBMvJ1aCAYegkrtUsU2vMXTp69SGjWog75gpCUl330n37pKHuK8IEUKRupfX6wKnbNNxcT8QEDEib6joT0WrUEumMXbqLutVxs+tLvscEGnQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391252; c=relaxed/simple;
	bh=n0o+s3aiY3Bsw3fqfqelZWwzh9qVu/lo25kdUzlaTJI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=auBSdNUp02zvQEJPOBOjoW17exQiAsVdbF6przzJ2LBwCLuYxnOzof31MR4j9hV7+Gfz6dd/JhWRHGA+CUSBKhrWtGae96MpEekmKVmK4yDaM435N6F1QmcikobyzhxaLCY8VroBF6JDW17nz1diBQCeVYVnZOmg2sK1oIA0X9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pVHehoUF; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23BFEC0006;
	Thu, 31 Oct 2024 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730391248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0o+s3aiY3Bsw3fqfqelZWwzh9qVu/lo25kdUzlaTJI=;
	b=pVHehoUF8pW4Qa2282JzDFtPU04KfzlzIxAbszb4P968e5MJa90O1zSyM+ikSZDVsVvLcE
	RtyQsl9G9LymtJRvP1c1NLx+JsSRL/ALz3qfBWuinM4hZRDqWsnOWF6+57Mqf77U2JIXsF
	nl52gOg46uHvXvw3VHK6UkMmjNZhVXsCGVc+4GlcKx8l97af1+PXPDSfnznH187Ll4GofN
	jaO5j8DvGgyiAp6o5ns62uVWzkxjHc0Vudr8B5kDWY1DbCM1U9fAfIBUIsSw7+MZFhbPiU
	VAbW7oGRhTcTfXSvt+3azmrUnExu7Rg80E3ZrNiZhH8GeipwyUcNX5I8RRgcYw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 17:14:06 +0100
Message-Id: <D5A4I4MRPY8J.OBNCJBOHUTM5@bootlin.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v3 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hi Andi,

On Wed Oct 9, 2024 at 4:01 PM CEST, Th=C3=A9o Lebrun wrote:
> Three patches are about adding Mobileye EyeQ6H support to the Nomadik
> I2C controller driver, in the same vein as was done a few months ago
> for EyeQ5.
[...]
> Three patches are about supporting higher speeds (fast-plus and
> high-speed).

I come in checking. What's your state of mind about that series?

Rob has given his Reviewed-By on both dt-bindings patches, and Linus
gave his on all patches. I can send a new revision taking the three
Reviewed-By trailers from this V3 if you like.

Also, i2c-host-next is free of conflicts on Nomadik files.

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

