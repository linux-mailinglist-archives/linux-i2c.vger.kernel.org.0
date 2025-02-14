Return-Path: <linux-i2c+bounces-9461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D877EA36320
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 17:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F063B3FC4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6F226770F;
	Fri, 14 Feb 2025 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e0BRCP96"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8477B26770A
	for <linux-i2c@vger.kernel.org>; Fri, 14 Feb 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550529; cv=none; b=qIsfHOxKuKg84y35mPxDeif2wmcA/KFt4ZdhaHfZa16hXyGPWvTHSzgOGg+0K+YTIoJuiVDc/6t9gn9ldQskZZtxeWHV9BVIRaNTjjo6qx5U5jjd42SVRTe/d0vVFfsPruajyVIDqOH4TxpjzgM3JflkJHSSRhyteclh3hc5FmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550529; c=relaxed/simple;
	bh=DXjwD7WWdujRsuMk0j2J0BLpn80ErS0u0byo9o10LUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jd6bwgVbSxgpsoQB5gfqPv20jQPeydDFHCVKUzffTVppl1++kezkbjmo7s+jzLGnPNIvZrFml9ZtBfE2bh+yhNbrqHB6t6jSSOC89YN2wH66h1oEna1Mh2A2kqjCssy3HdkEKvpiNlawXzyoQ7cnUlL+KtTEJd01giP/s/9rhtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e0BRCP96; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DXjw
	D7WWdujRsuMk0j2J0BLpn80ErS0u0byo9o10LUM=; b=e0BRCP96OQHzBqC6UyIe
	SJX6ndqb5eabZiTCsmNSeBohn9lDpfh7PitVC9YtyRkYvCt5i5wXRrlCi58YGtGj
	V20pUnlJooJyOKGZ2zz9qrb75encXOe+15hhnsZVywbwzfIXxk8u+dOfL4LEx/in
	ROPUzFCM1EM7Byrh7LuD+XwiW+aOABjNEAMf8LCXBtRgYGKfXY/asnFcKN8N9TzY
	hwPpCjhxLXQ6OwtiEeZo2cgGsJppHeOSfnJHoXehcyqcReK396ZzaJz8X24E+e+1
	qeICPjdDvTc/QH+SGD44UvAFtzwmjspjycI8bKsnPvdf5nSjLK4UAtRBVZKUm+JA
	gg==
Received: (qmail 2456670 invoked from network); 14 Feb 2025 17:28:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Feb 2025 17:28:37 +0100
X-UD-Smtp-Session: l3s3148p1@lYugqhwuXsVehh9k
Date: Fri, 14 Feb 2025 17:28:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.14-rc3
Message-ID: <Z69vNKVosjAHovGB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <barspgw6bqm2q4uj6gbrze7ky7nsbgnorzhkdqk5s3jdaahdhb@nnyziqfcnz55>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ym6xFr7taPFRWYcm"
Content-Disposition: inline
In-Reply-To: <barspgw6bqm2q4uj6gbrze7ky7nsbgnorzhkdqk5s3jdaahdhb@nnyziqfcnz55>


--Ym6xFr7taPFRWYcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> Finally, I'm back with my first pull request after my injury. I
> really missed it! :-)

Good to have you back!

> First of all, thanks a lot for covering for me and taking care of
> my work during this time. I really appreciate it.

You are very welcome, of course!

> With that said, I wish you a great weekend!

Thank you. Pulled. Enjoy your weekend, too!


--Ym6xFr7taPFRWYcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmevbzAACgkQFA3kzBSg
KbZEKA//b0yaVbNHo+Jz5/Sp5WGmw/rojlSxp9a+uv570JjJc5pZ3NLqYU9N12hu
ps43QBQn2+FDQCRjLo9ejvI4xKtfx1SlmmEztcjtQEgM5+/p2zxuo5ZEUjG/11Q2
3FjtzqQ1StSA/7HHYb4s25UPKjoQNgRDvp/a0Z1JPbaEhjtMmbyOe7z64PPEDMWi
ZwiHuWxffvVah+I/Lhj3hOPvI1E+NbXyGYl/ml5J/Y7QAl8CkA/+dFFyWx5rJ73S
PQwP/Rwgx4vh1E5Km+Le1eD0JvW9P5WbY/9TQPFq7mO/qVrmeuvxtTcWjRgsD9KK
GocUh1Qs9mEJ2Op10a3+26V53KlUpRpj7Q8rs5/QTg6VxEqEBMid1jsOsATA20ED
PJrhNmhuAM4iSzU7Vuk1dHFim9DaWrsWpuHUVvTHOFrn+QtqddiI+MqpOtUs5TXU
ouzZhBlinqd2X0dQDVcxNp646sSjVlIHPXASEA2rvuvlY/gkQmWHp6SSklO8iS0M
KdXAZ8SrZfmmQ3cbam0py/BU4CK5OFfB7WhONwkyRuIwZno6uvWopExKkjVQWy/3
c+kx6jd5VsD2W/ECPRrJvJ7vCo1RNjQSFkgaLt2EKkPbTZpysQ7Wv2IfoqjcD6mc
ebpOtE24opSTYqmn1LUVx1oQ80MGcFQa/Y2zuWCMdiKs0Pvr4eg=
=/guN
-----END PGP SIGNATURE-----

--Ym6xFr7taPFRWYcm--

