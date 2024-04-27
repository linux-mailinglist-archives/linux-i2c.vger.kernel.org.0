Return-Path: <linux-i2c+bounces-3248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49E8B45C2
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 13:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 350FFB213FF
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 11:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BD048CFC;
	Sat, 27 Apr 2024 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjVQcemr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D3F48CC6;
	Sat, 27 Apr 2024 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216400; cv=none; b=Pjyjv2w4NQ8tyt+XeRFYy+tI4JdVmF/UIWHAM6oPcSEGg3JpjZvGYd65LVI4BwaRkwj3r7ifFYAcklt68KwpS8yAjvpXDGrqMEWDaHIOk+yAEZVydFEwYPNBv4jKwDSxhMSzjvWmlzxAVPJFNeb+aDQR6GXwzoHD+DhX8hYeMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216400; c=relaxed/simple;
	bh=ymBpIlkzIlQEK4Ww4HzCrur/CoKjo8sLVsaWkEO0DNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IP4YQk9YZGnq+Dg+56426E8Xi0KPzswbw4dlFD8vt248BiSHrxEr2utrsgpZ3rrrjdboc7qTtQyrCtVNQ3xYxV0sL2F4GSrS393uYUt245E2phf77GQS5BUYDujttu8b9cfWtcgK9IkZux2fKCoUeW7HnQ244eQS0+wAHBMQItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjVQcemr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA729C113CE;
	Sat, 27 Apr 2024 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714216399;
	bh=ymBpIlkzIlQEK4Ww4HzCrur/CoKjo8sLVsaWkEO0DNE=;
	h=Date:From:To:Cc:Subject:From;
	b=NjVQcemr4PkvmgMpWd0w/AJ9vsJYLXcXpfJ9CON87eTdDUuYvriG973QgQpGwNFP/
	 icRUvgisPnGTQv7V72lDY2Fmou+FV7lwUsMyAJevsviJHY3NNvI9hvCdfdkTl/kFzo
	 xm2j4dcbEW7pFI2aJjY02Ts2GbRIuAGwMDxSv18lQ7BpGaikOS4Gls6eAm0c8tyw29
	 SV930nthwBa65OmSakXi8x1gQoOm7TnqHunooEQg21rkjf7uJJlyfdooLj6RUmldtR
	 k40aQTSmPYb2J1FveyVGOmoGa7QZxqf6VCQYNu0qo1skKVnmKV6ab2fwwDDuDUEQ88
	 +uwgncXNU2Mzw==
Date: Sat, 27 Apr 2024 13:13:16 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.9-rc6
Message-ID: <ZizdzEvh4juwfQCb@ninjato>
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
	protocol="application/pgp-signature"; boundary="zCb115SNB6s3iyBd"
Content-Disposition: inline


--zCb115SNB6s3iyBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ed30a4a51bb196781c8058073ea720133a65596f:

  Linux 6.9-rc5 (2024-04-21 12:35:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.9-rc6

for you to fetch changes up to 91811a31b68d3765b3065f4bb6d7d6d84a7cfc9f:

  i2c: smbus: fix NULL function pointer dereference (2024-04-27 12:57:57 +0200)

----------------------------------------------------------------
Fix a race condition in the at24 eeprom handler, a NULL pointer
exception in the I2C core for controllers only using target modes,
drop a MAINTAINERS entry, and fix an incorrect DT binding for at24.

----------------------------------------------------------------
Daniel Okazaki (1):
      eeprom: at24: fix memory corruption race condition

Guenter Roeck (1):
      MAINTAINERS: Drop entry for PCA9541 bus master selector

Rob Herring (1):
      dt-bindings: eeprom: at24: Fix ST M24C64-D compatible schema

Wolfram Sang (2):
      Merge tag 'at24-fixes-for-v6.9-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-current
      i2c: smbus: fix NULL function pointer dereference


with much appreciated quality assurance from
----------------------------------------------------------------
Baruch Siach (1):
      (Test) i2c: smbus: fix NULL function pointer dereference

Marek Vasut (1):
      (Rev.) dt-bindings: eeprom: at24: Fix ST M24C64-D compatible schema

 Documentation/devicetree/bindings/eeprom/at24.yaml |  5 +----
 MAINTAINERS                                        |  6 ------
 drivers/i2c/i2c-core-base.c                        | 12 ++++++------
 drivers/misc/eeprom/at24.c                         | 18 +++++++++---------
 4 files changed, 16 insertions(+), 25 deletions(-)

--zCb115SNB6s3iyBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYs3cwACgkQFA3kzBSg
KbY8KA//dRuXImb+3TnElPBfzdHftpg9QNjNOGahE8RA4QakR62eAHNNO7VMq8ND
1aXhjpJvVrUlQR9EkdVugOQ3is1vTWxQThsQ7Sa8Wfpx9Cz13fwDkW5MeL55oECa
/D0zq1X6yhuwocde/B0E9PunLxUzCqck6OmTBKneGgGf4HxUr3A7GLKLjrvB7iwh
QsL0VOmeT2V3O6T3lyAuxOp3RJT82okqRESRc5XF54Q6lnDvQWDNMS0GzPU6Qz8Q
6sTU1jjPGhmjgccvNI7W6xIqWMuP5dRqY4s3OKTftj0OhxGQxDsAA0DhR+fHOcA3
kknypXAxO7MZBbywPmuk8dy8yJdvcqrQaTQkzpscYuAcnxmEmY53KRmvKPdhI4B+
t8EHv8HADWGsq3Kt1y1eNsKV8Yt0CUip2mqezuaL+0rWofQ6kc2Qsxj66+Dn5ecy
lm1VNKi4eP4VjriNfUxHkQhcN2ZKwB/zMU1XKcKbMysKcW1PXOVac3fBejKXEcf/
RBSrV5/vdrMxwi/aIkNGO34f8nb0nv39gOY36hiV9uwI+EjV9v+9dqej2Xe4Vtu1
av26kSQYeGp/SbeK8OXcxPlONLaSqaSrpJh/lLQsfzSiXhk2mWkvG+PbAxn/hEJh
ZaqCtyOLh1lHMy4und4K+fc2/CZ6gBeEE4X9kUZA0HrUF/gcF3k=
=kj5l
-----END PGP SIGNATURE-----

--zCb115SNB6s3iyBd--

