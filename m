Return-Path: <linux-i2c+bounces-4865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE492DBDC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 00:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DB41C238F4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 22:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E701494CE;
	Wed, 10 Jul 2024 22:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fQkH2e9H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37812F365
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650072; cv=none; b=ImksxGQKqvsjgXUpGZip1Fpv03mYmLM0ulYwgbMuyLv4f2VTdT6uOvUy8Xn22uP3EUFuLJfPxZRxX/iTaWCTvyulPjRBwdPTB3634LNkXyOwwAndmIIaSo1LEqfl2dnzGuy/XOiX3g4rDpfz/RAXFG3vFTHkgTRKMD/nB7ojvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650072; c=relaxed/simple;
	bh=UR9u1b1LERdObB5H9teSx8y9oN2qUYckeEFv+IKQgpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmFWwaXh/ONZMUdmAn/sWOVCDd7aKoHd+EdZV3/WZVJS+dvQndLREQmvbVGRtrUstc9J+F94BQRfR/kvqbmuhSiN5lYMNjXCKu/w8YWitDMQGt1MnKh58GvmKlEI2jx2Wo+CVH3rTbvQ+mj6xjE2lbMsnUqnm9M0K83aGf4Po6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fQkH2e9H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5Gfc
	wj1h/9hwmssK1LHK7dJ8iHOpSHErohYtvx8U/Jg=; b=fQkH2e9HIcKdIvYY5oON
	IKDJqF8DV06ALI+M7NVl+EUJ7ByYLtZEtjpFjUe7RSfepjl4z1YcMY5t7JdpcowN
	ZPh6pf1a8s9JzHe3H2a/xfi2SIshs5Ww0LcUHtwYwYxQZ2X8NccO0+8bAO9+CxJm
	Jmv9KiQzTfuF08mXTm5Y9BB0erDowCFY+KdwSVV/DUbd3jaUW/JGgY1T/0AHRHhh
	3i196nYBA1OYsEdXjNIW2IlP8LJwkbmTybA39QeQ+7ky+yH5eYmmR4nXKJH16Kvv
	O2LqjAbHfOAfTJvROgWQfB5DBepKAlZdxhtiLgy7+JrL2xikA6Cx7L6YiROfV0y1
	/A==
Received: (qmail 653563 invoked from network); 11 Jul 2024 00:21:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 00:21:05 +0200
X-UD-Smtp-Session: l3s3148p1@NZTrD+wctoUujnsa
Date: Thu, 11 Jul 2024 00:21:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
Message-ID: <Zo8JUWIfmHhKs4jd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
 <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxE7TigkqQEf5t7E"
Content-Disposition: inline
In-Reply-To: <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>


--nxE7TigkqQEf5t7E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
> > -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
> > +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
> > +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,
>=20
> I searched online for the datasheet but couldn't find it. It
> would be helpful to know if the SLAVE naming comes from the
> datasheet or if it is arbitrary.

I was considering datasheet names, but obviously I concluded that these
are custom names.


--nxE7TigkqQEf5t7E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPCU0ACgkQFA3kzBSg
Kbb/mhAArl6U/dAyn1dNsFQSmYcw7GLbDJWa3SOf5W39+JRUBruxGzNXub7Qq+uD
V2j1V9t+yzD4O2+vyuzUHjQ3ru5Ky/Rc7INwiGGK+vwWmqvR9EG5lLQOZttAVfWf
kkn1lw8oTCd4jVqUV+gKjsqJyOLGn6b3+Ysm+7ezSbPLCyMc9uaxFEecrBSjxIqi
eMX2/DrGJ01XerhTAVbcP9dSXgtbwOZ2Qqg0L9Lw4LVHUUyYJ7Kkvi5aCt89KflN
V7nSgl5vz1T7aS9BEXF0Apo+pBuiyMg8zzl+dsq/Y+8wuWz7jGjMF9mgYwfSDQ2X
68IornfEriGfTsh3ylbdZzq0PZjRe/spqTFjs/j78DeFw6xuF7AjqZy/yPygJ/YN
jqNTnt9HjE9n9UCiXe7wqgddeNm0uSXrZ8HDykDF6d+dLWWucXyVFkxPs4Hpp4op
kse/w/I7WpXGhPeSvCSOPyeoZmGb5ueq1O7iEBrm26A1uJ+9mXetfZgWjf9nMIS0
kbMjNFyJDKwsP8/25BsSQ04nhds7rrjnYi02k9g2RBwYwPNlMJWf6G5vtjshT6C1
2oNewIuFTiYnnWMKdCnZraXMraTDqRD0WAAw0KxS9zY7aZU+NIDG/ZvdPiayf3VJ
9LEgLY1wE2gyU/7H6JzNRO/NM7/LCSa5L33FrbMTQHPkTabAljw=
=pPql
-----END PGP SIGNATURE-----

--nxE7TigkqQEf5t7E--

