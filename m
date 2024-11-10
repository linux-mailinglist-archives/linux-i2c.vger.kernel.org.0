Return-Path: <linux-i2c+bounces-7910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599E9C342F
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2024 19:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90AFF1C2088C
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2024 18:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B891369AE;
	Sun, 10 Nov 2024 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlzfDWkW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218C81741;
	Sun, 10 Nov 2024 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731263415; cv=none; b=pPaj5TkWTTvP2ZQ4NT3xi4vP168ja/LXhczxYCHfp+2LveMlbbXCBMt7EBMYW192YM8wvrR7ZNUYsdBhI/UIEtpA4GL+gPa/LdCThiyDdKSAZNmvi0MC/XA59QHixodXTUGHF/b8miFK8HCn0XtdYRAFim74SBsOMN/QaHLpC4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731263415; c=relaxed/simple;
	bh=i5og9rerJModkU+s8ItbMf0HvALRDPrt0CbiJyiqxrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUlgt8Go2DIogu42YMn1nocOEicDTDxtV74PI+aIPDzT3KRWFVSFoXxlOxH2I0LeIC2H3HLpzicWQpnfEfDJ025V7tiGNIWNszroaLflevRBf5qr0lNxXpEyvBj5GUPPffgmvKMA+ZOf0KIFAGQgmCjxp0qGpOkjme8tvoDOdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlzfDWkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8639C4CECD;
	Sun, 10 Nov 2024 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731263414;
	bh=i5og9rerJModkU+s8ItbMf0HvALRDPrt0CbiJyiqxrk=;
	h=Date:From:To:Cc:Subject:From;
	b=YlzfDWkWupht7IeASI7yR/xKOjtVVTXFpVWWvNqct3rBqRtfi6eC3kLATqhhF98jV
	 Hi/ZsdfC7ZQi35vNS/GuCdVnN7Ls9GYlvDUOP71lnj16MGuCBlEUeVxx0R9SthAwjD
	 6xS/1Zoe7egkq10mBnNVtGsaGnGchbNOLYaqpvlo9Zg2ATWTW9dCbTTMZajF6s43N9
	 dEyUVTPqZHZDdOQpvEw4Tf/PLxXn0M0y66x+nqNKUHfurFuuZCaUMY50KpeC67rPzw
	 ss8r9a5co9fYUq2BrDc13dxrWH2qjRSjh5NPzyJpFy7GQFVmwZYkapBFqjU2sXO6PU
	 VESvAyewAoZwQ==
Date: Sun, 10 Nov 2024 19:30:10 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.12-rc7
Message-ID: <ZzD7sqWIYWBgRmKr@ninjato>
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
	protocol="application/pgp-signature"; boundary="iFio4otqGN+Dc48d"
Content-Disposition: inline


--iFio4otqGN+Dc48d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.12-rc7

for you to fetch changes up to 547aad93e00d5acdefb9ba6de2a7dfaeaf311475:

  Merge tag 'i2c-host-fixes-6.12-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current (2024-11-09 23:47:51 +0100)

----------------------------------------------------------------
i2c-for-6.12-rc7

Core has no updates.

i2c-host fixes for v6.12-rc7 (from Andi)

In designware an incorrect behavior has been fixes when
concluding a transmission.

Fixed return error value evaluation in the Mule multiplexer.

----------------------------------------------------------------
Liu Peibao (1):
      i2c: designware: do not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not set

Wolfram Sang (1):
      Merge tag 'i2c-host-fixes-6.12-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-current

Yang Yingliang (1):
      i2c: muxes: Fix return value check in mule_i2c_mux_probe()

 drivers/i2c/busses/i2c-designware-common.c | 6 ++++--
 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/muxes/i2c-mux-mule.c           | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

--iFio4otqGN+Dc48d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcw+7IACgkQFA3kzBSg
KbYPDQ//STFzCO0q5mYKvHww7syobd0Wrzy3TADs1u5BtfvCxNx+6mvfj0WdlCAI
66Orxqbd/Vm8tVu+yDrLC9HMTJuRqAz7alWDPXwz5qV5w0XLz+yB3pvaqEyaEvRN
WOPvwcCRnOPC6XA6njCnxZQ+L4AzdcBI7eoy/RZm9B+OGdQ1r1DCrGo2TBwvRskl
pICZYfmjRykOC3/LYTP7ySY5A1o30vdVyKGTQjiEpq/7HRhAg885SJSQ1D6XW6Ba
t58KwBthnbO15hLaW5lvXpJJp6pgg/aMCmjLhlX/RIGgbs7BGAC5xP4E55HfBUXk
IhXF8ggIgjbCiwBAtkxpjWyWke/lX7lLt6EvAQertAZsmOxyklMTNBAifG5CaTWj
WJSYhrhZbqhph9LNr9pStKYisa5OIWDKc+sWnIhrbGhhMvXk5PcuUaR1HNfgEYfF
/rtri0wAj7NZQZJY8vEhmHwrCuqcYb1zLtbaJaSVqJPlJ/B8JmEWyIM5EH8FVOIT
Fdzg5KKxIsmeyeSwOg6bGqsXBptIZV+cLVvyXMBod9twAP1M8o5IQgj7/O4NngPB
ZutTfzz9O7FZxX1bB0bgWpPtmw2Lif2XU96Uff/koabG7aWrQ2FXVMJAQ4ACQ8UL
I5cxVJOZfFV0LRL8TulKk1fmAvV9Tl1RD53xOD4+hD5kmaYJdcY=
=AXw2
-----END PGP SIGNATURE-----

--iFio4otqGN+Dc48d--

