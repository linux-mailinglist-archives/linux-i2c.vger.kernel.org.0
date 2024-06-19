Return-Path: <linux-i2c+bounces-4115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932C90F50F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 19:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4618C1F22AA8
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 17:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A84156237;
	Wed, 19 Jun 2024 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXJb9Pcj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FAE339A8;
	Wed, 19 Jun 2024 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818051; cv=none; b=aqTcYUQXM3ao9/aSguUT7roih040MrA4BjrjeZ+06B44S59hg5LcMJJWds+wdfmDjrOe0cGkKz86xkdgqwnZCkjRV6DjjGT57ZpTPtSHLWFD7LVNTI1sEx/QOH0gcWXlOu+c+FAiBB7cFS6C5/MSWwOuDWLQPsEz72L0hUSv1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818051; c=relaxed/simple;
	bh=Rnex5JNhxKQCf5yHFRYCGEwnY7umcsl6iVUbeibuU4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SS0OzkUZUu3s7KJdq8vEcZ7c/aYmOUrrdnzsuqjsxKELAXjnoZA2gJygMaCtTdv1ZusV0Q8gOvEn+e/KDpXkl8bKQbRnEZP1/tN6f2e7tsl77n/DOnVb0hjrakvg88QDfj77Q8nZra+tJiyxPiyETiO7/dxLVCxtrn1QMbiVPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXJb9Pcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0590C32786;
	Wed, 19 Jun 2024 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818050;
	bh=Rnex5JNhxKQCf5yHFRYCGEwnY7umcsl6iVUbeibuU4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXJb9PcjkY2X1Fqqmt8e/n7x1YemeoPPoWMO1Z1jq+u8gQ6qCAK3dIB+WByTnBcJ7
	 D+EKEDfKHkfHDOoH7N9hhC53d6YaSD16alIqwYFV6O23mlePAZQluA4Pr12/OEds91
	 4Yh2P19ekSo3vKJO4dcsyV1UFdO8bD4AhiGkq/4UlZNO1TrwHn/obVZsJsg5H4j6lS
	 YE2xip64WqQCU3BquM6/p6V/AldfYXE+HSogTM9/72ACoM+G4TnxscIUldNNwggpHP
	 JZuGXDahiv6TdZ3BLu7Rqbc+mYLZVqExu6Qyb+a6B3JO9pT/L+8E3KfWjwH3nQtB4J
	 po47kbRiRbZTw==
Date: Wed, 19 Jun 2024 18:27:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: convert to dt schema
Message-ID: <20240619-exemplify-tabloid-9d15e5005513@spud>
References: <20240619154941.144011-2-kanakshilledar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RH7b0jy6yN7Cw144"
Content-Disposition: inline
In-Reply-To: <20240619154941.144011-2-kanakshilledar@gmail.com>


--RH7b0jy6yN7Cw144
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 09:19:36PM +0530, Kanak Shilledar wrote:

$subject is missing a prefix for the device in question.

> diff --git a/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml b=
/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
> new file mode 100644
> index 000000000000..79d6774dd54f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nxp,lpc1788-i2c.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nxp,lpc1788-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP I2C controller for LPC2xxx/178x/18xx/43xx
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@mleia.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc1788-i2c
> +
> +  reg:
> +    description: physical address and length of the device registers

Drop all of these descriptions as they're obvious, other than...

> +    maxItems: 1
> +
> +  interrupts:
> +    description: a single interrupt specifier
> +    maxItems: 1
> +
> +  clocks:
> +    description: clock for the device
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: the desired I2C bus clock frequency in Hz

=2E.maybe this one. Otherwise this looks okay to me.

Thanks,
Conor.

> +    default: 100000
> +
> +  resets:
> +    description: reset for the device
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

These two come for free with the ref to i2c-controller.yaml :)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/lpc18xx-ccu.h"
> +
> +    i2c@400a1000 {
> +        compatible =3D "nxp,lpc1788-i2c";
> +        reg =3D <0x400a1000 0x1000>;
> +        interrupts =3D <18>;
> +        clocks =3D <&ccu1 CLK_APB1_I2C0>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +    };
> --=20
> 2.45.2
>=20

--RH7b0jy6yN7Cw144
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMU/gAKCRB4tDGHoIJi
0sGHAP4g3+hIwfKb7xaf7XuqndD2LwEcQZhcfUAKlFVfZeUqewD/flKPkwXSVu1E
dmuDqAz/Gr5I39tTkIGwN/fx38BMvAY=
=Ntw3
-----END PGP SIGNATURE-----

--RH7b0jy6yN7Cw144--

