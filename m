Return-Path: <linux-i2c+bounces-3340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A48B7667
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 14:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9786C28576B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 12:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9AF172BDE;
	Tue, 30 Apr 2024 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="pRrgql8g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CD17279C;
	Tue, 30 Apr 2024 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481753; cv=none; b=CkwTiMwyWOuq7coOE1aMeOvRuqxOadIAeE2k/StM/kStq3AFaGg6LugHmH6mSAgtRCDLdbdNzIGBhq6qWurt9+d5A8Ztjpy0rQWQrPp93HYegpMlcmI+3HPcJSLfrv29/UFHdmydwkmvqAMzw9Y8WeXfKFoHd9rjSYq0lJs/cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481753; c=relaxed/simple;
	bh=h1L/HFA86d8yYp7QrNCUAGu7UScmEPtBVcWRfNzKEnY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CmiubbLhj9Yw3/BbtK/WVvgSUYhAWwkfpwCcOJ9jKWnSVq5hC7ZV8Vf3/zDTRjnmrzKGFoaCESA1/gVuoZKb61WF2/CFWUeYxml3Fv4youWqQnMJH66+y0hKoRXzbKDl5JT7jFSb2Xsks9DkhGRcijx/HYERjabjh66Eck44hmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=pRrgql8g; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1714481392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rwUo9fW2TVE8Ef255vklCN/02eGVq/9QqsXdrnT9H4A=;
	b=pRrgql8gXGvkBcFrqAfrVkBEdBtDICNZvNLy29XU8ZUF5SRr5aoK8WgojRsT2aOLGS52Uh
	84Ok/Vzr/82s8p+FIfxrabWY+HgGdoDDRX/e1JfdXR5n/6PABifzC5YGvfzOk0C2rltE9O
	tnRDIpTubyB8TDEDfL5haERyG2zYtcU=
Message-ID: <1a72ad2d6f72805de2c99db8ba8ea984711da81b.camel@crapouillou.net>
Subject: Re: [PATCH 11/15] i2c: jz4780: use 'time_left' variable with
 wait_for_completion_timeout()
From: Paul Cercueil <paul@crapouillou.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 30 Apr 2024 14:49:50 +0200
In-Reply-To: <20240427203611.3750-12-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
	 <20240427203611.3750-12-wsa+renesas@sang-engineering.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFC
 qaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IWYXnd
 JO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN70
 62DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOt
 X0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEA
 AYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/
 Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmc
 Gu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2z
 McLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/
 7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2c
 LUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le samedi 27 avril 2024 =C3=A0 22:36 +0200, Wolfram Sang a =C3=A9crit=C2=A0=
:
> There is a confusing pattern in the kernel to use a variable named
> 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns
> like:
>=20
> 	timeout =3D wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
>=20
> with all kinds of permutations. Use 'time_left' as a variable to make
> the code
> self explaining.
>=20
> Fix to the proper variable type 'unsigned long' while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/i2c/busses/i2c-jz4780.c | 22 +++++++++++-----------
> =C2=A01 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-jz4780.c
> b/drivers/i2c/busses/i2c-jz4780.c
> index 55035cca0ae5..7951891d6b97 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -565,7 +565,7 @@ static inline int jz4780_i2c_xfer_read(struct
> jz4780_i2c *i2c,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int idx)
> =C2=A0{
> =C2=A0	int ret =3D 0;
> -	long timeout;
> +	unsigned long time_left;
> =C2=A0	int wait_time =3D JZ4780_I2C_TIMEOUT * (len + 5);
> =C2=A0	unsigned short tmp;
> =C2=A0	unsigned long flags;
> @@ -600,10 +600,10 @@ static inline int jz4780_i2c_xfer_read(struct
> jz4780_i2c *i2c,
> =C2=A0
> =C2=A0	spin_unlock_irqrestore(&i2c->lock, flags);
> =C2=A0
> -	timeout =3D wait_for_completion_timeout(&i2c->trans_waitq,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> msecs_to_jiffies(wait_time));
> +	time_left =3D wait_for_completion_timeout(&i2c->trans_waitq,
> +						msecs_to_jiffies(wai
> t_time));
> =C2=A0
> -	if (!timeout) {
> +	if (!time_left) {
> =C2=A0		dev_err(&i2c->adap.dev, "irq read timeout\n");
> =C2=A0		dev_dbg(&i2c->adap.dev, "send cmd count:%d=C2=A0 %d\n",
> =C2=A0			i2c->cmd, i2c->cmd_buf[i2c->cmd]);
> @@ -627,7 +627,7 @@ static inline int jz4780_i2c_xfer_write(struct
> jz4780_i2c *i2c,
> =C2=A0{
> =C2=A0	int ret =3D 0;
> =C2=A0	int wait_time =3D JZ4780_I2C_TIMEOUT * (len + 5);
> -	long timeout;
> +	unsigned long time_left;
> =C2=A0	unsigned short tmp;
> =C2=A0	unsigned long flags;
> =C2=A0
> @@ -655,14 +655,14 @@ static inline int jz4780_i2c_xfer_write(struct
> jz4780_i2c *i2c,
> =C2=A0
> =C2=A0	spin_unlock_irqrestore(&i2c->lock, flags);
> =C2=A0
> -	timeout =3D wait_for_completion_timeout(&i2c->trans_waitq,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> msecs_to_jiffies(wait_time));
> -	if (timeout && !i2c->stop_hold) {
> +	time_left =3D wait_for_completion_timeout(&i2c->trans_waitq,
> +						msecs_to_jiffies(wai
> t_time));
> +	if (time_left && !i2c->stop_hold) {
> =C2=A0		unsigned short i2c_sta;
> =C2=A0		int write_in_process;
> =C2=A0
> -		timeout =3D JZ4780_I2C_TIMEOUT * 100;
> -		for (; timeout > 0; timeout--) {
> +		time_left =3D JZ4780_I2C_TIMEOUT * 100;
> +		for (; time_left > 0; time_left--) {
> =C2=A0			i2c_sta =3D jz4780_i2c_readw(i2c,
> JZ4780_I2C_STA);
> =C2=A0
> =C2=A0			write_in_process =3D (i2c_sta &
> JZ4780_I2C_STA_MSTACT) ||
> @@ -673,7 +673,7 @@ static inline int jz4780_i2c_xfer_write(struct
> jz4780_i2c *i2c,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (!timeout) {
> +	if (!time_left) {
> =C2=A0		dev_err(&i2c->adap.dev, "write wait timeout\n");
> =C2=A0		ret =3D -EIO;
> =C2=A0	}


