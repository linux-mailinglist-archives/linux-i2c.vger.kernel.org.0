Return-Path: <linux-i2c+bounces-8171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1F89D758A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 16:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97750B235DD
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E202500B4;
	Sun, 24 Nov 2024 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g1HoafMf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E242500A0
	for <linux-i2c@vger.kernel.org>; Sun, 24 Nov 2024 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463069; cv=none; b=V0UdCmKv1J0ILI2hs3t7I/FavOKZ8TacLS20dlt5Vp1K+WG+GDZAfk6Txtbpzyk+wWGI1mXOTzSpZCgkj0+HvAE+sL9WyOg7i8F7vHZ60VV6FgRS90PVkSYOY4SFu6FeaCnvWOMVSLUeaavSC+oeI5NxBFAQ4UAXTDCSmzGap2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463069; c=relaxed/simple;
	bh=QNq3MShJzyYlomkqqFJXRMbUOwOZK6Ab2LhATuvDetU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OET6Mo0bL+FFSbPi2h4bJAAYkkZwQPnTaLuOvhGFhRAKWe4mxxXmbqN704AkV29tCHtJmXZJs81RdvMfsRg5Zv4K25Je5LmOXwn2PlPHmxVRZODKTv4nJGkYyCYwOho43+ApXx3VYSpnLAa8L6dkbkHxe2m6RXB7pXvyz20oP3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g1HoafMf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=y9Hk
	iHe/0Z2kAZzsl1L90rtLwOAih1e5v4jOo9Fx4Fk=; b=g1HoafMfG2kGQHKq5v+T
	eclHraaBQRJB9/9szYXokYChEuyYjs5EIz5ldggAfDNwiR8TP4HRwxlk9Y/+ynZB
	vOAc5DXTj1rRRcs036gGATb/uJ9Dmjs0bodI7Z/4y6qgfeRoMzPw16J5qWn2KPSf
	xSVMFQls7AAVQ8TXqXaKp7Dmv1WiDau95qYVasoXs8j8IwHR5a5Ui1GeFOGkJZi9
	KivmKCnPfM7f+RtB52A9Ik8U+T0jA6p01Gz2kfXuWt1njFU8n//dDBzFFn+d9wQE
	rKIvoELXZnhgslE3Cv1fLcZlmPyUoq4vCSKubLCUviQc0EmcILzQxr4EqHXuhRu0
	Sg==
Received: (qmail 2190154 invoked from network); 24 Nov 2024 16:44:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2024 16:44:24 +0100
X-UD-Smtp-Session: l3s3148p1@90GKfaongq1ehhYY
Date: Sun, 24 Nov 2024 16:44:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.13, part 2
Message-ID: <Z0NJ2HjyP0KrKKWx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <bomhuajtvdsac6bsb5di6sixmr7pflgnmy7axmbpo6qwswm27d@bjwwk3mr5tbu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UZ5dABewy86X1etV"
Content-Disposition: inline
In-Reply-To: <bomhuajtvdsac6bsb5di6sixmr7pflgnmy7axmbpo6qwswm27d@bjwwk3mr5tbu>


--UZ5dABewy86X1etV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Thank you again for accepting this second part. I believe we've
> now included all the accepted patches for I2C. For the next
> release, I plan to focus on clearing out leftovers from the past.

Please note that I dropped the xiic patches. There was a valid review
comment pointing out NULL-pointer problems. This needs at least one more
cycle.

> As always, feel free to advise or correct the tag description.
> I'm always open to suggestions and never bothered by them.

I shortened it a little but not much. Check my pull request.

Thanks for your work!

   Wolfram


--UZ5dABewy86X1etV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDSdgACgkQFA3kzBSg
KbaDkg/9EkvJ6bHU/kTtVg7UbKCl7sf6WGia8wulh9d5kxr7u/p4jnr5/uSJUypp
bGj635Ea7hGUZs7KZsTLGrbg81wWX0v9Idd49CrG18bLHFXx5yoKJU13OTE5c5y/
0GcNPHHtPCH1chlZZVh5kc1KBCtrA5iPmQODqchVvk0H+PgsViSHGW/FfMof/T06
BnR02bb9gQWRFerccLcIwrzvSlQSuhOKRFHjow6v8vmjZvr3No+uIQr1sxW16uTY
mcC6WpyyGSotpUItGCOklPtSloX7CoZEBXxSBQ0KnH8hQil3HQPvneLphOccia1v
a85jN6ZHOJchKKuUeLKjMbXXfHv07VGqHHaOBq5DSTuoRQtaAPchkXQo/9PpOLln
nRizRQHZOgpGxNqbvkAIJMVbLvAgrneLgWntK0xHaRzCMsdemUjiKfgeEzPtEj/t
4gLy7AlQcaZNMeiBXp+Qr/AFB+IFzVBMlX0nptV2mAPY254Gks+5+wXIS7gwYrsc
5RWiOLv5KjguBQYVUViyd03C06ZH0z2s+0IE1A2tjhsPWmTm/nDCz20/MaZat9u1
dxclF6yvqzEsXXMQugAjOO19ipfKNguvQ0oWcok68cUMZvY4mWfedJyFy9IeE11j
lHsrZkQx0uatfCxy1lUO/olCODb34VEXx/7frAwojw5fbKPm8Ok=
=9+ho
-----END PGP SIGNATURE-----

--UZ5dABewy86X1etV--

