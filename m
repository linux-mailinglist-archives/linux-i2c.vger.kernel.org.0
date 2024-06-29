Return-Path: <linux-i2c+bounces-4503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A674D91CD44
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 15:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC7291C21596
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 13:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B88A80BF7;
	Sat, 29 Jun 2024 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqSLbEwA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8980BEE;
	Sat, 29 Jun 2024 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719668260; cv=none; b=evA9Z+CrZYRthhFJKTPt1LekJsELtPAxryD3HbtC55FEPqEFdy/wLjN3u/3Ow1jI32Sby5mRWZns5yHGHnT+p8w3H5vjfdQvvQTAeV7QTqPde9dVr0NL6ClaFWvjF0rnu7V+Ji8Hm3xHXPX2hLNqGQPXeFRHWMiiMOJYyvarZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719668260; c=relaxed/simple;
	bh=dqQDZvowwBChjuJGhkhif3m/CmZP0CoBJ1KWcJsYoWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsS9R8x1pRzh41aXAjNHmRCSzuEpUKkV8EBLiM2Rg74Vl9OSYlewbxdRuPSdx2x9GzK/JDrPqvXibcvMQ6/Oq/IU2j9Keb3You6IHi+lKe0iHPuDdeiwuEt0rGt8yHVrCfcDl180zE20U+uVrxnki71HcarzwfE77XUHKDrh2q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqSLbEwA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A68DC2BBFC;
	Sat, 29 Jun 2024 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719668259;
	bh=dqQDZvowwBChjuJGhkhif3m/CmZP0CoBJ1KWcJsYoWY=;
	h=Date:From:To:Cc:Subject:From;
	b=aqSLbEwAi+lF14D7sPC/B15D6Z7lGoZUVvGZxn9YX8o/H43KfUh56m2wPPo7smbys
	 n8lndxZFWMcpd7ZVe7sb1y3CfkTMsvfTemFPPyvpJreXjP+RI0nAX2+qCUclsEGetT
	 1/P/RrpSIdb9lAKTuTvnjrexKJPCvCT55N3QZiR07IGBecMXRfv+vN/5TlA554Kq0S
	 ucYFqCs/Zi/qKSylmP9JPXr6i5wvXrWcqSwxCOnAAnMGRfaA+3HUV+s1hTgJiJ9a9n
	 CePkSqUDF+jGdWemDD/Sw5yIpM4lq9zjLB20rqekhAYmOo8/1rAfndRw188Go5OypW
	 GQmidjmWl9eGA==
Date: Sat, 29 Jun 2024 15:37:36 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc6
Message-ID: <ZoAOIATcp1T_89x2@shikoro>
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
	protocol="application/pgp-signature"; boundary="Etker0Y8FjzdLkMR"
Content-Disposition: inline


--Etker0Y8FjzdLkMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Arnd's patch seems a bit large for rc6. It was in place for rc3 but fell
through the cracks :( We are sorry about that.

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc6

for you to fetch changes up to c116deafd1a5cc1e9739099eb32114e90623209c:

  i2c: testunit: discard write requests while old command is running (2024-06-28 20:44:38 +0200)

----------------------------------------------------------------
Two fixes for the testunit and and a fixup for the code reorganization
of the previous wmt-driver

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: viai2c: turn common code into a proper module

Wolfram Sang (3):
      Merge tag 'i2c-host-fixes-6.10-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current
      i2c: testunit: don't erase registers after STOP
      i2c: testunit: discard write requests while old command is running


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: testunit: discard write requests while old command is running
      (Rev.) i2c: testunit: don't erase registers after STOP

Hans Hu (1):
      (Test) i2c: viai2c: turn common code into a proper module

 drivers/i2c/busses/Makefile             |   6 +-
 drivers/i2c/busses/i2c-viai2c-common.c  |  71 +++-----------------
 drivers/i2c/busses/i2c-viai2c-common.h  |   2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c     |  36 ++++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 113 +++++++++++++++++++++++++-------
 drivers/i2c/i2c-slave-testunit.c        |   5 +-
 6 files changed, 143 insertions(+), 90 deletions(-)

--Etker0Y8FjzdLkMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaADiAACgkQFA3kzBSg
KbaB/w/+IbGFUNgGgNSx7C/2JVazFD/j/QQWhdy+O/6SYGQMa4SIat3GYAwPy8d9
QRl0SM0kds0e5v5Rdr7gpiuMxXnAqN/FSKYr+LPYbmOReDkWD+uaOBC5R8yRz5oA
SeHeBqdPmwWxLFLXIMqZ3Ff55tV1kc41gR9Z+qKAHp3UdthgikDC02e4G1tX7X7S
Ll3QItK+eGc4FPY8HpM87w34cDnR/yGipTG2vrxHFbuQR45Hs5Gmnqo7g/THVtya
MdRJ8hZC25kWO3qb5CIcOn/IkBI/6XS/erdS0FhwhuIRvmvsEA/SerJ1aq9RVrkt
gnDlt22BrDujX1zqKuaysjznH4kXk9p+aEKoZ02aZdpj12gpQdYilK9wGYoG5Dju
WQSnkGEPqMJS93rx6akZ4nB75O0QYSJae6DE3Ly0x7joHlc1xwYSheC+ICJs7liQ
aEM9oiebeF2WRLzd+MGFw7mBQ4QfTtVROJCIh3PDcEOBBS/s23+69gwlTropmquN
B8EQt0oZbTuhKjW8ic2390kGtZcamCvhWQECjC2AwyvmnXH976/rIqH6sOWhiyQt
A5an8GllmFrS0f6HsunZIVFyHbbRMxoEt4K/WasJbHnCDF/WAGIAeKQIUkT/vCfo
h5RbFHn7Ms2aI3s39c+r6nIykcd1NZCQeZJ7xbFrRWO8axc2Yfw=
=n1/r
-----END PGP SIGNATURE-----

--Etker0Y8FjzdLkMR--

