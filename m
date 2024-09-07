Return-Path: <linux-i2c+bounces-6346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6897032A
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 18:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24E81F22192
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Sep 2024 16:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A3415ADAF;
	Sat,  7 Sep 2024 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FC8aTlCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC4B657
	for <linux-i2c@vger.kernel.org>; Sat,  7 Sep 2024 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725726764; cv=none; b=GfJW/5rAVnBZbsLIsfV2fHTsqYsYArw6JIJcJCYBvX81mEc5FV/dAUyFxIw22PA1I9fFddM1dyOQ9llYBWM0Pajd+G16E7Uu4iwBNPSV98OuZ/ATYVwllkJEcro+oCqwSKEsJEi4X2/6JC7FepReTD2cOxDcvUXFF4yaNArsBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725726764; c=relaxed/simple;
	bh=RqyJiFLQ6SyIFcymeqr7hq+2LwRmkb6op/Ue7WGwHk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAMzdDJRf3l3JWKOt7rSTgwYi4dFDTQx9evtai3GY1uaN+8W4+s/fNscvzWORSqvCch3EqVwzlarDIKYaIMQ533s8q2i5rA4sjPtA76QCqaBy3hROwwUyYl4k/mDxvTLz3e48aXRgyRYhXkfPW8alean1GwPZmIsgk6A5sB7e3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FC8aTlCD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RqyJ
	iFLQ6SyIFcymeqr7hq+2LwRmkb6op/Ue7WGwHk0=; b=FC8aTlCDDuaTF1tYg1t4
	j39DHSgfEWCQG+DfDVRdSiw3cCFEgBTla4EPi1vEjGsuEOsAE1OvODc7RiVXVk+P
	wrS4gyC9ga4HWjfLnZNco82LXmlX9I0/YmnBqpq3a3QhK/mlpzdg1xNlIyh5afA2
	P3xw1R2jtuSwDyJ2ib/P8Nd2cTBKB7fi1GWPG6+faGT85Yd8UHr7NPdpXa4zGn4r
	Pv3zc3n5s7Ro2Q6ABeHy+tjfX/QGEvBEIFyrxHSMGvLUG6SVsp3h1PORgsS+0D8N
	qNRaXVnaReasYEVDjXPhQ1CozUtrlojllGceq+QFDIWCbW/nZuIkN+hQ6fROpCj2
	GQ==
Received: (qmail 1567190 invoked from network); 7 Sep 2024 18:32:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2024 18:32:28 +0200
X-UD-Smtp-Session: l3s3148p1@E03QEYohqMsujnvu
Date: Sat, 7 Sep 2024 18:32:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
Message-ID: <ZtyAGTw6_ZcdJZzJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kRf6ogCndLhW+1Br"
Content-Disposition: inline
In-Reply-To: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>


--kRf6ogCndLhW+1Br
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 10:13:04PM +0200, Heiner Kallweit wrote:
> This code was added with 2bb5095affdb ("i2c: Provide compatibility links
> for i2c adapters"). Commit message stated: Provide compatibility links
> for [...] the time being. We will remove them after a long transition
> period.
> 15 years should have been a long enough transition period.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--kRf6ogCndLhW+1Br
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbcgBYACgkQFA3kzBSg
KbaO1w/+NMsAlWK+Fd2AJH2DcKCPkaiqvmMoTlzXQ0dylNret+22iFmRMlr+HhD/
8hwYgXEDN4BzfXqiFbWANHC0yV2HE8UDD58LPpPkG0f8ifLqpbiCYp1ezYorPyOy
TnWwF7EXZ6sMtEcvlINus0HHf03QSb0uh5Nm7lePRQjVIQRYIEzTtoI8pEHm9jcR
O8M9a/fTE09ESV/K5PdELEaVwOgQKgBlCJF8S810VhbOP/WznWY/zDB2aWjqO+7G
Nkzgq2vWaVzP2/nuzi1prZ9rsalE4VYMFhRygx2YaXvtyjkW8f0GWET6aUM7gh+a
L/qyraahuzVsXHOuC8WbTO3gQyMankAkl6l2Yh8z3NK+oDBTMfZISkQE0rFQDkes
wv+bRQnz7NX2WNDvkNNhBOsz83SC5dSI1XB6XGnpjUe50z9bWGJMkJ9DCuO1e9TT
60C2RUpOo6ovTewHRvHNkKu8LkhM9hl0UIoXz2Jj3Q/th5hGFyGYOJnybwwJN0Ie
uJlswmdEShXceQwMl6xXkCbK6X25a59HuBN6l73wnYnqpATAggCoxZTSUk6XhTgB
eRyjRHn9HyLP6vgB6esqjKjnbxBasvD7kYTQKFq7oGy/MPLXKoBe6ToA4kanl474
G0X7fRmEET2g5jU6CrEeUAcJ1C+vGRZ6usEs50Xra7Ks5lKexPY=
=2Chk
-----END PGP SIGNATURE-----

--kRf6ogCndLhW+1Br--

