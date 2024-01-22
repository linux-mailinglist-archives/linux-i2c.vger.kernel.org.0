Return-Path: <linux-i2c+bounces-1399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4B835E49
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 10:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE801C21AC5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 09:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB0939AE3;
	Mon, 22 Jan 2024 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSivbJZy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389739AD8;
	Mon, 22 Jan 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916017; cv=none; b=IVc2PHVUio42Wgg4l5xOLT58Y9u4qEEQ1unScMvCUqHvx9+7mgiVIsVt8CE+6/ZxQ8r+46w/GpDviVXRlyirMEAzvPxKlZmCuDF4GHzBspQHJrXpF0XlbUm5s+POnKhRrWeiog0fyMLsqBy+uGBPltaMzV4Mf88Gt0VGhILXPkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916017; c=relaxed/simple;
	bh=FEQhqxSV27zZJ+eMJHKx6BwCXQ+B3EXodIj+ZGRhYMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiNG895+TgS8DUdtJd2cqqfXITkT3lDag9y8+fXfoq4L4bNyqGqPTMviiYI8KFpBx02ZWwiuubtFZARdYLBDS3N9dwVRbi3jyKsgL/nU4y4Q4Kylc9F11AfWUyXIY+5IfCXOz5HyLz+L+coEnA73YuZ8QpFmLW0skHusnpyMB6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSivbJZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75667C433B1;
	Mon, 22 Jan 2024 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705916016;
	bh=FEQhqxSV27zZJ+eMJHKx6BwCXQ+B3EXodIj+ZGRhYMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSivbJZyjMXi8CBUBLt9HCaLfcfjX3qhxScAt1zF+wbszJMLD6ucqYNQYWIvaNgcv
	 1kYUaukIW+RDNQQAE1n5lr9fOP/Zi2webjTzn/zjQVvCfKGqArFqR4cEoq81FhofZ/
	 jEVSaKOdGMi0hgF5FWjBDlPeCHmZ0ATlZ57KWiqtER2upN0ozrOAXcBL0ysxALIg7Y
	 Ck5QBdKM/L3U8646BfJ1N7npHXohRjTDcy73GpgF3PYyX153eeD98k0dnS8/VoZvo/
	 ixAo5YdN1YyKQvDWVm2zjVROcTvlBAg+F4Ece4ZdCWbYcwPYSZk2YL3mk9Hge47Nfn
	 gCzMIgIuaWKug==
Date: Mon, 22 Jan 2024 09:33:31 +0000
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] dt-bindings: i2c: imx-lpi2c: add i.MX95 LPI2C
Message-ID: <20240122-blade-saddling-784b57593913@spud>
References: <20240122091230.2075378-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IxqgPqMNTPtHQsCg"
Content-Disposition: inline
In-Reply-To: <20240122091230.2075378-1-peng.fan@oss.nxp.com>


--IxqgPqMNTPtHQsCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 05:12:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add i.MX95 LPI2C compatible entry, same as i.MX93 compatible
> with i.MX7ULP.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/D=
ocumentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 4656f5112b84..54d500be6aaa 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -24,6 +24,7 @@ properties:
>                - fsl,imx8qm-lpi2c
>                - fsl,imx8ulp-lpi2c
>                - fsl,imx93-lpi2c
> +              - fsl,imx95-lpi2c
>            - const: fsl,imx7ulp-lpi2c
> =20
>    reg:
> --=20
> 2.37.1
>=20

--IxqgPqMNTPtHQsCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa42awAKCRB4tDGHoIJi
0sXtAQDqKcW3ThYABJF7wDEf9gUZpjjOYvWKr08fw5UcV1ocwQEAmlvD2zONN6TB
hDd2AdTmLhZAzGLhgGRhjuV2YDJLBQo=
=S8yJ
-----END PGP SIGNATURE-----

--IxqgPqMNTPtHQsCg--

