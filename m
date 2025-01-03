Return-Path: <linux-i2c+bounces-8892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C607A00939
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9CA18843EE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8A01F9ED5;
	Fri,  3 Jan 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i2LL/3Rn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4B219E0
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907360; cv=none; b=Bpc9k/p+LYVTUhsqK9Blh3nEIXydLxUusaQlK6STiOgOwVeQD9wg1ny4h1iXuF0JVcb2/i3dRnFfUQO+G4v/sy3rqWzwGS5pbf4I1rPc+EomFMlPTGMde3dkH2ar0uK5vd5BgftJNay+kDpu7Xcw3scT+cm6p0ppjGCupzdT8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907360; c=relaxed/simple;
	bh=Mt79dF5LZFyOeJFzb0aUcYRJxif6AiVV9XY1hEF08bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXVjV6X5gpKSKo0ECE8/hQ1i3cU6RIQdqN5NcyVeBmOZgvrNgF8JpMtspqavPAOziedcQKTW7vtbsLkoI9HYNAk+yWjRN0ZpzkLxhaz/ZlFTV8A/ulezRbDDLPUa2Sg6DAmMVKGql7fj5CvKgnU5kI/grH6vOMe2l2VZbKfeBMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i2LL/3Rn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=k+S6
	kIMGdD9Inba7G068U7KObO269XTEjvwYPnnVPws=; b=i2LL/3RnwKqT1+jlXqRM
	IWMLegMwziLqaHGCxczxo7KngNt9zG8qKqMoQlzTHTvLdzUT0QHfrBcRafUqX5Ys
	jC36ClbAoRPHfXZVCx+hsuVwiYQzMjQfb9Mdbp0BbFekcQDsxJ9fpVF217FbDb/n
	GLkmAwl29FWE1Yrj8vsRba+s4ogezV5q3gQuYICYLEp1do1mZx3aWhRckOywB01f
	Q7un3/KM5/nFdHcGdn9CwLAFwIWysyca1zR2+oWxFD/wc4DV27XxqYvV9Ot8lm/G
	yUZCXL9VR1YHSbFTycZEcbhH2YyEuZURXnZTStfIoskysnkIwDv06uEWeBd4XXLr
	Lg==
Received: (qmail 899452 invoked from network); 3 Jan 2025 13:29:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 13:29:14 +0100
X-UD-Smtp-Session: l3s3148p1@cfU5bcwqCOogAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 13:29:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <Z3fYGvxAs5HkUx_P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
 <ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dySJziBeBkN/MzbD"
Content-Disposition: inline
In-Reply-To: <ad839a82-8694-4f99-b1c1-0ee53c9d40cf@gmail.com>


--dySJziBeBkN/MzbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 11:09:51PM +0100, Heiner Kallweit wrote:
> So far a list is used to track auto-detected clients per driver.
> The same functionality can be achieved much simpler by flagging
> auto-detected clients.
>=20
> Two notes regarding the usage of driver_for_each_device:
> In our case it can't fail, however the function is annotated __must_check.
> So a little workaround is needed to avoid a compiler warning.
> Then we may remove nodes from the list over which we iterate.
> This is safe, see the explanation at the beginning of lib/klist.c.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks! One minor edit:

> +#define I2C_CLIENT_AUTO		0x100	/* for board_info; auto-detected */

This is not for 'board_info'. I changed it to "client was
auto-detected".


--dySJziBeBkN/MzbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd32BoACgkQFA3kzBSg
KbbPbw/7BACdJlannB3ripq7pUfzMWnqMPRdrUGJYDTLa82axiBLLFRG5R3G5mQp
7LDl4FogENRw/jpK2XtnuYBgOhObYuDKvDAWPxpk0huSRlJpCrl4Z/J+qKUmgmBE
eXMt0i7rMvVamXbomwBZs1sZVXTGB5VR1pRS9HcFtAnGnR1HQL15aCZ+YLvPajLO
PrW9qCYMmoMbbY93TidIj7kNgF4RhadtDQVIsE9V/Zp6BVVYk6EDsJpf5Mnk4OCD
rc+JNt9wnIjhMlsMNOQwx2fYUoFzVSOh6/7KF+lLVG1/YPEgxIBKoVNbZgPpYo6R
IM42OBfdMAsqvSZp0iVPLUkUl59jN+jNUb2PvnHhJR9qTGw4VZtXBAGE4ywL+07X
7zqgZTbOWC3MOCZRcIGRO+Och6b8VjJRH2xs7WR4LrJSsv4pEh37BH3uWL7ZiemG
anu8D63zR323p7H6beyAyZ4GFovrmagqulz5fAxf57bP84Kv0kVEkE2OpycM6Lg0
ndQu2V6Z3AD/gfEDZgCKk5Lk5RWr2xSiEN0ttqOxtqUVmGikaAiIoFsafw0ejdA8
uw9asX3XQHpPhGxs3xT5lycvcLfhWFNA793QYmVx4hElqYGpwEzAwhAfldaEJsGe
xE4KzOG19LvhesymTfbhkb/WMiICIFOK5lt50Z6RJ9T/dBOh+wI=
=6izm
-----END PGP SIGNATURE-----

--dySJziBeBkN/MzbD--

