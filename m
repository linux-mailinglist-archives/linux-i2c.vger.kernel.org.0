Return-Path: <linux-i2c+bounces-5293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21D94E736
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 08:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2126928071D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 06:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FCF15381C;
	Mon, 12 Aug 2024 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TOSj3KL8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C057152790
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723445613; cv=none; b=q51QAqYtfMCqaMQCHEIO5NejIHLaY5N+oStZk77mhozPlOxN3cHukFTpThburCY0liizuq6kW584wRSlLRtrp4GFBHJMxaJLh4G4x7pSFEIbhR2+AfFScG3x9T+Vzt7c+z6VQdOEhTJHoqGQhNFgupmGB6kOMIMICe49RKh1zmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723445613; c=relaxed/simple;
	bh=mSFle22zJAezmirEZH6fkQtA1YJrvNYI2iXiEOQwbhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXbWQXtxiPA+JB/13qeaXnKXtPO/sSvfV1uuk3BL/rdcVJXcOlsPE58HGvh9ePnHCgOCt0n/zAwdi73pxjxFNpMNmhYVtp6wih8gG+2Caj3czK9slaO5joTOvm/SbwG544L+fR79Qu/hM08/wHYgmNwPOmUdfIBBdzt75NT6sDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TOSj3KL8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mSFl
	e22zJAezmirEZH6fkQtA1YJrvNYI2iXiEOQwbhQ=; b=TOSj3KL8YpMybYhlA8Ng
	gO01v92xPNf1KiGHE1uV4XKY9f2D63KgjBPUsrwhQY7L9ol+SrzqkQdB+hTKz7gR
	oW/WvSC7E3syHLgKJYioYnm156/5sEMtpXe7uc5BN7ZAyomrgfwKtnPLtzl5ACYr
	goSpGBXqjV6v+3FDJYlPHI2hJcv+WOsN/DD/nd1jZZSdGnaotraN0rG+jeMvuUq4
	DIY+MZbI9XLmbgk9r7+HY7kMM36zW6JRy9HBDT1TQofI5SIM87zxtKzPAkdtEyli
	p1UHl5gGKhNoIxyWFt7DP+PRm4XYnKddyTwqoWZ4WQXof4hBs1JF9Brux0Mm230v
	pQ==
Received: (qmail 1277415 invoked from network); 12 Aug 2024 08:53:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Aug 2024 08:53:21 +0200
X-UD-Smtp-Session: l3s3148p1@K+LV8nYf5p4ujnvj
Date: Mon, 12 Aug 2024 08:53:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, tiwai@suse.com,
	mika.westerberg@linux.intel.com, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
Message-ID: <ZrmxYB4zsOpOP2eG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, tiwai@suse.com,
	mika.westerberg@linux.intel.com, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
 <8734njl7my.wl-tiwai@suse.de>
 <554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
 <87frrhaofs.wl-tiwai@suse.de>
 <ZrIJBUJfgiKPCKXv@shikoro>
 <87bk25anep.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yDi4V8Q0uGeRFZzk"
Content-Disposition: inline
In-Reply-To: <87bk25anep.wl-tiwai@suse.de>


--yDi4V8Q0uGeRFZzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Yes, you can pull i2c/for-current. Maybe I can also retrofit an
> > immutable branch for you. I'd think, though, that it is easiest to wait
> > for 6.11-rc3 which will include the I2C part of this series. Or?
>=20
> Yeah, it's fine, I can wait for 6.11-rc3.

Done. Said commit is included in rc3 now. Thanks, guys!


--yDi4V8Q0uGeRFZzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma5sV0ACgkQFA3kzBSg
Kbbb+w//RAEp9yLwe6ViYFzkpfdFgGrnw3kMDuG2vnzj7HvCKIKHQnbPwPQVI/W6
LDPR522tlQUOcWBrk359zh0ERVEY1mQV0kL7zdJ/Hz1PaU3QnhlmZa2XZXTWD12h
Zg4sCwF26/ESwHEOUkODWsE9m6tqVZcJdStA1nG3GJEUJ/KZ1j8L9ZGTEyZASCge
Nt9MbdqtFMZKiW3jkpyge8J5zpVkxkgoeOPqO5af68wNJZoBvCBO3NgUW6FwfRpJ
PWGeOhLML0ubuafHnIjHC8oCkC+pwIhXQBuowHwdQwas/G8vU+Sg4/EWtFRCqVD4
o1N5LLvhJmV/lbNYKeNlikM/wpWXQcvRmmnDXy47Hj7Yk8NdwuSlN6kgPpXLB9DJ
sxX8te2EACW5h9LTqrTC+Q0Q0dCn3qFTrKwBn0vhivrN5sIPxcLCN9Wdz58kVgMv
hgzhXeGxbc3TjUmvj5CXknSYHglwCSRUrFkk8gTfylEESzaYuPHqMvC9V26PmSs3
e0y/EvLfbjKqs7SjV+ShEOeTaKZLmekPv+3/2qB3XT1pGkDjOPsQ2xeF34FocJ1X
Bzaa9qWaPOf+4VRpeP6VLeSe4UwARu3UG9SSkCd57S+RH7E+/oukoiCZE/iTli66
lU32n1YefCTO2M1rG4Y+1/mv5q7GuHfL2JzU3SB3GlDxfWO7PaU=
=nJ+E
-----END PGP SIGNATURE-----

--yDi4V8Q0uGeRFZzk--

