Return-Path: <linux-i2c+bounces-8427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E49EB676
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 17:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B358161C74
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0468B1BD9E6;
	Tue, 10 Dec 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jAPTSoQ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F9AD2D
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848242; cv=none; b=ddcv2cBHCaCGV3ERgdFAbm/2zatG+krih81oGsAFRlwXkAm5koTqbKdGte9CD89Fn9puOB4HjZ+vvrA4/BSIBE4tDRnKkv6L02SSWSid8MmfVhXvA5fjk8N1rPnw2xnPn8NO7yAQp3dOHAPl9KdbtFIh8Iwtfbj42HEbEwHZvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848242; c=relaxed/simple;
	bh=Zlnzz0wdPYXkvJtPphlnVkmYtMKsjBqYbz2HGIuD3A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwZvUJtkCXOCcAGAuszxZFvbf8iCQVlgosdLHRduas2+hsHp7B+gjpZfJ0UevnJBpLW+zhTVH4fMLrPelVQWsfqGCSJ1rfj5zW62adbcTiFnEJqyzmyCwNO1ok8r2cNNY481TpagkJQq8uZm3zUfb9vIvlIyIhPUJYORm8Xx4AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jAPTSoQ1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zlnz
	z0wdPYXkvJtPphlnVkmYtMKsjBqYbz2HGIuD3A0=; b=jAPTSoQ125TUsdb1Ob/8
	sA12zrGKpA6Lu3q84fFxaVBnyXd087afVV6l/lzM70C5FuJeQFsKvkbMQ/MXvmAV
	qV7TPcUOV67YzhspT0PAuWwwMXa7g4VF7wIqJay9jnL57qhrTOGcfLK2lThyECHm
	vJ0dPBySrgACFjdTlcPDPNQqppHVmSQkjnovdc/H8lczNdrwS+DvIXbNFTBGe9mb
	+h+9VlG/xt8QMlXgcmSH3G63FjEoksKl7t6U/wHlTOEu8OFf1bObWFjoIMDbe/AA
	Din6OqbGSRrPcCCZjJ0wif3Gm1OCHH9E0g6IXAPMFdYf8C+quX8Ax2On/pSNu9pU
	2A==
Received: (qmail 1448706 invoked from network); 10 Dec 2024 17:30:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Dec 2024 17:30:29 +0100
X-UD-Smtp-Session: l3s3148p1@JFTR/+wo/rsujnsc
Date: Tue, 10 Dec 2024 17:30:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 2/4] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
Message-ID: <Z1hspfPEgOAwmmOt@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20241209183557.7560-1-hdegoede@redhat.com>
 <20241209183557.7560-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cMjDwkZc+VaUwAzL"
Content-Disposition: inline
In-Reply-To: <20241209183557.7560-3-hdegoede@redhat.com>


--cMjDwkZc+VaUwAzL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2024 at 07:35:55PM +0100, Hans de Goede wrote:
> Various Dell laptops have an lis3lv02d freefall/accelerometer sensor.
> The lis3lv02d chip has an interrupt line as well as an I2C connection to
> the system's main SMBus.
>=20
> The lis3lv02d is described in the ACPI tables by an SMO88xx ACPI device,
> but the SMO88xx ACPI fwnodes are incomplete and only list an IRQ resource.
>=20
> So far this has been worked around with some SMO88xx specific quirk code
> in the generic i2c-i801 driver, but it is not necessary to handle the Dell
> specific instantiation of i2c_client-s for SMO88xx ACPI devices there.
>=20
> The kernel already instantiates platform_device-s for these with an
> acpi:SMO88xx modalias. The drivers/platform/x86/dell/dell-smo8800.c
> driver binds to this platform device but this only deals with
> the interrupt resource. Add a drivers/platform/x86/dell/dell-lis3lv02d.c
> which will matches on the same acpi:SMO88xx modaliases and move
> the i2c_client instantiation from the generic i2c-i801 driver there.
>=20
> Moving the i2c_client instantiation has the following advantages:
>=20
> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
> i2c-i801 module which is loaded on all Intel x86 machines to a module
> which will only be loaded when there is an ACPI SMO88xx device.
>=20
> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) tab=
le
> between the i2c-i801 and dell-smo8800 drivers.
>=20
> 3. This allows extending the quirk handling by adding new code and related
> module parameters to the dell-lis3lv02d driver, without needing to modify
> the i2c-i801 code.
>=20
> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--cMjDwkZc+VaUwAzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdYbKEACgkQFA3kzBSg
KbbdXQ/+O30sH3sRP8ycr3QAz+pXZAB9ZeihSq6o1qOkaxS3FLbN2GrcW+XU92H8
+dynC1Nk7wCN0h5IoPJpREc1G5i0kdYWIxiQoY7XECdcDeD3y5+FDuoF0vOsLPho
G6gp5DhKXZoPJDWJrhiyX2mYnDP3iGEHz/0NtAN4ojTrEFBQoKMlxGw+40g4kQc0
iH7QcbWE/VyaWCvXXmQihVRRfXM4wSy8LUty68bDpka6wh+hi2AvgTdD5d68dTfc
s44R7GQr9nyUXihxpCQfSL0q8KqW9O+WqiBn8nTEYSm/ZyMESWiBGw1GB7JZofe5
xmzLA3iKtJtjxJJB3UkLwFMxUOMUMZfdlUxrWVHjjdUH+fW7GUJmEtYWBPNVpy39
8Zvd7+sXI9Ocd1St07AdpUZPEzj/7pFG5P6ZGAkCKoGdKMCzwJvCKO7ZI+W/rPA4
A7nsuHAvBGpJ86Ybm6njdTbSdnrYNsPHvxcPRzuQsM5pnsefqwk4JJTCTKUxhGHZ
iB6+p09ctwUubvMs6v4FoDIMdsMcs3IoTmapFkIr3E2Qsn3M2sVtCLNpC9EZcOEm
Zx79gsSB5wuyxTQDd/Z/QQG5vPEJJQK3Trzx+ewdp7jT7vZRVJAEGQ/ASJfYX63U
hWBrxUPoH4JawvZqkCHbgbRz7qLQLjqDXYYGyFpZYwqVnviKB0M=
=e6Q1
-----END PGP SIGNATURE-----

--cMjDwkZc+VaUwAzL--

