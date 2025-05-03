Return-Path: <linux-i2c+bounces-10755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CAAA8254
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 21:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C180317D757
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 19:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BFA27E7D5;
	Sat,  3 May 2025 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1lW5zvT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812319CC22;
	Sat,  3 May 2025 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746301112; cv=none; b=Bu1nSach7M7i7uRFGBqs1EQBDpoZp+XfkEBWh7Mrgkebg8DdjmVa0QkjBZvxg57Hl3TNgK3tP20BuHwkguKudODAcqRp/FxK1lqr0MKVH01j6i9rQLnf738xWJevplhoqDZdeumYAABskOfVIviDPYTrvmOAJpeiHBDBGtesTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746301112; c=relaxed/simple;
	bh=wFmHsvoTtpbRFd5tfMpmSxDV6/y1Pa+D6JEA4XNarKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6CLGb2SE28hb23OAEJd4l8h7gI649jMlB1rrJ31o5WOIaMV6q8aLjhV31KO3G12yfztSrEp/GwnEylMNyMIVSUNVyzZ16i5wi4HoFjwI8aYpsGKMtHPXiCZzSxeWQBOVqFeEcIEz+KAp/NcEYERHwVfcn8JX0MW+3PmLEYt5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1lW5zvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6856FC4CEE3;
	Sat,  3 May 2025 19:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746301111;
	bh=wFmHsvoTtpbRFd5tfMpmSxDV6/y1Pa+D6JEA4XNarKo=;
	h=Date:From:To:Cc:Subject:From;
	b=m1lW5zvT+eHAWt8WnnutFq8vq1ZHzucScmlZ3r39WIic7D8C9T7u5zsyYSIalcO6I
	 e/mOF6puvpg96C5hv32fGkNnaRfqJQRH5R2fTK5LT1nchVI6VAOdIhBYkOKFQq1WXN
	 VEDdMc4+15nv4ySZgY6DM6tzqgly5k3Qevhjo+Pv5H1r8EUMVtuu2p2FhffkL7k6ok
	 1pfP7qU1YgFBp8Dk+wplMvJspc501JzskMiq94wd3Pvck2sGfNyaxcovsKZk0NwT0+
	 7M0wZzu667IC15rJFW7pJbQu3elqKnX50WULTOhFJqHTld1X0g5mHetTqhn2URhsDn
	 719oNmgmAEOhQ==
Date: Sat, 3 May 2025 21:38:26 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.15-rc5
Message-ID: <aBZwsuhgpgETHQOO@shikoro>
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
	protocol="application/pgp-signature"; boundary="y+OzHAFoCTCV9zDJ"
Content-Disposition: inline


--y+OzHAFoCTCV9zDJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.15-rc5

for you to fetch changes up to 8e17493ea2d1c9f72e5e31160f75f8be56f79ffb:

  Merge tag 'i2c-host-fixes-6.15-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2025-05-02 16:31:35 +0200)

----------------------------------------------------------------
i2c-for-6.15-rc5

imx-lpi2c: fix clock error handling sequence in probe

----------------------------------------------------------------
Clark Wang (1):
      i2c: imx-lpi2c: Fix clock count when probe defers

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.15-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--y+OzHAFoCTCV9zDJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgWcLIACgkQFA3kzBSg
KbY8ug//f86WHXORR6xyD++G6COx+9rIFn8QwctgO/B0btSRbryBcQoqe2DtOaJl
7bWLsYH4IkmBwJ1XJnGMOVy36ESp8I1QoFo9H9izCP7KDFRYhp6XUYMZbQhVFlVe
HJ0Gg+rNytK911UDiMz12+drMO/JWX2+Sc9jTrKsnHMwp/76j00b2pT2L0hgq/at
HcWNmyyYpglevA16dRvncZLfjCxEZwwon8+Bxp3TxzGWQ2iUvByB1jcb/X/295rE
ekdrFeM+kkb1aU/xqYrftdAmSboNEBqosnm/fMOt53KoUncljVAA0jP65nsp44BT
7mftnPFkiaW4hY8s+z1EkXuCL75kvxMXz1dLqGC9z6BGuxlp6BqIGS2Sp63e1z2r
o9L868xOKm60OSG+tiAFppdsf8paBLyEBN7k3L7hwPG7eiHPTqGc/u907b/x2j+l
ikIOREgeswXU14K8VaYvIpZTi/4GHeyz1owfdy0koZZEPv/em6/NER0jTkPgq+tU
hsRL1aXODoO7Q91slxUmdAd+HRR2wkuMwliBotTTYOxUOdrroeX0zZfNbZVhN0Dk
fY7YlDmpVbgXR6i837lDDcpZx+e3nMLvtZWzCZQKB5jFZdCT2eBNx0huU2Zg5nMs
Sulq9Suo+vmJIJsQ+1IZvUstVpfduK/POncBv1yZmDV1YZEvvoE=
=1JUF
-----END PGP SIGNATURE-----

--y+OzHAFoCTCV9zDJ--

