Return-Path: <linux-i2c+bounces-7266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A5994411
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 11:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A6C1C24384
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F90A15B12F;
	Tue,  8 Oct 2024 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NlFVRqi4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1A13D601
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379253; cv=none; b=G/pFWQuoTB0Lgcy4e5lJTSAK6tkdTA80X6UbTFMcBwg8SfkENYVce6r8YxHG0p2gStcrpfw2xeomy0IOy12yh3xqmAvDh8KK1nxm+0nlSpWJud1j1Wpp4sCZXciSKHX63Y7vD8xrEJVcRtJokENVwR9O9ILz5u4rA/1dMAg5IQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379253; c=relaxed/simple;
	bh=KKvy7ceutunpbBoRo0OCreZN/jGggX2HjnjwLhxtvjw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPNTANUud3CRulzOFYdYcwlUCNW6j3Jn2WZfwdAoF/tdE1b0oLlXqV+/OaNj/trvcmi4D84frSP/jUndnlBgnQd4pQAhIkuiPf7wLE1sHmkFy5NsuKI+G+5szLmAxspmKJW7ZrncRU3AY+Q9aB++0enN5V1QNXOqYS+zLMcQ6FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NlFVRqi4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KKvy
	7ceutunpbBoRo0OCreZN/jGggX2HjnjwLhxtvjw=; b=NlFVRqi4i1CT8mlOumaY
	jOyhrJzYFhnArFvO4cgW6BRtUCjyaS9qw+QvTGnmYglye1BXQVmRHkW2X4AyvxRq
	Lt5gxKq1Bo5x2PmYAriYjeTP7/GmJrNxHEbAVBkjMpnFw2rYBLfiYszunb2YQaED
	DxJHDoAPJwPgbsi2iwNmkLq08DAZ3abwxFDJFyjVq4klSxqf7XKNm6b4uXMOIZIE
	7xIJHMSL12p+6wqilaXO9dme1UcPsX21fDJFeFIpXoP8r+FmjyXIFKCgBvlduXw3
	9lkf+J8qAnbwrGjueCJ79qi5IdlTp83N3zYYwayeM1A/b3FDkBD4LRRvI3hRYk3L
	4w==
Received: (qmail 417640 invoked from network); 8 Oct 2024 11:20:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 11:20:49 +0200
X-UD-Smtp-Session: l3s3148p1@R1Erp/MjbkdtKPHJ
Date: Tue, 8 Oct 2024 11:20:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <ZwT5cK6yNnOuEht1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>
 <ZwTyWgNtr17bUjus@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsezKW9kjWsjoSGm"
Content-Disposition: inline
In-Reply-To: <ZwTyWgNtr17bUjus@shikoro>


--KsezKW9kjWsjoSGm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Isn't here some replacement needed to delete clients when the adapter
> goes away?

No, Because the clients are covered by the generic cleanup now...


--KsezKW9kjWsjoSGm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE+XAACgkQFA3kzBSg
KbZcCRAAsvN9b9/glV8qEt6dq1jpgjyLEPhNi0HLDPrJKFkgNJhCkgorBYB/x6+a
g686xnMrBTEQQUjNDPlzzBqMDidKLR4EBjNDwW0DJZhMkzzv2Skk5yTwb3US87mh
PHiNV0JQiIx6Nk1tBHagwDVt/tMjdSWT3s33S1xXU0wBY5U1BWemLpeWhn7f7x69
6uoo8flqahNE7Wf6BDTJEfncSmNb6cqefJLbW1SxLAnw+6Dl0sLc/C3r4weEQex4
P5NseC9FLlAjzjqF+2Qc0LOkmWyIboNjR+yceGP2abrfHElTEnIyX/JSqY6K2iFB
OtZ2oRX8X9Ef4Ucxe7aA73KJmKI4BOyfx2X0oy86PznfJfUrnlBr2Eesp3w1JH29
Laselh3zTmHENKl2+VESQfTMgriyNFWiPAsbwJtsqtGOFtMprnM5k7BH6Tgu8Dhg
AXARYY9BV5UKJy+m/l1OqXIfW/zaKjqszhOl74YIUoPBhb38jzj1ufIwzFmru8wE
3dwtbGjQVSAb1vu9+9fyYobC3zLKbB3c4hClk9hYEt1ygr8aCw4A+WlHHAw+P7Iy
/Tbh7rYyXyeGfFNXYhJmuf6Np4be2RbvVrCgaI9UqnxUBe2Yn7xoT33nfm6sTg9B
l21oaGjG68FpCB8NGg5bfVFWzx+umFU12gp/slGwH8PlLXxCuWA=
=dbg6
-----END PGP SIGNATURE-----

--KsezKW9kjWsjoSGm--

