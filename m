Return-Path: <linux-i2c+bounces-5077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A393EEFC
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 09:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CB67B219C2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 07:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405B912C54D;
	Mon, 29 Jul 2024 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Si/a4T+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B984A2F
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2024 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239399; cv=none; b=GzCyU0SYI1E2S69mGjaxs+++ewIIvoM11oF3j14cDbVCRPpJPn/pT32Us1pG7OzUtjcX1fqc6eaDmu6h+wgcq6S5P81YbGdhSLHfwxeaLKTzeXe0mg/LoaBaW8NYcNi+7zxFZNpFuPVeRGk3tW9y4g2cagQwfi23TUNXnwm9z1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239399; c=relaxed/simple;
	bh=HKJfNf/ZFgM9Vr/ActzM0EId85ptHfLLtveUNz/1Rok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+3QC2wHAYctPmozLFuLH4VZyUcPYoLNTUP5txpsGlqurGiDWBiVA4T+HDln8KeZLSxFCn8Zyy1/7rbbMITlT/QnfeHZcPNt18VcxfyGghsaIvlhtr+Wqo1N/CK+w85vgN2MkNMOLWkPp9Xo5ap7nBer3fLkyJbwy1TSwDktJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Si/a4T+z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HKJf
	Nf/ZFgM9Vr/ActzM0EId85ptHfLLtveUNz/1Rok=; b=Si/a4T+zsjEJT5pxoTy3
	4dtVO++LPhr3xU/feBoe7uvbwalOqQpMLjVKz/K7+JuxCcH9uFX5Nfl6sRR2iImB
	jTR1fPiplzZ7z7GJZFaUcQV0uJpne2Vs4p/UehcERDEbddOwmIldRJOtkmgUrSGO
	5mIsS2ZZyH8FOZqvM1NLF1nEtYs12Wsf0Vresxg82orAOTaqNJ6qlPZMj9f2QPiA
	0YYSsdqAu3Tmzq/4xGhjHtO7el5f8AVFK7gBzk3kLvBaxo7L8yHE6WWxoPEYjrFS
	KhoOBRBPZz3Gm6txVNHsQJQ8yzdNW4ZuntLefSj8LVRojRbPVd4a+28GaKqvKBm1
	9g==
Received: (qmail 4021576 invoked from network); 29 Jul 2024 09:49:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 09:49:50 +0200
X-UD-Smtp-Session: l3s3148p1@iIwTG14ePsQujnsv
Date: Mon, 29 Jul 2024 09:49:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: smbus: Improve handling of stuck alerts
Message-ID: <ZqdJngPM5_4qXy8S@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CKmgZ7Su3xMLo1p3"
Content-Disposition: inline
In-Reply-To: <20220110172857.2980523-2-linux@roeck-us.net>


--CKmgZ7Su3xMLo1p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 09:28:56AM -0800, Guenter Roeck wrote:
> The following messages were observed while testing alert functionality
> on systems with multiple I2C devices on a single bus if alert was active
> on more than one chip.
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
>=20
> and:
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x28, flag 0
>=20
> Once it starts, this message repeats forever at high rate. There is no
> device at any of the reported addresses.
>=20
> Analysis shows that this is seen if multiple devices have the alert pin
> active. Apparently some devices do not support SMBus arbitration correctl=
y.
> They keep sending address bits after detecting an address collision and
> handle the collision not at all or too late.
> Specifically, address 0x0c is seen with ADT7461A at address 0x4c and
> ADM1021 at address 0x18 if alert is active on both chips. Address 0x28 is
> seen with ADT7483 at address 0x2a and ADT7461 at address 0x4c if alert is
> active on both chips.
>=20
> Once the system is in bad state (alert is set by more than one chip),
> it often only recovers by power cycling.
>=20
> To reduce the impact of this problem, abort the endless loop in
> smbus_alert() if the same address is read more than once and not
> handled by a driver.
>=20
> Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to for-current (with the minor changes mentioned before),
thanks!


--CKmgZ7Su3xMLo1p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmanSZoACgkQFA3kzBSg
KbakAA//Ze8SxEL7waktRFZpMWweYooM4nfZLyLzq6Gi0km2fWhDBrd753wvmnUC
ueuQl2M+9Q8Gr3pGRiOlKZx4choi1eX/V51mx2ZhX71hG+qSeoiputbPuVlCDLDp
WK6mK5MB5eKLT2S+or0FmLGBD87n3xKICtm6OvvaFZpPIGl7DWj8m3cpJh1ca7vk
uzRjYEXrcEP+MeVW3xPxFp0sdw48JSUtdvgkpsP7pzeQ85mZmVVWBm/XZTCmi1uH
C03XB/ESnpwiUyXgcPlpPIE8Ae0bcpwOfj4y/zUP7cXmoiUEpZwnZeoEaKUurcNI
HfNystD/D76MZVEIgT4ufDWiM6qcSfowrzJt4zU9HEpL3S9pvgNIXX+XKyNNPdVm
YEHAdvHo1cWbLckmEmtUjmVMuyMgrY0JwBLo5925J/kXCWkS3lZVv6SaW6PUIzyv
rEOwusUQ8HzTq7GNiWr43ju9x/2s2Oy+Rzf8g6nrj6aMTKHcRxbX8HYpmrMh03AU
PR5/0rK/Bk2gb4T9CJoebBZXMBDXajo1YruSFawFCnqmApy3QnbtoWQPoZ4oio52
LwIBHbQ2TSMrE+TFJtryfdUVb3KbyULmfRzfL0YyUaKmD8Zuhi1fNpKk1WQb9Wid
KouT5+YYbQMmKbN9Q0WCPF/JOdO9WVPO//VNRqp1k0TE8ieAySE=
=/jz/
-----END PGP SIGNATURE-----

--CKmgZ7Su3xMLo1p3--

