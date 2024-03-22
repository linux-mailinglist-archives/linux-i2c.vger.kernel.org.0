Return-Path: <linux-i2c+bounces-2485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D788675B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 08:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C59286A10
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 07:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CD311193;
	Fri, 22 Mar 2024 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXEz6kwS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DD8F7D;
	Fri, 22 Mar 2024 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711091710; cv=none; b=iVzM7XomM2GTUP4f/VnFybPdK562OcMvgxz+SuYvcXDIqj14cfY58vbh+qJG7vPuvwL4Lgm9tvhQduPoejPI3a7/zpr28hcNVOIR+bC24Ccv4kVujjjTX60XkHIFNzCiRhefPH/JmUZjck/FwAwV0Bfca1TZc0+66oNZYUy2mXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711091710; c=relaxed/simple;
	bh=Klxk6rNOBn5Q806diilCssq3tOM7VVxS7fAG43QvoFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekF/LZUOLxMjYY/6jtdifJJmul3KCqWBysK5Dq2sAVgvXmLSSCj/2Ck45HZTNM9in3UXVRaLV0oCU3TVGqt40GTdzEQ6V3klwyM2lL5q+MLeI+Yc0Le2r1CxNAkmpN1gfKl8lmAnJZ4Zvg762cmZGNOTJs8bClgA4Q/EZSn6wbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXEz6kwS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DBCC433C7;
	Fri, 22 Mar 2024 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711091710;
	bh=Klxk6rNOBn5Q806diilCssq3tOM7VVxS7fAG43QvoFE=;
	h=Date:From:To:Cc:Subject:From;
	b=YXEz6kwSndTM1dTz81W+N2DVPH7ldsdW1HHytCthMbxYvQL3XtItk0OLTQgJ2eYLz
	 F8pNzfc0Q5KMMR4ZbkJraQgklHgZVKicxGYZ+zPZjchrkcyDwMo5a7odSFr6DDE7eR
	 jjiqbuPwGKU7g7uVEls1ODKi/7XUVzy2Gv++IuvE3Aka6ACYtIiHAejOc8SvREVpNG
	 MysUDRMdL0fjHy0dCD+UmcMjUDw799zoqtLHwV4MUZHaWinFdmpv+pSriBzZ1MGhsh
	 IFhZjcAj85fqTDi226nzeUQDYuhdHd6TGLiu/PJY4GahZa4y1P2W1R6Br+LEO/B+84
	 PWqekeDqBV78g==
Date: Fri, 22 Mar 2024 08:15:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.9-rc1-part2
Message-ID: <Zf0v-8vtOcMdy9Hp@shikoro>
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
	protocol="application/pgp-signature"; boundary="Hb1JKRYRu+V3TCj4"
Content-Disposition: inline


