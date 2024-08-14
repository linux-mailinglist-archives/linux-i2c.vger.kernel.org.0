Return-Path: <linux-i2c+bounces-5392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC419521A1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 19:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B620E1F21CF4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EE91BCA03;
	Wed, 14 Aug 2024 17:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WOQPNq+E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F5B1B9B2D
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 17:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658257; cv=none; b=Gk0YzblGNhrKzdHLdKH/dae556S0NOxBeqbmyE7OUlUgUuBAipGwpUm0mud+V86rmyn2ehu0e6Marvfo4Ok+ISmiFd6IEUDG6jRwCl3Mt1A0lktqj8V1+TA8SehpgI3kP+OPZnYBKMgtvsoRM6HVmbKRJsrROIZR/1FIwZfCB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658257; c=relaxed/simple;
	bh=WoQC6pCxJBYzUKUxU//nFDKHdTQJVn4ATGP2D9w3SxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsxmmi06hiQqxWVRbCL5o9fzeD2IbSgGLb+fdgvTSgRvn9e2qwu+n+kojAhbfzPCQADdVPjwJmV9GXY8Rgw7Zo0Vrslp9UM97lhkb1h+5TMJd1tuSIV2p9aUJPqVEPt36ZyFEkqkVeMIjRXwPoCtaPyIODYm8blOCUYDoT6EtS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WOQPNq+E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WoQC
	6pCxJBYzUKUxU//nFDKHdTQJVn4ATGP2D9w3SxE=; b=WOQPNq+E7xLBIZIwGPvx
	cyHwNwhRlOM91U7IstUnrBRYpcaOYvjMC2Fn03/1cFzY8zquy/KStLPCk+hZM2nO
	TD2qC2+5lHhQ9VKlVMjE6R0Ew3wzJ3rs7ZHaQgioDKlb0QbcGcynSeQRIXwsxXt1
	s09Gxn1pLdUUH7Rfv4bfG+JLjOAbrV/0H10y6jIKgn5WJZ3BRqTI6fG+iNw3oI+2
	by3m0WvLJjzadnPtqziCceKmjaUukwJrfx4d/grVYQWl6L+jBiHUZsrUtn1ucnUq
	Div6PZQkrnA6HPzTPaFg9ltIRQXU3iTG8vqh59KydMX8kuhXxDthl19TYrm2ilHq
	Kw==
Received: (qmail 2060209 invoked from network); 14 Aug 2024 19:57:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 19:57:32 +0200
X-UD-Smtp-Session: l3s3148p1@9i7Wdagf2OkgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 19:57:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] i2c: testunit: sort case blocks
Message-ID: <ZrzwDPlRXoq3Xo64@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
 <20240811212317.16119-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4F4uSanGMtKk+lCH"
Content-Disposition: inline
In-Reply-To: <20240811212317.16119-2-wsa+renesas@sang-engineering.com>


--4F4uSanGMtKk+lCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:23:13PM +0200, Wolfram Sang wrote:
> Because a 'fallthrough' was refactored away, the order of 'case'
> statements can be sorted better now to ease understanding the flow of
> events.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--4F4uSanGMtKk+lCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88AwACgkQFA3kzBSg
KbZrmg/+IRlcXjntOKFJPjGtShcuAEih97ag7wkOK83E2ANdInCcb9ypmjOoCyhP
77Ht6JR7uVZXJQvJX+pOpePvUO7ApY8ni/HZzyDthAxCX7iCdvImb9ngq7v7pKO2
nR2RS0rMTFVJcCXimCOkshZmXjn18MMFPUQaVXPdTtCXtJAjchh5Cxu+nj8NmRCs
LnLPZHMw/2xDOTqU2R75xZRPaVlswUStmht4/bZH70x+BCuWIegd+9LwdS2zcbqZ
XMJ3hk2i9Bp2YWbjce2+dgNDG8lzz1kzzb6XuwIr81isw+r091HxKFYHFBMc/84d
9xHb9AdfIVqPSI34bacZI5YN4MEdKsitAumMX6WxaUpnJphsj+fczZd8AG8BnlLq
cEYwvLycm2pBr4sBYAVs/Fac/z0XbUVcuass9sMcebXWruK77CAVjigzCwoUxh43
KjFn9JGIq/J+e33gXezeox1CBmlgJhU1SaU0P2fFAd+S5TkXjMqTMVM3wvzZvGDf
adccdfseSgc9c1MB6rjUr+wG4UFzflCtVHd9JkdJMzjqEBZa22psaYi60FymS/v/
gG8btmzwEtdKjt/Y0i5rtrf3vv5UAuBO/NSUBnbPNbaY3SDTLGaSAQ4sPAKru+yC
bt8stFYqBHFYx+E6ZJ5PxB0M/R2+KFTgOCbVGXzYTQs8ZlDxnn8=
=3WqN
-----END PGP SIGNATURE-----

--4F4uSanGMtKk+lCH--

