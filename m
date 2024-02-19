Return-Path: <linux-i2c+bounces-1873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BF85A61F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C814A282FDE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1511E539;
	Mon, 19 Feb 2024 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OUDi4Zxa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DF1DDF5;
	Mon, 19 Feb 2024 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353516; cv=none; b=Ik4+S8qJW51ge5YpTHzMGacxC5ho84OXaJ6U3ezfS9F9xbziEIXK17Udf7wjfyFfY44geTZo6HXRK2KJxwYJ6CT/J6JnVoEHNcU/EMRrXoAPr0qucUeatxORrt6mDKp/Mzm+PEg5kLKC9FLFJAZ6BeVrlHhkpfO+91oWFGL2ktE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353516; c=relaxed/simple;
	bh=ho99GpsLlVyNLlIgL8EaDAIa0KDiU9hFswI4+siTcPE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=t/ZmuMAcyLDeqpVz4gOBXI/kmTTgYdEUNbx2n3PWOSJwqM1QbwgqnZF1TvIGznma/ggDzBXGE26puTJzZ20H/FIoNpVaoAvON2p9h+bSZvbViMNzJtpaP7kFdMpseDO8vjoUN9TSdY/jjPxzdDHM7N6AqIS+qAU8yVDWXl8BPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OUDi4Zxa; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE72D40005;
	Mon, 19 Feb 2024 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708353512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ho99GpsLlVyNLlIgL8EaDAIa0KDiU9hFswI4+siTcPE=;
	b=OUDi4ZxaIhTt1u8DggtUyFiE7laXFp1LMYDlweFfiFHd0tfpYX7mHqH7Hrn759Ms4+WFcl
	1I28IJOXMLeugQrQlIEoUrsZrW/PCQBQszp3kgxN5Zi5YrsJKSjfKVQ4TyLgNHN8IAqkB5
	h8x/sFG6VWbSvAPfIhaZNHoYOB4KnJdgggHtqDmUCclr/aZLxgp7rey+wH2pz3F18YSHYm
	pc1h9QelXEzlsmK8avvDC2KR4hb12hBMtI5dXKXC6Jnwt+MZZCdMLcb0NTdGkKqfXnOSxV
	/iB1kete3Nj+MxB2XboCloOKyq+EzCl9C9p1onama0jCU/A9mQLU03LBiuIS2g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 15:38:31 +0100
Message-Id: <CZ94S0SE0WFN.1RS0SY3KNMWQQ@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 08/13] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
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
X-Mailer: aerc 0.15.2
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-8-19a336e91dca@bootlin.com>
 <CACRpkdbuTX50syD0CMFcZXBmAHw4nwpcSc-C1OOUQEA9WHqCwA@mail.gmail.com>
In-Reply-To: <CACRpkdbuTX50syD0CMFcZXBmAHw4nwpcSc-C1OOUQEA9WHqCwA@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Mon Feb 19, 2024 at 3:21 PM CET, Linus Walleij wrote:
> On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
> > The FIFO flush function uses a jiffies amount to detect timeouts as the
> > flushing is async. Replace with ktime to get more accurate precision
> > and support short timeouts.
> >
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Excellent patch. Thanks.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Somewhat related to this patch: while writing it, I noticed the total
timeout of flush_i2c_fifo() is 10 times the timeout. Without this
series, this means 10*200ms of busywaiting!

If you have an opinion on a more sensible option for this I could add a
patch to my V2. I don't know enough to pick a sensible value.

I'm unsure if it makes sense that the timeout of flush_i2c_fifo() is a
multiple of the transfer timeout. Does it make sense that those two
timeouts are correlated?

Big thanks for your review,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

