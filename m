Return-Path: <linux-i2c+bounces-8674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C89F9BD5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A5A27A4822
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804B72163A6;
	Fri, 20 Dec 2024 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dcMNtuP7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFC1A3BD7
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729651; cv=none; b=nhes8OaUPxePCESDAfuB+EWk070ZKK5/4ShdvHblUr/4qQ8DZQdkQteBzg5a6dL+8vHOG4vdJpWN8YiJy1BFHQskBkx3s8Ve+ZibhlGLpJfBsbB3TdFxZvK0RTTe/d5rSntHKnv2ofnUh8P23TH5NHJ7+5wsAndbxNxRYYAHRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729651; c=relaxed/simple;
	bh=MjhFa8bJqhTdz6UBNHivFjTo1NItfH8DgUMWVxWfc3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oxdv71Sq0kjVqHd/UFjOKr0CFrux9KewYR2f5/F2Nv3biscvqrVpsOHNQqYIVw0RgBh4dw2h7fLTxCF+8BdB5D8jafCqKHVaQYZEc1hEzDVOc/EF1jZUwhmMHUNHy4z6QFHKyDRGMbEVc/xVOqwtam6oXt7NcZ1s85WFQcTULh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dcMNtuP7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MjhF
	a8bJqhTdz6UBNHivFjTo1NItfH8DgUMWVxWfc3w=; b=dcMNtuP7Pn8iHw6mnXz+
	D5aO0pHzaYmCt4fI4BirVuCSuUUPztd5qGr9A4LN/O7mueyTCs0/DbG5QPa3knpI
	QNMV+XsFWznf+GonLonqhji/MMeH9Orvmpdk+vcYVN/VQ9hfHpgX5JUWvND2ZldK
	8T8Ts8HwiLj/REJ+OqgEoL7zFTouJMYBLuzDzMKCT+HQWRglstOnqdzewnPlenrG
	M8DsyXGylbnzRvnlN6m2otz8y8yQwGPqd/i+um2lqY2lmK0z2Co1NV8JdMNPhQmY
	9ilu/y62OLbvXt1hnoezCarXqF2LU2LpBI6YlKFd3M4jjwRslCyjc4EWUe8W7tl3
	Ng==
Received: (qmail 1127111 invoked from network); 20 Dec 2024 22:20:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:20:47 +0100
X-UD-Smtp-Session: l3s3148p1@SC9pOLop0JoujnsY
Date: Fri, 20 Dec 2024 22:20:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/9] i2c: riic: Use GENMASK() macro for bitmask
 definitions
Message-ID: <Z2XfrsxD9-IVXk1O@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TxjIsOP/09NdNLXg"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-5-prabhakar.mahadev-lad.rj@bp.renesas.com>


--TxjIsOP/09NdNLXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:13AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Again, I think patches 3+4 could be squashed, but this is minor.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--TxjIsOP/09NdNLXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl364ACgkQFA3kzBSg
KbbkhBAAsiV85GFvsNwG1rJWEOLa0tzefzvXSPxP5HXtq3N9Pzh8cw0/2Cil2vGW
8FBBKXFxEb2Rz8CcR+N/NMJ1+qax/YUhbqw35IDMq3DXWntqP6eAG1Kp2iRNw/p7
cDeX23beC4gpX/othZUxnRrY9WhzmiBKCoDGpHrQPrb2XpD2YefFZjdyYYTDcQfB
hKpSwh/iMgVKyx8GmqJuHTl0W8bTy0TH2X04MwEXrU88tRsVPhZQS1m74lR77sJA
9OD4PG1FdifPoO43foaJG+ITMANOpC6hmVqejLfWI5O4H9BmKVYXyWYOJQvx5jxI
o/f1wbcxHJrQYCcuLLYiXP08qxNxk0AzVSCmRJZGYfqFetNtlWxqhMXUwzww7cBK
0UgqYtV2b0Y5tSK2qXvEq6kT5s4NGj2M583g1VUQdP8Mr06sTQRIMUvKxLL5wRmW
rjBFRHpR+YJ5LfEabwl1KzM9eGA/+9CXnVZv71J/lDA+1BuVYOEaLNhcIDaWgEg7
Q6dol65N9IUTBuVrNtpFHGR4O/2g0Dr44yBbnVqhk8vkOIUM/d84j2Rb21nggqLs
Sslmy6eMHUfd3FOboZaf/LP1LLJRgAy2rP3BnOD9dNZmLoMV1yTWkQLKztb6Df3V
QYGHPlN6FTyxa6SMrR0VM6oOW/zSK9FcRxLS+GhdaOVFcaYj0T8=
=wEjg
-----END PGP SIGNATURE-----

--TxjIsOP/09NdNLXg--

