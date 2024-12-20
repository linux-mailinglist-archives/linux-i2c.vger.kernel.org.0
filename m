Return-Path: <linux-i2c+bounces-8673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC39F9BD1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631FD16D23B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F10223715;
	Fri, 20 Dec 2024 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bmQmyy45"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB971AA1D5
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734729585; cv=none; b=ZgBUalCzfX+ogM4+TEBfgdtDR5NLcSc4TV3bznVLdPNS1aaGiVR2P2/gCcmo22epxJAi+k/CBiglxVO2vfP6ANKC02LznWGIvCOp5UsHNOxoXf1deTTnsVI7JF+iOetH2oDpZmTtZ2V0KXh6TBmf8kw8/b2CHd+m8LZpru/YiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734729585; c=relaxed/simple;
	bh=maBh6NU5WerKErHYv6tUHuN9oiALjm15eD/eE51bhWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F26zrmzJ+SR8jlF2ke6NLOi8FyOlTBtkTFQcdOMT5Wb5ONahA71bRZ4z2rpFZOIdWmOjZ+dOarVEE9ldeSzV2kpDKk9PomTmI4gkeky4xlMl6eaamlNpkh7bbvelAyA8hKvd3JnGNB8etxRUa94xMkl6uYCbFBEx3669fZJAxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bmQmyy45; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=maBh
	6NU5WerKErHYv6tUHuN9oiALjm15eD/eE51bhWU=; b=bmQmyy45zNHpsStLNfWr
	i2PH/iTAZ6ODBPoXivJgDWJXoKBjGQ5dBR1uO0njRm8XxAD4F6w1sv0aDhys6ZmQ
	IDzixKIy4EEmWp1g1qiK0f6QfGZflSCTOFxl75jhb0F857wqizQtMdYwG1hqz7Vj
	JnFFAOG68eRF6Iw7TAkV1jjhFY9Ox2p2qhGFtoyLcs7M2NPnFlqC0P/9B7KL+aYF
	iiw9VxZRyHPZcifFpPmmI70Ev2WQGUvqPRzMqzvbGYmDx3Se4xoQ2oAWKf2msjtd
	+0qnXpz7bApIAWXL0thEJ2kOfoBGlLtEayPsUb8QSqyK0QI01eTsCB2PQxSl3cyO
	fA==
Received: (qmail 1126791 invoked from network); 20 Dec 2024 22:19:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:19:41 +0100
X-UD-Smtp-Session: l3s3148p1@zTt2NLopRKIujnsY
Date: Fri, 20 Dec 2024 22:19:40 +0100
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
Subject: Re: [PATCH v2 3/9] i2c: riic: Use BIT macro consistently
Message-ID: <Z2XfbNCHZHBRFYNw@ninjato>
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
 <20241218001618.488946-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sL8jQhzq0EGQvSe3"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--sL8jQhzq0EGQvSe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:12AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Easier to read and ensures proper types.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--sL8jQhzq0EGQvSe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl32sACgkQFA3kzBSg
KbYKkBAAmYcbQN6oTymzDnnuNzrJ5TjBxCAkWw0CDGf94J5DDe2e4X4bZA9uVgx7
HLIpdWtXCjEDUw6zcJrQaxhydLNo7oDKrv3Y5kNEckXqbGqWc40ZOXGdG+ngcUZC
o6AR3BAaQ5kAaasS42BmmB+S1py3cQqJ30ng1qievbY0X2B4L0oWG/g7rj9sXqcS
3O4u2rMdOYuQnR8CSy29y1e/EjDPkMkTuUaXSpRdYERcWC4UuJMa90x+Sdw021cC
I7I05ZJ0W7bMeqM3cKPZO4HimYyQMZbsbZNRenzrF7UPH9+NZsy1kbHXB7UnmC7v
rlMTBN72CRNvH/WZDRJcP4SII1OBSwX7OFqhrL8lGbz4eZp85qJybAgdpx/Uh6O/
kvcSGankSz8kllVkLyUsvyYhec2CrT73h2xMJpD8du1FwZpP3F8OsQcRL+C9AOB/
qmyluEWxGA60ICNJi+6PHx3GQAnFp66AJSNYJaTwWQPO0SIktlVbcx74Bqt9HvQi
BaoeGLj3jt6kn5CzAPl2UUeFqtChXu6wHq8n9DwDiKu7uylsFCFsyWQdStumv5JW
WLEJG9a2MtGQx9e6kLSW4IcdCGRofg/KfvhT4THWuF8obA6Rw0leZkghllxU5vV5
KcJ4yk2TeJkqHN1GdTf7n6ICGVAqAUi7Hf5n5AN+iT7TGt9Q4xs=
=FzqL
-----END PGP SIGNATURE-----

--sL8jQhzq0EGQvSe3--

