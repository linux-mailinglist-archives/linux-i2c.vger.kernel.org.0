Return-Path: <linux-i2c+bounces-961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549DF81C8A5
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12212288B5B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA26F171B6;
	Fri, 22 Dec 2023 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXMwN4t4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1A168BE;
	Fri, 22 Dec 2023 10:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33D3C433C8;
	Fri, 22 Dec 2023 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703242790;
	bh=jRrcN8BEhS4Elwu3Zef7+SN1MWujMXAU+sDNch4RE4A=;
	h=Date:From:To:Cc:Subject:From;
	b=RXMwN4t4cdOeP0eYU73mmBpOHlMOjj2G+nwBoG4dARUJF6xYgvso83Au0K1WOJY52
	 rTZw6XyyVJjEZYv+w4CrWjGwHd3UpuRqX2DkRHDyIxtcuM0Bo+vhktsILxnfEZyLri
	 LEtOZsrRI/lQmdyE4BVD2N968i2A1x+BXt2fgvlHe5VcDhbfVrULikLk3fpDCrAgMV
	 +zqYKLAwp50zkMPacZQ5ouIbxPcJumgVKe+H7gBu09Ap0VdbvBoC1Slf2uH9aCjv19
	 cxpe04fMyAZ6hDbGXR+G2Vv+8686wR+z/YBscqOrd3KmNe/uBym5EKfvBsyKs/E9Ly
	 J7D/Tnjc8yIzg==
Date: Fri, 22 Dec 2023 11:59:47 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.7-rc8
Message-ID: <ZYVsIwvSLqnn/BRW@shikoro>
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
	protocol="application/pgp-signature"; boundary="s6B9bvFWfMNqtsIZ"
Content-Disposition: inline


--s6B9bvFWfMNqtsIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ceb6a6f023fd3e8b07761ed900352ef574010bcb:

  Linux 6.7-rc6 (2023-12-17 15:19:28 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc8

for you to fetch changes up to b4cc1cbba5195a4dd497cf2f8f09e7807977d543:

  i2c: aspeed: Handle the coalesced stop conditions with the start conditions. (2023-12-19 21:54:57 +0100)

----------------------------------------------------------------
i2c-qcom-geni gets error path fixes, i2c-rk3x fixes polling mode,
i2c-aspeed gets state machine fixes in target mode

----------------------------------------------------------------
Jensen Huang (1):
      i2c: rk3x: fix potential spinlock recursion on poll

Quan Nguyen (1):
      i2c: aspeed: Handle the coalesced stop conditions with the start conditions.

Yang Yingliang (1):
      i2c: qcom-geni: fix missing clk_disable_unprepare() and geni_se_resources_off()


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (3):
      (Rev.) i2c: aspeed: Handle the coalesced stop conditions with the start conditions.
      (Rev.) i2c: rk3x: fix potential spinlock recursion on poll
      (Rev.) i2c: qcom-geni: fix missing clk_disable_unprepare() and geni_se_resources_off()

Andrew Jeffery (1):
      (Rev.) i2c: aspeed: Handle the coalesced stop conditions with the start conditions.

Heiko Stuebner (1):
      (Rev.) i2c: rk3x: fix potential spinlock recursion on poll

 drivers/i2c/busses/i2c-aspeed.c    | 48 +++++++++++++++++++++++++-------------
 drivers/i2c/busses/i2c-qcom-geni.c |  8 ++++++-
 drivers/i2c/busses/i2c-rk3x.c      | 13 +++++++++--
 3 files changed, 50 insertions(+), 19 deletions(-)

--s6B9bvFWfMNqtsIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFbCMACgkQFA3kzBSg
KbYw0hAAnZ/wWeSd277cQUeKt+jRIgxQQ1QBR/sVbfXXleklj9xRHsn5ITv5M28k
/t44IU5j10/13/gPG5JwdOljFSTJH+EHLzq0gcXSMveOy6O7pD0pD/FkTcwD5oBQ
Tvyw5Nsfo8ltGmjne4RcLgOa7+ZbIhUYalykliLqRkfEqE8OWFQcw7XQ1GiU7LsP
xhS6V6h+SsvdK/JKxtSWIaoliTM72Djz2FsA/mngmzLC1Ajggf8eu0O6WHeH/ZfG
LbRYeo4x8XE+mNDEWxBdOl7r1YWOw0GmWsv1EUTuS7FSLWiD/VsNEblxdtfcFAKE
sXR2Zq213K3b4Nbsmx8lQUYmUCuIkSCH9KK7KWcKX9fKN6XYM/Tf/fkU+3qQxoqw
n1jbcFCp5+srv4arD9IiXoaGgVG9wq5905LV0mP071+wNWZKaPrC4J+K4K+nWfCl
HxcaXGijwDvdh/s5BlNWuMzQTLiJItDa7Msjn2efp4rRF5/ZmNay9Iv0QUWGASRQ
v0ZDSqZlvE9PaEyJX95IakmdZf4fir5ISzOFMLF17ybuEm1WywDxMobvO1BSnqZw
+qz1auB8U9nDYLtz1Wy6RBQ1MeDJryBW8cbunFExMg52brHbTWnrGC+vgLlaLWN9
8f30gonLqIacjG6YkcJd0Aeyom4uHeVxb0uquNHLWkNPJhuS7S4=
=IFkK
-----END PGP SIGNATURE-----

--s6B9bvFWfMNqtsIZ--

