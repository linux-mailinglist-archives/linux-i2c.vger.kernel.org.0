Return-Path: <linux-i2c+bounces-5534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C41957089
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DB61F2349E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 16:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBF6175D50;
	Mon, 19 Aug 2024 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEaAHZcP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98C32C8B;
	Mon, 19 Aug 2024 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085581; cv=none; b=kKH/miNnJWO6j0PkFA8m4UngNRv3vpvVQWdecOmgPl5s/SB+raEVvlGfxn5cHpL4/lBbI7obT87RuHFDcS+rRUYt3nKWLieOgOr4IZhOtoZv0/njg9bn80SYjV2BcdpCckbnvT1M1uahqmQ7Ko6WQGX+uzloAWRpRw1nCsYOVR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085581; c=relaxed/simple;
	bh=IqgSEG3y/Kwh9+Hi5mZhe/UmOhmq/rH8CACS2ah6luE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA+JXsboZ8sjezR4EsJRtzYscsjWdpyUyuBx9snwnYhA2baNbgtVGJg4tFWI4KxEa8qtMYHVvADLQv5lJu+bU5u/d6aUPNwM0mssp55+QWw9dZmR86GUuQjoYOfmmZ43BsVoQGHfbOwz2nkviZWkbMt0j2RvXR2V+V5hW10/ekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEaAHZcP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39B7C32782;
	Mon, 19 Aug 2024 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724085580;
	bh=IqgSEG3y/Kwh9+Hi5mZhe/UmOhmq/rH8CACS2ah6luE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEaAHZcPYeFIflj0At10WYgr4IVsMonnR5ksRr13R35+Ez5wFdHYPmyaM18vk7SIM
	 E71E1rd5oykVcg/zGWkuN7jx7IcziCn+oBiy1kxf4GDByeSizz+9PhxKjh7n3lO/ey
	 3M9fy+Ir7AgPLb/I1v/fTl76JHmxg4fk43yjYqxKzwX1Dtn9ankOlM+PMEvS5IQECQ
	 owIbM9ufY7PBw8wj/BG8r9YPFQFzUJ3s/KI68JqMxQgmZyggvHP3vzwnhsibEwYY/w
	 vWo9pEYT1ScXjBvafgZ9NN3lttJyk8EzsP9rEOO6Zx8srtolFBtlOS2qXTiIJC+58w
	 QdtO9kzK2QXTg==
Date: Mon, 19 Aug 2024 17:39:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <20240819-sizing-devouring-17b74473d1a1@spud>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
 <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
 <e6377448-9af3-4807-a8fd-197f5b2b4aa4@tuxon.dev>
 <56204f92-d1d4-4681-8a9d-f28925919ef4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VnKoVPdj0kQtiJ5h"
Content-Disposition: inline
In-Reply-To: <56204f92-d1d4-4681-8a9d-f28925919ef4@kernel.org>


--VnKoVPdj0kQtiJ5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 01:22:39PM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2024 13:10, claudiu beznea wrote:
> >=20
> >=20
> > On 19.08.2024 14:05, Krzysztof Kozlowski wrote:
> >> On Mon, Aug 19, 2024 at 01:23:44PM +0300, Claudiu wrote:
> >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible w=
ith
> >>> the version available on Renesas RZ/V2H (R9A09G075).
> >>>
> >>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>> ---
> >>>
> >>> Changes in v4:
> >>> - added comment near the fallback for RZ/G3S; because of this
> >>>   dropped Conor's tag
> >>
> >> That's not a reason to request a re-review.

FWIW, I don't care about how many binding patches I do or do not get
credit for reviewing. Feel free to give a tag yourself Krzysztof in the
future if you come across these situations and I'll happily hit ctrl+d
and remove the thread from my mailbox rather than reply :)

> >=20
> > Sorry for that, I wasn't aware of the procedure for this on bindings.
>=20
> There is no difference. Please read carefully submitting patches,
> including the chapter about tags.

Yeah, I don't think this patch is materially different on those
grounds...

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--VnKoVPdj0kQtiJ5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN1RwAKCRB4tDGHoIJi
0j2FAQCYZwdZmkdYZ+TmKGJ16Div0eK93INBZozZ973iYJ2a9gD+P9GAiYE2F469
4ZwvdHMO19vqrDyeNw6aL12viw6umw8=
=n8Zf
-----END PGP SIGNATURE-----

--VnKoVPdj0kQtiJ5h--

