Return-Path: <linux-i2c+bounces-7715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3754C9B9140
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 13:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F04A4283601
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 12:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A551A0708;
	Fri,  1 Nov 2024 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HxvSsw9w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425A1A01BF
	for <linux-i2c@vger.kernel.org>; Fri,  1 Nov 2024 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465035; cv=none; b=AGDabqAzAD+a8F/RCmokOFxRHTVHlr4AZiXzD8ZJ0DUyF8WnuQ6hnTe3/W1HkugwlE989upB8uxUW7ka3jmL3oR/hskt+6GMZoOgoM/quEn0CoAcm73RUQskQbhFCoeBsssFTQRue3JqKU45qJw6Mdv4zQ/zeDB50k70EnrNdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465035; c=relaxed/simple;
	bh=GeUG3bJ8M2/QehUOj/nHzg4piQjubMloLh1kRZnMQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvrGq59UqWSz9Hq5IW5ROxTQdrIoSjICUk+akkuQleWbq/3DWe8tEpGOpnwlAcpJjWXIlo38/PWfYG3z04B5OTtgWvXdp4jRacan6kClhroX0OqiC6xJ24UDVxcqdslu49Y1RcxVvV8k9by6SYbrvvUiZCvUg6YGiDC+pxcyYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HxvSsw9w; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GeUG
	3bJ8M2/QehUOj/nHzg4piQjubMloLh1kRZnMQg8=; b=HxvSsw9wot830pvYzEr2
	oA87pFnJWZOaYBLaYtkGWmNUJ+ZUzLVvjAvwblbmYvVFbflNm0jF4BkwsdhO+g1+
	u46dPG4UxOcrSlVqka4cBFBcwS3Lh9QijuJac0djAaEDadlL0K8xiUvt8xPYkIAR
	GJGt+VEBvJGMYW1Dg2lhSQFbqCIxS5czCBbTHyTRSyaIbf/5GH3GNhLNAOL7dKwV
	89cvP8RPZM0tTozUyOFw7bJYdSy9UtRGzPRwsCnUB5hhjOiZuucKpIuXaLcoGNcV
	17z3jYpR30iyKW2pnVnw+e+drSCWDohsd2LDhuedW3b2BVoXEn9x5klm0XPPsT1v
	xA==
Received: (qmail 3746202 invoked from network); 1 Nov 2024 13:43:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2024 13:43:48 +0100
X-UD-Smtp-Session: l3s3148p1@AetHSdklOtIgARS7AKAttyJ3WvkjawEB
Date: Fri, 1 Nov 2024 14:43:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyTNA34Y1BRxMhhn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
 <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+dnm4sWW3a9QdAyY"
Content-Disposition: inline
In-Reply-To: <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>


--+dnm4sWW3a9QdAyY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Let's correct the old usages of *-objs in Makefiles.
>=20
> Any comments?

LGTM. What about fixing the drivers, too, in one go?


--+dnm4sWW3a9QdAyY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmckzQMACgkQFA3kzBSg
KbZJLxAAg8at3+Q2hj3LMWVa5yWLplLeNnlh3z8ERZB3by7GupBg0MA1NAwG4arC
3WEfFTTQ6tWqsNiZAX96PUOfWNVERlhpT8WgI5bfqeMLYGOEMP78pBGp0vYQpXQI
xCQulen/IPpH5tDZk0wNkfbtYyy4KmrhNtDG2n+cO0xEHkddNiga2XYRYUn2F5Cq
RtS1TOmYX00LERNQNkogMIWUVV3F8kCz4H19JVqExHekqHJoJwtolcB5gvCufoAq
f0hpZs1Tb7lY45Y4Pbeye1Oyf8j0ZoRRIp2I3ZFTGyFok/kQdB7CISuKxyCk8n+A
2XjPMsis8f76dsqlUnM/PII4BDOYGOvpglB/4fkmZfRfA1K43ZI38bUiSZXB1d10
6gLdTNU4SGOvRK6pkjevSxh+ROhEmLZKrlBAVCbiBh2cDJ1T9ncxEuYAPvOxpY6Q
ma4TeN1mNADB+gjkCgf0d/SyYspklTAWt6VwqFERX1bLwxB7OBUgbNPMwx4Gilkj
pJoEqtjzBVhRgKAQgBoGD1z40YobzkLy9Va/7b81UV8V6b8s44miWHE0q6kgfMLp
/Ju/IZDSKDpFXncHacof7L9P6OG1Y+xpDszA9dN/qM3cGIjUptMFINKb7zP2yzR5
pjg4Pdia9V0xvYru8B6hwINS2Af3w1WfLq85dEmgM8GeB4iiJJw=
=nAj1
-----END PGP SIGNATURE-----

--+dnm4sWW3a9QdAyY--

