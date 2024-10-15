Return-Path: <linux-i2c+bounces-7402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C445999F31A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 18:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5651C215A6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 16:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036731F76AC;
	Tue, 15 Oct 2024 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8Y2KEEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B91B21B3;
	Tue, 15 Oct 2024 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729010861; cv=none; b=BtXlM74EcF8WagQhMgseklZImoZkjZUpzYJ+IYfusfvh99aNRoGhQpjlS9Z27D/2GPXYSSDqo6XhUk+VM1FH2XWoJrmsBgThMB0E1zSwSKYFmyrmifRAyBYauPlEpH2O6QKziPhBiyWB5HaV+B76pwyXlThKNCPbLiUTIRc3hVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729010861; c=relaxed/simple;
	bh=3HDWfwQxNr9jcacdjyqR2N2Ro1vMfuFIFd9bLMt+MUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0xL3Cb7+p28LDHDCAcnDVKsESHXBUtDX9/xIrC/F4DQ1tWOh0TAE3dRz9iMh+OSId4/OWrOT78PyPoeQJgS0nVB9069RecvC9PEHg/f6bVpJcdaNBKKq7MLSyoBfkTDf4PN6IvdWmZ0sqSGIdfMHSlkHU/nPRpNyWq23JseDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8Y2KEEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A706C4CEC6;
	Tue, 15 Oct 2024 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729010860;
	bh=3HDWfwQxNr9jcacdjyqR2N2Ro1vMfuFIFd9bLMt+MUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8Y2KEEXoUYm8txol4GcIpfYpyML1pEmuh2lFM9mVE0RDHIwz+RgyvP0DF9thEF/E
	 GkpRe3BezXF/XyGF67a8bY31ku896v8Py+GndCoBIpOC+hUJVzAMLk1Da8IA1U0/Km
	 okKPGTnuPJ34jRMgeX5IiPaQRYf+0l/xtYbZLok1GAkkhzvyq6yLT768x5pQWYivnI
	 fPBDmK2MeRMal19wCTTnjZfpmenbO9PJMu/DdJHViG4gC+CFf6YZfSDf5hhflVhE3+
	 7wVqDWhXxQJ6G4fEQwmFcombJZWGTnecrGpSmisIFiQ4OZgNGhXFt2zlWa1x2PvlBN
	 Q2gsjKc9wRykA==
Date: Tue, 15 Oct 2024 17:47:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <20241015-jot-disposal-543cf7338a97@spud>
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-2-TroyMitchell988@gmail.com>
 <1524dbc2-2c9a-476f-a06a-0d998c29534d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="feYD3AfAHHXSuwu2"
Content-Disposition: inline
In-Reply-To: <1524dbc2-2c9a-476f-a06a-0d998c29534d@kernel.org>


--feYD3AfAHHXSuwu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 10:02:21AM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2024 09:51, Troy Mitchell wrote:
> > The i2c of K1 supports fast-speed-mode and high-speed-mode,
>=20
> s/i2c/I2C/
>=20
> > and supports FIFO transmission.
> >=20
> > Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> > ---
> >  .../bindings/i2c/spacemit,k1-i2c.yaml         | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i=
2c.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > new file mode 100644
> > index 000000000000..c1460ec2b323
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I2C controller embedded in SpacemiT's K1 SoC
> > +
> > +maintainers:
> > +  - Troy Mitchell <troymitchell988@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-i2c
>=20
> There is no such vendor prefix.

7cf3e9bfc63db ("dt-bindings: vendor-prefixes: add spacemit") will be in
tomorrow's next.

--feYD3AfAHHXSuwu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw6cqAAKCRB4tDGHoIJi
0sS/AP0bFzSKBkQwpTXIGW6worOTR2eaFIZkN6vGoAdsa7IsmAEA+EWq3rBZycrK
hxxrp6Gj3FQFrd1CTHEbmTjf8xGhgw4=
=lEi6
-----END PGP SIGNATURE-----

--feYD3AfAHHXSuwu2--

