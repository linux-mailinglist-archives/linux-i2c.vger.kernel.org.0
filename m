Return-Path: <linux-i2c+bounces-8170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7E9D7571
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 16:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06332285DEB
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810482500B7;
	Sun, 24 Nov 2024 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW9I/rjh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DB2500B5;
	Sun, 24 Nov 2024 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732462923; cv=none; b=UbXX9RTlBu/ypzxPvi8r6WeAh5liQiZEWUP6Mup4Yb3RZ5SMhixUcaMUw5XapY1RQfftHIODweLHxz/2KkwUphEv6tKv2kDc9IvPRdPTkpp4SYVieKf80uAg/yzNjkzYZmXbX25QEBNRQrfVV9vyGHH0ow9qkQYvpm9727KHvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732462923; c=relaxed/simple;
	bh=6lZXEv8fFFcVuaGzeVxG1JLdTfJSYtJER5SG0TtwLgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oOrtX+52lvoHPi2Nvo2zrOKo5HU3dWOtP3hQCQZf/8HVLFQLUvcCgBhqENOf0kiAuiVj504uahG4MmcAwmyAE4WIGB3HlKSQkpLF029xXXiR/88iiU/EwUKBg0ZbhKIE9yzA6t7NrjI9Cfs+HG7RK/Czv7fif5uZUpmdNZutMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW9I/rjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9F9C4CECC;
	Sun, 24 Nov 2024 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732462922;
	bh=6lZXEv8fFFcVuaGzeVxG1JLdTfJSYtJER5SG0TtwLgk=;
	h=Date:From:To:Cc:Subject:From;
	b=VW9I/rjh28otYiLXHjndSsjBMdW8BNFTyRFsz924f45+hHCZfeKoZarqHGpDYNhm+
	 Ga2dkFTkZBemeIvlPRV/hNt6odyNgbYaixTr3tTyVpT0W1ZV/BhgWTC779fagIiUHw
	 EHNtAFfsabZ87JJlIzjX/jjODmtoY0FF/ARGJAY6C54LTCvpUDvc5k0TkSrBTD7NUw
	 roqv0Ysikj73kG1JMxaDsv3fY9ZqnifBQGNXYAUV3JRvG5fZydVvBV+a5rgJ0mBMM/
	 TY8XD9pdhnR9PeZGbtHefipx0S/csR6T+DkjqpfAKooBRy5+wA+hw0NXJC5tb35PvX
	 mGgTR8ofH1I0g==
Date: Sun, 24 Nov 2024 16:41:59 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-part2
Message-ID: <Z0NJRyAhq2B0Sgtb@ninjato>
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
	protocol="application/pgp-signature"; boundary="DXVLMZnuPrAFu+S+"
Content-Disposition: inline


--DXVLMZnuPrAFu+S+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9f16d5e6f220661f73b36a4be1b21575651d8833:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2024-=
11-23 16:00:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.13-part2

for you to fetch changes up to 16470f60666618830cb9f0b8dfafd34a838c6dbd:

  MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan (202=
4-11-24 16:03:51 +0100)

----------------------------------------------------------------
i2c-for-6.13-part2

Andi was super busy the last weeks, so this pull requests contains one
series (nomadik) and a number of smaller additions which were ready to
go but got nearly overlooked. Despite the late collection, they have been
properly reviewed and have been in -next for 6 days now in Andi's tree.

New feature support:
 - Added support for frequencies up to 3.4 MHz on Nomadik I2C.
 - DesignWare now accounts for bus capacitance and clock
   optimisation (declared as new parameters in the binding) to
   improve the calculation of signal rise and fall times
   (t_high and t_low).

New Hardware support:
 - DWAPB I2C controller on FUJITSU-MONAKA (new ACPI HID).
 - Allwinner A523 (new compatible ID).
 - Mobileye EyeQ6H (new compatible ID).

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string

Bartosz Golaszewski (1):
      i2c: qup: use generic device property accessors

Brendan Higgins (1):
      MAINTAINERS: transfer i2c-aspeed maintainership from Brendan to Ryan

Michael Wu (2):
      dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and cl=
