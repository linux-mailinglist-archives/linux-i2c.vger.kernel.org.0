Return-Path: <linux-i2c+bounces-6655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 532099770F1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0299D1F23ABB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF331C1720;
	Thu, 12 Sep 2024 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BwORMKgF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E613D530
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726167111; cv=none; b=khpwIM3IlAhJeZB7YESFg98oc7Rjy5L7188WFWVHKRh7P4LDB7KIEXxarX1QrrsVykBzyQWAilnOMofp8SG0/CBhE4zw2QBJZmwsR8W2XhxpJIJSOD6gKoCXmAH2T/17FqkE13kLiDyJKAR1jSOWPuxPDjAII8lwZ5NH/bFa108=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726167111; c=relaxed/simple;
	bh=+50xCbduzE/F/pep8WvWPc6ZEedA5rjpqpTVZG5gd5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpR73QI3+IWEWM7NqfPNlBo0ALsLAmCEPhn5kfVlfWA1vmcaYMo4ZXpFQn37i55C0xoOeKtglh6kPEZdBMuDElVeftZRULx1ztnNX7axu7K1KumcAgSjIAtb9WXrmfqj3JCN/NHILv0D6Pr5NSu+Z6NpbJ8CZYxbks91UP68xGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BwORMKgF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+50x
	CbduzE/F/pep8WvWPc6ZEedA5rjpqpTVZG5gd5c=; b=BwORMKgF06yNPoV1d3HL
	2pUtCBuotI0UF2YfYjyvS5r47WVpusJYpc7vwjDDYCVochYg1BP03IllLDDlS+jN
	8OnHbKeZilyfnv/ZrqWvxpnXepQhY6n/Mz+avra7/NxQumrpVpduY8OvfDePMsTf
	rcO5YMBD9CwhjAw7BB8elxHbfJolD9Pvr6e4Y5xzhwI+Lg7mSqYF3sYKeaPUAXG1
	BAcTWhVst4g9XdIfoCY+PSEkhSX3OvrtrTOEdca00ngpu/Y8Y653cSiOSb18/EXd
	WhYetbtvijflk2l7beq2SMYvtdn67061txs6vpzyWAwSS/Ze42bcfVvZYyaLKAC8
	SQ==
Received: (qmail 987576 invoked from network); 12 Sep 2024 20:51:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2024 20:51:44 +0200
X-UD-Smtp-Session: l3s3148p1@WvISmfAhaLpQT+F6
Date: Thu, 12 Sep 2024 20:51:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2ctransfer: Drop redundant variable arg_idx
Message-ID: <ZuM4QPjaSlTY-pUT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>
References: <20240912144504.278d302b@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZhKzSrVl+hAGmPZw"
Content-Disposition: inline
In-Reply-To: <20240912144504.278d302b@endymion.delvare>


--ZhKzSrVl+hAGmPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 02:45:04PM +0200, Jean Delvare wrote:
> arg_idx has the same meaning as getopt's optind global variable, so
> drop the former and use the latter. Once getopt() is done parsing the
> options, there should be no problem using it for ourselves.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

I tried a few patterns in the command line and they were all handled
correctly:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!


--ZhKzSrVl+hAGmPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbjOEAACgkQFA3kzBSg
KbYeCw//csDO55smH01y3Hya/TtnIoSakY1RU85rJIePxo2XTXZ/y5yAj9I0olbF
u2YK3eft6TTZVFaDzl45I1NVHbvzzur43g5Hb8BjHDJ3ym4c1FipfLjqkB6pSLmw
+YVjjThQo1cmLpjQe6VGKdUskTn6Wsh2bb9m22+C2at8MVUeur6UN34DaRQEWaMS
zbTJ/KH4MvkH+krpPEgMz86qJmiyfvYETMbxlzuGbMX6QtEImpka27ajTwl/URtf
fEcPGcPHHGAEZ0d5DhJqXZIe7OErMnVPx6SN6yVhaVJB/qXwIv+ffpnVWKfUGTTY
4Qyi4/Se759MuvqAD367sYCl0dTkR/Zqr3m92jgDqwxRVNBeWBLTsbJoug2C++t4
5PI2ZfHrzWOyV3P5uhGNHafy5mgzuGhmo4GsK4ni2teUyaOhJ47p/iefDxHHtbGt
yD2iTUxbOpP62/bg+7mcAwnNTBuzsO0S8eAiowAGIYZKIkCVPP8hfSYrxqjXFelU
bmJPEVYrjNzd4Hs5ygTq6aalLHc1JWk4CazUkO0EAJVP6BUlUZX4aWgKQu7SQRxc
7sm+v9DaI3fqc0nHmklTfE31GfEriBXc8ZbL86PICCkgp7uWRTpvWdCy0B/zpXR9
ynlhaVOrYheSB5ghCQAxE9jqn/Zm6eBoCv4qZWIHWTf1stk1o+Q=
=Icj2
-----END PGP SIGNATURE-----

--ZhKzSrVl+hAGmPZw--

