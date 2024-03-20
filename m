Return-Path: <linux-i2c+bounces-2446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FC880F40
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 11:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03911C21F64
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 10:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED38E3B796;
	Wed, 20 Mar 2024 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GC8jJ4z5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757F3BBE7
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929108; cv=none; b=XIWzyk040/QWqBow8AcXxqLtbbXex4xyT5pjI+bgOUg2pICtjuH8QE6Tcta+2XjNdy65JgO1rN6hKz20cXmQ8Z9ymLNbcDVVJeYDa18zNIht113IMUiAw0L35oup5WI/E/GvFJ88+y1ICt+6ttYW0b61Z1sVZ4drIPkEg/GIq6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929108; c=relaxed/simple;
	bh=fwXyQZW6DDDve0eAASIUzDQwVftP1zi7BR49hnbI7g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J26TffckJU/uYyW9AVNCN+ngtfXIVy6S3l4qMzqAujzzg8XhhOLzumiO/50kvcBww248FxjUfAFeOwcbND0UG/+wIw/FDH1iLRRb/uL4ghDQ+oXMQosq3cvsUcuNM4Pycjg45zX3uM0ZHBFFBOOSsF11SgY3DqC2gmPi98dgWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GC8jJ4z5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fwXy
	QZW6DDDve0eAASIUzDQwVftP1zi7BR49hnbI7g4=; b=GC8jJ4z5BA7FBcdmKmxB
	nOh38H1A/elGSij6LDvExtCQWpXYuaze2shxI/oOVjXgrvWwWqmizbEJa3srsUyd
	tmqm3oeq5qvQ7Wnu1KqcET74+MRspbmRkp3gLJb6OfArWZtdIStl3kxGo3wWGILd
	+vsU7A/KUdAXd3ymwLA9zndvh3fAoVCXKYqxba12TQhmClVQiKlptJ3G8TqUB7jf
	KHO1rFlrBFupoYDW6PlqqfZ8PQlqf8vqnXsRw5yYwHseuQOzwA8k81dPlrkfteZk
	fdXF22fk/2lUnd7pEWBkZUBjys4cqtYPzEY68DVcavtvmk6XjG/mRE0564fGujkn
	Lw==
Received: (qmail 3167443 invoked from network); 20 Mar 2024 11:05:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2024 11:05:04 +0100
X-UD-Smtp-Session: l3s3148p1@c+yBuRQU8J5ehhYE
Date: Wed, 20 Mar 2024 11:05:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 3/4] i2c: riic: Pass register offsets and chip details
 as OF data
Message-ID: <Zfq00MQP_cjqbNAK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240319132503.80628-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n6zfj2G8jOBGA4iY"
Content-Disposition: inline
In-Reply-To: <20240319132503.80628-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--n6zfj2G8jOBGA4iY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 01:25:02PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> With an increasing number of SoCs reusing this driver, each with slight
> variations in the RIIC IP, it becomes necessary to support passing these
> details as OF data. This approach simplifies the extension of the driver
> for other SoCs.
>=20
> This patch lays the groundwork for adding support for the Renesas RZ/V2H
> SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--n6zfj2G8jOBGA4iY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6tNAACgkQFA3kzBSg
KbbFuw/+KFO4nELzzu0Fb2pFk7a5jucVMYggeaB3KmWNr+LF/8ZzMIESpfihpzgF
JXN8BECy1qXTXulumL28PADzTsvjjMJbKHpQf7L/OVBOC3Fj0TRrdw0W8Ned2a7Y
sb3tSWBtZBbz+44W6S3XnzT8UAVATCk1Wmufo4EaC0V+y8RdQ9ygnlWyri14hZ/c
U0+MVZv7zyJZ1bJdqpCd68lUYiT/aLrgyx3T626CWPyFhFP7hL/oMpmTi/1RUmYy
7f9o47mlT8njgPvrYK0m9ZynOqOLSK1TpE0gBOPNSgZGEZI5PPKxLUTn3fUzuymm
QTZwOzoM9yUGVyqHCWQFW2s8xJUCdMRF4deSuUFPOZE78/CXOQgy6zd4tB2TaJud
NUbzjbowbxkZgtJs0PPOgyImHUZ4J+fX3sDwLjyl0iZg8uzubTWQoRGOEDlwi5kC
sssWJoIsP1CKuWkOQ/Q1eECsoMkLdCXZWZvh3YUIWnlxw+auRtTFY6Wz7RHi4vuw
Y/6+4gUZX7XlsQB0ozi3lldRDd4b5Uiv14kGq2PO1D4fVR+f4BeLfTMccG2/GVYp
1HszCrCOqnyJ7UYMZOnB4TIJqckCNQCWAz2SLxA6vJqADZLgg3Czo7LtTxImuD23
JFYp5I5kt3KcsHSOL/2tqFth5sBevXRV0P4cIBN+cmgATZs+K/Y=
=R51m
-----END PGP SIGNATURE-----

--n6zfj2G8jOBGA4iY--

