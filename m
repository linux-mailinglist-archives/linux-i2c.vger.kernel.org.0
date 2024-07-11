Return-Path: <linux-i2c+bounces-4896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0102392E35D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 953E9B2324A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E280155A24;
	Thu, 11 Jul 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="caHchicV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7014F111
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689727; cv=none; b=NiZm8lVmts7h5VIwtD3SXtT3SXYX9t9ijI7rU9mrDoFKiUYZRVMu8kzcGdJ/OGi48MDwnypjtUKYgvhCNlGevywk8qQq4BhIR6PoQ6to4i4LQ+s4hqneMsaYpkITar/d2LF2oueUEbl6Bcijqcm56yLJflgI7PHVteA5TWgsaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689727; c=relaxed/simple;
	bh=WAEcsu2j28NNNgwpUOW5vvLGPW2YsKY58IKFklILr+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2dcwXP9ubv02AIjvDtb2Qeuznw4lorGLHSFILRhLzllrkMEqNJBeZhB0ugGDIsWKS/6TtaeNvT3kxGmrX4BtSUnWvflto1+QRxAcrrFDn04O7GzsTD16JeWe3KbdxbeGG/XUPtro5vCHWBf9LXccpi+R+zoP7tLrHnLvLEXq6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=caHchicV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WAEc
	su2j28NNNgwpUOW5vvLGPW2YsKY58IKFklILr+c=; b=caHchicVWxSuiN6hKWZC
	ko4saSPZqj1OG9wxcNcEAvreZVO11jnUqy3d4vuRjHRkPTy4ibtigluUVrQw0Nj0
	5xl6OIjFk+RRIkK6b7ipGNKZHhhVmUPZuc9ipBS/bTbiWTdR2nBJyTAFCxGmfP6Q
	9D4b2DrYLjR5/drcGYYdq/E2jWU9A6YzmEheSTwun+w4W1Rf89JT2FSuDtRRZtZq
	p60Eq7sHOpRIsIEfW5+EE0PAXjJ5J0IUc7/dL7q3bYZUTWxa3ienCgJCheI1gkui
	LkU6gE8K6TAie0YgDu4UTxS5k0OawHvDfha5WI7TkTckeAoxw9Zgs7Nlx3EthTQW
	Kg==
Received: (qmail 792474 invoked from network); 11 Jul 2024 11:22:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 11:22:02 +0200
X-UD-Smtp-Session: l3s3148p1@9iusS/UcMqggAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 11:22:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entry for Conghui Chen
Message-ID: <Zo-kOlU1ltMah11Z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org
References: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlhksqqM/UyfJ9E+"
Content-Disposition: inline
In-Reply-To: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>


--wlhksqqM/UyfJ9E+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2024 at 04:41:50PM +0200, Wolfram Sang wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history, so delete this email entry.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current with Jian added as reviewer, thanks!


--wlhksqqM/UyfJ9E+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPpDoACgkQFA3kzBSg
KbZJOQ/9ENJtCcfOwOqoJRYoTJAwRu0IIKzQD3J2jj+LFavghe3BBZ/39qMWbDHk
gUAa1AYAD6K1TsQyxKMYkC5yc3nFUqDhgEL7hOtc9IdAQUg1JWTgD2Qj5wcFyrDF
XVG4hFIYA6X53/WolDo4ioHyLAk2QD4kNJiFpmRfFYuqIk0JkeewabDJeW032kEY
1XEh4CfYqKzYwpWZnhZQAR+lRLD7VAGEj/9d1m9xY0aM5wVn/mSa4+bGMLeGjfrM
WxULGRV0lrDzGYL1Up9C3B3Mohpyd4DZ1yWMHGOJtwyxKlIH/J7wQe5vH7YlSDpV
hX2Fl0abCiK4UIc4gtQO/ItrGxDx8kdLVsr6GnyRlNmOldQJO8OIdqiZzjDOB4ft
aBU8SL8/tPDP/Khtyh3iYldaO7Q/Y55rD7fjDG7sWTd7vjnjyMAD5S5fPuPdEm+N
dt+taHbDjND1Doe/xzsbNqrGUOAATOgqCluGpGpcFRtIQ5FdhNRN9+ejKNRNMKFz
i8OO5/p7eETE2+v1ZyLnJCYCcX8gY+WT8E+xDXMCPWLj2UaVI0CwPdHGngqCUp6p
peno2uUBE8DEZpNAGxvMUlzQQdsZDvUI4OuHsEDWLO76L6IEIgpxEmKPywHZXD4a
djvUVcS1GPakQQ9CxPGd7JaRFKy1dWLizSckP71tW+LreZAxsQs=
=xlw+
-----END PGP SIGNATURE-----

--wlhksqqM/UyfJ9E+--

