Return-Path: <linux-i2c+bounces-9223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEFA1DD60
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 21:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A4311882B46
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 20:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7674B197A92;
	Mon, 27 Jan 2025 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BCcCDzEb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5E191F6D
	for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2025 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009725; cv=none; b=eHIzxhJYlmcB9s4wvCCURpofqXCPEPiBOtHlBLWTLyDnHDlqQN4Z1jBAneqsYu1YOLQxu85GUD2yD5mczw3gXoIuomxxQJlXlWIyRjctSj9U7zgArVbIlOeEF75D4FZ9u8u3W9Ydyk6viThqk+vHl9cIlxWJfjqNXADsLlSUxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009725; c=relaxed/simple;
	bh=gUM61sGEQMwuSHDve84gpHgedWVIYTryN8AyGJTsOtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+6ZTeK8tXwXJA6cjh0G5wJIlJblggDRFM5LP6rytpJ1aL3KFCkuVxu+asNyjdWR051cSaBLTTEVTXy8s1RKnLXYoIdAgklobgo1FDFpBOuQ9lfmoVgbcNufpGmc6wfWEMsJF/S/858e7uLhXXiI7QyJ/Ug7iqhOc0EEShWvof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BCcCDzEb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rvoJ
	JYX6OtmfKYyCKNX4vxkctMoCnWSAtqlLGNIzBCg=; b=BCcCDzEbYiHPLcfpovSz
	aurL5CdHMfyV4TEZ7DTMx1XMS+EYn8eaT84Naz1hjPFa8tJqdEQnaH38hcMNG/h9
	UDDdq9oW7zdMEws17Mrc4RYMwNPqXXp0Vm7pYg5cwkvbf10ZlkLlqqwrFlCyFmai
	KiHnOOVjBFkHO+bMNkO2SNDkh10vXTVB562wbQIC3KWSl2J+6uJzDJ98xhIfTy1q
	U9+467TbeT5iHt/gIogj8liC472VoSwncLzH2LMcD8Q/YM1oBiWnA2e+MOyH3WEE
	yDWONEzn/fJMrk1r/GxnDUwWARejGgMSrs35clhxWJddRZ0iOXnzzX/eBM3nreXF
	Dw==
Received: (qmail 366113 invoked from network); 27 Jan 2025 21:28:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 21:28:37 +0100
X-UD-Smtp-Session: l3s3148p1@9AvT67UsatMujnvm
Date: Mon, 27 Jan 2025 21:28:36 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Fix core-managed per-client debugfs handling
Message-ID: <Z5fsdIfeDIcfuntH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250127153938.34630-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqTSHeD+j9nOhdR6"
Content-Disposition: inline
In-Reply-To: <20250127153938.34630-1-linux@roeck-us.net>


--dqTSHeD+j9nOhdR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 07:39:38AM -0800, Guenter Roeck wrote:
> Per-driver debugfs entries are created in the device probe function and
> released in the device remove function. The common debugfs directory
> introduced with commit d06905d68610 ("i2c: add core-managed per-client
> directory in debugfs") is added when a device is registered, not when it
> is probed, and it is removed when the device is unregistered. As result,
> debugfs entries added by a driver are not deleted when a device remove
> function is called since that does not necessarily result in device
> unregistration. If the probe function is then called again, the debugfs
> entries will already exist, which will result in error messages such as
>=20
> 	debugfs: File 'test' in directory '3-0020' already present!
>=20
> if 'test' was a debugfs file created during the first call to probe().
>=20
> This is easy to reproduce by executing "modprobe -r" followed by "modprob=
e"
> with a driver using the debugfs pointer created by the i2c subsystem.
>=20
> The debugfs directory should be created when a device is probed, not when
> it is registered. It should be removed when the device is removed, not
> when it is unregistered. Change the code accordingly.
>=20
> Also clear the client->debugfs if creating the debugfs directory fails.
> This simplifies I2C client driver code if it needs to call dentry
> functions which do not validate dentry pointers passed as argument.
>=20
> Fixes: d06905d68610 ("i2c: add core-managed per-client directory in debug=
fs")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to for-current, thanks!


--dqTSHeD+j9nOhdR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeX7HEACgkQFA3kzBSg
KbbfyRAAjFuGdLdOy5Dv9XgUjps4tTblFMa7xIsMkVJ7nZV+UfiWZXI9SsfgNNTq
wyS5rYjLO7MbB+Ti7uos8rTiVvCRIVcz9gkl+yqR2BGGUuB+bQj7tzlQRuBKeKdX
iKCokSxCZGvUzUK7BiGR9T9AUXBM8QGukpBWFvGNWX+bKzOmBQzDEjF7bNCirv9A
1ACHz8+heLLuDtVuDHKTx3HcDqOKUMvNM2Lmio2dO36snoTuJ911Yj1prKb2wX+d
V6eXgXClqpxKECY9gPDTrN8tWWg3VQ6JKdNW0zBmDbwzpGIkLRMw5CaBmgw34F6T
N2Y5IU+Um9Glo56OobZ3SF7K4rIv3Gd5gRDYR63hTCzql/GUxRy1a/0VU7dbjdLj
LYqAaWETObCqGyRZVTDxQywhtAHTguomN6r8jfqmAhJtsBRX9HMHWPzYJ5G5bkhn
5ZBfH1eU1LrekE3iDj0LCvRINCB7VFiDA6niRfSrGAcFPoDDJMqrYW3zmU2WoF3z
7MQPSLi+8Shh5V8BKFbB46Wds8DbTuKlZoozSuBXIlPsZmmbiTo9jY5zR3xHdSzL
NeShpOvMFiYVI6/aKIe7DWfpu0qgOzG6hVHE8EAsZG54DVFnrIJ9bFStLkucHcY9
LmDcp141EXuF1mqUcffQU116zDDyGA53hx4/PWKxmhe22bH32Rc=
=ONym
-----END PGP SIGNATURE-----

--dqTSHeD+j9nOhdR6--

