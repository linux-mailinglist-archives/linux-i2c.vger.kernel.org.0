Return-Path: <linux-i2c+bounces-5052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06803939F9F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2024 13:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 880E2B222F3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2024 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8D014F9DD;
	Tue, 23 Jul 2024 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZictSF9m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B714F9CC;
	Tue, 23 Jul 2024 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721733581; cv=none; b=e/s2vuprF8dWY5ZZoh4vjikj2tq81TSmQeszyOS8PBq+UnxdKN3HpnlAOA8VQef53y6xjRK5sOnvf2BCET3QQWjPQ5Ppmcg84jG2Nxcvrx0hSP30aDVtPKEG6lAcCVSfHYUTQqrKxZ/IXMavCBWiO9eWsDJrSJqfDebx2bU8Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721733581; c=relaxed/simple;
	bh=/jEI1MKJ0mWcSvRjO2sJxNIZYvVJgUJMB2cCEbTTn5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgP7eD+Vy+V5Zcs0d6Y4OKFLQeBxxVjgDvdNBAhOM7X887zif4ytU/ePSoKdsw/VMXESzeGUHqEPsGHTlSUgo47PcXEch8YrbcKFFF7yp9Nl1DGVSoGMpLbtTcSl9/Zn2VWqut1CsYQd5IDEqo/PuD/5LVkCtfMAKucpHjLqOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZictSF9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C58CC4AF0A;
	Tue, 23 Jul 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721733580;
	bh=/jEI1MKJ0mWcSvRjO2sJxNIZYvVJgUJMB2cCEbTTn5A=;
	h=Date:From:To:Cc:Subject:From;
	b=ZictSF9mRRyE2dmFeH3WP1Rqow5R6DYMRh4Cow+xT4+c+DGDrI1Xg/vaiANSR8cE3
	 lrtJTgz5/eAHRvwzGguT546lcpf/0mF3v3jXg2BCmRhiWYhN2bv7fEAHqItbXD1387
	 NJg61lgLY3CJvQcWjVQKdb8UuWJsYZawujobw+AVWidbqbibmBDCI2uH0ycqz+kTtB
	 NsYpCyb+sR5yGVmMW7TCENFp847QZtTGZh57D6IrEL/mWn1SrNaV9tkaOyR3aGKHDx
	 Djy+rewofXqKDsD2SqPHEIF5hnne0sxvN/owyHvdEzv+UEl5txLkr6z9OZQ9vMebro
	 tNFIQlISvps9w==
Date: Tue, 23 Jul 2024 13:19:36 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.11-rc1-second-batch
Message-ID: <Zp-RyGae1M0Q9gqH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qz7dd/UTaslIo8U4"
Content-Disposition: inline


