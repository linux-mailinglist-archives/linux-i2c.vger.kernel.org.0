Return-Path: <linux-i2c+bounces-9255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEBA251B8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 04:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 850EE3A1D8E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 03:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82778566A;
	Mon,  3 Feb 2025 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="XO0VtXFL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE2625A62D
	for <linux-i2c@vger.kernel.org>; Mon,  3 Feb 2025 03:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738553494; cv=none; b=D/UJPvbRxN9lQmmE9TsC642ch5EvXAZFg7Xv39M+b4vcVp011ARpcS0lgbH8c/m+hrGmdr3Me8Atfr/IYnf+IbBgL2JKqHzGSPMYS/JVF1B20gncsgcz1e8EzoZDwF01BHXL7A+E7KpYFs7gU0Zy/gyGPQASbAki6AmW8eZ6R2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738553494; c=relaxed/simple;
	bh=zIM0HNxOpd+mwy4yH9/zK7GjEdI1Hw/l7uc/DAJMasc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GzHbPzKVfNlhQsYrptGngKi+IH4YkqWbuhTiVMc0fJtgpwXPoDcLBvvIHxZpxEHZZ69RPvy3AJuV6upBdNt4i4S/j+SL5CpddCEx7PpMccaduPE7ebCkzTeACpA3sOA2jZG42GzxpVVAv0EUFVe4nttLXCGuz8bJCeJtWR0Z9Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=XO0VtXFL; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738553490;
	bh=zIM0HNxOpd+mwy4yH9/zK7GjEdI1Hw/l7uc/DAJMasc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XO0VtXFL/rr/RxhK4obFlxxlnRmLC1ovr8B0+KmZ9ZCElM/lv+YJze58gfCxjyZ6b
	 Fy7uZIiO6QjpVNDqiHuV6lBxx8GMdKO4ILWUdol5Jvu8jrOG1SKuhPPQnFkOItpORW
	 BV6APxJvd/wFp3W26kobYkA/Tfnnoh0PIxCJIPGkVyQjIaIsoedB3XgveECN9sPUm5
	 zdjEza8OepN34DJxomTF5bEnWFI0QArWiBk2/rlKGrn2yh3iGCenyY/0DOsxlH58f6
	 J0mNtcbyf3QmOADC9xfXMiVCQncv6X7hUkuBhJWh47Ho7hcxlI0pLvc/Xc/sIEdtcY
	 xHdyLl/JjkZjg==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C605873C54;
	Mon,  3 Feb 2025 11:31:28 +0800 (AWST)
Message-ID: <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Nullify bus messages after timeout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, ryan_chen@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org
Date: Mon, 03 Feb 2025 14:01:28 +1030
In-Reply-To: <20250131222941.798065-1-eajames@linux.ibm.com>
References: <20250131222941.798065-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-01-31 at 16:29 -0600, Eddie James wrote:
> For multimaster case, it's conceivable that an interrupt comes
> in after the transfer times out and attempts to use bus messages
> that have already been freed by the i2c core.

This description seems a little vague. Did you hit this case in
practice?

>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> =C2=A0drivers/i2c/busses/i2c-aspeed.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c
> b/drivers/i2c/busses/i2c-aspeed.c
> index 1550d3d552aed..e344dcc2233fe 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct
> i2c_adapter *adap,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * master command.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&bus->lock, flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0bus->msgs =3D NULL;

It feels like there's buggy code elsewhere in the driver that this is
protecting (broken state machine)? I've had a look at the
aspeed_i2c_master_irq() implementation and can't see what though, as we
take an early-exit (before indexing into bus->msgs) if bus-
>master_state is INACTIVE or PENDING.

Can you be a bit more specific about where the issue lies?

Andrew


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PEND=
ING)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus=
->master_state =3D
> ASPEED_I2C_MASTER_INACTIVE;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irqrestore(&bus->lock, flags);


