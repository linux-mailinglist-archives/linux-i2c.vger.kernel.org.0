Return-Path: <linux-i2c+bounces-9462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C334AA36FAA
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2025 18:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1E93A96A0
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2025 17:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D07C1DF982;
	Sat, 15 Feb 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlUq0p2d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5018B467;
	Sat, 15 Feb 2025 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739639566; cv=none; b=eWCR1MDMYWz03JRoHgT4UXCwaolap9FEV9AGjuKD8+KVLSGNDdR9ffns0V1zY5mwf0b0IgIqdzU6Z9Yx8qoiZ3xXPTtV+0z7LbcpLQw0qcEO5vFL4M4yirA0dMOn/N04tXo08fbQwZkE9Dv1jjVYTPDFCXb8beVOf5sv70tGrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739639566; c=relaxed/simple;
	bh=9NpyrnnXrWQiuGlBMAHT8O8bCihdP9rW1a7d1z62utk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHZ0T6tOoEuoqWvpejPeZ1DEq7LcRwaC1g5xVgPYmY+RHX5TnFtqXotTyx39zE/5mvomVrvStdJTHqzBsZYCOemwpQv9sbO1s7oYnRgTPGAPAg404tTVzfw2pjgf0tAgBI8vlrV0162hXTBhCi7Zw3XTyC+tJJWcnYsAnOb1pZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlUq0p2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACE6C4CEDF;
	Sat, 15 Feb 2025 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739639565;
	bh=9NpyrnnXrWQiuGlBMAHT8O8bCihdP9rW1a7d1z62utk=;
	h=Date:From:To:Cc:Subject:From;
	b=mlUq0p2dQuDhkx45R6PaZ0ppOcUEa7hfKU0YCp6F6q1nhiFRfFXawbxnsWzlA7ftv
	 MtT2Q5lXugZEYSk25P0Qvar2cAl34qVdkE8m5jg+azurAWoZ7imxTr28sU5SsUgpod
	 SMtCFRnD16J05HQ1q3bl+/jhr36n7MhOORsQ7WUKnf1LaDF3Df04Pyiex/hRnfU1CN
	 AnknYyw9yD/Pa05SmKDZbunbB57Q1Wz1KsJNz4RaUbA4LE2tg79q2mR/xg9XUcPFRl
	 Sqzae9ZwmD6S+zGa2C9Zfz3dwu+hX0U/guG/SYKXP2MVO9cM9Z3TP3QR2w++ma922J
	 W/7yvFkMd00wQ==
Date: Sat, 15 Feb 2025 18:12:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc3
Message-ID: <Z7DLCmDPaRhLWwos@shikoro>
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
	protocol="application/pgp-signature"; boundary="BLFyc/nnPRUAXEKU"
Content-Disposition: inline


--BLFyc/nnPRUAXEKU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc3

for you to fetch changes up to f85478fb3fecad01927935c51fe7e9dd5731d0b7:

  Merge tag 'i2c-host-fixes-6.14-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-02-14 17:23:54 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc3

MAINTAINERS maintenance. Changed email, added entry, deleted entry
falling back to a generic one.

----------------------------------------------------------------
Mika Westerberg (1):
      MAINTAINERS: Use my kernel.org address for I2C ACPI work

Mukesh Kumar Savaliya (1):
      MAINTAINERS: Add maintainer for Qualcomm's I2C GENI driver

Wolfram Sang (2):
      MAINTAINERS: delete entry for AXXIA I2C
      Merge tag 'i2c-host-fixes-6.14-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 MAINTAINERS | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

--BLFyc/nnPRUAXEKU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmewywoACgkQFA3kzBSg
KbacIhAAjfE8FOxLyumD0R+pw5/p0lUc2ckdHbm4e9A1riJUTm/t84Ak8g5yPSWq
dfPPjmuJpDG+nt6tXY9ZcqGhWD51Vtf52hnka4BkP/1jU671J+QCoqTOKXCMN/Bj
xVc6b7IF+K703nU3BS7lUUJYwEWACfkOZdYHTGTxGmQNFf65yoT+5d+zAo3cxNZy
Gs36QhqYrGh1ww6o42ukcRwstc1t7npMzqA2oAJ650fzRCg+F7kL5kIBZ5wR9yJ1
J7Op35LXCIZorupDmb6Ux/ztlSPA0HfIitvUWwNWFBRFZN3GURNha0Hr5kBvAiAr
++wRi6f0+uM64cokm8zo7TwfLx9+9f9bENAe/AkY0rEOnAsJN0Tt1WLYCWug9cAK
6SiKWzqzR7FdiWVEYSa1lN/aXIsNg5rNtIRz/KA/CdmXNQKRJpWI6ukq6ljxJf5C
2lEob1sbWhxEXaYNViOX0lr5jKP61mI0GPvq4n+1N+LWP/DmXnifgTuT7baSetgg
0WSToDpjBnAtHAVWvsr4d2evnMWWODLsR3e34Z/KVm5ZFv/GYorPj/uLeRrNxh86
6GjUQKE2fsMG2Bs//8mw1U+D21pb/VSswSiGx7Fo5tCxYesOdhHVOOsQ8uBG/mUD
qfa9cWe5jAYhDcffVZMqawjNHtkIRHyMiNYngcIXRhvfiuqE8ug=
=JNln
-----END PGP SIGNATURE-----

--BLFyc/nnPRUAXEKU--