--Hb1JKRYRu+V3TCj4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit a4145ce1e7bc247fd6f2846e8699473448717b37:

  Merge tag 'bcachefs-2024-03-19' of https://evilpiepirate.org/git/bcachefs=
 (2024-03-19 17:27:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.9-rc1-part2

for you to fetch changes up to e593a4a2d3ad5e1a4be338b38ed6ba7c70642d88:

  dt-bindings: i2c: qcom,i2c-cci: Fix OV7251 'data-lanes' entries (2024-03-=
20 10:28:56 +0100)

----------------------------------------------------------------
Some more I2C updates after the dependencies have been merged now.
Plus a DT binding fix.

----------------------------------------------------------------
Chris Packham (1):
      i2c: muxes: pca954x: Allow sharing reset GPIO

Rob Herring (1):
      dt-bindings: i2c: qcom,i2c-cci: Fix OV7251 'data-lanes' entries

Th=C3=A9o Lebrun (9):
      dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
      i2c: nomadik: rename private struct pointers from dev to priv
      i2c: nomadik: simplify IRQ masking logic
      i2c: nomadik: use bitops helpers
      i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
      i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
      i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
      i2c: nomadik: support Mobileye EyeQ5 I2C controller
      i2c: nomadik: sort includes

Wolfram Sang (1):
      Merge tag 'i2c-host-6.9-part2' of git://git.kernel.org/pub/scm/linux/=
kernel/git/andi.shyti/linux into i2c/for-mergewindow


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (8):
      (Rev.) i2c: nomadik: sort includes
      (Rev.) i2c: nomadik: support Mobileye EyeQ5 I2C controller
      (Rev.) i2c: nomadik: fetch i2c-transfer-timeout-us property from devi=
cetree
      (Rev.) i2c: nomadik: replace jiffies by ktime for FIFO flushing timeo=
ut
      (Rev.) i2c: nomadik: support short xfer timeouts using waitqueue & hr=
timer
      (Rev.) i2c: nomadik: use bitops helpers
      (Rev.) i2c: nomadik: simplify IRQ masking logic
      (Rev.) i2c: nomadik: rename private struct pointers from dev to priv

Krzysztof Kozlowski (2):
      (Rev.) dt-bindings: i2c: qcom,i2c-cci: Fix OV7251 'data-lanes' entries
      (Rev.) i2c: muxes: pca954x: Allow sharing reset GPIO

Linus Walleij (8):
      (Rev.) i2c: nomadik: sort includes
      (Rev.) i2c: nomadik: support Mobileye EyeQ5 I2C controller
      (Rev.) i2c: nomadik: fetch i2c-transfer-timeout-us property from devi=
cetree
      (Rev.) i2c: nomadik: replace jiffies by ktime for FIFO flushing timeo=
ut
      (Rev.) i2c: nomadik: support short xfer timeouts using waitqueue & hr=
timer
      (Rev.) i2c: nomadik: use bitops helpers
      (Rev.) i2c: nomadik: simplify IRQ masking logic
      (Rev.) i2c: nomadik: rename private struct pointers from dev to priv

Rob Herring (1):
      (Rev.) dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and=
 example

Wolfram Sang (3):
      (Rev.) i2c: nomadik: fetch i2c-transfer-timeout-us property from devi=
cetree
      (Rev.) i2c: nomadik: replace jiffies by ktime for FIFO flushing timeo=
ut
      (Rev.) i2c: nomadik: support short xfer timeouts using waitqueue & hr=
timer

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +-
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  49 +-
 drivers/i2c/busses/i2c-nomadik.c                   | 740 ++++++++++++-----=
----
 drivers/i2c/muxes/i2c-mux-pca954x.c                |  46 +-
 4 files changed, 514 insertions(+), 323 deletions(-)

--Hb1JKRYRu+V3TCj4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX9L/sACgkQFA3kzBSg
KbYdaBAAipYlvuC5oSOv1tex+k+QL6YmmDHB/oz5xU67ZmT1FW+BcqzGEaMZqNdD
ETpGTuZ6Dcxq19Sd0HKMYR7otrM4fSQmztnaN5yKCGBqsHEJJzzKJJN3V0sKd/ip
lgx+qVGN6bEkRdrEqme7QN69EoijFgXvoZalQO85uofipGshzkwvn6LbBcboAynI
6Cj/0Pvmnyhnn3lnLdA9IvcJnF8A7boNMGhEGYNYGG+FlvDpgfnCIt2mirWzLQUN
Gu+Yirs2FDElIlgftVD390rwiw7oC2az/cjVEu9lwA9kcSY6jQDe50lqo39oWgx2
+4mQyTY+Cu0q7CKWES7LQ46zvFNwLXTd7dbdomX4TMKRgUp+uhK5Znn3jHy4xoxC
eQnxGTGg0N07mZhmkCKYRCfoUn14+DAdo+sZU2p2JKyYYmdk6FMnFCnvLiNuGRwS
n9s/7nQVG4UFPl2SfgOkE7i+USVvCRK0bdc8if2lFeT7eyY5dhI0HyGFEkFOtZiD
FNc/X+N2unXvX2IjxEg+FFSDQXb12GKGjQckWkK616cNMdX/tTet1rqL4U33Stj0
wVEF9SjzMV5ENNMatIK8QW33UQ7tFbIsNN3KJfCZKf3Mqe05Tcr50z9147uwL98a
vRJiI8tXsaHEyRAymcyg7yPVaLO0La+vVV2Z/yhFSH6Dx0hT1YI=
=wP3a
-----END PGP SIGNATURE-----

--Hb1JKRYRu+V3TCj4--

