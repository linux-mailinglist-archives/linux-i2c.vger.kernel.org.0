Return-Path: <linux-i2c+bounces-7494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2909A66FC
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 13:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0944B25FD4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF341E7C16;
	Mon, 21 Oct 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="X5U62lAj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F667581A;
	Mon, 21 Oct 2024 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511370; cv=none; b=sOWz4kbIkVy8sQRkpVxKquDc4CF0EGFo2FOthRuIxtgpEm90//ekgtLYr9NaBOLuls2AhVAwRy45GK3g1mdR32r0RREvYsWToiENCmEANxF+h5f49gBQ7msUtFwb+N7+AETzTStri5drWj2Gu26A+2E0med3Ec6uWUj5T5fMNTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511370; c=relaxed/simple;
	bh=uyNblGNDjcEEEdZiYPjjBd4JM1pjG241newOSWQDLFE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qcOJlLKXaEfwX9iUm0J6mkR1f6H0UnIRFwc/6UesOsjNHDZiRntrFEn7WU3IY/ZFUeEh26zDl9BuNwaQi+w4JXhd5kPV9iomkvpcsTF0Crf76BJwt9XkCLnNh3HbPAQftvjTUHm1HMsDMIT6cmK2agu45CGaGtxCnduksu7zU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=X5U62lAj; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729511366;
	bh=ynpv70LgynLfXwRzZBGijnfOVKcOlHyDivF6n67p/a0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X5U62lAjpHb52sbnM+thpFoqHhHFqlG9am9kjKDaxlO+/ehGQolqSyXJOI3Az3xQI
	 sFWWxe+8i4h0FwU0H14eXpD2cpx4gX7SmSNe5c/S0VQzAs7T4p4WA1fLpCNQ2xww2d
	 M9DFsjeGwTH0ETddbtUE6qNxAzXvxchl2KFKk2LIjtBtKStHsQRB6QkQVHkOp/Nyf1
	 PBlXVBBjLqqr/h05iPP8lbAEKOJq8ese96ov4FOSUgLaTNgut+Ng5rYZUghs9fFgrd
	 +g1D4GOWbL3c8RCeNXOLwg7XhOTxGMGYiOg20RbxheS0+B/MgxkmirdJTcVClOTlRO
	 v369jtIGiTipA==
Received: from [192.168.68.112] (58-7-152-218.dyn.iinet.net.au [58.7.152.218])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E91DC684AD;
	Mon, 21 Oct 2024 19:49:22 +0800 (AWST)
Message-ID: <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tommy Huang <tommy_huang@aspeedtech.com>, brendanhiggins@google.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,  linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 21 Oct 2024 22:19:22 +1030
In-Reply-To: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tommy,

On Fri, 2024-10-18 at 11:49 +0800, Tommy Huang wrote:
> In the original code, the device reset would not be triggered
> when the driver is set to multi-master and bus is free.

That's not how I read the existing code. As it stands, if it's multi-
master and busy we do the recovery, however, if it's multi-master and
free, or busy but not multi-master, or free and not multi-master, then
we do the reset.

> It needs to be considered with multi-master condition.

Is there a specific circumstance you've found that's problematic? Can
you provide some more details about that scenario?

>=20
> Fixes: <f327c686d3ba> ("i2c: aspeed: Reset the i2c controller when timeou=
t occurs")
>=20
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index cc5a26637fd5..7639ae3ace67 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -716,14 +716,15 @@ static int aspeed_i2c_master_xfer(struct i2c_adapte=
r *adap,
>  	if (time_left =3D=3D 0) {
>  		/*
>  		 * In a multi-master setup, if a timeout occurs, attempt
> -		 * recovery. But if the bus is idle, we still need to reset the
> -		 * i2c controller to clear the remaining interrupts.
> +		 * recovery device. But if the bus is idle,
> +		 * we still need to reset the i2c controller to clear
> +		 * the remaining interrupts or reset device abnormal condition.
>  		 */
> -		if (bus->multi_master &&
> -		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
> -		     ASPEED_I2CD_BUS_BUSY_STS))
> -			aspeed_i2c_recover_bus(bus);
> -		else
> +		if ((readl(bus->base + ASPEED_I2C_CMD_REG) &
> +			ASPEED_I2CD_BUS_BUSY_STS)){
> +			if (bus->multi_master)
> +				aspeed_i2c_recover_bus(bus);

The change doesn't seem match the commit message. In this case you've
punched a hole - if the bus is busy but _not_ multi-master, we neither
do the reset _nor_ the recovery.

Which is what you intended? The implementation? Or the prose
description?

Now, back to the implementation, punching this hole seems reasonable on
the surface, but I guess we need to keep in mind that time_left has
also expired...

> +		} else
>  			aspeed_i2c_reset(bus);
> =20
>  		/*

Andrew

