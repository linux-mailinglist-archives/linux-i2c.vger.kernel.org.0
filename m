Return-Path: <linux-i2c+bounces-5391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750C952186
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 19:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5A061F237AC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 17:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945B71BD4E2;
	Wed, 14 Aug 2024 17:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l2w8oE0E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307C1BC082
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723657815; cv=none; b=uLth4shpUVPlPSnWPhYDSUTfaAqAg+rDnmv9eOD8v6LIh59FhLWfpcmYKwroj/pL+/du1+44IR/QaElD76HxVnb4/0eVFk0tgQXLaiGLqysh+PemkNqbUBbwI811SkQkwJaRhrHy/pZKf54jXSkb4LloK/c5+PTjQ0Byc5b1nNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723657815; c=relaxed/simple;
	bh=X+GvbaOtm8CvRiRC8yyK/CWiIh0EeZEROpQOGMGR56Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh8YBGnT5KwRA9FljXubuuvSShZs9XTsNaAZ1iGU5wCOjzOeGUsbIVwAb+68zopaqEPhzLpzNIIJcoyr7rPW+nnjbEFjmRdy63ZvDivVre2B3uFxQjAqE63nC42Xu8dlQRGmy2ixWzkIqbRYHxGJDBiNCN/BxX9Fpz7quPKkqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l2w8oE0E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Or+S
	2nEqMg9pqH/VFqnv0TUQJusbLS5yunAHABu31tM=; b=l2w8oE0E0WLc1QSVaIJJ
	BmLJvSMVfpD5xqX1LK5BFL8cXhiLEEdPhjXe77K+6eqz582P6v92FlhdV74iag+Z
	cp+D8OFq2nuVb7KsoYEtX5ztlpJkP5ng4vehT2WQHRjwDznPNxU1VKkZ5igPhZm8
	fPc2OCYIex3upe8dEkwTC3AAdtncxt20h/QxVDWellbQ98CHRIjPLt0ZqYxNhnEF
	qfYqCUxtGX/z4aVExdF2wSe2irlHwAJ5KCsQYii++r4BsFELTf/woiBfWlnD+wlF
	Bo/INUTwDWnm87Hc3AW8hhQumd+IJL2YYPcZjcGd5kvBmySh+hkC0SPmChyuwuPu
	ig==
Received: (qmail 2058841 invoked from network); 14 Aug 2024 19:50:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 19:50:07 +0200
X-UD-Smtp-Session: l3s3148p1@hnxRW6gfDOkgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 19:50:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: Use IS_REACHABLE() for substituting empty ACPI
 functions
Message-ID: <ZrzuT3ShO2xeJ4bI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	kernel test robot <lkp@intel.com>
References: <20240814121649.261693-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Ehr6Vug+sZofqH5"
Content-Disposition: inline
In-Reply-To: <20240814121649.261693-1-rf@opensource.cirrus.com>


--+Ehr6Vug+sZofqH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 01:16:49PM +0100, Richard Fitzgerald wrote:
> Replace IS_ENABLED() with IS_REACHABLE() to substitute empty stubs for:
>     i2c_acpi_get_i2c_resource()
>     i2c_acpi_client_count()
>     i2c_acpi_find_bus_speed()
>     i2c_acpi_new_device_by_fwnode()
>     i2c_adapter *i2c_acpi_find_adapter_by_handle()
>     i2c_acpi_waive_d0_probe()
>=20
> commit f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI
> functions") partially fixed this conditional to depend on CONFIG_I2C,
> but used IS_ENABLED(), which is wrong since CONFIG_I2C is tristate.
>=20
> CONFIG_ACPI is boolean but let's also change it to use IS_REACHABLE()
> to future-proof it against becoming tristate.
>=20
> Somehow despite testing various combinations of CONFIG_I2C and CONFIG_ACPI
> we missed the combination CONFIG_I2C=3Dm, CONFIG_ACPI=3Dy.
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: f17c06c6608a ("i2c: Fix conditional for substituting empty ACPI fu=
nctions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408141333.gYnaitcV-lkp@i=
ntel.com/

Applied to for-current, thanks!


--+Ehr6Vug+sZofqH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma87ksACgkQFA3kzBSg
KbaAPg//SUDlsQOz3zoOc/HzUtmGDHUWSX2BUNCwNtOgT+QnQruTJINXjOHopzwt
KlH2OcNM5A2EgYr+oxxUb8bA/TYdnBin2V3ezSm3vnnU0X78aciyD5iByRyANp5w
3TlHSjH3XZt1nN+S3NllGy66ewsZRzohIwS0WodJ9bFe+g/5KB5Jk4zauMBiM3LH
U3yqIFNO6j4fE4X/3hRKUCHSXqAqV+CAs+B/tfoparY2U2Ky4t9jn+A+/+LmViVs
+LreDvQRTSlaGt55ejpbFguNHupgETZkvqoY7uc98FFewpqpP8ZoePh59YQy0vP+
qYMwyiwcY40m+4J+66Pcv1Xqt3/Pa/DT9m9iw1TJ52Tw3GVA+jy0ePeVpdntvsgu
8UqrjWRYuaX901jYbhhgyIAq5fxvNRXk4FS0b746Wkay4bNPcYBvcl5zaFrLYWQE
QaC+26Ec3jnvneVDXm2ardDENp8Zp6T5A8r9B9cOR3Gb5436S7KbT3wdVD5VhKFn
+fKH6ZhLWlpdjziTIsUlf95UKMN2mTKZk2DxFM+DgmWH3CxJmXM1q1bP+F7XXC7x
G8vrEACxbRT8fNnU/LEfBzdCgfMM8MrPA1VLzHbO5nofGiHD8pyvV+bXK6YVy6Db
8ncRdgaGpFNdjNpEwXJ3cVVFwr6EFQS3JSNfc135xQpiKLLR9bk=
=1fND
-----END PGP SIGNATURE-----

--+Ehr6Vug+sZofqH5--

