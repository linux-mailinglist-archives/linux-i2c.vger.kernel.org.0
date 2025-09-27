Return-Path: <linux-i2c+bounces-13252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D045BA63ED
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64675189DC6D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC8E1F94A;
	Sat, 27 Sep 2025 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jOYe4lXX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C123C50C
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759011373; cv=none; b=lP7x1zuyTXebFVk4DPfvLJZOT5sf12a89kiEy2GcgZ6zgK68CkyR9ZAeUEQWJTLlTX/hGF1Cel8jmYdPXyvsJjxCeAZS0cnesYvO1WiqePjy0GtyKJd8djJfdOHvUiGGpSudif5L7N4ZzxMz6cCvN4ZKWAgFtmyZdYlgz+ex504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759011373; c=relaxed/simple;
	bh=/FwZvpIv/rpMoG1Ur9psPNhkJQTOiKSKYoyUS+1It7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pivNfJ2PymLcfb4pfJxgYejU+PgeOD8daWNHGdW0azZiOs7X6O1KuWAMEErn+A0JD0IcEzq6+cbWOqVP8gwOnD42BcwGRH8fiknap3s4j7dNuBhbassG9ehtkjvIMkbZbgsk4af5XiI9sQUUWy3nw2napbTSQwvyXXeFOzEoMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jOYe4lXX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/FwZ
	vpIv/rpMoG1Ur9psPNhkJQTOiKSKYoyUS+1It7I=; b=jOYe4lXXAxrLEBgN2sKF
	/wHNGcPb9pQ5aKm42NxlTElmNZQpYRyahju4GnS6KfPSMJp2cunx7q7/ZOkzCH6S
	Aft5RT8vytsxHen6VDlmZXJLWP8vJZXUZVf4SBH0XUS/9ecEt/uMOnATO+B+a36w
	9Ba+gQQQ5IoVZJ4XVd5nf8HpcUDKpfgNj2/b00TH0boN9NSPC0e3H7JRMqMRwh+m
	WigICaRPUvcjOQVQoJ5peb1SlcA7TRrTvr19Ow2cyK0Wa45MB7of4ooqRQnaEmmk
	fwQSPeEQlhBePQSO2VFq2CU9uipEdMD/XRejjHg1ruzp/vxDPfaYi8vD6SpUFnKS
	RQ==
Received: (qmail 2700325 invoked from network); 28 Sep 2025 00:16:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:16:07 +0200
X-UD-Smtp-Session: l3s3148p1@7c+4v88/ZJwujnsw
Date: Sun, 28 Sep 2025 00:16:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Add me as maintainer of Synopsys DesignWare
 I2C driver
Message-ID: <aNhiJ7LELptFdS0D@shikoro>
References: <20250926115057.3752771-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17QJ0VrO6yRGTDBn"
Content-Disposition: inline
In-Reply-To: <20250926115057.3752771-1-mika.westerberg@linux.intel.com>


--17QJ0VrO6yRGTDBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 01:50:57PM +0200, Mika Westerberg wrote:
> I volunteered as maintainer of the DesignWare I2C driver, so update my
> entry from reviewer to maintainer.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to for-current, thanks!


--17QJ0VrO6yRGTDBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjYYicACgkQFA3kzBSg
KbZ1zRAAp19OE9XV6deMBMeWo1YYjftMnMulbg7yBZup4k8YQMuG5mCXNsUGAZ2V
X7KFjSQW+n6dJXdZwSlrYKyZUmpitHWefuJkWsyCMEsqLwFrhXHmmuOynRTleBRe
Jb+4RjSaD7ZmLByZlIUqX7cEd6R8DKRD+tz2rzp7o6PUmcr6SQ7jk+1neq9q+R64
zMyZzUKLViyBwrkCWMeZAvtzDlwxOtvB/cVGk9N17wv/SrAdvT166V85x3CCugZl
/7Y/JMgoQUrHpT+s3Y/oHh5mcI8jBLze7RR+jejVbokyjhoYU/b9brC7bxzHkv8x
+v2SdRrARC9OjzZCxl5UZeWbPV38xE0V0Ril0NQBtSpIIIk3/4l8JP5hfGNUCa7t
DydiHizMxIhPyB5iRMFinuLWRlFDTnCCA91cpZMGKLckZT/x+9UiFXuFScKq4XGn
qPkGDQKzcFEWPaAGVMywg+lK26EWdlim7HTpeSSg7qZokwGXIVuGvSbKM2nI45cp
YOId4sIudTpkjbePXFPv5hMw/ZwVAR9YkydJIGPhkZMiO0TqzpyVT3Oz2gG/nP9o
47E95ZcEPXzd/tKNOX51ngDMSPzjomUli37AQ+pwlwHd2rXysnniqtJhB8vf9Awc
VyNZqyYcpeDozFPaTVkDsQZHId6NKjYB+8ouF1HNTYgqXUSTlSI=
=iMPz
-----END PGP SIGNATURE-----

--17QJ0VrO6yRGTDBn--

