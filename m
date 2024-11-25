Return-Path: <linux-i2c+bounces-8210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DD9D8C2D
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 19:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D47228A3FA
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20191B87F0;
	Mon, 25 Nov 2024 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYJUBNaR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50F1B3943;
	Mon, 25 Nov 2024 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732559202; cv=none; b=Ju6OLHgxz4VuUy8da4i2cG2+Ao7sHidLatyPqwqLAphaAWLtKNVJ6D/2XKJS8gTJ82Y2VvFMAxKwkPdOyhtz6b1NoOotBQQx6FYWCsbF7918/W6+WyJ5Vy31gQ2Lsnuuzk2VcnuJWY+oYZTjuhsSCYgajPXV49ZZiwqA04xKXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732559202; c=relaxed/simple;
	bh=dIlnLnEZTpntVMOqJzYDY6xXyHJNFe5p+MNhUzw9vOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0ej39vs/dC9OCMuZc9NV16wyvrfFikZoPTZdcw3NZ/+CW88L+/sqq1+MO4FmewZybM5qyoHrhpGdZDmpqQ2ENOC9uLjoerxYTUwU1EdatsxImnECEbEH8X3v6pd/6RjF8fKpjWCnUPLQ3cAdpWy9TCHAJ1FpXYOYIAmhXgbrnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYJUBNaR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B74AC4CECE;
	Mon, 25 Nov 2024 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732559202;
	bh=dIlnLnEZTpntVMOqJzYDY6xXyHJNFe5p+MNhUzw9vOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYJUBNaRnthKhJTlHf87j8mUbYeKWIdzMsRpP+dH+JfyhFGsFKsVyesBziNw30f9v
	 ABYkNchLr2bOFhUn6PqrEHPu2XxYUE0SoV0SZ0KJPWelBCLCd5PH9ksf8n+3Blvx5q
	 SkVGberfNkTr433c3vu08fE6rRyvVjrvrGvn3rtpuBrcLR43KKJ7HqfpDHQa67lpJ3
	 A1kk5FvItMj1zBbQWJccJdKpVg3zsPQIA67io2twy2cd3zsffPXCzQiHd8j4ntdpXt
	 eCRn2Fgk6r4egMIX5b9f2XyAVAUNOn4MtiPjJI9z67fbEMnPaIi50e0gQaxXTn3B5k
	 n7VtOa+L7NHaQ==
Date: Mon, 25 Nov 2024 18:26:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Message-ID: <20241125-overhand-economist-5a3fc6339265@spud>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-1-34e86bcb5b56@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cqws6ipUry0wyICg"
Content-Disposition: inline
In-Reply-To: <20241125-fpc202-v3-1-34e86bcb5b56@bootlin.com>


--cqws6ipUry0wyICg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 09:45:15AM +0100, Romain Gantois wrote:
> The FPC202 dual port controller serves as a low speed signal aggregator f=
or
> common port types, notably SFP. It provides access to I2C and low-speed
> GPIO signals of a downstream device through a single upstream control
> interface.
>=20
> Up to two logical I2C addresses can be accessed on each of the FPC202's
> ports. The port controller acts as an I2C translator (ATR). It converts
> addresses of incoming and outgoing I2C transactions. One use case of this
> is accessing two SFP modules at logical address 0x50 from the same upstre=
am
> I2C controller, using two different client aliases.
>=20
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../devicetree/bindings/misc/ti,fpc202.yaml        | 96 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 102 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Docu=
mentation/devicetree/bindings/misc/ti,fpc202.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d0464a77cabed81301e27ac2f=
d4e7f943a027f2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/ti,fpc202.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI FPC202 dual port controller with expanded IOs
> +
> +maintainers:
> +  - Romain Gantois <romain.gantois@bootlin.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,fpc202
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  enable-gpios:
> +    description:
> +      Specifier for the GPIO connected to the EN pin.
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^i2c@[0-1]$":
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    description: Downstream device ports 0 and 1
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Downstream port ID
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - i2c@0
> +  - i2c@1

btw, why are both downstream ports required?

--cqws6ipUry0wyICg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0TBWwAKCRB4tDGHoIJi
0oJcAP9PTOaF3V2bg4xd6wRretaCNK05VyVFngG8VUgFNJT+mQEA08X3WhwZ8s3M
gSIZTYSag/xkOsNsSZao+4JAYnRkIgs=
=X4LX
-----END PGP SIGNATURE-----

--cqws6ipUry0wyICg--

