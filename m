Return-Path: <linux-i2c+bounces-4375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1E917E9A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9736C282D4B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CFA17C7CD;
	Wed, 26 Jun 2024 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bm/UXCCK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26CC16EB7B
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398528; cv=none; b=Nq5xNcMfTyVWnxwhU0uo/Khk7h7BQBG+Y7vtzADF9GULkJLt97FmzsK8b50LnI9me1bVH8+QmG5/VhS3FsepOs72CE9xCfk1njsZki+cQ1gyDFt0cV1yWjmfggwIdic0Due/2w1/lCse88U0IqcOEO8OPPSGn1B/FOFGvnXrg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398528; c=relaxed/simple;
	bh=OEEz1hMBvDFfTJm7nGtUmDHLys55gExQu4PeuQJ6F2k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqdfLe4GF9xj27XzhDRsgUUmQxp6K9kBf8mzSAtjXrLMHtJBM/MK5MReNd4mhiabgIfGUJSdc5NDHhHhlTKa0F1VETocSYB9gjZRxBQ3HYn63cG3lqBx3KsHv0UAt1qSIAvFXg49epfg0iHyLyXFXm+isPhknH+0au1Dn4aNClQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bm/UXCCK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OEEz
	1hMBvDFfTJm7nGtUmDHLys55gExQu4PeuQJ6F2k=; b=Bm/UXCCKqzcK9VIl283x
	TYeOdeJhHWUvZ9uFCPIVYzgR4FiHX2DjjeBaQ1Qoq7o2EIS6lCnW8ubia5w7++/0
	kqcL0MMFE4lKOUbI37YCQI8c1xOLIqMg5or2n/DefPEM9OuE2xuClAEXANOkOFOg
	RpjCM3OYd36GbA0fHgtt4tHQ8gMQxa1y1ki+pEEtTOqn/Cjc4kx3qv7La80PjcZ9
	TMYzuXJ75P9HnS7kEFrFtwYSK/aBLrtHjShXVAAHpkIS4dx6OYW/J7FdYTVmpaOj
	tVf68kCR9qanIsaqUbHxT8JGf8InV6Oi7Bza/LiH5qszj1QH0t7lWEZGPY8KjpxY
	3A==
Received: (qmail 539353 invoked from network); 26 Jun 2024 12:42:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 12:42:03 +0200
X-UD-Smtp-Session: l3s3148p1@C4E5qsgbArsgAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 12:42:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Hans Hu <hanshu@zhaoxin.com>, Arnd Bergmann <arnd@arndb.de>, Wentong Wu <wentong.wu@intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: viai2c: turn common code into a proper module
Message-ID: <5shzq44g75xykn2tdbutbqa4u5by3sijvztam2x2scey5rglox@kgh7lul4j2el>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Arnd Bergmann <arnd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Hans Hu <hanshu@zhaoxin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240528120710.3433792-1-arnd@kernel.org>
 <bi3lwgeh5egvd4g6aspwvefibk3cviwuzinvgkmnwy4f3bvua4@nf5a6w77cr7v>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipkf5kaljj6yrtxh"
Content-Disposition: inline
In-Reply-To: <bi3lwgeh5egvd4g6aspwvefibk3cviwuzinvgkmnwy4f3bvua4@nf5a6w77cr7v>


--ipkf5kaljj6yrtxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 10:00:04AM GMT, Wolfram Sang wrote:
> On Tue, May 28, 2024 at 02:06:30PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The i2c-viai2c-common.c file is used by two drivers, but is not a proper
> > abstraction and can get linked into both modules in the same configurat=
ion,
> > which results in a warning:
> >=20
> > scripts/Makefile.build:236: drivers/i2c/busses/Makefile: i2c-viai2c-com=
mon.o is added to multiple modules: i2c-wmt i2c-zhaoxin
> >=20
> > The other problems with this include the incorrect use of a __weak func=
tion
> > when both are built-in, and the fact that the "common" module is sprink=
ed
> > with 'if (i2c->plat =3D=3D ...)' checks that have knowledge about the d=
ifferences
> > between the drivers using it.
> >=20
> > Avoid the link time warning by making the common driver a proper module
> > with MODULE_LICENCE()/MODULE_AUTHOR() tags, and remove the __weak funct=
ion
> > by slightly rearranging the code.
> >=20
> > This adds a little more duplication between the two main drivers, but
> > those versions get more readable in the process.
> >=20
> > Fixes: a06b80e83011 ("i2c: add zhaoxin i2c controller driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Andi, I am tempted to include this in my for-current pull request this
> week. Are you okay with this or do you want to review it more closely?

Meh, I forgot about it. Andi, do you plan a PR for rc6?


--ipkf5kaljj6yrtxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ78HsACgkQFA3kzBSg
KbYD4Q//fvSD0PMr13iTwlPy0ZvqeVG4v/LlpV6icKX3bHzq8jEvD5LtA7rxHr7K
WYT58zsAx68bqPSTPrIzn3ZeAeIchTHm/UdJx/h/enADQ8Y0MDHKYh0dv9X53Tmm
mRZhh247YEFowJLB9wnLs5X74vpKE5Xf1OfVN8F31BZYR4/gaY6de0nL1VR/5yU8
XeL3OyKPCoTD2SKgHsEC30RO0kQWPBjj/Xsc/pkWLF1EyEEzUT12c+qvO3dFVxgT
vQwcI+1u4iXU0gYnpHxjHb8cEP0MXq4rRJuROHv/5J8MXPK/WiCy7CcFI/XcudaC
JmsE8NdxS7yhBFfPeLM9n/XMN4sZzOh6lz539e2+A4GkTR25VpbHteMi9/nlaMh+
hLkpCwDx0NNLq9tKJBWtqUAICeRb0ASatWbv5hxP07Ym6f+Wl4b4FSZFGRu57ESZ
rkYSAcv5qFeXpW5qt0/DU2e9uJzqA+zSnHgolNGXwKDJBEGBZTAm98DwVA4ETeF1
8UK6PuqoI/i/xoSljAaOnu9PM7BEAW/N921EWd1RIF0TwRTl5gRIw9GYeeR7ZaPi
1IwVmYEc5R5TjEBcJFWRipPvwpqaZqsW1v5u/Ij2ud9GqOKxYTvsK7EvertX/WdG
6i6T8v2sgT6Mjiv7Uq9YfixD0KXJelYlo90MERh6U+xW6rWqtnM=
=Upt4
-----END PGP SIGNATURE-----

--ipkf5kaljj6yrtxh--

