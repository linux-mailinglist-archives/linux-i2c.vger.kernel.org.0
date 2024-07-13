Return-Path: <linux-i2c+bounces-4978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD89307D5
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jul 2024 00:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 045331F218F0
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 22:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E8114A0A8;
	Sat, 13 Jul 2024 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSAiwTqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91A200A0;
	Sat, 13 Jul 2024 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720910594; cv=none; b=tUs+9oWWwmgsIDLy/xJ2QVk4ioAn3kzChJkCYZbSgN57YAdbe8W2EARoxfKaCrvXRE5Fvkm8WQ9vafPrnbWi+F9iprybdekhQhdwJOnCLC257WEACW0ojuteTazFXw/LwHFTekt/yUQSDieaQBemC9DsiY4acn6Nn1K7f839yNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720910594; c=relaxed/simple;
	bh=hETYkNnlXHQGebeKJD5NwFmWpobQ/5QwmRql7Jb8RvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rLZgD+br2rq2nIhc9H2fJUV3Dgv7j9n6OgddKELvX9oCxy0P9L/8nmLL3PYl8/LSSqURecp0ePIRiS9EvLBrX1tgt8KEdeLC9CTGWlZP2xCGTJzuZGfY37Gzcj2JG0QzS9LSjsIBTUQvzalsp4v5iRYqKRk9wRX1TZha3W0k3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSAiwTqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29118C4AF0B;
	Sat, 13 Jul 2024 22:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720910593;
	bh=hETYkNnlXHQGebeKJD5NwFmWpobQ/5QwmRql7Jb8RvM=;
	h=Date:From:To:Cc:Subject:From;
	b=aSAiwTqaqkiNLdDSGkqfPw5DOha/6oeu28Hpv1vS6TQWza2jKnabUBMOjzbN0rQwu
	 ByfGqj61AFA7yuQ4Ymu3aILBWG1y0WicftBuBd+auK/YzoOEN9Zx3Oxn6z0hhY8Sye
	 yUwwj+g3wg4MSsIN4rCIri4vJTVqG1XESVlxI5ugGArGIAz1b9t1DVnqsjUk3vkmoS
	 QQsYrZA3qUXPHRnnGhqpinqQSc4XdR5RWLmwt5Q+V20D729sBQ2mi6T/LdQFWg7PO0
	 knZLS9YKaQDgj7kdN+r2fgcZYooDhrU0hcX21aHR1SFe4oJ31RMz6+VfNHEzJprZuD
	 Mw+cseU0aDuwg==
Date: Sun, 14 Jul 2024 00:43:10 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc8
Message-ID: <ZpMC_ugpHtY3GrmA@shikoro>
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
	protocol="application/pgp-signature"; boundary="zJEu+bkQi7iU23s1"
Content-Disposition: inline


--zJEu+bkQi7iU23s1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc8

for you to fetch changes up to 3fdd2d21f1c7f0203575b46d2b3fba81292992b6:

  Merge tag 'i2c-host-fixes-6.10-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-07-13 10:50:55 +0200)

----------------------------------------------------------------
Fixes for the I2C testunit, the Renesas R-Car driver and some
MAINTAINERS corrections.

----------------------------------------------------------------
Wolfram Sang (9):
      i2c: rcar: bring hardware to known state when probing
      i2c: rcar: clear NO_RXDMA flag after resetting
      MAINTAINERS: delete entries for Thor Thayer
      MAINTAINERS: VIRTIO I2C loses a maintainer, gains a reviewer
      i2c: testunit: correct Kconfig description
      i2c: mark HostNotify target address as used
      i2c: rcar: ensure Gen3+ reset does not disturb local targets
      i2c: testunit: avoid re-issued work after read message
      Merge tag 'i2c-host-fixes-6.10-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (1):
      (Rev.) i2c: testunit: avoid re-issued work after read message

 MAINTAINERS                      | 23 +----------------------
 drivers/i2c/Kconfig              |  2 +-
 drivers/i2c/busses/i2c-rcar.c    | 27 +++++++++++++++++++++------
 drivers/i2c/i2c-core-base.c      |  1 +
 drivers/i2c/i2c-slave-testunit.c |  7 +++++++
 5 files changed, 31 insertions(+), 29 deletions(-)

--zJEu+bkQi7iU23s1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaTAv4ACgkQFA3kzBSg
Kbah8xAAmZtWH8xe4kx0P3VSP/5kv6RrGXWFL43FJRWV/f886VhnOHqmeAwffBsQ
TVcegfMk6LP6X3lKv2DhNaowVA0xyeIrVfYbqEgrjUGaRJvjokDLXSBpiB6+tbMJ
1izhs4quXSD0GgnMDD7ito2UZKSMzU4/YNDFVCUIx/bvf+C6u3kJSfrBJz2AvUNR
t7gm7k6Il7Fm+s12Hlrg7oNASI1jtIyaH1ughg+a7sgwfyzxCsQXFgH4EQCO0HPW
C1q1P/bDmMko75Ig4yQuVfJJkizDXb/QcPHAjclaLP48TnHaPdi8eTkBPdJWm+jC
1Cy1CxZRbqqaO0G6ahmkdghRLgdV6EcNJvyGoX1skjE+YddMrpTXkKTxTPJOQM1x
91YF6jr9gfq8+g76mWM+Yht/vd9Jjajf0f5ZvWvJgdXuP7FyWDg0jAp6Nqbt9Fjd
EdX8hLkx/E6g8NbXioSmdQ7TgJRE2vxo/74eExNp09ThHwFsWm9w/gjoruExPRGx
MeE93AyTwAM5Bg9oA7EDVrXEdGmKIX/hVbHHKQf9QC62aJzCKjwNO1zsDxaN+YGc
FLzuMhyl3YSK4LJpeX7xjavfIwnOs/vU2yI7IYxwe5EP+5YLzWOz6mv70O4Rj4wJ
zsyjVtWmrEJpCsWPu58nhGf4UAZ4a0YJMwPia1JZ5enz8t8/CPw=
=wLHB
-----END PGP SIGNATURE-----

--zJEu+bkQi7iU23s1--

