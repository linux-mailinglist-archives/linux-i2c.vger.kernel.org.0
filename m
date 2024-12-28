Return-Path: <linux-i2c+bounces-8793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F07D9FDC55
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 22:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DAB1882F52
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 21:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8B71917E4;
	Sat, 28 Dec 2024 21:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ov7TIic6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2653C45009;
	Sat, 28 Dec 2024 21:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735422661; cv=none; b=DL1hW59cnEkN0qBd49WleLEQQQpYi5gNFHakwxR+3wWHOoUNoV/1s89nlXQOLuTlCALnbKoDDIc+/7eEMNWCgDKmrq9ywgiU7Py6NZB8jIGGTFRxhOSqGf9L1dqizgmiGii7+QJ7ev5UOeWzgREHJUIq4OBxm+tUDV+F+3dtPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735422661; c=relaxed/simple;
	bh=izvaR50vbFkqLYbm8Y2Li10f44wd+l6UapmM8wF39r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCSwZEIiEub2MkqmGnYHShffVfTwd2zc3XJtlDUg1dokERRms2uR4dEj0Ew4g/BK1yn1SidSVmWPA9aubGJjna4CsK4AkVGr/+2aA7ZAepQMFNmCD30q0faRR+Zc0QJ8maR63UEwud9iOCnuEkxzu7UkIxitg+GfrPola8cPyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ov7TIic6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0622FC4CECD;
	Sat, 28 Dec 2024 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735422659;
	bh=izvaR50vbFkqLYbm8Y2Li10f44wd+l6UapmM8wF39r0=;
	h=Date:From:To:Cc:Subject:From;
	b=ov7TIic6AiCD0LRtc7dxozmSWv+O/z1GSFRWBYqt+URL94gLxMRBjLIfh5nbg/u77
	 tGv1hY0P1DPYqBcX1FXzqgWjTEDN+/bA1tb7OTjR1HB9oNlxN7hnRTxNLR4kCMBbZr
	 m/66avGEOKC4SGEobUcrKN9KnflYey5Dx9aZ3w1w8bsnZdnE7eou/Gz8uMvuwRUIFo
	 oaPdHwHZ/y8MQB4e4erbM2OS/LfTcEINlH88NtPuN6t1xH2fcv+kmopxCMv0kbxFQ+
	 XKPFTLv3vHKBpBlms6/LCW6phW0CAEb+D87+CFk51PRTd6V0DfEY8K4YHspUtl12Q2
	 QsEVbMe1s4urA==
Date: Sat, 28 Dec 2024 22:50:55 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-rc5
Message-ID: <Z3Byv8tvueVAsv08@shikoro>
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
	protocol="application/pgp-signature"; boundary="wmUxOIRU6WHKc07G"
Content-Disposition: inline


--wmUxOIRU6WHKc07G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-rc5

for you to fetch changes up to f802f11b2336b0f5c522c6ba827a013bb0b83826:

  Merge tag 'i2c-host-fixes-6.13-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-12-28 00:25:04 +0100)

----------------------------------------------------------------
i2c-for-6.13-rc5

i2c-host-fixes (Andi)

- IMX: fixed stop condition in single master mode and added
  compatible string for errata adherence.
- Microchip: Added support for proper repeated sends and fixed
  unnecessary NAKs on empty messages, which caused false bus
  detection.

----------------------------------------------------------------
Carlos Song (1):
      i2c: imx: add imx7d compatible string for applying erratum ERR007805

Conor Dooley (2):
      i2c: microchip-core: actually use repeated sends
      i2c: microchip-core: fix "ghost" detections

Stefan Eichenberger (1):
      i2c: imx: fix missing stop condition in single-master mode

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.13-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: microchip-core: fix "ghost" detections
      (Rev.) i2c: microchip-core: actually use repeated sends

Francesco Dolcini (1):
      (Rev.) i2c: imx: fix missing stop condition in single-master mode

Frank Li (2):
      (Rev.) i2c: imx: add imx7d compatible string for applying erratum ERR007805
      (Rev.) i2c: imx: fix missing stop condition in single-master mode

 drivers/i2c/busses/i2c-imx.c               |   9 +--
 drivers/i2c/busses/i2c-microchip-corei2c.c | 122 ++++++++++++++++++++++-------
 2 files changed, 98 insertions(+), 33 deletions(-)

--wmUxOIRU6WHKc07G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdwcr8ACgkQFA3kzBSg
KbbjyhAAtGgkHscwt+ZxnhYPJaHwSe6cxF3qiThye/p+qeOJ4CyJRjHbBShE8N3J
pPgglsFwjKSBiBNk/SrlGV9xSCs5Xi0QCww2o2rq4vg8IiqVg+S8rs9tFBFl8W8O
k+lpN68o9IKgn6dLzHMHojKwz8f8xVvqQ9/Z5LciQSFWbRHwdeBSbzTYpPWOrh/o
V+8gorJNSvK+FuKsPxCIJ/gtt4Cqo18nVRnruwNpsQAxgz/uY/l99L3A1bNFCxfK
XVURI0NtZYvOW3MxxvtDwjLcurGfU4I0mB+MVWlCUSGnklv7Pa0Uvoupo/Dhgr7y
vnjnyqTotGdkFvaIvHkQA9lsuADp1KFzzsxlsfXXp5nmPojSuj9XXEEk4OrQn42i
grtx/tlpWHQsaD7cFlyU0NMFZYhtE+h9oRQK6wi5JI2th0V662W4zTp2FRFWfcWq
KTD9Y6RofpDMLoY2SJIcbDDKImNt2Bp8AzJech99nvAe/QITj1AS891kHSLodeex
HmBSVLteCp/Mr1DUgS5X2KhjTpMy6KWyxngsHDuJu1UDz7pz9QlP5Vl7d5aOKCVz
jBMAxFEIyHmuKZ1eRzLBZBeE7E7PUE501IdVYF0KciOtlquoyx36g5eijtrZMtHl
AOYf8rKDmxr3XCJJ+Y4zr3T081Pc0/feRtMsWKMJjqmhXzis33M=
=gVWn
-----END PGP SIGNATURE-----

--wmUxOIRU6WHKc07G--

