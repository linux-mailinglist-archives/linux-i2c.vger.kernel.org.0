Return-Path: <linux-i2c+bounces-5658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A195B232
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5BE1C2392C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0554E18660F;
	Thu, 22 Aug 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="g9+78//V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A9186614;
	Thu, 22 Aug 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319785; cv=none; b=g+r2TAeqO4hNV/hsdn/8OVtg9g7LAi/KDMyAzuUpPLt942FwkkwFNgkZR5ma/MqZ0FkHKvHPogSUSf6d8wZhzMT309LXIhd3yZCpIsCAdqhO2IwRmWKJGTRakla3VnkLXOFIX8c5bVreY3PKTdP9SL5uBtD7DFsqQrJ4BnwRLF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319785; c=relaxed/simple;
	bh=GqWLqyuEja4Q0JOsfqAlVMLVNeplXtpPD4HXOSMp6dw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzIXbh9pjPcptjYpHb0msLQ8Lz/wII22J8/VY4yoDEdWdM+q2gWOl4SFoHN0pC9668wd6Bebvd8CboE75dD6tH/4m9V/7vgvPj/tb1OiO7QC/5agRBI2sQKZCdiEV8RoyWnvv6dH+vIjlUvQbeAVPzOry9E8PJUNoVejiXw7dIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=g9+78//V; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1724319338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WN+VthHd3oguprV2+gdYjxF24d7fL0D3mFHfDOvyKpo=;
	b=g9+78//V/pjfc5+pnhlgQPOUfA1KZgWIRotPAgc5Ei40ndZ7sccQ7C9ttkJCz2H1R9ABXO
	vljARa1qBeFvPoOsA2oz2Bk0XZYS/TVjc/rLvTJNmVyCZwqogacWuCh/oDLHOa81Ws1azA
	jMlQkIHPouPTq5e/36/NChiC1tguDvQ=
Message-ID: <1473866ced990d435f31e541e03d1676aa04b4ae.camel@crapouillou.net>
Subject: Re: [PATCH 2/2] i2c: jz4780: Use devm_clk_get_enabled() helpers
From: Paul Cercueil <paul@crapouillou.net>
To: Rong Qianfeng <rongqianfeng@vivo.com>, Wolfram Sang
	 <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com
Date: Thu, 22 Aug 2024 11:35:36 +0200
In-Reply-To: <20240822025258.53263-3-rongqianfeng@vivo.com>
References: <20240822025258.53263-1-rongqianfeng@vivo.com>
	 <20240822025258.53263-3-rongqianfeng@vivo.com>
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

Hi Rong,

Le jeudi 22 ao=C3=BBt 2024 =C3=A0 10:52 +0800, Rong Qianfeng a =C3=A9crit=
=C2=A0:
> The devm_clk_get_enabled() helpers:
> =C2=A0=C2=A0=C2=A0 - call devm_clk_get()
> =C2=A0=C2=A0=C2=A0 - call clk_prepare_enable() and register what is neede=
d in order
> to
> =C2=A0=C2=A0=C2=A0=C2=A0 call clk_disable_unprepare() when needed, as a m=
anaged resource.
>=20
> This simplifies the code and avoids the calls to
> clk_disable_unprepare().
>=20
> While at it, remove the goto label "err:", and use its return value
> to=20
> return the error code.
>=20
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

With a small suggestion below.

> ---
> =C2=A0drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
> =C2=A01 file changed, 6 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-jz4780.c
> b/drivers/i2c/busses/i2c-jz4780.c
> index 4aafdfab6305..f5362c5dfb50 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct
> platform_device *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, i2c);
> =C2=A0
> -	i2c->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> =C2=A0	if (IS_ERR(i2c->clk))
> =C2=A0		return PTR_ERR(i2c->clk);
> =C2=A0
> -	ret =3D clk_prepare_enable(i2c->clk);
> -	if (ret)
> -		return ret;
> -
> =C2=A0	ret =3D of_property_read_u32(pdev->dev.of_node, "clock-
> frequency",
> =C2=A0				=C2=A0=C2=A0 &clk_freq);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "clock-frequency not specified
> in DT\n");
> -		goto err;
> +		return ret;
> =C2=A0	}

Since there is no more special handling needed here, you could just:
if (ret)
    return dev_err_probe(&pdev->dev, ret, "clock-frequency...\n");

And the same for the other error handling paths that you changed.

I wouldn't request a V2 just for that though.

Cheers,
-Paul

> =C2=A0
> =C2=A0	i2c->speed =3D clk_freq / 1000;
> =C2=A0	if (i2c->speed =3D=3D 0) {
> =C2=A0		ret =3D -EINVAL;
> =C2=A0		dev_err(&pdev->dev, "clock-frequency minimum is
> 1000\n");
> -		goto err;
> +		return ret;
> =C2=A0	}
> =C2=A0	jz4780_i2c_set_speed(i2c);
> =C2=A0
> @@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct
> platform_device *pdev)
> =C2=A0
> =C2=A0	ret =3D platform_get_irq(pdev, 0);
> =C2=A0	if (ret < 0)
> -		goto err;
> +		return ret;
> =C2=A0	i2c->irq =3D ret;
> =C2=A0	ret =3D devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq,
> 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(&pdev->dev), i2c);
> =C2=A0	if (ret)
> -		goto err;
> +		return ret;
> =C2=A0
> =C2=A0	ret =3D i2c_add_adapter(&i2c->adap);
> =C2=A0	if (ret < 0)
> -		goto err;
> +		return ret;
> =C2=A0
> =C2=A0	return 0;
> -
> -err:
> -	clk_disable_unprepare(i2c->clk);
> -	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void jz4780_i2c_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct jz4780_i2c *i2c =3D platform_get_drvdata(pdev);
> =C2=A0
> -	clk_disable_unprepare(i2c->clk);
> =C2=A0	i2c_del_adapter(&i2c->adap);
> =C2=A0}
> =C2=A0


