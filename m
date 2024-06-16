Return-Path: <linux-i2c+bounces-4045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E9909D07
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 12:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797DB1F21413
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 10:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156EC186E59;
	Sun, 16 Jun 2024 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKiDj/Y9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B051862BC;
	Sun, 16 Jun 2024 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535147; cv=none; b=IYByrj/YjUkYSvCc5pSwIPMMFMVoAkLL7pQcLLbYdpdKppLcJA9Yv0a/uh2lKR06pJDN8z4zZ+uEZSh4I2LAlXBSpuFo92GH+U0tyF6tU9XCwLOFSxckIVSinG6aonyBj0hTkoNSBDpdK6tPiNKv/5Ciy6qT6/7Nd5xodMBXfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535147; c=relaxed/simple;
	bh=jWF7GSvBklMEPkrDs9FDK/7TyQOR1+RHkcvCeYAc0Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvcAaevRCj8VFi+QkOXtOxTXqTz7BU1T9CRI7lNEyHnX0/dEmUB8TkctYD+wvdZdutUUVJwWhzJ7kFysDULBjfuR3DRPiHP9Ax4PcyYQqN1aXa8WwlBo+FJ7HAo0k/kdSEnYxeOYfIZaGsgs77HmoH/jUvWGrp0AVXxbyaMGrRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKiDj/Y9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A64C2BBFC;
	Sun, 16 Jun 2024 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718535147;
	bh=jWF7GSvBklMEPkrDs9FDK/7TyQOR1+RHkcvCeYAc0Oc=;
	h=Date:From:To:Cc:Subject:From;
	b=cKiDj/Y9T5iGpFac6GoCTq1yNySl+y1bvoV1Up5OrzX3jcQ+m5XNHtiUUFw3J/w/s
	 2NR7jbohqncuYyjjgOzl3PgSoXguC9qIreBOYTqVNY019ZPFGgIp4ziY0s1a8atUtS
	 7C3ZzYVa0Fm4WurL3MANvaYKFSwhQx7XeapfeiK0H3p4cOd9Pq4nCEmUPRe0Wybnl6
	 TXsU2lomnsG8mbiSIQCuo102cyPix4Qq83HiH9CGSJK0vooAmeYgGLxFGWQghNZx6T
	 zCpW2mT0tRKX8kfJAjMT3GJyPvEHOKCio7V9Tbo2jcXoMMq3H8LCAWC9m+g/eYlpTN
	 P04RkTIvNqfTw==
Date: Sun, 16 Jun 2024 12:52:23 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.10-rc4
Message-ID: <Zm7D5wSXVQnhsPpw@shikoro>
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
	protocol="application/pgp-signature"; boundary="Y8Pijwrw+gZPYOP1"
Content-Disposition: inline


--Y8Pijwrw+gZPYOP1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc4

for you to fetch changes up to 7e9bb0cb50fec5d287749a58de5bb32220881b46:

  Merge tag 'i2c-host-fixes-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-06-16 12:48:30 +0200)

----------------------------------------------------------------
Passing through the i2c-host fixes from Andi

----------------------------------------------------------------
Jean Delvare (2):
      i2c: at91: Fix the functionality flags of the slave-only interface
      i2c: designware: Fix the functionality flags of the slave-only interface

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.10-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: Fix the functionality flags of the slave-only interface

Jarkko Nikula (1):
      (Test) i2c: designware: Fix the functionality flags of the slave-only interface

 drivers/i2c/busses/i2c-at91-slave.c       | 3 +--
 drivers/i2c/busses/i2c-designware-slave.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

--Y8Pijwrw+gZPYOP1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZuw+cACgkQFA3kzBSg
KbZpQQ//Uyha0hBwpyuyxuyRBXUcsuWSyome4xyrqbIB5xqSrc1O3oOimAhkcECC
wmmRJsZQq5+oAShXKTl1nFtcr9MYlx88SwI5htG5Ih2sWKqpzf1wh+5NNXRY9391
Xdg5ZqGu39k4ZBMOWZhU7pBYIy1be59rrMm7lxvUwpTArkrCWu1WLgwyVoteQSfP
jwdnyij4pJljY2bTMa8ff6LNupua5Q9vZr7zDoQHTdNFmFWO06Esd8lGYLjER6vK
jBkBBIZKHCle5NwUEt51Q82v8OZJsKlBwUqbGGm/HxVXeWfKOs3xOAz/V3diDAJU
RzPHy4/df/lOYeeUa9O34KXP/V+Yhn/eIdK52hpQDoHFw0XgUYZHQMJYqbNv0sOn
KyrjvJkT1+XPBAs/ogoPLUc3GCrnwIT7r+0tg3AKMuhU3q6rsfA3h+/orS0LDfKR
tOZOgtdePppYLiTH7XttkO7X/PFfeFI+eipeDEBpQb8NHlSCZtD/6bUrdUGOGmmr
mwqeJ3N7aZ2D4U4ZzOdh5SKKV1wPTY04b0fjAM3U4wKCXm3g/wMp3hr6Py+vScRD
4zRDrIdkRwAxHPZ1p/5qnQvXgkcq+gOIbfzeSbnZGGrfrVmmDmXZ0/WWTpNogPng
H/j9LHM8s0tpj2OqMa8+1XkAk4kWIYpBOjdxndfdkj6qnO0y5hQ=
=otap
-----END PGP SIGNATURE-----

--Y8Pijwrw+gZPYOP1--

