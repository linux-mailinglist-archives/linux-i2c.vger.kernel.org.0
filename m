Return-Path: <linux-i2c+bounces-13183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40664BA1A2F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16DA53AD603
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7B3321F32;
	Thu, 25 Sep 2025 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UPaig0Z4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27732142E
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836117; cv=none; b=R0DXsrhCQAM2em4jUP6j59aZektgbYRQ3m2QLflQxPEmiGDQrCF9EaMy2dizrfZH2yddUolxZCoExAidyk682MYTSpP/Y+3ViuaCS1KusPgJsxH6sCXKFv/QPRdBgo7yofCzZdWtcNALbY8g8CuoH+T4zukwn6wNhuc1nzKVRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836117; c=relaxed/simple;
	bh=XFFZkzvAD8QYdCwQk9vx+tzdFd+s5u7iPwhCFbisNgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqJ2yluuTd7naT2lNWzS3ttXadM3Q5hHc7PXy+WkJdFtvsByYO/bhmd1meF6ZbsKlT1G/UDu92MBHz+ZdMhweRJ+eRQPEx27FRNzAoVfRNTL41RGGcjlQOurvRkAD9zxCo4RzCSLdoQWhdU1wnwrxotpE3tnsFbIpzXisjHbFCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UPaig0Z4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7yL/
	bOzH5mMb9e7gtd/JTSCmRguD3ASp510ZjiuAn2c=; b=UPaig0Z4uXv3Kgyjd0NQ
	uz9xo8YJJnYFdBCeQdH2DJBO10ayTgZYaEv0+8TNLqMJrFOmaciYlraFlh2gvJtQ
	SjQYgaiGHUZzk06s5BFn/AFciwSM1sHmK/IvnHWMQK8RxJPJaLqXvovBW75j/XAW
	jJuWv4IZnCCmu4LfAP21aS8P3IVxNGVZrwnQ+IyNBieiHm0LHOtSlvdIwj3DTBLy
	o0MBMnRGY3+O9lx1/lfqDxXDEXK0hkPqUxm7v9YLnX5bqzMfG6ntW1vxKjp7EpnZ
	x7nYZJ1g/veMcT2Xp0BWPNuGnCAu1Ck2DWEUfWsRrkihg2n/otqnz2Qu29dCTPEP
	kA==
Received: (qmail 2021161 invoked from network); 25 Sep 2025 23:35:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:35:12 +0200
X-UD-Smtp-Session: l3s3148p1@nXqv8aY/Suoujntx
Date: Thu, 25 Sep 2025 23:35:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: designware: convert to dev_err_probe() on
 request IRQ error
Message-ID: <aNW1kP-jJquffypg@shikoro>
References: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
 <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RvBl/JEy3PTd/KX1"
Content-Disposition: inline
In-Reply-To: <20250904-i2c-dw-dev-err-probe-v2-1-e59da34815fa@bootlin.com>


--RvBl/JEy3PTd/KX1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 04:31:06PM +0200, Beno=C3=AEt Monin wrote:
> Simplify the error handling of devm_request_irq() in
> i2c_dw_probe_master() and i2c_dw_probe_slave() by converting to:
>=20
>     return dev_err_probe();
>=20
> instead of calling:
>=20
>     dev_err();
>     return ret;
>=20
> This also handle deferred probe error without spamming the log.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--RvBl/JEy3PTd/KX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVtZAACgkQFA3kzBSg
Kbaglw//S9siA9TQMPD4lumWc5KDVsnqJDU3n6zBjzINdXUZ221bkn/SHuNJqxz2
ur3KEUu55X59M9c7uMnxdiNP6jR/cU9Ox2Bom2K6Qaq7fUuCHeaAInOGF0YZ6SVJ
Ehk0PI2qEvrDYK+nz9Hc4XtVCZ15VYS16hLSJ6LZXgk1gpSfPbhiauO6b+OXn3w0
/7YYeTChM4NwVjheU12NLf7A2E3+6+kZiU0dZkA6+znxLdpN1tx0pFlbrGeVQUe4
SSDGbXepcRSNTrfbpxEQys8d5Es3Imjq0EUVAzJMZ9EzsJ0xnUo5Sf0U3ahOxW4i
j26eXsRjdJJwo+hrRSpJj0zJoP/ot8Hb58MjiCralYDal7x5o+BM31UkooVKdJwN
oyyJigUy2hpvQSY+V1RUW8CW22BwGvAXThD0m6/uUS+rmJ/XgSc7PwM5Hc9gvIsy
ZdSGqT8kIbk6a7Ius0s1Rov+OFNIP9f6C2GdWjW24FKPwzevJ4ksaH599mSK5XLl
wptTrwaT8B7PvDJVfTTs4+8RaYyn2zSxSeIUlLT/R7sVRJoXYAXLRyGu0EK9wKc/
duTWvUv3EvenV4u+QxU4TMgvG2pIHSBQ9CrIg4t3+BALqbPGDNSBatwXCRbqu0mg
6dQAvDZwXrrlNTHMGX36iwkXH+049fS00cNbAIe9jfoS0Ak+P/k=
=F8Ct
-----END PGP SIGNATURE-----

--RvBl/JEy3PTd/KX1--

