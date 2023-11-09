Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA0C7E6FD7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 18:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbjKIRJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 12:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjKIRJz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 12:09:55 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13FCD4A;
        Thu,  9 Nov 2023 09:09:53 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC4EC433C8;
        Thu,  9 Nov 2023 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699549793;
        bh=9BXK0KwCu9S5adkHNwW6vjWRO10k3ESEGRHXlcO7k/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HctJhaRjYsnF1NnuYAE8SxFhZeb1L+0wgXPBz6YJ5z4Hf4Tz1hCleQELLBMyaF6fy
         /n40B19t3cK436cE2fjQrDqjQumZ8UQ4o8++uJsQwikBRGD0m4amYP9oULeED+EClM
         4oSoknFoQxQoBT1kB2KnRCtWpF+FpwWRKE9bQ4LpRE59fJLRaPaIxrHA9OpezghYDZ
         OD5bwrt8mSSWXln1TpK1dRSrA/8KtwVUCaRMMFwr0jgKtf88SY+UHQLsfZGeyjeeke
         MA8ZNGW41A0qxJncJtnC+8R8SIYJTA2X4TIjMySw/46fUArKJLfQHH93tvpqv3uum9
         PVeKygKnXwgYA==
Date:   Thu, 9 Nov 2023 17:09:48 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231109-obscurity-dress-4d1d3370ea56@spud>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r1FpUNa/o+EDNg70"
Content-Disposition: inline
In-Reply-To: <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r1FpUNa/o+EDNg70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 09:49:45AM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 device.
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>=20
> Changelog:
>   v4 - Revise some inappropriate writing in yaml file
>   v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
>   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>      - Add type for adi,vrange-select-25p6
>      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms

Your changelog should be below the --- line.
You also omitted the tag I left on the previous version.
With the changelog fixed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 51 +++++++++++++++++++
>  MAINTAINERS                                   | 10 ++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/=
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..d26f34fb7ea7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4286 power monitors
> +
> +maintainers:
> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc4286
> +      - lltc,ltc4287
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,vrange-low-enable:
> +    description:
> +      This property is a bool parameter to represent the
> +      voltage range is 25.6 volts or 102.4 volts for this chip.
> +      The default is 102.4 volts.
> +    type: boolean
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Resistor value micro-ohms.
> +
> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        power-monitor@40 {
> +            compatible =3D "lltc,ltc4286";
> +            reg =3D <0x40>;
> +            adi,vrange-low-enable;
> +            shunt-resistor-micro-ohms =3D <300>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b275b8d6bd2..5d439cd64ecb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12609,6 +12609,16 @@ S:	Maintained
>  F:	Documentation/hwmon/ltc4261.rst
>  F:	drivers/hwmon/ltc4261.c
> =20
> +LTC4286 HARDWARE MONITOR DRIVER
> +M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> +F:	Documentation/devicetree/bindings/hwmon/ltc4286.rst
> +F:	drivers/hwmon/pmbus/Kconfig
> +F:	drivers/hwmon/pmbus/Makefile
> +F:	drivers/hwmon/pmbus/ltc4286.c
> +
>  LTC4306 I2C MULTIPLEXER DRIVER
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  L:	linux-i2c@vger.kernel.org
> --=20
> 2.25.1
>=20
>=20

--r1FpUNa/o+EDNg70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0SXAAKCRB4tDGHoIJi
0o3RAP9LvMj3vo2ZN2flNsUviDAWifQqZBjc1Lz6mrq8eBIYLwD+LT7EN17e+maE
VSFhoe0qSkogRKsDDObn6ROyOwNV7w4=
=HQG0
-----END PGP SIGNATURE-----

--r1FpUNa/o+EDNg70--
