Return-Path: <linux-i2c+bounces-1850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C2859525
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 07:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D61691C21234
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 06:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B515CD52D;
	Sun, 18 Feb 2024 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPICGprb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E8CA62;
	Sun, 18 Feb 2024 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708239146; cv=none; b=Cb8FDirEh9T/iOJfnkAICvxzLugae9sTOQyL5CaiU/m72a4qqFS/RJRSgvGuXg8IiH7LBZI90xapNdnzdQR+uY+3zw3lgi+JR3iH79N9mu+mXRYZkGTPZbTQYNPNd5TfCZ/p8iUV2GxNMjk0bzXa8P21/nzjPj2TpTBJ58zpKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708239146; c=relaxed/simple;
	bh=Wn+TuRelVfypXU6KRa5w6LDlFMshvKNrXnne3jvo13U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNCMOQ3bfb5twvH/EwuHIAquaLvT32vcjJ5s+zUKNx3u6twLRLcvISnZtXoanLpI3zJVhAuMHi0ISAxEJ/pMtSSL5stHaeg7U91CKCxYZ6AL6OWOAZsxEgDK52xoInMmrb3eZgs4iWeMnhoO1KsUGi572HRc3QiCkmv+TYMstG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPICGprb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D4C433F1;
	Sun, 18 Feb 2024 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708239145;
	bh=Wn+TuRelVfypXU6KRa5w6LDlFMshvKNrXnne3jvo13U=;
	h=Date:From:To:Cc:Subject:From;
	b=CPICGprbMz+0rnknSQnCdT9ak4WNjeKygLL0kAEamdPLLtQoB3nqdBWR7OilGUatQ
	 JQl+AuC4EYrmdlVSF1orOcrP4bfHGReiZxtrX713GH0wOXCGvXCETUWXKrwaR7ay2M
	 +FrrcorFIXkrgRW20xk5qdZNkVxGWY8quAh3n25ugAi1j412Zd9IEkjpQKH7D9HB04
	 b4YRBidmMAEoM3oc6LONZxJfG6xyLkY5V/ZR2E4mk6OYwaqqLD9tPhTm6zYaipg36y
	 osFZIY43t27eHaD1I767XpwfoNYxDTwmyIBYNfLR5RsFSYIGceOn40u/ZWfHalGduS
	 hx5yKSPsKQ3bQ==
Date: Sun, 18 Feb 2024 07:52:22 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.8-rc5
Message-ID: <ZdGpJm-eowSwd_ng@shikoro>
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
	protocol="application/pgp-signature"; boundary="TF3He6G31C2lTajl"
Content-Disposition: inline


--TF3He6G31C2lTajl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.8-rc5

for you to fetch changes up to 67ec505fae32419354f4172c06c853def2541300:

  Merge tag 'i2c-host-fixes-6.8-rc5' of git://git.kernel.org/pub/scm/linux/=
kernel/git/andi.shyti/linux into i2c/for-current (2024-02-17 13:13:33 +0100)

----------------------------------------------------------------
=46rom Andi:
Three fixes are included here. Two are strictly hardware-related
for the i801 and qcom-geni devices. Meanwhile, a fix from Arnd
addresses a compilation error encountered during compile test on
powerpc.

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: pasemi: split driver into two separate modules

Jean Delvare (1):
      i2c: i801: Fix block process call transactions

Viken Dadhaniya (1):
      i2c: qcom-geni: Correct I2C TRE sequence

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.8-rc5' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Alexander Sverdlin (1):
      (Rev.) i2c: i801: Fix block process call transactions

Andi Shyti (1):
      (Rev.) i2c: qcom-geni: Correct I2C TRE sequence

Bryan O'Donoghue (2):
      (Rev.) i2c: qcom-geni: Correct I2C TRE sequence
      (Test) i2c: qcom-geni: Correct I2C TRE sequence

Dmitry Baryshkov (1):
      (Rev.) i2c: qcom-geni: Correct I2C TRE sequence

Sven Peter (1):
      (Rev.) i2c: pasemi: split driver into two separate modules

 drivers/i2c/busses/Makefile          |  6 ++----
 drivers/i2c/busses/i2c-i801.c        |  4 ++--
 drivers/i2c/busses/i2c-pasemi-core.c |  6 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c   | 14 +++++++-------
 4 files changed, 17 insertions(+), 13 deletions(-)

--TF3He6G31C2lTajl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXRqSYACgkQFA3kzBSg
KbbskA//TVvzvLrl1pHmMcLix1BubbInrYSShR40MED0gFDSt2RY1OmSXnbz59cG
MZTc3j3MK7buovgq5VLjrtmm2njCSmatwbXNv/3oIv0UbkOBByp15GgLH1R/t2GQ
lvJzdA3yw+nLH4qv0h5wGLHQzpCE2WrYPuDxRtCCrRE1yw1djwPSi4pVogdkDxvc
puj+o3XgwPyIRwXZ75W5tWqPXNkRr3/oM/dKDEys+eXs1mrSXPh66kI/MxgDswkT
39QkRjZNF733rkhBsd4BstQUMvxhpN4H9ubWDUJHECa/xsOdREHTD21L1NySatZc
wL47AaCsJ57iN7ZKrfIeUa8xFb08XivJARxUxY53nGQjJbNeP29QWVn8eqtaI6nH
nnnPWMh47RJwUi5RGU6hXgF/G0BjmtvRXfNZO9pXR1J5RzCRFNO+7hFhm5ocFVOi
5zw2CcJqt5LM2OQuHOwEeQP5l67nlheN79900CQEjOhKEOhsVH4asg48S2ShIZnk
5C2vtNEmfpuXN8NukLmLm4/VBnMAwVIVV8pplm4ggS1GjIkRT19mtpf+CkD7VM3M
4r7J3srjp6KQTQ/KK7BvqAt1fMN86TLhTxG+sdD3nw/P5svvhT4wptOtEDZkWorC
FqL9OaVzHmhFszDjryGuNeY2MknSCk/HhpJzLmORgvTAkYiAn80=
=wSAQ
-----END PGP SIGNATURE-----

--TF3He6G31C2lTajl--

