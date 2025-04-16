Return-Path: <linux-i2c+bounces-10425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA048A9086E
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 18:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7E0A1883C00
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 16:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CC1210F59;
	Wed, 16 Apr 2025 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AlGYOEU9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3961DF985
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819869; cv=none; b=ThHQthaH442hVY5SSVr42A+TrLzAweu9TLjVnNi7G4WmbMuzx2kkpab+omCpmbXMrDnNv+K8nYUUe7BwdNY/PaoQwyPigyJfLc43MbxILcAo3C2zQIfErctgG6XyznO7uNdtivR2g2XGxgxvR3ZjSY5Y9JlZNMLyETeibnKChkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819869; c=relaxed/simple;
	bh=r7nXonSwEu68bLebps2Xf8cTuO1u5ko/8r+nHwK3ugI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFrH9RguQQm0JTzlN8adUwdmaxhub9N15VgDZicqc2SPcuqz7Q8PKobLCGn+4f+njTrtpqTKMasckkbZ/L4RACP8qEZgEZ/nuTNiF2FkI3ru4qHGDVdLd0Qxa1DeAJL3U+a3KOtrCPT3WqC5joygi1f1CJnN/9HqZVfBptm30mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AlGYOEU9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CD82
	aaEtrX3qt91NG+am4gW8qYGsJOF0kgldIcobva0=; b=AlGYOEU95X51qyDBtNSD
	XeCXS8XfmIMqq9TzOUX1X5igA0XFmf6tUEbjDLh+Ir2KWErKTQYwb69waitO7+Wc
	ZIFDWF4Fd6njngLAk10PNBRG7fheyq0ndi/hACFMFhS/1Ou2kJBV7Ebvj+f7FYXX
	vYnsz/FsTxmj2sWhDDrFkEnVHEoCgo4Pi5a0vdmiAiIjcuws9NcxmmIc7lPvUe5V
	JNUyoa4odK9W3KcxtcNhzLe+MxGlcTiS6yISso60ShbqDxJCr7mBGUYWuMztBN6o
	28dTHPmKEZvn3Kfa3GQ3lGP15xSSiJ1/Pb887oShWiFk+oSsQkhZlstLwW5OoBqd
	dQ==
Received: (qmail 786598 invoked from network); 16 Apr 2025 18:11:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 18:11:02 +0200
X-UD-Smtp-Session: l3s3148p1@ZPkViOcyruAujnsq
Date: Wed, 16 Apr 2025 18:11:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 0/7] i2c: core: Move client towards fwnode
Message-ID: <Z__Wlri8-tjuctsa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3liHQc8JqCGglSNk"
Content-Disposition: inline
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>


--3liHQc8JqCGglSNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 10:01:30AM +0300, Andy Shevchenko wrote:
> The struct i2c_board_info has of_node and fwnode members. This is quite
> confusing as they are of the same semantics and it's tend to have an issue
> if user assigns both. Luckily there is only a single driver that does this
> and fix is provided in the last patch. Nevertheless the series moves
> the client handling code to use fwnode and deprecates the of_node member
> in the respective documentation.
>=20
> In v5:
> - reformatted conditionals to make media CI happy (media CI)
> - updated commit messages in patches 3 & 6 to make it more clear (Wolfram)
>=20
> In v4:
> - fixed spelling in the first patch commit message (Sakari)
> - wrapped the commit message in the patch before the last (Sakari)
> - added tag to the last patch (Tomi)
>=20
> In v3:
> - fixed compile issues with i2c-core-slave.c (LKP)
> - fixed compile issues with IRQ APIs, i.e. missing header (LKP)
> - added patch for the only user which assigns two fields (Tomi)
> - added tags (Tomi)
>=20
> In v2:
> - covered i2c-core-slave.c where it makes sense
> - covered i2c-core-of.c where it makes sense
> - rebased on top of the latest code base
>=20
> Andy Shevchenko (7):
>   i2c: core: Drop duplicate check before calling OF APIs
>   i2c: core: Unify the firmware node type check
>   i2c: core: Switch to fwnode APIs to get IRQ
>   i2c: core: Reuse fwnode variable where it makes sense
>   i2c: core: Do not dereference fwnode in struct device
>   i2c: core: Deprecate of_node in struct i2c_board_info
>   media: i2c: ds90ub960: Remove of_node assignment
>=20

Works at least on my OF-based platform. Let's go CI.

Applied to for-next, thanks!


--3liHQc8JqCGglSNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/1pIACgkQFA3kzBSg
Kbb8Pw/+IszgCGVXNlw6c/miI0lJl/qMnSp912U1Cbr8dtrVMBR8KQB+67dNMVJU
D2t2bNHaOkYgv7E4uaBQNeo6NzTjCTOnjaN3BFWZKcCG6a9E7knKKYJ6V12ywNuV
xrGp6IRLj6zTubXIP2n56s1d+toB1YsIqYlMKeJYgS0Cw8A4o6hChEFLYfG8nqRZ
Tj3qRMk1I+KA3RtnAC+7e8/X+qJQYPmQYa13inuFTWmGVQxohae3Rjk8Hu4A+31V
tTzF232MCktI2CGS59fH5FSdAirYdBkoi+/icGFfSO4QCuBkPD44FnzlW06PnRSa
rXjYt+h9Cvh6IHTlQik24+2jdV9vEZLs2zwa2PqDygbrX9OAzf+HC5WoRG7aPIgv
Ur69M4d5cYnOPg1yH3NvkXDOnsXaf5Xuzmg65P1gofMfeEVvysmXaJXuQ5AsvvQi
CovIOoYxVu+BWaC4Y9gSsDQE6ba2V+PEA5BnxHdIOnMA4FPSPxgZk9F5Jn0ka+TX
gWOiT0OuVcibb/peK7IEvy1a6UZWmkONhbIuOFV/8NNNeptW1OkFVGysb77IeVaM
0V0L1i2qN6ENAUfskSahh5Bux0eq2Qf1jzUulBvMkUn9p1r9lQlyKbKgQPhEkSsx
va+/hTJMyzk2IBpzGZfl1hWC22ELTEMH9UgVqB26K43C167/xI4=
=6xgd
-----END PGP SIGNATURE-----

--3liHQc8JqCGglSNk--

