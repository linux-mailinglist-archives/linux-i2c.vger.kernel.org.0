Return-Path: <linux-i2c+bounces-952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99381C848
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB921282E8F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502A312E67;
	Fri, 22 Dec 2023 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A56G4zdb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163AE1173C;
	Fri, 22 Dec 2023 10:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E4C433C7;
	Fri, 22 Dec 2023 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241606;
	bh=6OCSEbFa5VjqhrZXUbS6iLLH3FBSj9uWLxp9Nea6BMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A56G4zdbW6PJhc8aFp8/SzaFix/169m/K0ZI7iFHEQb4Gg728GjWZdTxJaWctJrXM
	 /3melLT/isNGPY9pdDL4ZthT+v+z8FI7OKYkTRcRSIWCoUa/vRUPEXH718JCu3Jt3E
	 T69QyXl0whtyP9q/BCLDOlLLSzgYWkMmpYLHbFVDe7QvsCtOSJXjXyjAMe3bj4M55k
	 vOK7PzQI/Sc4udnXbNwqQxnkeUHrDtlUbD6XxaMfvsAlV110y4oAAuaBD+O+qpnTlQ
	 oRCrzF2d4Ai5dVsdphvdjErDoGHsbv5foqOBO3WnMQF2lYfTgGyjSp+HUXveaFMzKv
	 OOWKOBxxZcpog==
Date: Fri, 22 Dec 2023 11:40:03 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Add =?utf-8?Q?0?=
 =?utf-8?Q?x29_as_I=C2=B2C?= address for lis3lv02d in Dell Precision 3540
Message-ID: <ZYVng90Z9nIGSuNR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5C/NluWS5tnimeo"
Content-Disposition: inline
In-Reply-To: <20231220161003.68310-1-pmenzel@molgen.mpg.de>


--e5C/NluWS5tnimeo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 05:10:01PM +0100, Paul Menzel wrote:
> On the Dell Precision 3540/0M14W7, BIOS 1.7.4 05/12/2020, Linux prints
> the warning below.
>=20
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus =
but its address is unknown, skipping registration
>=20
> With the help of Wolfram Sang, the test to probe it on I=C2=B2C bus 6 at =
address
> 0x29 was successful.
>=20
>     $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
>     $ ls -d i2c-?
>     i2c-6
>     $ sudo i2cdetect 6
>     WARNING! This program can confuse your I2C bus, cause data loss and w=
orse!
>     I will probe file /dev/i2c-6.
>     I will probe address range 0x08-0x77.
>     Continue? [Y/n] Y
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         08 -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
>     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
>     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- -- -- -- -- --
>=20
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-6/new_device
>     $ sudo dmesg
>     [=E2=80=A6]
>     [ 2110.787000] i2c i2c-6: new_device: Instantiated device lis3lv02d a=
t 0x29
>     [ 2110.791932] lis3lv02d_i2c 6-0029: supply Vdd not found, using dumm=
y regulator
>     [ 2110.791981] lis3lv02d_i2c 6-0029: supply Vdd_IO not found, using d=
ummy regulator
>     [ 2110.809233] lis3lv02d: 8 bits 3DC sensor found
>     [ 2110.900668] input: ST LIS3LV02DL Accelerometer as /devices/platfor=
m/lis3lv02d/input/input23
>=20
> So, the device has that accelerometer. Add the I2C address to the
> mapping list.
>=20
> Link: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca8=
26f@molgen.mpg.de/
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to for-next, thanks!


--e5C/NluWS5tnimeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFZ4MACgkQFA3kzBSg
KbYXwg/+OO6AsH+D/2ATwmM/XRpIwMBWdRD+zra9TogbhD6D1LytGW83U5mYLV0z
pEhJHcrxtxKXcE4sAR26G3li5CWjwZb8UdF5lai/4wjC9kuWtD3nwwui8df86rmt
3S4BkK6Onxf/XkMGv1Gu+k+y9wJSEKWfLEL2jWz9Lvb70Zws5jdV1IWKy4V6w9ZW
SC6KTYZlm9g8IxWAS7Gyz/G26gDmQ0kaqCExqMrBsAn3P79Tgb6yInhK2IoDBVCL
4DSgbhFCyC8Pz9fHnFatKfuL5gYNX20rkehHrOp5Su9aputbYhYfQ09x9D6shboC
+g+Hoq1rdPaAikL2zEnJdMCVAAyFBGbcpZtqct6yIXa0bS3kfuo3SeE2/p8yD8LO
fBym5j4KkuaWD0+/v/dsaxksUIXT+evhwU3/4dEHKbgq9RfZSXXUq94rRQaQaPis
995eat4EB9reeSZz/wS8BkscOdyyBfglw115oYfQb2tpPx/5MK6F1rhAQhtlZLXy
XyYd0AhAqVDwUtBjz+SJjoqPR/rwLegmXRxNLfx9GqL1r6NQkJ4rGNoc7rf5hQJP
F+h1YZyr7+2PFhB0AC7sOkMdg7DkWL3Cu5DlSwl2YRiEQD+HSSQ8iM0/VnZ8Lpg0
c9oL5Pol78q23qyonxh+Rpmlhwpp0lAsOjvuNi3kw+NCvXQFgjk=
=lhaU
-----END PGP SIGNATURE-----

--e5C/NluWS5tnimeo--