--qz7dd/UTaslIo8U4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74:

  Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/dtor/input (2024-07-19 16:51:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.11-rc1-second-batch

for you to fetch changes up to 385ac870bdd531348de123d6790626ccd7827f69:

  i2c: header: improve kdoc for i2c_algorithm (2024-07-20 15:45:27 +0200)

----------------------------------------------------------------
I2C for 6.11-rc1 second batch

The I2C core has two header documentation updates to be applied as the
dependecies are in now.

The I2C host drivers add some patches which nearly fell through the
cracks, namely:

Added descriptions in the DTS for the Qualcomm SM8650 and SM8550
Camera Control Interface (CCI).

Added support for the "settle-time-us" property, which allows the
gpio-mux device to switch from one bus to another with a configurable
delay. The time can be set in the DTS. The latest change also includes
file sorting.

Fixed slot numbering in the SMBus framework to prevent failures
when more than 8 slots are occupied. It now enforces a a maximum
of 8 slots to be used. This ensures that the Intel PIIX4 device
can register the SPDs correctly without failure, even if other
slots are populated but not used.

----------------------------------------------------------------
Bastien Curutchet (3):
      dt-bindings: i2c: mux-gpio: Add 'settle-time-us' property
      i2c: mux: gpio: Re-order #include to match alphabetic order
      i2c: mux: gpio: Add support for the 'settle-time-us' property

Thomas Wei=C3=9Fschuh (2):
      i2c: smbus: remove i801 assumptions from SPD probing
      i2c: piix4: Register SPDs

Vladimir Zapolskiy (2):
      dt-bindings: i2c: qcom-cci: Document sm8550 compatible
      dt-bindings: i2c: qcom-cci: Document sm8650 compatible

Wolfram Sang (3):
      Merge tag 'i2c-host-6.11-part-2' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/andi.shyti/linux into i2c/for-mergewindow
      i2c: header: remove unneeded stuff regarding i2c_algorithm
      i2c: header: improve kdoc for i2c_algorithm


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (3):
      (Rev.) i2c: mux: gpio: Add support for the 'settle-time-us' property
      (Rev.) i2c: mux: gpio: Re-order #include to match alphabetic order
      (Rev.) dt-bindings: i2c: mux-gpio: Add 'settle-time-us' property

Guenter Roeck (2):
      (Rev.) i2c: piix4: Register SPDs
      (Test) i2c: piix4: Register SPDs

Heiner Kallweit (1):
      (Rev.) i2c: smbus: remove i801 assumptions from SPD probing

Krzysztof Kozlowski (3):
      (Rev.) dt-bindings: i2c: mux-gpio: Add 'settle-time-us' property
      (Rev.) dt-bindings: i2c: qcom-cci: Document sm8650 compatible
      (Rev.) dt-bindings: i2c: qcom-cci: Document sm8550 compatible

 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml       |  3 +++
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml       | 20 +++++++++++++++++=
+++
 drivers/i2c/busses/Kconfig                          |  1 +
 drivers/i2c/busses/i2c-piix4.c                      |  9 +++++++++
 drivers/i2c/i2c-smbus.c                             | 15 ++++-----------
 drivers/i2c/muxes/i2c-mux-gpio.c                    | 14 ++++++++++----
 include/linux/i2c.h                                 | 21 +++++++----------=
----
 include/linux/platform_data/i2c-mux-gpio.h          |  2 ++
 8 files changed, 56 insertions(+), 29 deletions(-)

--qz7dd/UTaslIo8U4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmafkcgACgkQFA3kzBSg
KbZa3w//RFl0P8gWFR3hdS6fbKK0aVnhjQT3fsM44qD2PqTAaYHWAq/0iHRLyXtb
GJnEGOU1BEgPwxGlnnleeUe2odHEQPxwFDEhmCedaylFe94FaDv3x5V/G+FmWjCC
7UhANR6X/1Ff+iuj1kPh2IxzsDTmx0FMX064QykxW2SxAZH76PWjFIqS+XvpBu32
pb0LkwNms6NbmVDTzlLiQc1RHok9D2nKHYJsXQo8+FqcikvDNgCiyXJndusAgVJY
n5F0wX7/r6ZX2eOzxxlnapVONZGQJWRkat7YiD2qSVA0Xvri3rTYisjtVGu6t7EI
/9PRrJsin18Z78WPuFQKFLwMGaNqMWoW1sMgjG+bU3bgqfILSyCat/PsoGZs7UtQ
Hnfh19WSMOXScjMSL988WYXBjydMtESUtnR0tPEF2xQwIb1TTwS3HugSe+0Un+bT
PoIXWWAW3HGE3ZZLh0x019ylSnf8SRr/qd1JphWqOCwaSlG6g1sdKp6v9mgEHE4N
j6B1wekVrWuO9etU7GcNXCpwLxqaNtSMkqNeqYFsiKLvOcBWbgS5skxwejbkdwRm
yLMvxmuptVgfZ+4PYUGaaRJ9z4P6/sst5TIRXaRwIENovYT3xs8x3lKOGKgSaEiE
Xu6wUaM9qHuaQhgbb/ROT1d4kB1h0xTGzNEU213/QEvuhvOg+D8=
=qCWM
-----END PGP SIGNATURE-----

--qz7dd/UTaslIo8U4--

