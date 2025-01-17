Return-Path: <linux-i2c+bounces-9127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73567A149ED
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jan 2025 08:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC633AA1D0
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jan 2025 07:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295681F76A1;
	Fri, 17 Jan 2025 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7UqrYul"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5951D6DBF;
	Fri, 17 Jan 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737097257; cv=none; b=m0dr3Yg9zSdTEvuOMCZ4/UtC9DvuDJoMHo17af5HoUfgB5rXcpFzvohtcjc7/X2RId0eDfCzWMzND9b2UFarDqd1PL4kHEJjTIiUth/niZIg0g8uMOr8O2zFusSmqA/iSE/DF9LbE/IR+5DSjVMU6I+KExtTHb8eQ6y0w/YSnK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737097257; c=relaxed/simple;
	bh=gpc1RFnN/U2caGP+Q3TIxquBweQjsUa5IS4arwk+tL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qziXw4WjN03YKVhY+LPAAxfEjR5FVR0QZohap+9xurnSnv1+z9Ns5n1RYwyIkd7ERDj5KHjScTWhEiels4VqmzK28ecm50lFkkuvNlp7Qn2seWErbPw6l3mibj4Qpywv6qTaMm5xgQ46kBK0Sw0+qDPpGZA7IPxBqZewrkqPqoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7UqrYul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0E3C4CEE0;
	Fri, 17 Jan 2025 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737097257;
	bh=gpc1RFnN/U2caGP+Q3TIxquBweQjsUa5IS4arwk+tL0=;
	h=Date:From:To:Cc:Subject:From;
	b=L7UqrYul45idQcPcveUYUywTUCtDO7/EXlQAxQSsTfjyldb9OuTCHPk+ZsMqjI0Km
	 72OhG1mcYaJxPDgGS/kmuWducshyKkGLEhkmvvMCNg5UVQ80zPp4cljIkoRYPEZ7e+
	 u/2X0qsQcNQYGkCqNCuhULtNthP9LDgEYKO96x19qV814pE84r2fuEBVPy81gEg34g
	 uP7m1Xr3Jm2uRSlVhb91gLCs4HC+yvDAPimFakx6EORsFW03wlhf6gYAGL4tQMz8ai
	 bxuX/5xpwSr4fxD+o8Rc5axCTrtTYR+2TEEV4tiijj3/XAQ1AoqF+qsVI597WNS57x
	 nLxEz9mhMzRkA==
Date: Fri, 17 Jan 2025 08:00:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-rc8
Message-ID: <Z4oAJW2NkCsWQEzh@shikoro>
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
	protocol="application/pgp-signature"; boundary="MZ36+aoZid4z3CXa"
Content-Disposition: inline


--MZ36+aoZid4z3CXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc8

for you to fetch changes up to 6ad30f7890423341f4b79329af1f9b9bb3cdec03:

  i2c: testunit: on errors, repeat NACK until STOP (2025-01-15 19:44:21 +0100)

----------------------------------------------------------------
i2c-for-6.13-rc8

This pull request fixes:

- a ref leak in the I2C core
- the remove notification in the address translator
- a missing error check in the pinctrl demuxer
  (plus a typo fix)
- handling NAK when Linux is testunit target
- handling NAK for the Renesas R-Car controller when
  it is a target

----------------------------------------------------------------
Joe Hattori (1):
      i2c: core: fix reference leak in i2c_register_adapter()

Tomi Valkeinen (1):
      i2c: atr: Fix client detach

Wolfram Sang (4):
      i2c: mux: demux-pinctrl: check initial mux selection, too
      i2c: mux: demux-pinctrl: correct comment
      i2c: rcar: fix NACK handling when being a target
      i2c: testunit: on errors, repeat NACK until STOP


with much appreciated quality assurance from
----------------------------------------------------------------
Luca Ceresoli (1):
      (Rev.) i2c: atr: Fix client detach

Romain Gantois (2):
      (Rev.) i2c: atr: Fix client detach
      (Test) i2c: atr: Fix client detach

 drivers/i2c/busses/i2c-rcar.c         | 20 +++++++++++++++-----
 drivers/i2c/i2c-atr.c                 |  2 +-
 drivers/i2c/i2c-core-base.c           |  1 +
 drivers/i2c/i2c-slave-testunit.c      | 19 +++++++++++++++----
 drivers/i2c/muxes/i2c-demux-pinctrl.c |  6 ++++--
 5 files changed, 36 insertions(+), 12 deletions(-)

--MZ36+aoZid4z3CXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeKACUACgkQFA3kzBSg
KbYb2Q//Z+/fmqdekp6Bw+B79dQDiB1+cjmtykn5OjVOJNhbSwV5DDeKfSCQDy1j
aI4e7N2zMoUgDMBhE7XuCS6lsU1gCOMpRLpb8zKher3lEtD5RQjvunuhAHz/yihh
MiHmR+44NOs3XR8/rps+xWhUcL8zlMoNMBwdnhR97aEniAKjhQOclm/OXpZciRws
uXHAfIxTpAKD7MsU8QL2ailSOQUmKuz19ousBA6hEa/eIUj/gnoqIGUeJtPV+zIo
6iVIZ1Odd+Cu7VdvgtmnUC3Hnr9p2oxLvx0ynHO3fBMShYxMcmj9x+STV5dsXVHu
tYF3K63fjmcMnAb5zEn9Qtbu7qoztT5jcFDtOI2PgtXCDIzFvtRYrT8aDLMkXc3S
9L+wHyfzjaJHK1H+xQRQIpGEdI9ms7TflDcRAdp5Q3ei9yMgbLBn3+N1ZafsLDIP
cd/bKFp38dwpuT2iMxb+WMv2RM3dG4OJn8Maac/I69XtgS249VFR1bTVqmko3bBY
GGDebIqPWhBOOw7RkXqqJtPk67cH1v9iQLT/+WS6vaSFUvlnzsD+/PwrWShQONyQ
ulrEGp3DrTrksYMqfMKI1wN9M6TwG55baDKnqLPJVjMejmWD4F3n+pkKtyGcHbGg
7ODPW8r4mPa6jl0qNyUe1brt9s1we+46Gfu7+M7GYLQrs8536u0=
=nybC
-----END PGP SIGNATURE-----

--MZ36+aoZid4z3CXa--

