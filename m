Return-Path: <linux-i2c+bounces-7265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECE99437E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 11:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C311C214AE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E461B1D07A3;
	Tue,  8 Oct 2024 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bf/+tM2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA8192B8B
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378062; cv=none; b=AOHq7UJtja7QSxyVeYGPP3jIgdNQCo8BSei5c+33VlZ7nsUwbUuCW6/NMWTnnkb303yAeRTzYX5PcMmAT40HQ4aaWWv6jOyRECkIr7HwOdRXpYN9L6RgmXv69gZor+0s6RGa6QlkZrcuP9H1fAEJITmxYiM52tCL5LZ7XQlCK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378062; c=relaxed/simple;
	bh=rK3hXxK6jKT3XrsBJIyMwZ3I7Dmzpv0XQPt8NVaXQSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McA7vIUA9sJHnksb/Ih3sgG2D6wO01jR5FiDhk8vvgmybpI7yiFv91rAf4l+enkb2A9kOs3pkRZlJDSMEx4IQm2auGmzHRC3G6+c85blRIrTqu/uHQUKUyOe92r8/eCO3d2BaE0PUP8AQOx9hdvFsmjRjKIwogMKuMm4FDoOE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bf/+tM2I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rK3h
	XxK6jKT3XrsBJIyMwZ3I7Dmzpv0XQPt8NVaXQSk=; b=bf/+tM2ID2aBMdzcCc0m
	melbuWGFR/NX0JNKo+PBVzqMyLau+JfQjanad1G+ZoR/eNEWKWcAl9HWsxqOkyrZ
	+mDFYF4PlBdIIDys1+OGYZcymX0adRln9uTmE/e40rvAd4WbuiSHNZinG8Ezd67W
	vf9r5PLMNU/RiP7zHIH3gcNTqQukh6vAZA+5IAd7cFAx3x9iNBYC2B2eiQEy5ee3
	XFzzHGiqlPZ7gIeIBQxGxWW0uR7u9xEkb+JrC32FV4xSqHdQ2jO1iPxtV5gBbtNe
	0UrJ4cJ2XCKubE5Xg7HurSY7yODsIUaTJWI+31MYUXOpUcutFOpHvMR+ftExuqFE
	9A==
Received: (qmail 410787 invoked from network); 8 Oct 2024 11:00:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 11:00:58 +0200
X-UD-Smtp-Session: l3s3148p1@/Gc2YPMjJkVtKPHJ
Date: Tue, 8 Oct 2024 11:00:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 4/4] i2c: core: Remove obsolete members of i2c_adapter
 and i2c_client
Message-ID: <ZwT0yuq2yIirzCY1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ddf1ac29-1fe9-4432-be76-574203d185e1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="avwtiPN6pJQ7j6Kh"
Content-Disposition: inline
In-Reply-To: <ddf1ac29-1fe9-4432-be76-574203d185e1@gmail.com>


--avwtiPN6pJQ7j6Kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 09:49:29PM +0200, Heiner Kallweit wrote:
> After the lists of auto-detected and userspace-created clients have been
> removed, we can remove now unused struct members.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Why don't you just fold this into patches 2 + 3?


--avwtiPN6pJQ7j6Kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE9MoACgkQFA3kzBSg
Kba8Lw/9EuqbwT3ZryohrW1+vbb7Dscd2/Co+FaTuEaiWKnH3vL/VMFsaV6AEYrZ
J9QYKWN6tAQ6V4j9hSHbD8UuWYicP2a/JNx8Hxx9u7hnhQexBhpwBfJLlk0qjoio
Vn9eaN64sL21CAo22/KKyI9xbmMx8+fShXkcrk75KVPOQXRLX2pwIgvz4NmffXA/
DGBgK4zbaifVlF8DLrSTVIgRjV78STVvaJO40bJC0+FQzAqbbihDzWn3AXUwr3MV
1ITymH8oRAHnc76BtgcJWPu+nhHF94Kmfjhb+NTxtGtKI8KNB8Frpqiyn/WCM032
6Z5ncy+rDYthPPy8HfK6HlLzlNJ3n4GlZRwxrL98/fWstIom9mU4KAt6ITN7UGHg
xZOkdIZmNMY3nWW5t+lNr44O01Ya3jc2kAczG7AHJBGz9DDPwdnAAiyuXx27Wx04
BvAiazYkkrezfJ4FSEdOR/fZYyXXR/VSF4GClTJ921ePHY5g7T3YXw9e17C6teJP
wmqlg8Hpj6mBgNoIVJyLZEEDaasTXN9uWRfJ+aT/3Lmpufe1ScXDeDUg1usRQQI1
QP/zVcKyoQEMaIyoh/QRRwWxgvURlTCsfzowORtBHCkPtEWeGVtE/q1TprDz1j/J
8gWW8C7MJMsytFCdK1TEmqtGfeyy6rPbje+KEZfe8IS/uGeVlhY=
=8ZoC
-----END PGP SIGNATURE-----

--avwtiPN6pJQ7j6Kh--

