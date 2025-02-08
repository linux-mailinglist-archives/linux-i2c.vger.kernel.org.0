Return-Path: <linux-i2c+bounces-9352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B42A2D5F3
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Feb 2025 12:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7BD4167867
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Feb 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04592451EA;
	Sat,  8 Feb 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBblN31n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896481624D0;
	Sat,  8 Feb 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739015940; cv=none; b=aw/rlCWgano0HwHG478w8NaPPsjFQmziG1RRzaKitsXm9tNXILmtpo7y1+/v6MFupt8UUiGul5k5lNTwng/WMuqFydGztHnX9ukXlSZSM+hMkMYyVYgCWixOzAAZf05FwBIe+H6vIVVrblaQMQ6BsMyY8QLE3ECV2ZrexSJ7D3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739015940; c=relaxed/simple;
	bh=8zdPfaAd61HtnEzwzTOoIlR8RIenVo7mfoghgXMKMho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUZ/87a8uCgc7WKg+Ux4aEpEirHEe7Hu9m1/jwXXhKe4ql2rpJXySEI2lkQge9yTwxJ3mxFbN5YCdWOpWG43BIHc9eN1K/moOr0H74H7CZtk+coEV24VYs6YIhAK+l1/8pSyl1Xpek2yxesvBUOAyVz2puD9N2w3L6ySnGkT/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBblN31n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDBDC4CED6;
	Sat,  8 Feb 2025 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739015940;
	bh=8zdPfaAd61HtnEzwzTOoIlR8RIenVo7mfoghgXMKMho=;
	h=Date:From:To:Cc:Subject:From;
	b=GBblN31nUMvL+abtT9hWPydGzdUDIwJhPLiQoxav1bE7X2Tw3FTxzYkkpH3kLefQc
	 uAxBHDaiYBYfcGSgwEhHWYWRTr8xfvl5ZG7J1AQXOmTIz0lf1FNsevOtsDXxBTbKMf
	 C/UzaAng6FTUoKIuEmVU03tihceJxCv4ateLXbVttoQSQwRW1sKGo2p54LJrE2eNfg
	 BLYrvpYtc5X8udN4UHZNgHTCm7/n75eT28r+Fe455kfPOsOCEl5YujnMqYjPZg8kI9
	 MeJzU33+klSj2M+gVZ58rKWvftsDfMe+QhuPQlQJwNkB32RnRQp5tnWBlIBMJQerq0
	 rKck37no2Vg1w==
Date: Sat, 8 Feb 2025 12:58:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc2
Message-ID: <Z6dG_QT0l_ehhZd8@shikoro>
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
	protocol="application/pgp-signature"; boundary="pXDECexc0vW3EbuW"
Content-Disposition: inline


--pXDECexc0vW3EbuW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc2

for you to fetch changes up to 3bfa08fe9ec8dd79e183c88e1275be74191e7bc8:

  Revert "i2c: Replace list-based mechanism for handling auto-detected clients" (2025-02-05 14:22:12 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc2

It turned out the new mechanism for handling created devices does not
handle all muxing cases. Revert the changes to give a proper solution
more time.

----------------------------------------------------------------
Wolfram Sang (2):
      Revert "i2c: Replace list-based mechanism for handling userspace-created clients"
      Revert "i2c: Replace list-based mechanism for handling auto-detected clients"

 drivers/i2c/i2c-core-base.c | 113 +++++++++++++++++++++++++++++---------------
 include/linux/i2c.h         |  10 +++-
 2 files changed, 83 insertions(+), 40 deletions(-)

--pXDECexc0vW3EbuW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmenRv0ACgkQFA3kzBSg
KbYuLw//aa+CC3uiL3Wl07T+/ZnxgPBGJy5MGbrjmirmRykcL/8Y94lW1S2aTLF/
aQSw5ogrMDsrmc66XHSGxeylF6+TSKWL9wqtsymAL+iAUQLr88AfycU2Z3updiW5
Zzkon3cD2rXKsicLYHVZ40Ik+yvvY7wm1Ru1vpRiKBZ0j6dIxx9gqRAaUyjnnays
gR352oZOZGWOBVSjWUOaFwIViEMW+PkSiD62tIZeFC6ZW6J315OJ5QSn+Rlo5V0P
zYVezww6zWJRyig534tDhSnyzfdry6nAQW4FC7Pf+PQLXWvogZAE+r6FC0pBc9bt
ukB3DE5JinJo1hfJ6IXLlxdLIxw96p2FB1Pla0OzPKkPS4m1Kh53oDfBbq9gsuwB
H/pDrbGptI7j7JKmjoxnVXtb/mwaiOiJtx7lgIG34xZsCifW5Uy6ltNg//zxGCh0
tDvN8GrvX8xp7ZBrg6pmRu5es1bwxB0iGFmU91lSkaa/QsXW2s43hsQxQwIMxVql
cULWYKGmvy1mWMaR1eFuJcCc1xuzP1tUipcyAEDt4JlUjq26BkGb5p1ebQCZCR2P
aW/FhtbSaRZqcl/XDQ1IebaOJTdalOSxt/LqiI+vniaXCnkIyWRsDQ1/mcBeUm04
Qh72iVLGs1UZGnOGlQnhAEWC3LVMJVIsYpKK0ORHuGINX/IKVoo=
=PMzS
-----END PGP SIGNATURE-----

--pXDECexc0vW3EbuW--

