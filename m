Return-Path: <linux-i2c+bounces-7948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 238849C61D8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 20:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40A2AB290EF
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 18:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9992144D8;
	Tue, 12 Nov 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j86D5prC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427621A4F21;
	Tue, 12 Nov 2024 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434601; cv=none; b=WADkobK2tX8mm2ZcwSYPi21lLlLajuxNVjVkQVzs1Vvm/qbIe7VXorWnsNLuIzcmgpbsxXe7XjJCO8Iw8akViyihmqki8+yCHWwXjTv6p6KfJV//bdKKMMQALm9M+6/J4EU9LiAn3YOgrty9nFc61eAjw2UCIAUbqHUj0+opKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434601; c=relaxed/simple;
	bh=tpLHM8gccjiB9TKd4r6ak7Z24HirrOP9meXzwB/YKZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVbomWZ+9i2k/YhBlRHTNyIVKOZ031XiliW9Ki6znNuUOeemV50A9YXJLAYkaQpaDh2z2kZiDdPpe0MP3yjoU4BXu/qCfCePM9ijSOdGYnT+8iwXdwOiJ5IFy62oWD15IhkDNBps73oXS1EqQUoduOeHxJkjFONKzjjRYCBd2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j86D5prC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D05DC4CECD;
	Tue, 12 Nov 2024 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731434598;
	bh=tpLHM8gccjiB9TKd4r6ak7Z24HirrOP9meXzwB/YKZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j86D5prCl7y97ZHmVe6LqOL10fpsKI+gwn8KSrIMNXO7taHDN2iLHhMcYBZkXQvw7
	 RyZfPfyHQyNJeokKsxj3ACb9qLnduUkhFajLl5pMclUQg8EqWWXLkmYJCbTQe4VJ9A
	 rbhwn1xkFpFEsCI5d2pZROcoIv58b0yspcrtIf4teipc/6VCDwt5S1puGQXWGdZNyE
	 mkbckZ6xOUV9icV0L+RoCPDLwDPajWAJD0iQE4cTyn9KAd0BSk9yobhkVCwhyq5Dsr
	 3pFC5gI4M+ix39GLDHVQ/9a4mevaVYsILXh5XVhKSbG4MZc/LzyQLlhffBO5vGu7uO
	 Nq9OQSJ7hThoQ==
Date: Tue, 12 Nov 2024 18:03:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <20241112-aged-trailing-cffda6af0944@spud>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dWgxOHE1CCfc7zNw"
Content-Disposition: inline
In-Reply-To: <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>


--dWgxOHE1CCfc7zNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
> From: Troy Mitchell <troymitchell988@gmail.com>
>=20
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
>=20
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++=
++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b=
/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..e8cce360bf03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz.
> +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
> +    default: 100000
> +    minimum: 1
> +    maximum: 3300000

It's sufficient to define just default and max btw, the min is set in
i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible =3D "spacemit,k1-i2c";
> +        reg =3D <0xd4010800 0x38>;
> +        interrupt-parent =3D <&plic>;
> +        interrupts =3D <36>;
> +        clocks =3D <&ccu 90>;
> +        clock-frequency =3D <100000>;
> +    };
> +
> +...
>=20
> --=20
> 2.34.1
>=20

--dWgxOHE1CCfc7zNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzOYYgAKCRB4tDGHoIJi
0j7FAQCbUUgxdSJQs+FT/bE1oW0kpoCBE49kCO83l0nOmUPHpAEA85bBZy41ZiTq
ots9GS42MSa62edsAPDjufaHt6iEggc=
=L2u2
-----END PGP SIGNATURE-----

--dWgxOHE1CCfc7zNw--

