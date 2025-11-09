Return-Path: <linux-i2c+bounces-14018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EFC439F6
	for <lists+linux-i2c@lfdr.de>; Sun, 09 Nov 2025 08:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56C144E137D
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Nov 2025 07:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73F9239E75;
	Sun,  9 Nov 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTdLRagO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E41DF994;
	Sun,  9 Nov 2025 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762674912; cv=none; b=Qb3UnvBqj9olNL+Eospju0ilmxpVQmPvlJXTbcyBp1tLhVgN2NOwQP5TwW+XBy4j/20RmxBeDsevHSSsmtVfcA0TBQ4dkiVa4fbL1xjrihC7G8VEmTh/KSS6xpy3lZwzZEbNpYr7HNLVtQejk4ra11/jCWlwDBB+sgFI/N5A280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762674912; c=relaxed/simple;
	bh=+aqPrF5RRo6fKG0GxKClt1tG25K7ddKVbhbzUrwL+8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFzk2MJ2hWiJFELWe80+H+XGWFvVErKQTGuQhC722nfngtBNOv3nuFYMI7joHeWaSCEXSGLMXt4s08ZpiNP7H1oXRBcQpt8fb5SdjQ1BeDmVBrkAOzDKakHcN6EILEIirUk4lgEo2uoCAkwQAwdTCBdIFZeB5ih85U8Hzv7a9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTdLRagO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9073FC4CEF7;
	Sun,  9 Nov 2025 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762674912;
	bh=+aqPrF5RRo6fKG0GxKClt1tG25K7ddKVbhbzUrwL+8g=;
	h=Date:From:To:Cc:Subject:From;
	b=uTdLRagOoD73ZnVM1JQXh9qVE2SSiHJ+JWWJLv7Lt1d6uKLW9L3QrcdbnELLzdZvt
	 XwtSdvzm4QCiZ/aencLftGVejzRo+9b5v1YAXPUGYymo1a7BWTolTjn2hp5hZZeheD
	 iOVSOdPT26nFwsAL5aERHuAV65uvvCabiTRpJV7KdEtnYZQcVszy8jWG2VbV7Vbq5G
	 DrDSXenhMSBa3hVSYZKGvGIRh71GVTU1l/FfJFuEz5sq7zbVYA7HT7ojFVtP7yt9Yv
	 nkafcs9KpxNiBvJfK4aUjeJViNjvU0Vf1IqGJi9nTk9xondCC+ljjK/99oCPU789XN
	 FV7toMnAWoDhg==
Date: Sun, 9 Nov 2025 08:55:08 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.18-rc5
Message-ID: <aRBI3ERoaz18MvCQ@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZrIFUsCEfi5T4cb"
Content-Disposition: inline


--uZrIFUsCEfi5T4cb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc5

for you to fetch changes up to 6a0dddc53f6f04281b27254a7d940fb9bb2d5a3b:

  i2c: muxes: pca954x: Fix broken reset-gpio usage (2025-11-03 18:04:15 +0100)

----------------------------------------------------------------
i2c-for-6.18-rc5

Two reverts merged into one commit to handle a regression caused by a
wrong cleanup because the underlying implications were unclear.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      i2c: muxes: pca954x: Fix broken reset-gpio usage

 drivers/i2c/muxes/i2c-mux-pca954x.c | 50 +++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

--uZrIFUsCEfi5T4cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkQSNwACgkQFA3kzBSg
KbYAfA//egDABNFcR4mbGefynlV4RIP80rPeNNTsWneRPu5zmMM61e4/Xx4ZBIj6
d+xiPShtRQvO79Q0SBPoR8Gefv9PCm9b8aMGnwfVTdzXN6N3MDr6n/pHmbnCUjRb
M1TPm8CKBIq75eZy06R5FUiL6F3hTXCKB4cGT6dMFsdtbESiBN9rutzF96sjinZw
ESKfcQN5dIaNZrwlMOBZ4jVjWlAfW5j3wXTmpN0dQ1xKjFV7do9+Jh/ejzpnbm2L
RqAO8nSoWvUVKg5tX5Bm5l9T3zlXX36vWob+3Exf7OIJHAdy0XkoKejBE5AIrV9a
gBhUFn9SZWKO0Xm5BW4LU2rSbVFCS6mP9QOzt7Y6la3vOc6ZWNcEE2W4GyVqRjga
oW4RQf8QUeSkElnZhKxXMO5oxBUafWYXxoWV/DD29wh5pCee26FYUjt+hVkF9BE8
bEkLfYFdsu3T0BY50h+m+32LLU3C9Ra+o9vC5CSdi0r/TzdqLTku1O2ds+nENLyN
TT3j0RlN4QAvMeiMBjERYcNcWb7u3aqGqWzbiH7xWxKezxdbLVbvln3OaiT2LAzE
fG7etsUo5+vqY0DuCPyyCN3Pxmpg15FlZiZ9RWiL0k1kjLLws/9Zpit1qKEYERmP
kdGfut5j66eSLSrJu1qsZXduDcr7mdLrTOrWBdgTNZIgBIR5yoY=
=Ld7u
-----END PGP SIGNATURE-----

--uZrIFUsCEfi5T4cb--

