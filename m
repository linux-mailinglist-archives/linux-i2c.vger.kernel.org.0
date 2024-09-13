Return-Path: <linux-i2c+bounces-6723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB69786FA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E64481C241F1
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 17:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534C51C14;
	Fri, 13 Sep 2024 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw5Poujn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055482D66;
	Fri, 13 Sep 2024 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249149; cv=none; b=W+idzIuCbrTyR0+DysdVOOERn7BuRIRQsu6SeM2hewzFmubuYoTLhquNgnvidoIYzZSgR/XqVw/NudQCBBDHGPja+IB02gRqNU8ckh1eqUMPl0I/uJW9Y97RZZqbF/h9tRq7rrc3fL9O03tqz07KOIBfR8XEdb+nZ6URJ4hrMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249149; c=relaxed/simple;
	bh=vqVpW7A+bwSz58QzHm+Dfdp0okxgkZaHCuIoxx/jJGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJwtX5UW+r/Wv+jHvoP/Fq48Ps/+nEvWHgcaeZbmhLStXfm49OTJZWHyF9btsaNm9b2yC+lpd4uPxx/uKBOCp8cJBcFArezwOE6hqy9fx/Kht7hwJBD0ySK0+MNkt/A9ZLskG3q5va1O9xUBaWLDXO3dEPh82h463mol02F855E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw5Poujn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50117C4CEC0;
	Fri, 13 Sep 2024 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726249148;
	bh=vqVpW7A+bwSz58QzHm+Dfdp0okxgkZaHCuIoxx/jJGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aw5PoujnA+cqBrHWQkDFPDq8loitqjEpCG7JdP2i1jLWIbb0wH75ymHC7GjDeT3lg
	 p6CmZ+Ya/6SuY+8i0/rFvc1aI9qHK00sUgcR8RxqiOV1KBUFtPKne5hVDy/hByUtwM
	 kOlfiW2meamiCXNQwGA2HvBaQgS1GsKP+csBRLtb1rF8Z3/l5tsNDONHGtOFPfaE4H
	 FlRG6sHKyxjfmMBwLt70iLOSP7bn3vr8bEFYQyeOaE9Q9MOWXcNq8oBmdFGfPBHIbn
	 E3RgGhuR4Hqyd3/nlxCnGWTaDLMcglhZgg4fKYTu8RygiFJfaroxuqcpqOX0kEl/5w
	 /WsCykNIQm9Ew==
Date: Fri, 13 Sep 2024 18:39:05 +0100
From: Conor Dooley <conor@kernel.org>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Message-ID: <20240913-ensure-blot-8f7b55ef4298@spud>
References: <DB6PR07MB3509DBD6C72832E8ABE7FA539D652@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hV1P1AUcJ6L7Fl+r"
Content-Disposition: inline
In-Reply-To: <DB6PR07MB3509DBD6C72832E8ABE7FA539D652@DB6PR07MB3509.eurprd07.prod.outlook.com>


--hV1P1AUcJ6L7Fl+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 10:37:30AM +0000, Wojciech Siudy (Nokia) wrote:
> From: Wojciech Siudy <wojciech.siudy@nokia.com>
>=20
> For cases when the mux shares reset line with other chips we cannot
> use it when channel selection or deselection times out, because it
> could break them without proper init/probe.
>=20
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b=
/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9aa0585200c9..872be72da965 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -63,6 +63,12 @@ properties:
>        necessary for example, if there are several multiplexers on the bu=
s and
>        the devices behind them use same I2C addresses.
> =20
> +  i2c-mux-timeout-reset:
> +    type: boolean
> +    description: Sends reset pulse if channel selection or deselection t=
imes
> +      out. Works only if reset GPIO provided. Do not use if other chips =
share
> +      the same reset line.

Why is a dedicated property required for this? Why is it not sufficient to
attempt an exclusive request of the reset line, and always perform a
reset if selection or deselection times out?

Rather than "Works only if reset GPIO provided", enforce this with a
dependency.

Thanks,
Conor.

> +
>    idle-state:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
> @@ -146,6 +152,8 @@ examples:
>              interrupt-parent =3D <&ipic>;
>              interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;
> +            i2c-mux-idle-disconnect;
> +            i2c-mux-timeout-reset;
>              #interrupt-cells =3D <2>;
> =20
>              i2c@2 {
> --=20
> 2.34.1
>=20
>=20

--hV1P1AUcJ6L7Fl+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuR4uQAKCRB4tDGHoIJi
0oYyAP9lG+j6Y/QSd3T0d4rl4XWK9A4Ca7Pa6g66du7UR/sSCAEAl80Kcvh9Z7Bd
XE6U9iAcWXrZdo65AjVavRX1ELAK1A4=
=9puo
-----END PGP SIGNATURE-----

--hV1P1AUcJ6L7Fl+r--

