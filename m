Return-Path: <linux-i2c+bounces-15099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D3FD18FDE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D2943009259
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A266238FF0C;
	Tue, 13 Jan 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AmV8Xhvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911B38FEF8
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309332; cv=none; b=nO7ffVkayi9/I9xNxoMbD2SrQkl+TmT9UD5MLpufYu8MzpRZ4Atdto9GPgu/v0T933wZuoiIlZKTqkuYdwsLDKjxtA8/hgT4YZZ2pNHcuOWCYMEe1E4SYSXWKCP5tLaGiDx1dqEkDzV323d9ScPG5aTLJhik9aHfPR6RuZKegVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309332; c=relaxed/simple;
	bh=59TnFvMgxSvgsNvfS4i8+KDTLqG+GWYBXVjCCJ5HPuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qnu6jNw6rXZVEOlUBMkrkdQ/26zImpY5YEfJb99BSo+w+DFWOL8tg0iMrx1l1jxtqPyCZQ2hykCuznaNQ2Ho00CAyBAQljrAknueAO+pjT4VgJIZpS02ORKoRFsXLvOWTuXak32eqyE6h6yo5CacLHH1nOh7U6isbALBkOQrzCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AmV8Xhvd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=59Tn
	FvMgxSvgsNvfS4i8+KDTLqG+GWYBXVjCCJ5HPuI=; b=AmV8XhvdrrtLHKtL1QCx
	zwDmKo3bV83LHhMVy6qYINEw3GztZhoN1lTFOT50lQFwIkX2s9d3NrzHpn9XtbYI
	vzoDYy2hRnObgxG7gH9+XDIfh8OifaJT8LjcQw8qhdGS94fWKBuQtzEw/y2WglZv
	6brlWfcVXuxTTKv8SWVXKLJZSv7djKuwl0z334pIduBrQJ0NsCkYzvvn+ezi6QA+
	l9Ex8Gdp54dKLLg0bywT7D4yd7ar7CI2Vpnv2s/ITm3HVV2r8Mq4V86Kzk57Ds2+
	H/oFu2aqivxATT6aY3P3RaPDUOq1vebx6cXY+lBjSUacCD2ezp4BD5efxbPGxu1b
	kg==
Received: (qmail 1686994 invoked from network); 13 Jan 2026 14:02:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 14:02:08 +0100
X-UD-Smtp-Session: l3s3148p1@XoxjmURIcM8ujnvx
Date: Tue, 13 Jan 2026 14:02:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
Message-ID: <aWZCT0JQfvX1LAMC@ninjato>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zSIVovsvAGbL0wM0"
Content-Disposition: inline
In-Reply-To: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>


--zSIVovsvAGbL0wM0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The behavior in the regular case is unchanged, spinning for up to 1ms,
> but the open-coded poll loop is replaced with read_poll_timeout_atomic()
> as suggested by Andrew Lunn.

Hmm, spinning 1ms is still a lot. Can't we just use read_poll_timeout()
for the whole timeout? I can't see that it will cause a regression. But
please correct me if I am wrong.

The series looks good for me apart from the above.


--zSIVovsvAGbL0wM0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmQksACgkQFA3kzBSg
KbZ1EQ//T0I4Uy6hDFq4L2wjPhnlxj6KVLn9eLMmqtqIYGo5AJnURANunWibEVe/
FulWrlSAAf5i0G8v6jwbnV+4ndgCN0KXbfic2QOPLItG6utAowGhoK9kIOGoLTJP
zMmBHT2uHjYZO5n/f32ed/Cgh2o9C79CGLR5qlrKMWoKxt1uxbVnynCPcZRokf4U
7FOCiRkoVY9GDay4VVmBNh07M6YNtfPlEOXwg3ClE5OZIGyDrMpkCKBJ1SAiRPeZ
LNWKqBlse1G4aULqwiGileOB9JS5EJZpjr541RI9LtXSCmcrdmoBQMcw/slI6VUr
HeA6JRTitis1LiEsOmL3I76ODPqorxVeVNIHu1HSULP8g8L4bJ7nDER6WZBN9Jb4
Aos2wBYVr/KRrMQt3Iij3nVQJduz08fnox84QemADzAAVrvTDhZ9XX3wDDjtMPc9
75VCSs2ZNfoDMxH/dK7UovkL5fqAnxxOinNVAeHTlS4fNIr1lrkGifAMYy31a3Y5
E1S4YeyIHexgpsI4kIz/k9UQsDfLffPJW9FNlODZ2JeiggiFxA6cV+RNE2w8URVk
5Mr+76rDZZKt070XvuXqNh/iQ3tjyDUSoKJcrZ8Js7rT6t+X31NPygZzW/sGCume
E1Tg2LbihnFfdghwflyuLq+RX0gfZWckTKsInmMAmqH+dPYJTS0=
=xSmg
-----END PGP SIGNATURE-----

--zSIVovsvAGbL0wM0--

