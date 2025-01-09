Return-Path: <linux-i2c+bounces-8992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E93A07239
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D3F3A6394
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF23218E99;
	Thu,  9 Jan 2025 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BeoO2Uwd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A48217727
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416292; cv=none; b=s6V3ra8izFOjIYquTKrL79goUpW5Pri7/Ec3ii2Ky+5bKR8R7BKi3w2Jy+H6RYk+OBIngKNOhp75lcik9ksSAL8jdCg4djGzIgxpPNT/7uSEIdtXCxIY0jSwVzKAgItYFEhHWjM0bHIUEA9uTsa+TYE1TZ54/Fkk9Z3qxWjpLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416292; c=relaxed/simple;
	bh=4m7F/Ni/qR/OZqubWvzv34mg3djzTJ7f+xBA41UWmFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTZt3c7E0SA12MdLX85+Q5h4c8r+UOmf9GfLsL+YWtOq+I9t2CWMy5RO//j4NLtYGAaXY70K553DeiD8nmpq7nEt1CgETgMpV8opWa0QpJJ7M0npe4YseHhNf8wyJik3PLxTZxsGRkdP+dG3qxgwyQpuOLgUkzVxN2CRnOOFjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BeoO2Uwd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4m7F
	/Ni/qR/OZqubWvzv34mg3djzTJ7f+xBA41UWmFw=; b=BeoO2UwddwWj7d3DyN+0
	edNmWBpFjOaRD8Pw1iKgYN8XeXyy6uTsDyESbv7itDQ67yAb5LN70lthcDylRyd+
	//YZYCx1SLOqh2k6jyY6rZ7g9/jV6uma/mZEBrsvH396Y9SxT2DRmTDV/hDDxJO3
	8UjJVj7s+RAiKos3uFxO8kPbaWs9BrjqlLiHmZOOnkLJRjt/1UkhYQM+HW7plHQV
	2yVOJlLuOGh8fbkokwWZmF9tYII/cbcZe8t7PxMakI9MDMSeZlMydtCGGok6WOHz
	nsMD5EO2bL6ouNlGy/38SV6FX6dEndt7F7DHxhSTwaqoi/ZPuLrWcE0G6ASM/RcJ
	Dw==
Received: (qmail 2858580 invoked from network); 9 Jan 2025 10:51:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:51:28 +0100
X-UD-Smtp-Session: l3s3148p1@QA4H7EIrwNkgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:51:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: slave-eeprom: Constify 'struct bin_attribute'
Message-ID: <Z3-cH5a3bsAppL1-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241215-sysfs-const-bin_attr-i2c-v1-1-d5c336c02924@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXaxakA+7hvKvyc5"
Content-Disposition: inline
In-Reply-To: <20241215-sysfs-const-bin_attr-i2c-v1-1-d5c336c02924@weissschuh.net>


--dXaxakA+7hvKvyc5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 02:21:39PM +0100, Thomas Wei=C3=9Fschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Applied to for-next, thanks!


--dXaxakA+7hvKvyc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/nB8ACgkQFA3kzBSg
KbbNUA//cD3ry0uuk7j0clK5zrchgnwTwP+st0hh0jIqk8KJq01PD+0LUKyMr/lH
G2zQ7bikFX/MUKRjIiDSSKM1TnxIJLZ6A8alhu/ILndx+vwji/qP41n6MjLxuWVP
WbXt9d2npNpVzlqqz12hutdLOBvpwuZCKTFVNOMkYysEMrSzylak3nbDkE7DKqMr
HVnbifU/ZK04dRERxdVl41rwsFS8l4E7ZjOmgFjHHQh8lb5ygXxa/zMntMvKguZf
UPDRxfKBiqhPNgTFw1/N6VkNdW9ncvb3VDBmMlbhMGfLqooC0aMBHFwVxZnPWU2L
cPM+vH5ABjoYrS8Ix3TT96G2jW/rIGVgigqQYndQmdHND7rjdRszsUcN/CcZe5Ks
d34q9GgjBiY/+UH2AwTYb94dp4T0oVx9MTZ94kqwjo57oq1lLgjzUnXS7XmNZz1q
KEsdOlxgO3OyncAp137u1BlMoo6lANHD+qZBiGOOHOool4zJGRMb7o8gAeY0qd9f
H0evSAUHHMrfhNGfq6xB+fsWX6MwdeWz58onhv1Ydiri5zPdTJdZf5uOoa/xWo2N
MkW51RE2C6MNQXWD6gjnF8RJowiquybTeKWQJAw7TaTrPo4ma0Z25CDgFRCPvyLX
8VokKZXMlfcEpW6C4DrSozuPC/6frYux6gDFJ+eQ3959bUxdn4s=
=+wQn
-----END PGP SIGNATURE-----

--dXaxakA+7hvKvyc5--

