Return-Path: <linux-i2c+bounces-9838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E24A635B8
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 13:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D193A5B20
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784331A5BBE;
	Sun, 16 Mar 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKwbp6ot"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD71A3166;
	Sun, 16 Mar 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742129892; cv=none; b=mcSh1ZAW1wIGkU8o4F6G4qORJOzOhM6oUQzFJcATHx03jJNvd19KnPs2Vtu45/UrcjmlCypqaskMG/kEQDZWTK0pl3rr0fk8BAphBBgl29Vx+2jG15EPqMaURE5+kHkfTBrJMJuS17VMRHY/A5F9hnwu2KZwRvB1PJbwCU5tm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742129892; c=relaxed/simple;
	bh=slk6SNqASVJFkyV2UtBmNroGAFov8Es/i9bevw4AiDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBBGCvg9nMsmuy9qpxw5ne7cq4DqZU4IxjDyHtsNgvhB7OUI3Phq7aRiT5l4WY+ktYxIm7gvLn4OerfyJRo2LjvgWvFnYlIozZMDEaf5S4GPS6Kjioykr9iAOp6hgu8BYrK0KlTTMb/AKxGMj+d/i9Z2MJ5HiqdxVAIF4CB+pEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKwbp6ot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AD3C4CEDD;
	Sun, 16 Mar 2025 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742129891;
	bh=slk6SNqASVJFkyV2UtBmNroGAFov8Es/i9bevw4AiDc=;
	h=Date:From:To:Cc:Subject:From;
	b=SKwbp6otHWJXwLvTYdi6xlLVOBGc1b9AXMe23XNK+I5xUrZeKUtzdN75AU8E2L/Wt
	 qybR82GfXByS5Uu0siS8LXqFkncWedOmFrcQYGus5eccfrOOixZaWAFpu65UZB5aWC
	 OJqf4sXA73PlN5GkyctVYt7YsrIzsaQ/tBbbmMv7PsfXiAuJAFpOjpIpQwxrqbGKlM
	 O2pSGb/vvmMAMAaHa4xqZCqD09Eq4L6UVi2HBWnLbL7WBG+4g6JkdhJKQlEpJD3pZY
	 YM+vaC0Q0VYANy5HvmPW1ds7mAoF6xEg3ZN6/A42+OI6wbo1Tw5gKJ7+ZwmXtCqrrM
	 S14+qTtrHRaxg==
Date: Sun, 16 Mar 2025 13:58:08 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.14-rc7
Message-ID: <Z9bK4PAANPoIcMbm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+nvCH/Ykt2cjQhF"
Content-Disposition: inline


--C+nvCH/Ykt2cjQhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc7

for you to fetch changes up to 3ef18b236690af5f6427c5b6d8636881116aa73a:

  Merge tag 'i2c-host-fixes-6.14-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-03-15 09:28:41 +0100)

----------------------------------------------------------------
i2c-for-6.14-rc7

Driver fixes:

- omap: fixed irq ACKS to avoid irq storming and system hang
- ali1535, ali15x3, sis630: fixed error path at probe exit

----------------------------------------------------------------
Andreas Kemnade (1):
      i2c: omap: fix IRQ storms

Christophe JAILLET (3):
      i2c: ali1535: Fix an error handling path in ali1535_probe()
      i2c: ali15x3: Fix an error handling path in ali15x3_probe()
      i2c: sis630: Fix an error handling path in sis630_probe()

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.14-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Aniket Limaye (1):
      (Rev.) i2c: omap: fix IRQ storms

Nishanth Menon (1):
      (Test) i2c: omap: fix IRQ storms

 drivers/i2c/busses/i2c-ali1535.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-ali15x3.c | 12 +++++++++++-
 drivers/i2c/busses/i2c-omap.c    | 26 +++++++-------------------
 drivers/i2c/busses/i2c-sis630.c  | 12 +++++++++++-
 4 files changed, 40 insertions(+), 22 deletions(-)

--C+nvCH/Ykt2cjQhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWyuAACgkQFA3kzBSg
KbbSMxAAkBh0czo3ZaAAAlyEkJVYxRekEh+/5Df+1vB8Sj2WA536jmnLow5PjfVp
qdol99ofMp+ubnEMAy0H8nVgWZBP7TUPyAizObSixQYAXnAXXvN5jA+51K5egzKb
Se+Y/rrHei1KHaUeg3kvkSaFBdxN07ycHPSiBMbmaffNLQQYTH+A4YsWMcpESZl0
YnGPcI33RtZP1Kg/OtNSFD/qOoxo14ByA1KRiAj5Giiu9HghbgDIHNvHquX6mX3j
eConWL+e87BPb7MXt0g1zV351ahBbCU6byCtwBL4SW580cwmXqeip6wkznDBCZwq
LMd5bYbg45V0hBs6A0IPpL8pbFo6GPjh/eSzZhknm3P+9tHwmhpxmisoKA0WDeQp
PEcmzn6IqHK5kLw+QF8J0KrYPQAzn7NQTuXgDw2H/kOKG44mmTobO0wba4RijqLr
R0njOOAj36CvesDx1MnO6mlOrAKINcgoo6ItRl64wQFLSXx0u6IeWsBxQpLCqMab
6b0UbvEiReeQVEHv2vNzaqwPij1LHs3gcbyeagxijlNszG/SYfNp7w0JJ5JM645g
eX1iOEv/n0FfPNSpk3IZBZn17EtgX9CKViRQzjPr9CMomeQsGjuARLGDQS1fKHua
bkc9pozi4jZ7XrZkELJSV9RenwsFzMyZl+2qoCGuh9Upecxurrk=
=PTAb
-----END PGP SIGNATURE-----

--C+nvCH/Ykt2cjQhF--

