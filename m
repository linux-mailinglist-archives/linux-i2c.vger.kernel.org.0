Return-Path: <linux-i2c+bounces-5274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8294DC08
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 11:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6B828212C
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0303B157464;
	Sat, 10 Aug 2024 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQ8QQzMg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92361D555;
	Sat, 10 Aug 2024 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723282738; cv=none; b=ktjE6bRK+rDfiZCM+voN//jDIUPAAQYLiAYgVLlNi4+uUQlQUpZIlMZOPYLz/HpoSrjaDiKMcNUwK4bTzvkGD8mwzI1iYceGoYxIa/M6jG1oDivi+3pSCy9FqqAcU6DWsMhhBL4MvY78iv15IELxHVFXK1YnUj8BkBwyTNr0/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723282738; c=relaxed/simple;
	bh=yGihDf4UPvnVbeBFvypXekjA1yNeJQAtpvjbIlX4CqY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DF3U/QTOEh8h02Mdb3ISpH/iyKPAeiafEonCAz2HAqgIzdxlucdzlw+DETAX7VjsexPyY6QvgIzCvts2RKO2HZqqI4dkxLm4caIheLY6VeFX50Wl3JSl9a+pygALSzdiKQaNz3pXVGB3Ad7pwBuP1zcZ/ou/NffJytXOt5IjLp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQ8QQzMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7004C32781;
	Sat, 10 Aug 2024 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723282738;
	bh=yGihDf4UPvnVbeBFvypXekjA1yNeJQAtpvjbIlX4CqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JQ8QQzMgM0Uvlfnfy3IDHI0GO+THTPSoCUsfXfJucyG/0X/0em3nRX+L9KNsXXZ9y
	 8wnRm4nDZzapTf67U24uTTXgedsk8EzUl+EZ+ApduQDyICVmTBxto13YZqc0/Dt9gv
	 OsN+fut7B13hM9gxcL0Pa6UjZa8rzbeZF9EOM2hrBIkXoh8j22QINgZcdoFDoXdG6C
	 XiUDJ0m140PfV33fX6virJsn1k8b3xaz2qQcLgn+vJ8gCNSu3gtXPm/0OrGarAwuOJ
	 WNAXfnpNNH6FAcPRD5L0xI/CFHpCAKocMg0ejq3QGJQiDFxurtE4/RKddRjLUIDPhq
	 HsS3LhS/n23pA==
Date: Sat, 10 Aug 2024 10:38:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, Dragan Simic
 <dsimic@manjaro.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov
 <alchark@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao
 <finley.xiao@rock-chips.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH 04/10] dt-bindings: iio: adc: Add rockchip,rk3576-saradc
 string
Message-ID: <20240810103842.19a60a22@jic23-huawei>
In-Reply-To: <66118cb8-595a-4149-84c9-0105a2949151@kernel.org>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
	<20240802214612.434179-5-detlev.casanova@collabora.com>
	<66118cb8-595a-4149-84c9-0105a2949151@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Aug 2024 11:47:44 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/08/2024 23:45, Detlev Casanova wrote:
> > Add rockchip,rk3576-saradc compatible string.
> > The saradc on RK3576 is compatible with the one on RK3588, so they are
> > used together in an arm of the oneOf.
> >   
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
> 

Applied to the togreg branch of iio.git and pushed out as testing initially
because otherstuff on that branch needs some build test before I make
a mess of linux-next.

Thanks,

Jonathan

