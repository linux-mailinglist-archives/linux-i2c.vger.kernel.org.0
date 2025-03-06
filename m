Return-Path: <linux-i2c+bounces-9749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05444A5511A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 17:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 136677A866C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 16:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CC923FC52;
	Thu,  6 Mar 2025 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8/rVKxc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5D23F42D;
	Thu,  6 Mar 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278472; cv=none; b=mQ1tDK4z6lgbZzOY+OBwMPlRv38XTYL0XJpKMx7bSOZXzKBeWnr+a0PaFkAxg4+5oMcUiPbwDAAw19r31sqjeaDLQ2ZnZMAVAIZWB85GvG43UyW7+AAtf2Upzw14w5Fk4wocRMU2FMTK6JPl+neGhhE8b+QARM1UotCpfDT9SDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278472; c=relaxed/simple;
	bh=6CMCRwOUYh67tKcbM/XuwZFGUiXaz18QVK9UO2VRh/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve4wIZa++58XBAXGyWt2kS6u0OMDrY25KAuCyW64kDXR10g5DgfABRSqiP5cDRd6MbS9pZ1f6IqwWFBq7RhxmuZVhErN0QcWMeWEJSODinwTaU1dC4KoHBzhoSZcNRXGq2R9d+w2kbHj2x07Fh98fQueOyRhrHJ/GLiaUknA0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8/rVKxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AA6C4CEE8;
	Thu,  6 Mar 2025 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278471;
	bh=6CMCRwOUYh67tKcbM/XuwZFGUiXaz18QVK9UO2VRh/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8/rVKxc+BgfIZHssN+untqD7OxtqqKGGYp4111h7EbNrivuEv3U2w9Mh7oJQvVgA
	 DKc3rDfXmRbLNPALNTjG568jXUYItcNWszXtsRGuMN24TsDMkZand/Rr+duoTls1ov
	 dBTvq7xsab29aDihh5RVA6HYbMgPAu9l8Hyvpq1g+iDQNbS8pfpErO9PwAakpw0xg/
	 Ahiv6QmtRPuYAPD+XYTSyf2e6wHrjMce3Wg6oRsLL9VNONpdKh+bYjLSWnXUJj2Bwq
	 53l5J80twC6Gpd5umt+wmer864ybaHC+ictKumNbw0Qth9cDBaG/yiSgSxBPrg/uwC
	 ViGMChagTidDQ==
Date: Thu, 6 Mar 2025 16:27:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX LPI2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C
Message-ID: <20250306-backstab-chewing-89e93ccba5d7@spud>
References: <20250306155815.110514-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FI7Itgj+bcYXrnFK"
Content-Disposition: inline
In-Reply-To: <20250306155815.110514-1-Frank.Li@nxp.com>


--FI7Itgj+bcYXrnFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 10:58:15AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-lpi2c" for the i.MX94 chip, which is
> backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-lpi2c".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/D=
ocumentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 1dcb9c78de3b5..969030a6f82ab 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -26,6 +26,7 @@ properties:
>                - fsl,imx8qm-lpi2c
>                - fsl,imx8ulp-lpi2c
>                - fsl,imx93-lpi2c
> +              - fsl,imx94-lpi2c
>                - fsl,imx95-lpi2c
>            - const: fsl,imx7ulp-lpi2c
> =20
> --=20
> 2.34.1
>=20

--FI7Itgj+bcYXrnFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8nNAgAKCRB4tDGHoIJi
0l57AQCqtv96l2iZhR6gqRjBt3zAi8MxJxWpWyM1j5TLuPotSAD9F+lDTHLtWifM
PYf5w7zIctNlp+bnBCKzUd2Nsh8yFAc=
=rJKT
-----END PGP SIGNATURE-----

--FI7Itgj+bcYXrnFK--

