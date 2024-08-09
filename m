Return-Path: <linux-i2c+bounces-5250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B276494D02E
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 14:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22AC9B22AD8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 12:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36FC194A4C;
	Fri,  9 Aug 2024 12:29:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749318E02F;
	Fri,  9 Aug 2024 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206541; cv=none; b=VQwQmC/nN4mWBvR1tH9jsBjB+crj1INlSO6n5spdvow/V05MGwNd9xn+c4vYpTs1MNVaiOT/utkAcP+8Ei2Y/C+/ochaKztQ9Q/5nkvJedZ7RnwCnr72sZrN8+os2dqm4f8+P03tlbzlEggn7P3k3Mdya57/uJJHRbxRAkSo8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206541; c=relaxed/simple;
	bh=QhTmdNiPQBdgYv29JclUBwXooYWQFaOtO2exgAChwo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+1164yTBkB56TE98dSp1PV0f0AGV7EkDMWec+BgjnHnzUoPsoULL/Ry/qHVXtp1PWOJ0zP4RQBpTYfKHViyl6sE5tSwwLRAdP902N8tB1AdRVTJS9+6n7F1SdR3gh2gYRGPMSf+odeRNGzLpTvDhl+c1tQQZuYRB/NCrmFD2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b02.versanet.de ([83.135.91.2] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1scOiz-0006Nc-37; Fri, 09 Aug 2024 14:28:05 +0200
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
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 03/10] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Fri, 09 Aug 2024 14:28:03 +0200
Message-ID: <2741894.hTDNKPQEx9@diego>
In-Reply-To: <20240802214612.434179-4-detlev.casanova@collabora.com>
References:
 <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 2. August 2024, 23:45:30 CEST schrieb Detlev Casanova:
> Just like RK356x and RK3588, RK3576 is compatible to the existing
> rk3399 binding.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



