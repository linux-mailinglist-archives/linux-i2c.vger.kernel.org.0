Return-Path: <linux-i2c+bounces-9820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2873A5E962
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 02:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1B7F1893CE3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 01:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ABC78F34;
	Thu, 13 Mar 2025 01:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BXPR9wXN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE307083C
	for <linux-i2c@vger.kernel.org>; Thu, 13 Mar 2025 01:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741828765; cv=none; b=WIK7FxrWNPu1t4UnrV0JhixS4/u1zSGim12rCJqOafhS4399Q7CKxxh/4dkH8XEguivOJZr/3H/QVFlumbjlstzoQOWhe5XHJ3mdtigGkKITVAb+HyOehZwBXsrbz3qW0KlNqjJk/gUWiubzfSSp6vvUEwGeNnULc9Ro4YhI3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741828765; c=relaxed/simple;
	bh=DB68pVaJJ4VS0y+Z+2ellm8XL9+PFw9fg9mxEwWFP1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dva1sWC59FsU4lt9bQjg7vdrviaJd20fWR1BbSdQwjJVQ6o1E/qbZs7KGjmRLiE4r6NfHTx2A+rLm72J7R6MqPjxXB1U99mnukzKeX7Y7crq8uHAGd280URr460I6mJ3LtBTFqkruZ7r5PZV34Gukwbgw6UbHckFUHWvSr20Ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BXPR9wXN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DB68
	pVaJJ4VS0y+Z+2ellm8XL9+PFw9fg9mxEwWFP1s=; b=BXPR9wXNEzGvWgE7maOj
	Z2BxD7vbxL5FWMIlcQDzKY6qPnmNui2p07GkK87cf/jjk29HLYbAWaXPU3ER+sDM
	i0P6cPvK7yKnKYa4mIBQBqaLBzdk/604S+QyMH1OOTDgd5zi5y9c1aVc2opvsBvI
	gS/TWPT2PIbOuXN72teTk/P5XiPjOcnU239brcOqE6jKiSM01odL0bmoJL8QRubv
	5ujbeytgi6TngDyzZI/z/2dPtNGTgOKqQzakbf5QgdiltMCnDavT7edmW7Qz4RB7
	5NHfIEokx5q9y49JMBAhiOKciVhe9yl5Nqz7U+HQBsVZPbzzBPpxE8UssewYCJqv
	3Q==
Received: (qmail 1441578 invoked from network); 13 Mar 2025 02:19:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2025 02:19:13 +0100
X-UD-Smtp-Session: l3s3148p1@OGcbHC8wPJcgAQnoAFAeAGR2+CrWUxoz
Date: Thu, 13 Mar 2025 02:19:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <Z9IykQgaOL8_Yh_Y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
 <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
 <7d9e90ba-8c23-44dc-b64f-80213216faf7@riscstar.com>
 <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpEyUD+s7U217eGg"
Content-Disposition: inline
In-Reply-To: <nrmoj7gookedlz2e3fgu3hvn3s5fc6vrxgjueynyp5orj63k4b@cqlhflioxv7h>


--CpEyUD+s7U217eGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I checked the two drivers last night and I can see some
> similarities, on the other hand I also understand that it might
> require some extra effort.

I think it is okay that it is a seperate driver. If register sets are
too different, the resulting combined driver would be a maintenance
nightmare.


--CpEyUD+s7U217eGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfSMo0ACgkQFA3kzBSg
KbYCDxAAkhFVL8kRdmj5c8fja6ix5dc1ANAZJYGlh/G5aNdbj9MhxbQn1OgWSvxZ
Ap7DZ/G1dkvv/CN7mjMUjqQOaOJzuNdL4m8+pzbVjWwt9odvqe2dzlx2f1Odn/Nj
g+3FTwbctyi+W4sxkYsv9Fvu6+Z4VybShwmwBzai8HcLvDYrMCTXYUFefX4xodi7
ZD9mvoGSzRGEKiOITWxDaR6u/6YDZ9fQE2LDEbqGluz6ecDE4YHjIOa/tH6HBx9y
ut8KLeze7qRvFbkKTVSAXzTnICPRzhE74arEscNQgJDAa0HjJaTPCHT26Z+dS8ne
+uyF37G/pzBw21/78IEmvaPr40YYn0oJ6nYL8Z6hankoJPA2MpCGhEPFqv1zxRMo
fnD/CkZSrarzdzZ/5hWPau5cTiqfhvJXOHGXy1Qc0ZT95lAKoynxpmqSxKsFBjmr
wUZ3fEcR07oMH4NibpI+pTW/q6ah9aUpESH7SDEZrhJ5UQ1Iqhs3Abym02cNc31z
XckFbHTT3ED1NNvImxNx7lH0AD8rWwWJiiCHTM3SPPAuCjXX01nwCOYhUu0s53iK
jXmQq8IFMQ8w+QFpVJ52yzlSoTzWB4QRpoztES4C74EWEznf/azvRi3GGQKCdfEK
k7yd47ORfzrtVqrCNKJQLsODzFbAvo1is5nfxcWpD2KOttuXI28=
=2C6g
-----END PGP SIGNATURE-----

--CpEyUD+s7U217eGg--

