Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305C2270F3B
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Sep 2020 18:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgISQCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Sep 2020 12:02:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgISQCK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 19 Sep 2020 12:02:10 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E22B7208DB;
        Sat, 19 Sep 2020 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600531329;
        bh=EY4T7CbPJ+ftHrDs6+g8isUOWPamqMXmH3pJxkBmJsk=;
        h=Date:From:To:Cc:Subject:From;
        b=2Y3Hyvv6RtHFfJDpf6g1iBovgBuI41fFmxFQFWhteqT85rGwa1jGM+rMnVsK+h4lX
         IlQlA1vB82WxwegNKF9DUnm1h7D2A4xzuOMwrvOQ0VFnlRpOuB3P68FxhCRyT80o4p
         XPt7XufPpc3EFnXKSNtYgDN1909mKgF2Y7mlC2pU=
Date:   Sat, 19 Sep 2020 18:02:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.9
Message-ID: <20200919160206.GA50781@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here is another bunch of fixes for I2C. Only Jean's i801 patch is a
cleanup on top of Volker's i801 patch, but it will make dependency
handling much easier if those two go together.

Please pull.

Thanks,

   Wolfram


The following changes since commit 856deb866d16e29bd65952e0289066f6078af773:

  Linux 5.9-rc5 (2020-09-13 16:06:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 6eb158ec0a45dbfd98bc6971c461b7d4d5bf61b3:

  i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK (2020-09-18 2=
3:11:44 +0200)

----------------------------------------------------------------
Eddie James (1):
      i2c: aspeed: Mask IRQ status to relevant bits

Hans de Goede (1):
      i2c: core: Call i2c_acpi_install_space_handler() before i2c_acpi_regi=
ster_devices()

Jean Delvare (1):
      i2c: i801: Simplify the suspend callback

Matthias Schiffer (1):
      i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK

Qii Wang (2):
      i2c: mediatek: Fix generic definitions for bus frequency
      i2c: mediatek: Send i2c master code at more than 1MHz

Volker R=C3=BCmelin (1):
      i2c: i801: Fix resume bug

 drivers/i2c/busses/i2c-aspeed.c |  2 ++
 drivers/i2c/busses/i2c-i801.c   | 26 ++++++++++++++++----------
 drivers/i2c/busses/i2c-mt65xx.c |  6 +++---
 drivers/i2c/busses/i2c-mxs.c    | 10 +++++++---
 drivers/i2c/i2c-core-base.c     |  2 +-
 5 files changed, 29 insertions(+), 17 deletions(-)

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9mK3oACgkQFA3kzBSg
KbaLlw//X7B9pJcohcBWX++GqhJ0wY2vc/nwQMwz1MihLxM7VjsXNZLKpOaEeQ24
KEoHHkBsc1FCUXn50pXJvchy0MM0LSvyHu/vPbgzZaDmdFSuakfWa3mRJLcnrJWT
A9NUZf2Jkl6IZJ1zX9nMMtbGxVaGUsmI+OqthApS8itTTQIQvsMahEW3GKtdbfTi
WKHIUUvFJ34dNLVQbiAYASEgRktv2gFTT6K1V/N0jU0ktMcYxBjO7VGgH2i3ROd2
yD0TotxFH5oYcnG0CEWDdS5Ia+dz0+r7P9gTpCbAJ+STJ4k+3fuqYkG4JcyzYVrs
fx5ovlzHTA1FDAll18Uwfe8OZWl+kBInFEuR77TWMnuMe8XkgazVaqHNMDrrx1CQ
Z0V5w2sP3Nhgp/zhB9/CviZhPAkzy672mYljLlrNrlRbPUt7dy3WOC2KQUMoDMww
pYL/GR2gtmRHZzfxeoTAv03kTPvqnHeihNkv1ejlqOo0VPI5WlLM8i7hKt9lVm9F
Kc1E7Mu66UFNdvy1vhBFWOsvZeY+INvZ+nfzIQKCUCAjUtBgVq9AQmMxf4LmiJFL
aGiiZi+3YDjghdRVUF4nq0sjkGH4SJrj75ugSotxccPRBrHKWvyZRsO6C99Xlk51
R+kKW1gLfhz21RqRqxZy/EQnci/emr6qb2+hhuhkIGhdkhQ33R4=
=7CIU
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
