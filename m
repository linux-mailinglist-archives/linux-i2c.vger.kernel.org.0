Return-Path: <linux-i2c+bounces-8074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8689D3327
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 06:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECAF91F22E3B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 05:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FD156677;
	Wed, 20 Nov 2024 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ix2ARSNx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504711547FD
	for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080903; cv=none; b=lB2b/kSjqcXwBnmJicTowHI6pBZRPRG3ZwoPCut6fpGnSPh1wvw8wJcpXfbocFC0HImR6zEQ8CpHaMaZSgHkiZkTR3zhu/o1Jb3S5F/qaZ/rVyMDIV5kwuYwoPBtHHoZoP3yEzuBI4sNJvKq+eWkdsStOaW7YCmTbv1223+p3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080903; c=relaxed/simple;
	bh=W4fsX7tbJA415f4Nj4NqMqhwN7y/lNUIZZacs1xL5FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXNwdPClJuathilgt4Fem2ZIjtUNScmsIbzwk5Y6/gn46Z5RbnrquQfDHxBuzf/Ca4Wom067OBRJCTlyoMBGMXs4crK8DpiEohHgRvisbkLXFNFljzZdbijlKI8pkbs2REdfpa2+Yf5KFaxkTnHH7b+f7ZQmyd3jQAQT+7qX4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ix2ARSNx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N8po
	JG/3GZ03nbD/13+9l6Ai6KzvrJVBttYvH3MDLRg=; b=Ix2ARSNxGeMjeula4iin
	jwso6PEshaUdekDIrDAt8f+gycow2dfKKFy3G56gUrSCKRwxOvuD/NQIFOwCOUdH
	w1Px9D1cChEcqXEm8R+AdwqxxQbjR3UymDkmRuULpJdgJN9jkFNbDRez2yoATO/H
	97MIkMcXAPmobx03IhTOx2P5mv/ztkWTttOl56NZ+Nu5mf5ThSF3S9+5XnyJro1F
	DptFDH5D0ghxpA+b7MEFsMvhkAOYvgBeOb1au1+LMVRgi54kyCIitHrBUp0Vk7fu
	n7CVvhTR6oUR+QSdnenMwkJNLeYZZ3ZcxW1y9sufyeboTG2Qv5cHNXN1DNVl/i8r
	HA==
Received: (qmail 790055 invoked from network); 20 Nov 2024 06:34:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 06:34:49 +0100
X-UD-Smtp-Session: l3s3148p1@EwMiglEnXt4ujntT
Date: Wed, 20 Nov 2024 06:34:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: cgbc: Convert to use struct
 platform_driver::remove()
Message-ID: <Zz10-aGTFmWcw-1e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241016091323.12578-2-u.kleine-koenig@baylibre.com>
 <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzVjsvaTN1izvyJh"
Content-Disposition: inline
In-Reply-To: <twrnl6zi3tzluj4z7yutb34r7ljr3jbk5jzf6jzcygxt5yq6iv@h7cwqlbtcayg>


--uzVjsvaTN1izvyJh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This driver has not been merged yet.

It is in Lee's MFD tree, and thus, in -next.  It will go to Linus' tree
this mergewindow.


--uzVjsvaTN1izvyJh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc9dPQACgkQFA3kzBSg
KbYtmRAAtOl1xSFpJKO+3B0FMGXM9aY7+FIS4n3IcLagpHUi1Ki60fb7a9LSitHm
F79qCkLcLuff+l3sHIll0WpvVuwUZiqbw2g3hJDHqru7dnFh+dMmp7LhrSVF09VH
D1nwGYV2gAaeJf2ItS7wk0fTyliZJoAH66T/HW3EHNusdh8lS6EBvZV8G632qrKZ
4rV9++Xzej58kcWVDamEYLbNHbahkuNqd0S+2WKGVQz8saftWQPnBz8ULRNE8tjN
AruLj+USJhcZXsjBsTYj+LTS1AZSDNB60a9et5nz3KQ6AnBVuJmeQkQS8fxk1nTs
u7+bZiJNciu4USTzoWyqSE9CHkSOKG4KhWkl6QO3RPklxangGNww7phsDijN4eTw
fBhQ+0gtFc/UtOWea8uDxvIXnZJ0R7J7HgEvr4B6eAJcbIy9cGE7iprZLykiXz3L
NW218XmKExEYlTf2t4UMESE3HSG+HE8UO8nPhcz6owNJajNeobHJVqFryvoKhrTV
Ybdz9cqS5KIKK8FZSoJHTkmtleagP6XRGmnoradGDY8CGsCdCYarDJaum31AA8r6
0Mw5ivu/CBUziCQqQ35zQVc/Bu8P7VlZSJ2txW0hdhtBHOidbhT6bEmzSvdDAeXk
UKkuZnK0QP24h5pIUERR51aWFaQhEZUD/t9a6kz2TB8sqkUkEVc=
=d3et
-----END PGP SIGNATURE-----

--uzVjsvaTN1izvyJh--