k freq optimized
      i2c: designware: determine HS tHIGH and tLOW based on HW parameters

Th=C3=A9o Lebrun (6):
      dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
      dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <=3D 3.4M=
Hz
      i2c: nomadik: switch from of_device_is_compatible() to of_match_devic=
e()
      i2c: nomadik: support Mobileye EyeQ6H I2C controller
      i2c: nomadik: fix BRCR computation
      i2c: nomadik: support >=3D1MHz speed modes

Yoshihiro Furudera (1):
      i2c: designware: Add ACPI HID for DWAPB I2C controller on FUJITSU-MON=
AKA


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: designware: determine HS tHIGH and tLOW based on HW param=
eters
      (Rev.) i2c: designware: Add ACPI HID for DWAPB I2C controller on FUJI=
TSU-MONAKA

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: snps,designware-i2c: declare bus capacitance=
 and clk freq optimized

Linus Walleij (6):
      (Rev.) i2c: nomadik: support >=3D1MHz speed modes
      (Rev.) i2c: nomadik: fix BRCR computation
      (Rev.) i2c: nomadik: support Mobileye EyeQ6H I2C controller
      (Rev.) i2c: nomadik: switch from of_device_is_compatible() to of_matc=
h_device()
      (Rev.) dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <=
=3D 3.4MHz
      (Rev.) dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings

Neil Armstrong (1):
      (Rev.) i2c: qup: use generic device property accessors

Rob Herring (Arm) (2):
      (Rev.) dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <=
=3D 3.4MHz
      (Rev.) dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          |  1 +
 .../bindings/i2c/snps,designware-i2c.yaml          | 18 +++++
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 13 ++--
 MAINTAINERS                                        |  2 +-
 drivers/i2c/busses/i2c-designware-common.c         |  5 ++
 drivers/i2c/busses/i2c-designware-core.h           |  6 ++
 drivers/i2c/busses/i2c-designware-master.c         | 23 +++++-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  1 +
 drivers/i2c/busses/i2c-nomadik.c                   | 87 +++++++++++++-----=
----
 drivers/i2c/busses/i2c-qup.c                       |  4 +-
 10 files changed, 115 insertions(+), 45 deletions(-)

--DXVLMZnuPrAFu+S+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDSUMACgkQFA3kzBSg
KbY2ww/+I70uEj51jiW+x5uROwV2zc0sl6ZSnuGxYNsQ1nCyHXGTkG23SouI2oCr
48jgrWGIEHPiovnoSuLZzf7ZvECHJCeUQ7ztMOiW9hdFt+0Q6/HjdiQXWORQfcfJ
ig56M+T8i8N6pxKC0Od20AKNwrlKUjGDUK9CKEZQlhg5GZJL/BOIQ+PVbdXcWC7A
rX5+opMFcs/iCo/MZIBAjm0c1qTcqng6T19to9k6YLuskrGc2kU1R9OxDYt+CvNm
g+oqQij/9RM+dns3lihztZmvuWfxxrFhTTZ4/sB9GU4x8VUi5aKZQQwmkhNNDdqz
pPOCK+aFSAz3I25zvIk8q+Rut+eVn8zpyP0izcYcXFKK62HFUZmti7GgQyFqpw65
JNXecvpCVwV+LqAEFQBT/lZpf8YS+I77Pi8rC1SB3/nmTc0mQh+uhMUEjg6UazMn
XBzr9umkaZNN5wH/QHUxL1MKy81AVPd++WYMvXMzU8MwOLXXtCm/eCS+nvevRKY2
9ou6OuZK7la18DO3ayd8FOKd3w9381vW4a/4tHhzjGIN/gAHSsvLtPckBbqJjqtQ
q0yOKZOVD+VLlnieV0wuNuGUzKQSuuM9xnJJecBNGve4VtQ+avy4dLdhE6SVgyhF
5+/MfYKEsycd/h5Y0r4x2ZNFXmRQsgNJYDAmXCIqWMSYx/9CFeM=
=xkc4
-----END PGP SIGNATURE-----

--DXVLMZnuPrAFu+S+--

