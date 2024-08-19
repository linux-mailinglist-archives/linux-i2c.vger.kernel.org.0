Return-Path: <linux-i2c+bounces-5536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E392E957293
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 19:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 088CD1C23208
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 17:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7643B188CC2;
	Mon, 19 Aug 2024 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="MM8rOpdc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8E7D531;
	Mon, 19 Aug 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090376; cv=pass; b=XaHsoJYriE1sjcmSYUnjrN6f2q0dpuMlOFdXsLnVcYqaPDCRnrdHasDgo5S402w+f9uPx2584ZPqgHGBQybSXL2VGoiv6Qm06haks/8Adix/GRyseNJjSSadkUI4XLlDtqkBaq5Cw79XXJ5zX7eQW1rIFTvNhRwAXboO1bH8+ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090376; c=relaxed/simple;
	bh=o6P0nZ14SojOcYFxiCK7txSvI4RmGN+OJHmCKCGY1S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pw79p/KElsgZ/zJcb7AyDvakGU7Vqx3dVl9sQMJfep2/3YbJkXb8xDNI6Z6QhTB7xxJYAJ4mwLrfq1hqr3cX3PohjNOTcTcV2miwg58LqL3jYZAsryPGLzV4EcGpvXJ0Ghjx0LD4amuOSVzDTTMn7nSuSu8QLzdBqvQGp6An1Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=MM8rOpdc; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724090294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J6r5s7/Z8JeFN/26tvSLxRD9tuH13mCXG//biHkwArz4lxH9bEabeMCfhvwX1Jz6HI+dw6snHomGANxT1hNZ4gmBIBpe1s52pgQDfjLJDsrus4+aGyRLSHZwiI1OK2/btb4jej9p9puqNR4b+OuBMRSzaUI9Cizfk+2ugLtMiTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724090294; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pNG01ooGieLYITjXohGoGYVq/b4PMFucDskno7kh9Yo=; 
	b=Booe36Q8WD2x0h5CZNUq1hzMG6xAMF+j7zKV9UZBzEgUZVpK2heJBENHFKJBiZ5VchEQOO9xOMfac2H4zjNZ29O+Ta1PtcMbgpD9GzE0e8GO3yc06cHXQorKxx8AcbAjkuNOop7F20t0Y3nLwoNJomZM+it9Ecc2Y4ZP1JOhqJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724090294;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=pNG01ooGieLYITjXohGoGYVq/b4PMFucDskno7kh9Yo=;
	b=MM8rOpdcrt7xe+eScEzW5zHxUcQjxiueHE/FDnRu8/Pe0U3Af0w1LI2u+gCz+/G/
	975sA/Tg6i+P+y1npppA4SDz/yTTZtVhb8uieAVLaVB2m/QZkDJVs3FboGR/vh1tRmR
	2i9Gfc92wHxxstL1Gg65syWLiCQzCrdWZmGFAAi8=
Received: by mx.zohomail.com with SMTPS id 17240902923861007.2839847459757;
	Mon, 19 Aug 2024 10:58:12 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
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
Date: Mon, 19 Aug 2024 13:59:45 -0400
Message-ID: <23696360.6Emhk5qWAg@trenzalore>
In-Reply-To: <21547916.mFnZMskM5D@diego>
References:
 <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-10-detlev.casanova@collabora.com>
 <21547916.mFnZMskM5D@diego>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Wednesday, 14 August 2024 11:31:04 EDT Heiko St=C3=BCbner wrote:
> Hi Detlev,
>=20
> Am Freitag, 2. August 2024, 23:45:36 CEST schrieb Detlev Casanova:
> > This device tree contains all devices necessary for booting from network
> > or SD Card.
> >=20
> > It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> > SDHCI (everything necessary to boot Linux on this system on chip) as
> > well as Ethernet, I2C, SPI and OTP.
> >=20
> > Also add the necessary DT bindings for the SoC.
> >=20
> > Signed-off-by: Liang Chen <cl@rock-chips.com>
> > Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> > Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > [rebase, squash and reword commit message]
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>=20
> looks like (since 2019) there is a strong suggestion for having a soc nod=
e.
>=20
> See Krzysztof's mail in
>   =20
> https://lore.kernel.org/all/6320e4f3-e737-4787-8a72-7bd314ba883c@kernel.o=
rg
> / that references
>     Documentation/devicetree/bindings/writing-bindings.rst [0]
>=20
> So I guess we should probably follow that - at least for new socs for now.

That make sense, but what is exactly covered by MMIO devices ? everything=20
except cpus, firmware, psci and timer ?

> Heiko
>=20
> [0]
> https://elixir.bootlin.com/linux/v6.11-rc1/source/Documentation/devicetre=
e/
> bindings/writing-bindings.rst#L90





