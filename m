Return-Path: <linux-i2c+bounces-7904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860259C24DC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 19:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501C3284368
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 18:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA6E1A9B23;
	Fri,  8 Nov 2024 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK23fbaV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6D9194A49;
	Fri,  8 Nov 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090223; cv=none; b=kVTMbl6hNA+kq53t3h3lqmc93GQV5gVFnKpYJYYOmr3eSbm2eyR+PaXq0jfb1ufNvFl+T0rmOmvFsk6gpy2n5Ymo7AVvK5OLqt9gEspP3HMhjWTdQPZbSV22UOYb7E+3iCyp1Y1a7G9JTvS6D2jQlh27AxoPOBKnlrlOFu8dNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090223; c=relaxed/simple;
	bh=E1qodTO23N6fEjVBbWnX+Cjij/DtB0PL/py4ryiE1zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+qGNdii5zi4iuLd/+4wX0+T7gCS/6ebUAxU6OForH0q6Yx1xcMGtcC3bVS/BoERNagisk3c0lYPYuHSwQyQHc6HILYqhJef/mopV8MvMaKE8MmbIU5GhxoL3B6JlR8NMdEiM7qlKJnWE9npTC22HIUZfKFQFEWXjSfNyCP4HaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK23fbaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF39C4CECD;
	Fri,  8 Nov 2024 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731090223;
	bh=E1qodTO23N6fEjVBbWnX+Cjij/DtB0PL/py4ryiE1zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FK23fbaVjFEmYrm2ufOVC6VW/ctWgPcF83kUbqX6tG2xVRNotZtrl9nP18CMQfRbD
	 Bpsxy/XeMSbuQZSwQTw8G49TwnP5+lWGaWKSjNYsR74T29Y1QqO2suD2LruS6y6zqq
	 sNjBwFWRPi2+pzzsvLVWpN1YpI3u3UcgZTvro/yszMCHhLNuVZ88ifYS5SPA2s9qiV
	 OC6Ah3er9ZV7KbI8SH4HYMmqrGUoRJ4KXgs27WYockdUHewfRp8mxTaoLjrur0pRoU
	 7d7RSXUO6pA8YCEdqJYfbLMsCQDtP32DgOE7RNS+p0kchQ2lZNtVg32ubh+vX9SV4H
	 R/Oeu0JW2oHFg==
Date: Fri, 8 Nov 2024 18:23:37 +0000
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Message-ID: <20241108-reimburse-saucy-2682e370469a@spud>
References: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
 <20241108-fpc202-v1-1-fe42c698bc92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XDNiCDMGHlNuJKcl"
Content-Disposition: inline
In-Reply-To: <20241108-fpc202-v1-1-fe42c698bc92@bootlin.com>


--XDNiCDMGHlNuJKcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 04:36:53PM +0100, Romain Gantois wrote:
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
>  .../devicetree/bindings/misc/ti,fpc202.yaml        | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/misc/ti,fpc202.yaml b/Docu=
mentation/devicetree/bindings/misc/ti,fpc202.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ad11abe11e68aa266acdd6b43=
a5b425340bbbba8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/ti,fpc202.yaml
> @@ -0,0 +1,75 @@
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

Gotta say, this looks absolutely nothing like the other i2c-atr user!

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
> +  port0:

ports usually go in a ports node, and are port@0 not port0. That said,
these are i2c buses, so the node name would usually be i2c@ for those.
In fact, given you have i2c-mux as your node name, the binding for that
expects you to format your child nodes like '^i2c@[0-9a-f]+$'. Is there
a reason you can't just drop this ports business and go with a pattern
property here that restricts the pattern to '^i2c@[0-1]$'?

> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    description:
> +      Device port 0, accessible over I2C.
> +
> +  port1:
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    description:
> +      Device port 1, accessible over I2C.
> +
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        fpc202: i2c-mux@f {

The label here is uused, you should drop it.

Cheers,
Conor.

> +            compatible =3D "ti,fpc202";
> +            reg =3D <0xf>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +
> +            port0 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +            };
> +
> +            port1 {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.47.0
>=20

--XDNiCDMGHlNuJKcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZy5XKQAKCRB4tDGHoIJi
0h9BAP9BYW2dWfo7u+4uzLkmUh2erBiw5UUBSxqs4nj2SJvUKwD/ao7/K//aEknK
8sFWsA91FTWT8u/rWbOrsZl9gP9JJAM=
=i7XM
-----END PGP SIGNATURE-----

--XDNiCDMGHlNuJKcl--

