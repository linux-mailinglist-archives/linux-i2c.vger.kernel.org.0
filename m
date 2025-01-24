Return-Path: <linux-i2c+bounces-9193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2DA1BA83
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 17:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD5F188DEB1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC291925AE;
	Fri, 24 Jan 2025 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np1zaFee"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC0770E2;
	Fri, 24 Jan 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737736418; cv=none; b=ukSjlBi0/7wGk+VhWtERVRv4F1NdixywbCVeBSKdHTMwdqLrFYfA5dNabc8eEBnRen66hdhspo8mJPWZ9VQSoDpJgheKFcXlMWEbNm10UNRRMpsqJk7BtA7aq1TkcRxCrH5ztdGF8qBg0ikwd7dOvAzbkkhRhk46iqqlqfxKwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737736418; c=relaxed/simple;
	bh=YNgbPfAlhce9LhRpIKdOJ9rI3Ylx5Xrd/4UQleJyQ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7Rqff9DyNxnaJMKoS7J6hn9eWOR81iYB+lzEvj8Zgyjvf2yuZj8+WgVODP6oxdevMMsPOOX1OdRwwV7pbBpwqybL5BZ5jYlCumJSs+2am9Fhs9bhJ/Hfn00Ch95p/Iq54r0sl43mXfKsjCHkzF6PuHP7z/dJ9RL4yxs/y89Esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np1zaFee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3342C4CED2;
	Fri, 24 Jan 2025 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737736418;
	bh=YNgbPfAlhce9LhRpIKdOJ9rI3Ylx5Xrd/4UQleJyQ9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Np1zaFeerLedDkUngOj+FpJ0MZhVDJFvpqAt72CNX7Xkvqr18v/RHWWmSEfHz9oXZ
	 dBQ/YsNIPWtkTJ8Sipc5SK/ZGm/XPig94QChgxf6LU964fGCU/tsq2sLsU6Ekm9KTw
	 nW6cHEC0DR6V6B8kwWPQFQYrCWfV3+8hfB7lflZ5VS9VITpMxiMyerAa1sUrnog/Fb
	 cTM7/JDOQU4cC/FLKy9RSUYTwyRXitAlyrunF63zHTY/jU0Bjqa7B/9qFttgHUd715
	 j3+YLySG8eWeXf93pZCwnC81STAUl6IsX7Fl5U7lksDIU56qkg4JfXDi81jzBxGSlo
	 JP18HLpfSIvGA==
Date: Fri, 24 Jan 2025 16:33:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: (pmbus/adp1050): Add adp1051,
 adp1055 and ltp8800
Message-ID: <20250124-dominion-hummus-7bb90d5fd7cd@spud>
References: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
 <20250124151746.1130-2-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wZqn+XQqP0G7hyBv"
Content-Disposition: inline
In-Reply-To: <20250124151746.1130-2-cedricjustine.encarnacion@analog.com>


--wZqn+XQqP0G7hyBv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 11:17:44PM +0800, Cedric Encarnacion wrote:
> Add support for adp1051, adp1055, and ltp8800.
>     ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>     ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>     LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
>=20
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/hwmon/pmbus/adi,adp1050.yaml         | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> index 10c2204bc3df..af7530093942 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
> @@ -10,16 +10,27 @@ maintainers:
>    - Radu Sabau <radu.sabau@analog.com>
> =20
>  description: |
> -   The ADP1050 is used to monitor system voltages, currents and temperat=
ures.
> +   The ADP1050 and similar devices are used to monitor system voltages,
> +   currents, power, and temperatures.
> +
>     Through the PMBus interface, the ADP1050 targets isolated power suppl=
ies
>     and has four individual monitors for input/output voltage, input curr=
ent
>     and temperature.
>     Datasheet:
>       https://www.analog.com/en/products/adp1050.html
> +     https://www.analog.com/en/products/adp1051.html
> +     https://www.analog.com/en/products/adp1055.html
> +     https://www.analog.com/en/products/ltp8800-1a.html
> +     https://www.analog.com/en/products/ltp8800-2.html
> +     https://www.analog.com/en/products/ltp8800-4a.html
> =20
>  properties:
>    compatible:
> -    const: adi,adp1050
> +    enum:
> +      - adi,adp1050
> +      - adi,adp1051
> +      - adi,adp1055
> +      - adi,ltp8800
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.39.5
>=20

--wZqn+XQqP0G7hyBv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5PA3AAKCRB4tDGHoIJi
0iOUAP90fO7JGnB0lfu6s8hAxWWlLlS2gAaktpvbUdJBJCVpWAD/XelKtqp/RHr4
hzhr+ws+8sgi7cwDO9UaDbSls8odPgQ=
=fari
-----END PGP SIGNATURE-----

--wZqn+XQqP0G7hyBv--

