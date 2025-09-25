Return-Path: <linux-i2c+bounces-13174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58BBA15DF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 006107AF119
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C726C2F5306;
	Thu, 25 Sep 2025 20:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E7SIPsmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10695314B73
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832454; cv=none; b=BJmQfGO/0My45nFzfV1PSQlXERiGI3l14twqIciZeAtDU1hz/q0NsLELe0uojYVRzOhT0sQ/ZtSnPaBnjhMUA+SQEHFEEk9rVSjyEoPrtVh0ProJ/umtzUBeDavXT3JPvIusiK1cFb2CFSpCtQGpm2HOODVpFY75Horth0me4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832454; c=relaxed/simple;
	bh=znLnFJtLC+oBFDusVWzj97PWoNvRxO9zLc0a5hiIE9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QY0dOVtu5bsDwxM9iLQwoQWf8O1/xgsTf8YCHP06bjJyoHmLQqJg9lqsWuVnJEb4ThYFDayKhhFO+/fK/CGfV66I+tfmeTVdVjrcuzRD73aNTvHK22ZoJIuPlCigNtwUIgMWd3hvyLuxN7MdXfMI+D1K5kWAKEvYSUFhck/UMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E7SIPsmE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=znLn
	FJtLC+oBFDusVWzj97PWoNvRxO9zLc0a5hiIE9E=; b=E7SIPsmEgeKSHSnxBJny
	B1OevX2s4nHbHv08p7jv1riBBbLlN0QuyxzNSzMDvVdjeaLzuRfLzmCDq9/hTs5J
	pXxJsG2QHROCiJMxIVM+joDYftRpxKJ/y+9aYRMm74OZBs1Bt6gABQyN98YdBcd/
	wEKMQA422EmDMxJL6cUaA5s3aKXPCv8Jzd/tStkzDZHNxltB0bDRwdktNStX8l9I
	qECx0bvUsxiXax0sEswEM4gLvdV+GremkaY+3nPezjWXCUDEOheD98PQh1l15p8s
	0o+ukxSldfrK6A3Fimj+0gVGLVQNcw/E+KTs5XjuMexDiaXd1gc6vMM4Vs+2cRcr
	XA==
Received: (qmail 2009427 invoked from network); 25 Sep 2025 22:34:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 22:34:00 +0200
X-UD-Smtp-Session: l3s3148p1@hGPUFqY/jIAujntx
Date: Thu, 25 Sep 2025 22:34:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rengarajan S <rengarajan.s@microchip.com>
Cc: tharunkumar.pasumarthi@microchip.com,
	kumaravel.thiagarajan@microchip.com, UNGLinuxDriver@microchip.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 i2c-master] i2c: mchp-pci1xxxx: PCIe Hot reset
 disable support for Rev C0+ devices
Message-ID: <aNWnOOg5KY_8K1DO@shikoro>
References: <20250925140049.14454-1-rengarajan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eCTXuL0ZtUxVITRA"
Content-Disposition: inline
In-Reply-To: <20250925140049.14454-1-rengarajan.s@microchip.com>


--eCTXuL0ZtUxVITRA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 07:30:48PM +0530, Rengarajan S wrote:
> Systems that issue PCIe hot reset requests during a suspend/resume
> cycle cause PCI1XXXX device revisions prior to C0 to get its SMBUS
> controller registers reset to hardware default values. This results
> in device inaccessibility and I2C read/write failure. Starting with
> Revision C0, support was added in the device hardware (via the Hot
> Reset Disable Bit) to allow resetting only the PCIe interface and its
> associated logic, but preserving the SMBUS registers during a hot
> reset. This patch enables the hot reset disable feature during suspend/
> resume for C0 and later revisions of the device.
>=20
> Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>

Tharun? Kumaravel? Do you have time to look at these patches?


--eCTXuL0ZtUxVITRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVpzQACgkQFA3kzBSg
KbYg6Q/9G4o1ez2b5CeSRkBiQ9oef/21n6+5/hizIs3nfCohSeEfkHpahk54LPfY
N2ZDOABDO3m2QH2nQrGc/vVy77uP9E9FSvS1r24ag1SbDGZwGXsshmEYr6WFvdYQ
Ozo+ZgWd3TyR7StvRvU3Qlgef+Ia9WnwtV0N1eqfpFDoE73HuAR2QN/n6El/GNKv
GDSFbW/p6/dJ6zGx9i+C7I5Z316W4nxaePk4BVl6OsSAta3/wjdAxToiApGMBNuW
cRVXCYhXv0BpvNaqhjBD1TZfslLMSzS8uWr3r/Yf0iDIvY2UdOAYQkDYqT9LuRJ+
p2UlYxLXT9P0p7vcLBQ6Pb3xwzGGV4k2STHsIooZlbsVEss8iuIwJeBTZDpwIew+
Cr0apuuoohgjhJEKyxVD/9kAy7/SPJ4YEHYJrZBmOcCRUQr2ETc6H7Usjv0uGo8D
i2ss4jIsWtYn2X5Jxjy0zV8TqQFL/V4igcXJlBKpSie0/qGkN4GWX2ErSivLu3Cg
DRACFs12cGUTcScfDivp9vl1wR9G6akMlJb0pccU4thommz/IAM0oBrq9aCr3afJ
GadY1Prd1mVmIvyomR+LqMGmMKyn63XVKbkwTUD3y33pB+fT4yt6US+GPnbAE3xU
Z1BccCKmM/OQRP0Z65sKx4MakIFkie0p6Ff1MnmWPIGh9BioOPo=
=loOF
-----END PGP SIGNATURE-----

--eCTXuL0ZtUxVITRA--

