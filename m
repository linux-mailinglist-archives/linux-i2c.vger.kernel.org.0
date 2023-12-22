Return-Path: <linux-i2c+bounces-953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F881C84B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F0C4282AAF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B6113AF4;
	Fri, 22 Dec 2023 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbRxY4N3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC612E67;
	Fri, 22 Dec 2023 10:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AF0C433C8;
	Fri, 22 Dec 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703241639;
	bh=qOS484/8I/VcSt29F9FoCd7owAgLyk0rsi11NBcxJxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbRxY4N3bAoMCRd8PJf0Itebzl4JsO28tx8p5a+IdLcp5q//7n3/kzTSwTYCFLeLf
	 uX/o8bbwWc4N6oadbsNKqpkkP0ky+7TAxUC2pm4nNAwWvGPoOOB0gynMGd8yYhN0eN
	 B7Z+6sXx0H8v3ks6HkvBBhaLfUO+60+lGcLmjRDd2CbdSBUMrcX12b+fx175qRmRAF
	 Q4mruIt0UeICQMcqccY2ApsFpSlJ4fiZxyXNrFwXow8YTMSIoUCMa938zrVn/m5zw4
	 o99KrbO8HCBHLjrvfMqO/4r4k9jjaDH634NSPMvNDvkHm0u4F2RaRHOnudRpgvHWku
	 3BW+pmClhlGjA==
Date: Fri, 22 Dec 2023 11:40:36 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: i801: Add =?utf-8?Q?0?=
 =?utf-8?Q?x29_as_I=C2=B2C?= address for lis3lv02d in Dell XPS 15 7590
Message-ID: <ZYVnpB+Y1WowfkUO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231220161003.68310-1-pmenzel@molgen.mpg.de>
 <20231220161003.68310-2-pmenzel@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="boHf5/EX7BeixKFs"
Content-Disposition: inline
In-Reply-To: <20231220161003.68310-2-pmenzel@molgen.mpg.de>


--boHf5/EX7BeixKFs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 05:10:02PM +0100, Paul Menzel wrote:
> On the Dell XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023, Linux prints the
> warning below.
>=20
>     i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus =
but its address is unknown, skipping registration
>=20
> Following the same suggestions by Wolfram Sang as for the Dell Precision
> 3540 [1], the accelerometer can be successfully found on I=C2=B2C bus 2 at
> address 0x29.
>=20
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
>     lis3lv02d 0x29
>     $ dmesg | tail -5
>     [  549.522876] lis3lv02d_i2c 2-0029: supply Vdd not found, using dumm=
y regulator
>     [  549.522904] lis3lv02d_i2c 2-0029: supply Vdd_IO not found, using d=
ummy regulator
>     [  549.542486] lis3lv02d: 8 bits 3DC sensor found
>     [  549.630022] input: ST LIS3LV02DL Accelerometer as /devices/platfor=
m/lis3lv02d/input/input35
>     [  549.630586] i2c i2c-2: new_device: Instantiated device lis3lv02d a=
t 0x29
>=20
> So, the device has that accelerometer. Add the I=C2=B2C address to the
> mapping list, and test it successfully on the device.
>=20
> [1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca82=
6f@molgen.mpg.de/
>=20
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to for-next, thanks!

(fixed I=C2=B2C to I2C in both patches)


--boHf5/EX7BeixKFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFZ6QACgkQFA3kzBSg
KbY/9g//fss+P2RTFKOCxef/wXLI5EPTfPe6aG1wBehw4H/2xTITjBG+oB0uwsOe
P/VsZQhna+S3hmox54o3nDIGys1nqefGdS/S3Df0djwbo9K1lBHuz5rviTGdkeoK
B/+ToqFAgC8TodKubZVCheLSmmPTI+SzGlEWEe/dPQcp53t4SH31oKyK+3Ph0TPT
3e0UIbQ/o913fzqutvMe7Da+kAeRjLgStfdjaYnzfcCg74hEbixYdZnTAD3cUiWU
dd0VWEQkWvgzz9LX1TrD/DTCG6RgP6jylUgj89qYrTiVHtXXEO0+25il9cyfjOtc
zwVJqsNEyWiiyHhZDFsO224tOvBcFtGFIUZ1FPlsi4tWSZ8/zKs4G3izH5wwLNBc
4wfmBp+6zrI9gtumEb8c5UGOAMpq5N7SXQN5G4W7AMskvBdW+JXAhIeXfOSMe1w/
ao3+AUO2tvdlpi0xfRCqsYPLRNDxnChM9raeyRB3dBQoLgDfGYhZJ+pkvgy+zu21
dnuMZE01ZXJRYDjlkp9ObxbVt0pQAJEXW8O0DKJCOMQU0tFlr8/IrtaHm2Y19wt7
kYHQpN0H4/Wwj9BIAD0dyFRi9WxAieaPgVnfcovaYce+7idgjNeBhDHSyvNR5/HB
CLEA3C6GrekabYbwnQEQex3nOWiOy9sgE+G/3GjqHrZxNRpfnN8=
=egwR
-----END PGP SIGNATURE-----

--boHf5/EX7BeixKFs--

