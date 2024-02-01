Return-Path: <linux-i2c+bounces-1596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5587845F94
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 19:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61211C26924
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 18:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B1384FA6;
	Thu,  1 Feb 2024 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0zp3zvi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E712FB23;
	Thu,  1 Feb 2024 18:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706810945; cv=none; b=DT6CWTPxNovdsyAKnKdX0R9npRGIpT/WIvjvfV2o5rYgXOr5H1Lc3lJmtBwlc1pDuXTcB2+dhSe6B/v7QPCtu5Pcutcv4+riS4XemKovDzal9a+eQRZun2EnQQFiucseo3KqsUy1j9MUFMuErMN3YTu6WTh/oRnS7K5Yg5TWrkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706810945; c=relaxed/simple;
	bh=uoOcPOvKUCn6wckzgr3G3WyXV4xKTQ3mg1IrekPYHc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL82RLd6C8Islr+tdEML3PeVeiNeK+WYxRRxZSW7gAQHpOo29X51PytYKW7vv49DkOxzNwtOoTFgYjGr/YBgzxJe3KJe8izA1QNEiBd7vk3gT6OAi2XS5PuVRs73tVeETgpE59qP+Rlu0knXJsraownZfX4sltowsNYyBrN1eMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0zp3zvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26DFC43390;
	Thu,  1 Feb 2024 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706810944;
	bh=uoOcPOvKUCn6wckzgr3G3WyXV4xKTQ3mg1IrekPYHc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0zp3zvisK5fl0K2LbyruYxTMpZFDomBwHiFYjB/yogu4ssNdOhxhFV/zjkD1G4FY
	 XWmIELVGRBgMAQn89QuuSsxl8vyxqiajez/su2u1/nGzOzq2+qd2mk1YGEXsraFkif
	 EGGVHfSod0VboRqTbsWMK54fX87OTps44WoP7n0HaMkQvLHoN2smm8ueKeNkvrYYOy
	 i6qBPeAzTPYO49ixA+Pv7rd3qK0Sn4pKDdyC5y44k7sD0vZIJgOsVT2XzAHJgoi5tm
	 5MGfsuTmlMADQGKqyiLDIPEjMRrjdLleyln7pabY3OT4MnAvYrn0vgEI/1xyP5bV5U
	 HpO4T5kCFpTiA==
Date: Thu, 1 Feb 2024 18:09:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
Message-ID: <20240201-keg-query-78a90148e9c1@spud>
References: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/rUS97OndTlOFFR"
Content-Disposition: inline
In-Reply-To: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>


--s/rUS97OndTlOFFR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 01:18:51PM +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml =
b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> index c4ace5585e1e22d3..51b220da461b068d 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -53,6 +53,7 @@ properties:
>                - renesas,i2c-r8a779a0     # R-Car V3U
>                - renesas,i2c-r8a779f0     # R-Car S4-8
>                - renesas,i2c-r8a779g0     # R-Car V4H
> +              - renesas,i2c-r8a779h0     # R-Car V4M
>            - const: renesas,rcar-gen4-i2c # R-Car Gen4
> =20
>    reg:
> --=20
> 2.34.1
>=20

--s/rUS97OndTlOFFR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbvePAAKCRB4tDGHoIJi
0p03AP90TmNNXiZFv6YAGDC8FeN630WZYjVd7wdDHcRIeS1VzAD/UriGy0vx1tmc
AeU4nlmc18/hCvVzO9bNo7fOMkJNhA8=
=MNfT
-----END PGP SIGNATURE-----

--s/rUS97OndTlOFFR--

