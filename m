Return-Path: <linux-i2c+bounces-11683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ED1AEC9D7
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 21:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1163C6E0EE1
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 19:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3516B221264;
	Sat, 28 Jun 2025 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/rk8GHN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2221DF75B;
	Sat, 28 Jun 2025 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751137420; cv=none; b=e+u4ihfs72IIrSllM1XfmtgY20NWjjdmCWFT4g3fHyIgLVnHNInd79N7hYswyq999tKU19Ji8T1cJVKSKHkq0tiCAfuw7HTWNkYroN+MJBFzb79ZLg2OX4na2cOyAgXv9lt9mSd9kyYiW3UaG+IH2XY4eNgEaAPj5xY/i7F2Mtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751137420; c=relaxed/simple;
	bh=zfgv6PJINC7vZIj0NCJ7W3L3ZAysaSJB5bC+FX0XBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fY9m2iXaCp0H3TDOxwo2MNzzAm+n04IBhhhRcDZX1FETYy9+Z4sLmg9I9i3Ld/hPVrHGO4v3Q7OSJllcXidN8N8YnDKmzamSdZvLhQG4vDYxAohi74reWtTiUFxUtnjbOGPNxld7zQ5DOaQPitiC79UE6njA8WApsi9AD38PQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/rk8GHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64BAC4CEEA;
	Sat, 28 Jun 2025 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751137418;
	bh=zfgv6PJINC7vZIj0NCJ7W3L3ZAysaSJB5bC+FX0XBcU=;
	h=Date:From:To:Cc:Subject:From;
	b=T/rk8GHNTroexcOeSUiNHnwzN+p5lQ/QE7NXAmm6GCCi+Mvj0AqHLUvII4rQ20eE7
	 p7OxjXfHdoEPyDFmZvwKE/P3JxU1PDDb4avoifmdaNh7f5jMQux4k+h8OYkrWA+mMc
	 +tYz6o4K+Jk+ZUELzVP5Lndw8scuT1UQd/ekhx+Md+c/RbYjT1lOC1d093QJbRoMZf
	 oSvrmVtDgZ4n8eQYLLJU34XVRDmFFVXqedhnFPBT8fkw13Om7yXz7LlieLZ15oG48Q
	 7ndqodB3x6F652pHvwQXZYybhzYMC+ppbYDwShwSofyDtSh3nE6wKWx6yXN41QVeVQ
	 oHGa05UBNB8Gw==
Date: Sat, 28 Jun 2025 21:03:34 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.16-rc4
Message-ID: <aGA8hmxiZJcIIqOI@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbZkZoKMazwS44YT"
Content-Disposition: inline


--fbZkZoKMazwS44YT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.16-rc4

for you to fetch changes up to f40213cd93e608ee78b5e25db042c42ec07139fe:

  i2c: scx200_acb: depends on HAS_IOPORT (2025-06-27 12:28:33 +0200)

----------------------------------------------------------------
i2c-for-6.16-rc4

- imx: fix SMBus protocol compliance during block read
- omap: fix error handling path in probe
- robotfuzz, tiny-usb: prevent zero-length reads
- x86, designware, amdisp: fix build error when modules are
  disabled (agreed to go in via i2c)
- scx200_acb: fix build error because of missing HAS_IOPORT

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Johannes Berg (1):
      i2c: scx200_acb: depends on HAS_IOPORT

Lukasz Kucharczyk (1):
      i2c: imx: fix emulated smbus block read

Pratap Nirujogi (3):
      i2c: designware: Initialize adapter name only when not set
      i2c: amd-isp: Initialize unique adapter name
      platform/x86: Use i2c adapter name to fix build errors

Wolfram Sang (3):
      i2c: robotfuzz-osif: disable zero-length read messages
      i2c: tiny-usb: disable zero-length read messages
      Merge tag 'i2c-host-fixes-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Carlos Song (1):
      (Rev.) i2c: imx: fix emulated smbus block read

Randy Dunlap (3):
      (Test) platform/x86: Use i2c adapter name to fix build errors
      (Test) i2c: amd-isp: Initialize unique adapter name
      (Test) i2c: designware: Initialize adapter name only when not set

Stefan Eichenberger (1):
      (Rev.) i2c: imx: fix emulated smbus block read

 MAINTAINERS                                |  1 +
 drivers/i2c/busses/Kconfig                 |  2 +-
 drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  5 +++--
 drivers/i2c/busses/i2c-imx.c               |  3 ++-
 drivers/i2c/busses/i2c-omap.c              |  7 +++++--
 drivers/i2c/busses/i2c-robotfuzz-osif.c    |  6 ++++++
 drivers/i2c/busses/i2c-tiny-usb.c          |  6 ++++++
 drivers/platform/x86/amd/amd_isp4.c        |  3 ++-
 include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
 10 files changed, 40 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/soc/amd/isp4_misc.h

--fbZkZoKMazwS44YT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhgPIUACgkQFA3kzBSg
KbZnqA/9Fmnl4mcD78dshgNQp1V7nnVB+BMAzaBxK7Zw3Yo+YRoiusKvYJfOwhFy
M3GaIYHv1144MzE4JzHEGulLAwA82d3DawNtedZy9SPszIdz7X93uSd4/tKpL88q
VqW9TAFnLzMOhDYnPAJpEaiqgwJ0FnXZSpUelJu/wIT25rwCFZJRyEAYkweaCg4i
NW924BwXhv+pQ8DkGO2QgFGZ3FZZsL7Oin/nU5wWe522IkJkviKG8zgm5C0iT4XL
IdfFnIvwbCCFsiuxMYSAwkEhD0jvwVIl9CNN+YySRHorLSU6GBGdfEIwsSzV14G3
i9vK3RbgfGeeKLSN1v4Txnw2qX1zuOaW5lI91bgFvKNn8TZEGgYn2lbpJyMn8XuE
VDTySsmKj9SHIKy+JvS5jGNUer9wRlA41pSQKl3STbVY2j/RfmCGSqxqJM4SLm+X
YPYnYLvXi6Bzc4ZwfIXoIAe5lWGeJkmVFNh2OKCW1szlQqsvbJ7HkmCXYY8MSrmn
6puE+hXdOMLaiN1wVHT4YF+bzPV7x9gAEfWAhLuG4rYjpQPwW9bKRF1TbstE2y+P
EOL+WjdTTI0LDAkKXNN7c8Aqs6mlC/Orkf4mgBr5j1XaLvFllFnb2Ynkli8wZl0r
GCQZddD66acmjakyYLyXxvFl3ef9uO00d7B/xCZ3RIGA51kqBJo=
=gNlQ
-----END PGP SIGNATURE-----

--fbZkZoKMazwS44YT--

