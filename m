Return-Path: <linux-i2c+bounces-8168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277B9D7780
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 19:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD165B46218
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762AC19D886;
	Sun, 24 Nov 2024 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L4AEqI5k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B151AB530
	for <linux-i2c@vger.kernel.org>; Sun, 24 Nov 2024 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732460613; cv=none; b=RkJHZcC/Y9ZBuwbknR185ob4yRamHounLLATzE0Aim5j3nwKA+g3vf8l1TaAFqWVcdy+3fFQnvrABvItTLKZc1RUNv97cqRfgIBYAYihyHsxTdO/kdJTwGryc4YtkLdERNSE+sThhOeLSS9TAwkgKxzZjnuTvfQ+y2z3bhvOcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732460613; c=relaxed/simple;
	bh=nOyaFi/e4IJlmsvLGIH3KH7UpSzBHBUBVEFPMiN5ov4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZanQeMO91w9LoN5HSF5iMmiNT84e6IfjLx6DunRXns3d3pbnz7KphXaDnbfoob2QRpjXsJJJ8j2BqQ6HjyA12gwTGFbCSEHlP+S/PeD7vBx88PTd3OWR5Fe2ELoX905R3HWRfqjZ+Fmgo/mer31KVTqz+yPTuPobC6kEAZj27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L4AEqI5k; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WC9w
	EnYWL0EQTioee95kVRsxy7FIR1mXYlHTKXGxmeo=; b=L4AEqI5k01J/FeySqABI
	nNclRVmRuyS38g9Cr1vsP8MkrZHR1YvaE7ZK+aWjdrDryvLW5Eo7sXoPQ+VXbXMa
	c1WdP5Z6kLDnPBm0mB39YyAdS9cMlxtBfKKRAK3NKPmHVVnH5NQFrumiwSY7P3TU
	5pL8UyABxiVO/j2O5DxyKmyAehv5sItYSVELSrqGnv594hegzTg5k0oRZF+qt43T
	iDPKeaJ0B2O5NCC4h9BqlOdMWZu2Yxt695isPbdyPWim8tQRcNG5AgZX9Uh9OKtt
	433cccRvO+fNqZXrF+oj4ZNymgV5Ozl3wCMr1jKejYZIv43IntX+zfXiKGyeKZF/
	vQ==
Received: (qmail 2182007 invoked from network); 24 Nov 2024 16:03:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2024 16:03:20 +0100
X-UD-Smtp-Session: l3s3148p1@Hg6l6qknlNpehhYY
Date: Sun, 24 Nov 2024 16:03:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
Message-ID: <Z0NANy2xoSE7TDY3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kees Bakker <kees@ijzerbout.nl>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
 <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZqCwWEwsOzAY94AY"
Content-Disposition: inline
In-Reply-To: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>


--ZqCwWEwsOzAY94AY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	while (xiic_rx_space(i2c)) {
> Let's remind what xiic_rx_space is
> #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
>=20
> > +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> > +			if (!i2c->rx_msg) {
> This check is suspicious. If i2c->rx_msg is NULL then the while
> above already dereferenced a NULL pointer.
> What is going on?

Valid point. I'll remove the patches from the pull request.


--ZqCwWEwsOzAY94AY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDQDMACgkQFA3kzBSg
KbbqPg//Vnc4Zxwvj0fkEhvE8HZHChebEMmwLbL8JSx7dPb/7T3LeJUn8lJTP8Ta
UGCf4yx10M81atf8cRiupbI3lbphZ6KYoJ8C6Mui4wmu+1hI+7ve2cw44a/wGZJ9
HQ6KubeOwRaAAGG9ThlZ7B2zxCMrZl1pXQ48EG1Ct+Naxs61o0fPHvo8ja5x20QY
fqAN0URK13wBDnupixnge6eqiui0gUxZEdNHz6B12/QpMZg5xRTyR4xHlUeGjvkf
ivVVYjno2vCaI/+aOq3HXZMVr/e6cTbvcbmyxSasW2m+GaKccCX5vpS6t30bjc3E
Wm0JZDNxX/H5Gh9eXj6iAeAuGi6uwdRxuNgXKtkA7R9QE5PWUCReycmEScQheg1X
K9zxO1nyIkLRR+W+hFfT18MSyZJztBsopo9KT12zH+3CpvGtebYnK1wvlfiX97Br
Edq783MhPavJSjklmowJOdryPgFnP9wDapg1OQcYISFvGM433mWshk2y/xDUvHF3
HxU5iAXWF4B+RahGIp5yqHRLEs/+pqWiAW041qdmB2yGMF4Ma/3ZSMAvzsyKuJVq
gQGVsm7VB262s9O3J2ty54Ata60KCMHoI6TyoLwW6V7Kej635a2+y0sLkozvf5lX
6cQ380SDtvF8QnGqxG+gQelOLpfBPaQT6NqfTvs1T5B4sDz1BYk=
=pjrq
-----END PGP SIGNATURE-----

--ZqCwWEwsOzAY94AY--

