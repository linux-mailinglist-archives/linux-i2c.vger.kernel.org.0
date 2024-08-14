Return-Path: <linux-i2c+bounces-5393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC39521A3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 19:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6442F1C21B37
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7851BD00F;
	Wed, 14 Aug 2024 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ejlHdekU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8481B9B2D
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658261; cv=none; b=AkNjFzXeubVhCe8wdOCsr9AP34NM70wF7op0Z0y+zYCEaByd5o3fOYE9DZBY2pzQKsgld8DyyG9ihzn+Pl7eLWVjldmx2UN7inOy2UylJrAVI94rkG44ujcUTt04c2Q+mmTtPi7elQ5rHZy0UEk0cLsqLtIQ+csWmMFTQ7ZcP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658261; c=relaxed/simple;
	bh=RbHjwsKVbqo8D4VHCC7l7EI7qv//XuS2kLmmgIt6lP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL3D2OjEofKBFdr2UeeUVi5yuTOmjNIoszdvaDCDld5qGKY36kSEW2VNd2lFX/GlKrwmVj1mJH2QSNAJEkm1Za1VWRKHYRHM4D8I4RNAyJuKbUWTnFVEjjEKfMEwaeiN1UBvnP7VX3iKtKJ52CTM3KjFFlYaIV329AanzVpsRKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ejlHdekU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RbHj
	wsKVbqo8D4VHCC7l7EI7qv//XuS2kLmmgIt6lP4=; b=ejlHdekUzoIR0iAA1RN0
	h0U5TuUWNg/BWV69dHzdz5rYCPETDM6QDwI/0Jt4Er4zNKCvMX3XFsIKwpOs5JWG
	2Gw6tsUHRzQwdrEbWCOFExGc4Evj32PRHsiuTDPzcLAdPRHt9d1Y+Zh16HNAI1GR
	ryqEiJPci0LpbEwvfbEymoFsw4SMvuZd7/WHR4nfLMdIp5grLDWrmPxJKPjNr0qu
	vuMHjEMR4invkwO4bupFRBNGbPG0qA2B7ud2DebQKWXDDnAaqBX3R/UMGOfsg04e
	jgWrReOydTGF6iq8wk/VOc5zw257R5A6yZjziEmonJYoY6hIdtIpKHjaI1mDcwf6
	hQ==
Received: (qmail 2060249 invoked from network); 14 Aug 2024 19:57:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 19:57:37 +0200
X-UD-Smtp-Session: l3s3148p1@QnYcdqgf4ukgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 19:57:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: testunit: use decimal values in docs when
 appropriate
Message-ID: <ZrzwEBSNRemZbg_u@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
 <20240811212317.16119-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zlNtEwY0kCKxWWkB"
Content-Disposition: inline
In-Reply-To: <20240811212317.16119-3-wsa+renesas@sang-engineering.com>


--zlNtEwY0kCKxWWkB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:23:14PM +0200, Wolfram Sang wrote:
> Sometimes decimal values are just shorter (like for cmds), sometimes
> they are even easier to understand (like for the delay value). Make use
> of them.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--zlNtEwY0kCKxWWkB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma88BAACgkQFA3kzBSg
KbbXyw/+NX9jQP1/VPEHsXAKm0Be4u0lnO2sVDuGMWh3o00LOHiCSOW1kUsYxetb
nqQI7yMg0X7LwkfpPq2Q8tbJeLLHzJ55od77q7TvchNTYCruSCl89P1ijSpUhlCH
7sFc2MmEgVZWryU3/gKaemcjcCS+jwxg0v/SmL9VMskCXwvya3Isq3srQ5cCBUZe
F7wXmg5BmnVu2wn1+H6PtroFD6LuH6RwdWHr7WVyZWLydgsVjL1ReBeBaIfBv4Ru
RjRc/loUKkCAr0B94em85dUwPjzKmMxiqPPJNdkb2ofU/nMqmN9zRSgWoaehXEIb
qE/nTiUBoM3L+3ioZSyR7IwskMTPFMv3IVx+U0+oPdz8qWYDB+e/UZt+PFke0+x2
GoP0kH8QvXCHYg5bucKhve+wdCjvw/JJXDL6jB0bkTp7jBX/BCItLbRAc47ijZR2
Vvsrd8Wo0z/89eVvqEOgAx0gMayzeZJzBBip6hmSqTrVXNGmMEsHbLy2fSxIu50a
BPWoIj4FeJ+kkkIPYD3ePM5ztceqyVeoWIwdnZCnpL63Yx6ojTmEyqPZRkpTDrgR
RI3xTqKI8K2KKfvv7vE3fkTTvfaR7ytcYcum54hIx9CPbsEurnDbAQgZ43vLBey4
R+O3cRCTeJK/Y9uxXZMiaNPVA4Y0P5L0eVc4QJnwSNRr3FPIZgI=
=USyu
-----END PGP SIGNATURE-----

--zlNtEwY0kCKxWWkB--

