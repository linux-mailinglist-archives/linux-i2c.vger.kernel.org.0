Return-Path: <linux-i2c+bounces-8092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED49D4111
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 18:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45025B2E13A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 17:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393661607AC;
	Wed, 20 Nov 2024 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htf6KFMP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2029155742;
	Wed, 20 Nov 2024 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732122713; cv=none; b=qkmJYkLm4vc4ceT48VGGa5y3QItYBzeMWSeCZfNpHrC/OM1AH+Vt7gslDJz3s0luUUDKMjE7yoruyLkD77595Z67ubHRZO6H0qsSVGvhGUT/TmlGDKId8QnF52exi0RwV72jpdJjMQ1MZ11EN/ZMQ8dt69L33eXJuJhRAg9twxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732122713; c=relaxed/simple;
	bh=VqLXZHHF5Fsu/qHpCPLie3C1EsAICVv7NKvdM1FJX2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB2Q+EsN1HevfaIG5iacF040yy5abi7rLKl/1/TtIiMK0mslAU8VFEeIKkqTIarGHQ0JAb4DNWIRf6H39s9r1eAZjMNYHIOOt/PAQ0QkqYK5r3TsQizrtFy5UXj5do8UHi/3fB0bIaaYI9pNByqnaLj9LXi62R+o3QnKU977fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htf6KFMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A1DC4CECD;
	Wed, 20 Nov 2024 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732122712;
	bh=VqLXZHHF5Fsu/qHpCPLie3C1EsAICVv7NKvdM1FJX2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htf6KFMPX26YChMBl7D2v80W4p4HGoHL3Y4bQkhPkfC80Ip2a81CD8VtXtmlZv7cd
	 HM8jNf3fBEM8KHckklb3B508+vy4yvMeu38UKli4Yxxy/jWN9S7VXVbchpYdhOeWLd
	 BkUQBduLQTrVQvT1DhtyA99JLXCdmdGb7oYuw1+/DJIxHllMGvZ3Tz1DUhDU8AAhLc
	 ePF/YYlRRgjTECjntFlYiD4XT0lLxLxkOayv1Bt+Zv5vl+RDv/YTCLWCDL4revq9Tt
	 XPP/WyDfHSg3/YXLHQx4vJe5U/M1OYYHdYzj1QwL8/Fts0lAkIc9/3bVk/QcmWZjlL
	 X+IO9GztD1NBQ==
Date: Wed, 20 Nov 2024 17:11:46 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
Message-ID: <20241120-process-hulk-ecedcbf088f7@spud>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tnO2aouk9cuaI/A+"
Content-Disposition: inline
In-Reply-To: <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>


--tnO2aouk9cuaI/A+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
> add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
>     ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>     ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>     LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
>=20
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Why did you drop my ack?
https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/

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

--tnO2aouk9cuaI/A+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZz4YUgAKCRB4tDGHoIJi
0lWGAQCeKfqfC4k6HK47gzxSBIhux0vdbkTew1F44Lyp5cR3HwEA443zBoYImZMw
aWnm85TY4THnTOMhNDElEokAC5kzbAc=
=ZlEJ
-----END PGP SIGNATURE-----

--tnO2aouk9cuaI/A+--

