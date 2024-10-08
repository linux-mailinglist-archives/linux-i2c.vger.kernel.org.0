Return-Path: <linux-i2c+bounces-7275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177899505E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 15:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232921C24B21
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 13:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22391DF96E;
	Tue,  8 Oct 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PckD2QJ8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800F1DF745;
	Tue,  8 Oct 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394802; cv=none; b=uyxCsFtD0wbEro6HquHl7W8lO6u3trfqsmako5iphsxrzWbtfhKjxhY8SWixJ0Q4UjprYbRLnLQ+OhHqvzixmKON+G7J9tF87iGWaM/0YS7rwgrvs/1zcqoovYorU5E4sUHIu85ci9hPXgUwyZXnNMlFVBXeJgwls39NiWZq5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394802; c=relaxed/simple;
	bh=+Pn2LCQcgWM7VPBtdDVQGvXG7mqRqcOY7mWUeNaGsRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFoAbeQkUTErCGOGKKVdOHj29InXVmNuduTQyD4GK2l8vAIufcd2J6hCFO0qHzVjM1OD7WPHvm8IkYOkgmmoSfAAHM8oidL3sj6b5Q89cMt0WQ1hB9IM21Icc4jMDHR2vmPpVUyOUj5hBcE1ITh9DRkoorVua5uX/TboDYP6Hps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PckD2QJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD992C4CED3;
	Tue,  8 Oct 2024 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394802;
	bh=+Pn2LCQcgWM7VPBtdDVQGvXG7mqRqcOY7mWUeNaGsRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PckD2QJ8hwXMdRrnfzbjrtzjdeTXqOYz9x7mpFwWY1RdzEKa5uFfG5sGXJmPgPoJ5
	 TGskjHa/2Drao3Ut1FkxtY9YvBh8iMDyIGanhHs3fmRNp2JCa5JnFyxyYXhSo0YszJ
	 jpztaUnHJBdIxoyBBo28R6Q5v8c++2LTl4iE2RX9SajJrzW91xyQkyiJZzyRXUtEeq
	 WsZUBMAwRnJNIIWGf1J1EPBR2V2dTAp1QwUIl8a2sq+qgXzDeqF3coWJeLDK8pDDPT
	 mHG58pWeGf2DrauPB1vT0MAfET6RAH1kSALZZLs833WQFQ+6c4XzywuUrwF4FAYVDE
	 ZYIdk8N+o0nqw==
Date: Tue, 8 Oct 2024 15:39:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 2/4] i2c: nomadik: support Mobileye EyeQ6H I2C controller
Message-ID: <oxcxs6n7y4bw33yfgaacd2cayf7otfochvlaofva2kabzjim6h@d6pam3gciepl>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
 <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>

On Tue, Oct 08, 2024 at 12:29:41PM +0200, Th=C3=A9o Lebrun wrote:
> Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
> as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
> and readb() by reusing the same `priv->has_32b_bus` flag.
>=20
> It does NOT need to write speed-mode specific value into a register;
> therefore it does not depend on the mobileye,olb DT property.
>=20
> Refactoring is done using is_eyeq5 and is_eyeq6h boolean local
> variables. Sort variables in reverse christmas tree to try and
> introduce some logic into the ordering.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-nomadik.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-no=
madik.c
> index ad0f02acdb1215a1c04729f97bb14a4d93f88456..ea511d3a58073eaedb6385002=
6e05b59427a69c6 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -6,10 +6,10 @@
>   * I2C master mode controller driver, used in Nomadik 8815
>   * and Ux500 platforms.
>   *
> - * The Mobileye EyeQ5 platform is also supported; it uses
> + * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they use
>   * the same Ux500/DB8500 IP block with two quirks:
>   *  - The memory bus only supports 32-bit accesses.
> - *  - A register must be configured for the I2C speed mode;
> + *  - (only EyeQ5) A register must be configured for the I2C speed mode;
>   *    it is located in a shared register region called OLB.
>   *
>   * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
> @@ -1046,8 +1046,6 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *=
priv)
>  	struct regmap *olb;
>  	unsigned int id;
> =20
> -	priv->has_32b_bus =3D true;
> -
>  	olb =3D syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id=
);
>  	if (IS_ERR(olb))
>  		return PTR_ERR(olb);
> @@ -1070,13 +1068,15 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev=
 *priv)
> =20
>  static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id =
*id)
>  {
> -	int ret =3D 0;
> -	struct nmk_i2c_dev *priv;
> -	struct device_node *np =3D adev->dev.of_node;
> -	struct device *dev =3D &adev->dev;
> -	struct i2c_adapter *adap;
>  	struct i2c_vendor_data *vendor =3D id->data;
> +	struct device_node *np =3D adev->dev.of_node;
> +	bool is_eyeq6h =3D of_device_is_compatible(np, "mobileye,eyeq6h-i2c");
> +	bool is_eyeq5 =3D of_device_is_compatible(np, "mobileye,eyeq5-i2c");

You should use match data, not add compatibles in the middle of code.
That's preferred, scallable pattern. What you added here last time does
not scale and above change is a proof for that.

Best regards,
Krzysztof


