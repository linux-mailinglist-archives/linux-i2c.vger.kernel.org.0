Return-Path: <linux-i2c+bounces-5555-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569B957692
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 23:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEA451F22866
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 21:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE738176231;
	Mon, 19 Aug 2024 21:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wNRJuV+u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8B1598F4;
	Mon, 19 Aug 2024 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102833; cv=none; b=a66+hRrSMYzGto8IGj/YxVJ98B16mRr8RHiSYR/pFQIxLp9MnRSKpU4KgrPu3zYBUVahcabH0mb8X6emDOEBmfmkoOGcxOxNYoJEbFUmUM7LDPaBbuGffcZsnscp6E4FfpG87JlPaeJ+BrMATreJi9EeGLWQFnIebXej6Kp7hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102833; c=relaxed/simple;
	bh=+sOmpMxl05XLDPuo4r7/zihYOtpqvtWf8lxC2z/W41A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4/kFIYAn/QcoQdIk7PFH8ev4YFjCQsM19CZlHQbvaxSXxCJJI6DoYL024LzyU4g/A72dLgbY7GZ60JmNhHywrW8RWA+oFggpRk7CCP8IKkj9UNuHeyOPs2ryEHRfY8hGH6TY1zI2+0+4gGFm3KolKCb16qnby5fBhPIbO+QfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wNRJuV+u; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kT7Kuxp6fbaULbA/LwhMmUWF1CJosjyeQGtqZ9CJp+0=; b=wNRJuV+uiReaCGv60DiKRMQhAm
	eOMs1pRGa6EHvcjoApT6Mt5LM3b5GpPAKD1+j2Tktv+nGAFu2xbK8PDX9tn25zqFUuGjAMinpkdcZ
	CJ7+c3rDsJQPC8ZMbyvyVtnQlX7NzhAiLWUHdx1PlvLugrngoXqLffbvyJvrO5IEBY863rGZ30Uvz
	ArvLeDZnfGgT8JEyzDAE77cHFtE+YnHPG7LtEbxE5OUcyeQl5cGttOfYdRMKOQUAUB1R7pQImU0NT
	A1V3ZHPCQILEOpmUYokl/tQVOF2JmWyZe3ID0d8PRRxULB7x7tFRETjiKYukjEnC9kC1wfvW2EYOL
	K37fH8RA==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sg9tR-0003Xv-3A; Mon, 19 Aug 2024 23:26:25 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Muhammed Efe Cetin <efectn@protonmail.com>, Andy Yan <andyshrk@163.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 09/10] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Mon, 19 Aug 2024 23:26:44 +0200
Message-ID: <2553026.Sgy9Pd6rRy@diego>
In-Reply-To: <23696360.6Emhk5qWAg@trenzalore>
References:
 <20240802214612.434179-1-detlev.casanova@collabora.com>
 <21547916.mFnZMskM5D@diego> <23696360.6Emhk5qWAg@trenzalore>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Montag, 19. August 2024, 19:59:45 CEST schrieb Detlev Casanova:
> On Wednesday, 14 August 2024 11:31:04 EDT Heiko St=FCbner wrote:
> > Hi Detlev,
> >=20
> > Am Freitag, 2. August 2024, 23:45:36 CEST schrieb Detlev Casanova:
> > > This device tree contains all devices necessary for booting from netw=
ork
> > > or SD Card.
> > >=20
> > > It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> > > SDHCI (everything necessary to boot Linux on this system on chip) as
> > > well as Ethernet, I2C, SPI and OTP.
> > >=20
> > > Also add the necessary DT bindings for the SoC.
> > >=20
> > > Signed-off-by: Liang Chen <cl@rock-chips.com>
> > > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > > Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> > > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > > [rebase, squash and reword commit message]
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >=20
> > looks like (since 2019) there is a strong suggestion for having a soc n=
ode.
> >=20
> > See Krzysztof's mail in
> >   =20
> > https://lore.kernel.org/all/6320e4f3-e737-4787-8a72-7bd314ba883c@kernel=
=2Eorg
> > / that references
> >     Documentation/devicetree/bindings/writing-bindings.rst [0]
> >=20
> > So I guess we should probably follow that - at least for new socs for n=
ow.
>=20
> That make sense, but what is exactly covered by MMIO devices ? everything=
=20
> except cpus, firmware, psci and timer ?

if your node has a foo@mmio-address naming then it goes in there I guess



