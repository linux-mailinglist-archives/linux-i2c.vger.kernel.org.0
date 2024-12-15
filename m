Return-Path: <linux-i2c+bounces-8508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64879F22AE
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 09:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148B3165F65
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2024 08:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED491411C8;
	Sun, 15 Dec 2024 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpTsAyG5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC313E03A;
	Sun, 15 Dec 2024 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734252759; cv=none; b=d8nglCXYVRp1Vbhb6N7QdAMo13otE5+jfi4WSGXicBt98SIgw2vlrZRVRY24g8yhy1Ni/ERtEuR9sO7wSlbQLYSc+Z39fvQHr4wPktdoDoTbsbArQN6B46EKzMlmfv3pDAZk1evYUeytDoktRRp/DlmkLTt0FG9oXbx7FvBXdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734252759; c=relaxed/simple;
	bh=GXMfR71BINMxRUbasKTEHeoIwyH3/80RaqRMxfN21XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPnGV0ANc11ophQS0Cmt6FW56k5k/zPWvo6MRoXGp2/sTp1Vv/XsXz5goAIP/s+68ShPcoGm7Si0NLBcaZyWKHpPeWuyV2UiLJULiw//i89uEltIQfkZ5Raqh+t6XvQ2NTYCj1Ed+9xQBi+eNWS9FORj5pM+e9w7L1LAgWUJEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpTsAyG5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57647C4CEDD;
	Sun, 15 Dec 2024 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734252758;
	bh=GXMfR71BINMxRUbasKTEHeoIwyH3/80RaqRMxfN21XQ=;
	h=Date:From:To:Cc:Subject:From;
	b=rpTsAyG5qMVy+GSQXMX/235R1sOD7Aj6uQ8vU2JeS3hP3dvFN1NWF5Vs3dbbNPFJX
	 TWkunKuP5gzrru1E++i3VxBDSE9ClZ1pycCq3ulLus5AIiZwLJoI5Uq2wygJ7YoRG4
	 S0iTKp5KztA03acDHiQO7U4drlGZ1aX/b919Zoqru+Y8fMGQhLQzpwolC/vXdBfvcP
	 zAKFVy2T7BI9K5CQRuny0zGscISrZf3EyxFo9gpcQW+9o9ClG2sEdk9FQSzwWPZRsz
	 TmYCm/lYLKk2X2irtb//IiOHLfupfuMoFYqLb2MFw+HS2Upc9t6UvGpHcttr2LIkqs
	 3DIfVeanlccWQ==
Date: Sun, 15 Dec 2024 09:52:35 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.13-rc3
Message-ID: <Z16Y0y5inb4t5jJm@shikoro>
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
	protocol="application/pgp-signature"; boundary="p18DCJlXseYbsS4D"
Content-Disposition: inline


--p18DCJlXseYbsS4D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.13-rc3

for you to fetch changes up to 5b6b08af1fb09ec1ffab9564994cc152e4930431:

  Merge tag 'i2c-host-fixes-6.13-rc3' of git://git.kernel.org/pub/scm/linux=
/kernel/git/andi.shyti/linux into i2c/for-current (2024-12-14 10:01:46 +010=
0)

----------------------------------------------------------------
i2c-for-6.13-rc3

We have these fixes for hosts: PNX used the wrong unit for timeouts,
Nomadik was missing a sentinel, and RIIC was missing rounding up.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      i2c: nomadik: Add missing sentinel to match table
      i2c: riic: Always round-up when calculating bus period

Vladimir Riabchun (1):
      i2c: pnx: Fix timeout in wait functions

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.13-rc3' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Th=C3=A9o Lebrun (1):
      (Rev.) i2c: nomadik: Add missing sentinel to match table

 drivers/i2c/busses/i2c-nomadik.c | 1 +
 drivers/i2c/busses/i2c-pnx.c     | 4 ++--
 drivers/i2c/busses/i2c-riic.c    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

--p18DCJlXseYbsS4D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdemNMACgkQFA3kzBSg
Kbb2Mg//RVKPdzx9XougSYhcZCyDJv4p7lMU0NMeEkbtx8N8okUeTjBNNGFs743I
fI0+0m3l5C3MwiF8Q3YXT7N6tgz33hmYtrcyScslwNK0+dx2+C0hDBfFhL3t9z1O
IVHGbalxA5YaSb5J2UmkM70yrLKFHmpmCx87QT0YTf4z3MwHf9MCWhps6DgNjIk3
mr8GIxL+BjJC9ZT7sEsUWZCoW/AdMP7/XfJ8nksi2sErJabVjHkMZHRPm0bcxFtw
dY06M2mZyejD649CleUHyd+vpfavlO7FPDLWaCBXU4AFkLmu1HTT7sFA8U3r6GML
P/EnSrTemT5oTrmEnOMe4M9qL4BQCOSDuwENABfG1Z4AuMsiVPYKt8Xe31ucjUiC
0h+2ezYcGLDfNk0/R4MWtTNn4pmyHsqGDUVePXY73Kp33i8vyC0Zzuev/T4QkDuc
fVQA2iQw7S+H/1NX0uVUbBQrv269I4I273y6MBUr00vnrTzSXQ+0448I1zFRncqy
8Zk0UlizU7lBB0Ft7ha1VDLnetVTpM6yK+nAOesH5xPtvaCS98MwVlG8F4aRpRfe
sNuynNUB/L2yT6VtFTUTiplHk7817udjwjYOUIm0O0AXGDSQM/RqmZZljY2h8/Ws
DEBKr+9kwJ6UI1u9MvYO+Koz554Gj4VT6mx73l8Fa6EiWY5P+lk=
=nrrT
-----END PGP SIGNATURE-----

--p18DCJlXseYbsS4D--

