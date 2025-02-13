Return-Path: <linux-i2c+bounces-9437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D55A346FC
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3FD1894381
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7023F16D4E6;
	Thu, 13 Feb 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b1XZKgCN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADC14F121
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460176; cv=none; b=Tj+zbN2KOP90BpE2/1sB4/jJdGGKa06L4CFhEFsKTVJLy3nNTZj/TMXcBxpDMy3dIv9MwBijmp0YNtq1hyJ4uLYxg/pm3eFPIQkcPBPpkRPvoj+lMskmvsGCZc/1wqbDbs4L21nA6wD3W89Pirzr2GkPJwGWNLig+9TJiOpbWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460176; c=relaxed/simple;
	bh=BPfo8p07AJkO2ocHSAKC/3O/4QvXuF5LwpiwIjb1tkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6uGbronL0mY/0lEyjAByWqyLvbF9K3dOCO8LYr0/ItziG1D+PvTcpNoZDY1nuezTs10PUpmFV1nwlHqqsHd//6KvpnAUhGc6iXElRmFwN64USi/IQcSrqVu8gILp1kGNXyrtx85URkSmQrYU0FlGwgV/Dbt+kfgSt3rMDTvDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b1XZKgCN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BPfo
	8p07AJkO2ocHSAKC/3O/4QvXuF5LwpiwIjb1tkw=; b=b1XZKgCNM4opx75YK4KO
	IwRLymPfHFWA4qDZWW12C0Iu/WAahznM26iqVDBgrpXK3D1vxk/8//LaiiJvg58I
	M6CHBByjtVc9bGhnO71PcW/GFJWJlErchHr0UrdqsNcAqiGqSawpcLhl0lfAcvvT
	I8lIhcuLzqgLJ9D38gAV6NJAsRgCwiqB3nucQwHXQmUx7pto6tYQVHITspQoIizN
	BKklgWss9NEltbyerbsAhNp2vMb0WIoY0yZ6nTrlv+8Gr8CS0CsK5H1mjXeccZxf
	6CSOoqQQxBMVZzgFh3uBunCDUgal72k69lu6aVA+ZbZsEN/AFvMbyy+BXXOghhy+
	5w==
Received: (qmail 1923982 invoked from network); 13 Feb 2025 16:22:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 16:22:48 +0100
X-UD-Smtp-Session: l3s3148p1@e+hpoQcucpFehh99
Date: Thu, 13 Feb 2025 16:22:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org address for I2C ACPI work
Message-ID: <Z64ORw9U6jgFvN_N@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250204115236.3973371-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOeomMHmjYfVQFl6"
Content-Disposition: inline
In-Reply-To: <20250204115236.3973371-1-mika.westerberg@linux.intel.com>


--vOeomMHmjYfVQFl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 01:52:36PM +0200, Mika Westerberg wrote:
> Switch to use my kernel.org address for I2C ACPI work.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to for-current, thanks!


--vOeomMHmjYfVQFl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeuDkMACgkQFA3kzBSg
KbbFPBAAnZiyQZTGVNHRyx8Ok9zfU5WjE0bA9yb5CEdh7FM8qiXU/0+9/Hx2bQQ0
D/xEAnkCS64vUh6KI8xWyZ089u7Az19RUkLDgW1zl5IngDkdIrY9bMUK6KPPEgcI
+bbzmr1q+he9mswcDbnzPfffWvFdSf7wHwR7H3DmhjxIiRltGai+M59Vnp4jqHF3
vpaGeaFdO0o3jXncqLk3r3F1JK7zFWiV53QMahYtpQGkWZukHsNnhVgB261k94b8
Yx+HZGXeiJVvoKjznkyef74o6DhbgZXOLZoVrfjwLkQ8yZ+liPbidqPZjMkqnuZN
Xb430yXbnUbO5ynMwA18d2cGnRCPau14yWjrzLC9MOEkEYQ+00nEyEVxG8boYqqj
MB2ou6gQFAt7qo5YS6RwtQtPqSgHmCbMUusBNc5ZaDqXcuuSOtpDdAYbk4ulbuQs
Qb3h4dXCuQm3EYVQHBKYywJpkKtZPIH6GQVrALIqRRk9rKgc2O7/KcTCz0VjSYE9
/JR/w72kM7sWZzPA2owhzZ1p4CeSKZhYgbZ+FxWhY8zC4Nq6K6Y/rxMPQbx+bus4
IP0hcPZy6qazi4/EeA17HfgjQdB86NwgieiyHIXHOw9+M/7ALK6ttJSwjdc2JtPY
8iX6Wbl9pi9srAnwsrPtqgDFuldwyekCKKrWJyY+dQ/q8ZiuFu4=
=H+Ms
-----END PGP SIGNATURE-----

--vOeomMHmjYfVQFl6--

