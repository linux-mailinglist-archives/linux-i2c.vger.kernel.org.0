Return-Path: <linux-i2c+bounces-7765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB89BBD68
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 19:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14F312831D8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 18:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D95A1CB9F4;
	Mon,  4 Nov 2024 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbiDShIR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DE518622;
	Mon,  4 Nov 2024 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730745894; cv=none; b=Se1AIt1hmDzOUaBw3KtzpDB4DnjJfYIkFZk4QtbdPFZ6UrGoN29lr35eOwruPlT6bjGNQdU0yJySZc0AWf97Kwg3DrWkWUwEEkWl8xvnhv1U0GY49H+evvuGizwDFqQnQH8cj8B301pW0ai5bOYJFQTYyc9eiZV7oyHAAo3cjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730745894; c=relaxed/simple;
	bh=NyVQlMFDaeFVbSuBOFcWlKWF0LNcMOH+vquUoGrumDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n40tpWE8P3pq0/l0PzcG+bVlfdhhO8+RLhqzkcLclljrRa37deX9e9m+iWViHvc2j+oHFp0fZe0RSPbMDjYLKyYlvAzShGmKiPqZ/4ceTyJO6PTuPIQOV0qc/uyRJdDNsj2ky/rE2pSLftrwy5ymEMlr+U4Us5dGu6Mm+Xfo+B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbiDShIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC926C4CECE;
	Mon,  4 Nov 2024 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730745893;
	bh=NyVQlMFDaeFVbSuBOFcWlKWF0LNcMOH+vquUoGrumDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbiDShIR362g7b/18qH1G6xpiy7jgylY+yFf0pA7MeeuWV7naItK3k4+IhwF4DbvM
	 y17iUtC3psiV61j7uMn20AUoUfVfo5jGYrmaCN/z1Bbl5KatvKCXXlhAHIx2m6QZb+
	 S7ZOL+Zhb+uPev7uH19R/bs0USYAfsCrWexUcD7qyD3rUEQcJ5odd/8KNj1xoZJi9d
	 /CBGTz/rcMyeZrOaogTAMm5LDPVjqvRyOesFK8gZ9BnNls2T5nvdW8YhyHP7v3tz9/
	 M6JWacSXYF1rv+AjRFW6+KSz8IQ+GSaVgT/i635DP8gahleh9xu9ugnVWKdARtLboK
	 G37IguSXP/jMw==
Date: Mon, 4 Nov 2024 18:44:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: imx: add SoC specific compatible
 strings for S32G
Message-ID: <20241104-stifling-remake-f5abdc8d82bc@spud>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
 <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v9eOVK6j83W6+2yi"
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>


--v9eOVK6j83W6+2yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 12:00:43PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> S32G2 and S32G3 SoCs use the same I2C controller as i.MX.
> But there are small differences such as specific
> <clock divider, register value> pairs.
> So add new compatible strings 'nxp,s32g2-i2c'and 'nxp,s32g3-i2c'
> for S32G2/S32G3 Socs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documen=
tation/devicetree/bindings/i2c/i2c-imx.yaml
> index 85ee1282d6d2..0682a5a10d41 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: fsl,imx1-i2c
>        - const: fsl,imx21-i2c
>        - const: fsl,vf610-i2c
> +      - const: nxp,s32g2-i2c
>        - items:
>            - enum:
>                - fsl,ls1012a-i2c
> @@ -54,6 +55,9 @@ properties:
>                - fsl,imx8mn-i2c
>                - fsl,imx8mp-i2c
>            - const: fsl,imx21-i2c
> +      - items:
> +          - const: nxp,s32g3-i2c
> +          - const: nxp,s32g2-i2c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--v9eOVK6j83W6+2yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykWDQAKCRB4tDGHoIJi
0v8DAP9XNX1ulct9ojS/foqv8ALtBOLXzFnt7aMuq3U19E2PBAEA/KdNUxINJJt1
gfRtCEPII6vTAjZsDFZkIl1RvT4MFQA=
=eMVA
-----END PGP SIGNATURE-----

--v9eOVK6j83W6+2yi--

