Return-Path: <linux-i2c+bounces-3184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24148B3000
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9291C21B31
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE8B13A407;
	Fri, 26 Apr 2024 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gKNwUKlu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4826AE3
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714111254; cv=none; b=YwzYmBFksAfKBZiAG1+KvXpeZbPtprpWmAmEZw9Hz0o1awN8qVHCr7Hfb89TvmmINYKRv+u5z90XV/u/679F43BnWIhqXbE8TAWIfiCbJS2HCaIM7UNgexysPcdlr/WH6QTr3yIaJ+nNZQGAYBTeaOURB34U+HQ33UfMYRR15xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714111254; c=relaxed/simple;
	bh=gTFo47ijt8KUjDnC0cnDsDuf62PWzGx3+bsqWXuLzNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IBWju/Ps82S9oh0g/uxquwihVG9lDc5lWpi1gmoUuW7adUEjp1TNyCxHzwhBXIiaApTFMkuvjnQGBQ7skU7u3WZ1I1u5e1hNVJIb+FaLMFmo7GNHZEEzkya5X4Z9cQAIDXi4EdGbHRZpHaXkn3TxSC88IAki4E9TYi2WV2Lx0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gKNwUKlu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gTFo
	47ijt8KUjDnC0cnDsDuf62PWzGx3+bsqWXuLzNo=; b=gKNwUKludeX6LXgDbvSf
	FDx7ZveUSSz9PocevYFJnjwhScH8072RlI4oc/xhCFcTPFRaglFrxHNncjgRwFKc
	EOJANxqUx5jNJXpBa6nUSdWt3H6kcOkaLSYUklexbrWqE8zqjB+X4WFxxC51LQFN
	kYyBBqVZSwUIGCm5RCbF9VM6JACINlqEABMRMxV6Jgy8kCMb0UkPNuVWvM/9X55p
	ZafdZJlUKKhRadT4/ibABmywGWT72YE/g+3onaPwL/L1PxH6jZoqYfwnjaU5Ti7c
	l5ibsVQ9HUUBqp856jYb9Bto833ki6TpcOzJrSJ4410egFSecUzftZUJqzeIhRPG
	2Q==
Received: (qmail 1191485 invoked from network); 26 Apr 2024 08:00:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 08:00:39 +0200
X-UD-Smtp-Session: l3s3148p1@Wq+Dn/kWzNEujnvp
Date: Fri, 26 Apr 2024 08:00:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Drop entry for PCA9541 bus master selector
Message-ID: <20240426060039.ka7vj5hnbiikomvn@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20240425205719.2536971-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xp4kw46cwzx3ms6p"
Content-Disposition: inline
In-Reply-To: <20240425205719.2536971-1-linux@roeck-us.net>


--xp4kw46cwzx3ms6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 01:57:19PM -0700, Guenter Roeck wrote:
> I no longer have access to PCA9541 hardware, and I am no longer involved
> in related development. Listing me as PCA9541 maintainer does not make
> sense anymore. Remove PCA9541 from MAINTAINERS to let its support default
> to the generic I2C multiplexer entry.
>=20
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to for-current, thanks!


--xp4kw46cwzx3ms6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYrQwYACgkQFA3kzBSg
KbaffQ/8DtnKT5tQc9JUtq7gvW/n1uAcSGxvWvU1c6VCubrnINR+YsAyBsNSetoy
9gapNdOs9K/bpVDnyg1tiaevbX46+5Hzk1wUqzrEcDSb44e/Fd3sZGChGAQWCN3Y
X/Q7dQkwyf7OcP9KaPLkrE17jTW5vUPrOBQKidEv7ewgzwJxh+BwerKM+7aTDmW5
F+L5ZToGzaCp1OhiF5NPnVC/n8Jo+Re8bIG4KDqdn75Kyfs9rjrdAy4HPy1I6qty
tIuamjQj2414GPjCn5Ha1zm770SLKdiWptUZjFbiuzFyS+i/GYU6KkawWPU1F9Ld
QuIGHW7s/SitOXuq3iO7gzq88Nch33o9iVzZKB99wVwjTFE3/EDcZNRGYc1HNTTf
5jwqFZA5U4rO/sYEX0rk3DP+DSMCwGikH3gaQ4sgtZJWBBK24UOp2SXfyQvP5Kl+
Zf4fE5Cp+wgDm51MItB6Rq8L87mnZ2m8PstDJloa+MxP5sWctbg4mo8kgQrP5rYx
S8sytY6VvdaJCMut+l6OxQxjxW4EV5b7FQeu/Ree0X7mPoFs2gMfPir7Kj1Dq35M
tOKAW/WyTxZr9b1TUttoGoVpCn0czsD+FGeC6zJgFCTl+Dw5Z34eauWLUQKnXi3z
jQJmokfLu18uEE+aJEmiLQ+wzaUyEM2QRfZ3Xq53LdULwYrclYI=
=537p
-----END PGP SIGNATURE-----

--xp4kw46cwzx3ms6p--

