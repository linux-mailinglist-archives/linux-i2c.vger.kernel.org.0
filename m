Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2A739CB4F
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 23:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFEVsY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 17:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhFEVsY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Jun 2021 17:48:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D6EF60231;
        Sat,  5 Jun 2021 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622929595;
        bh=Qyi9Y5m7xQPuhNEwqQYAzAGEfdfpPg1sP7cJRaNcc0g=;
        h=Date:From:To:Cc:Subject:From;
        b=CwJ1ybigf36P8KBz+o1OT03HtQaYfoDCY1GnKEjZ/OmPViqw1e7VxMvWTxwFTGCxi
         gO4Us4tkLnQVR0oPE00FEI1ERMUMvvIlE+8mbjnkOUc/nsW58rl7xReK7OHh5+MSWG
         ZiUc3LZoG0tzfBip8qb84FUhquAnCGpu2Sdg1ZcneLoxht9FtxqnNLgpxFjXgEsXHW
         FK/SkGeXIGTbaiPXgo1pC8jULHVecDgj4N3KvvDzXC+ZGhd40ba0pHYjktNObZ4KXg
         yvNES4H+dv7a+e8L5+AZr4FQNcCsGbWxyMIdpsKM+B3dbeNeYPQUzaRTeh9kDawVK2
         NWjzbKgZmXbaA==
Date:   Sat, 5 Jun 2021 23:46:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.13-rc5
Message-ID: <YLvwtW3JuDU0MC8E@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WjXbV/mJbe9rlxvt"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WjXbV/mJbe9rlxvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are some more bugfixes from I2C for v5.13. Usual stuff.

Please pull.

Thanks,

   Wolfram


The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 57648e860485de39c800a89f849fdd03c2d31d15:

  i2c: qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops (2021-06-04 22:32:58 +0200)

----------------------------------------------------------------
Lee Jones (2):
      i2c: altera: Fix formatting issue in struct and demote unworthy kernel-doc headers
      i2c: tegra-bpmp: Demote kernel-doc abuses

Roja Rani Yarubandi (2):
      i2c: qcom-geni: Add shutdown callback for i2c
      i2c: qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops


with much appreciated quality assurance from
----------------------------------------------------------------
Stephen Boyd (2):
      (Rev.) i2c: qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops
      (Rev.) i2c: qcom-geni: Add shutdown callback for i2c

 drivers/i2c/busses/i2c-altera.c     |  9 ++++-----
 drivers/i2c/busses/i2c-qcom-geni.c  | 21 ++++++++++++++++++++-
 drivers/i2c/busses/i2c-tegra-bpmp.c |  4 ++--
 3 files changed, 26 insertions(+), 8 deletions(-)

--WjXbV/mJbe9rlxvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC78LAACgkQFA3kzBSg
KbbKjw/8CLEOA1VNscRcEg/i7fjBtkNnvoJwxdpBPiVtPL/kArqARkoL6GbACw4b
YRji9e0SDQ49Zh6VhM4S7cluCNHFxAB9m6fo6RVvbgN7vswJk70q/euhxfx0vO1R
KC1yAlB702cbqcjhzW4Vszkc1pOBv89gDToUTB08fXpRgTlQqMlquBrbjmwvseiZ
1Rajcfl3vrPxQ0tMTGxwXx0T1UhNPQjkmgNtq0yFRRdJviQucCgiwud//avUZuui
HUew5tZ/zHAtPa28pW/Ti6Poz95/2s/SZYVlDYcy5UUlLQAQeAz9wOVIv12BIKGR
wk5LnkBWMnh6IbtxH9VsVWCDR7YJpyVF7ot+k84yvZ10XmaKYajJOv++NOelg0vc
XHVhbhXnIGtoMcNazoHtAfh0rTv6JF7dmWsbBSYvt/3XRX1DPYuPcceB+52mN1hm
KwYTr0f0ozBiPzjj1iYFdEZgCeFzdRnckLZV7wzJXN+L3V2gFrLhtf8eEEC09mnm
VCF8rxNNtN0hcOiEYstsfljEcCIGNTvZfudESwbEv6Ri0j46LwVwtB9MRx4+UukQ
fkALKtGtv7RnK9QtptdW29kQz0azyqp4uyVAUM8Y2lgF+LJF1vqwANwSMiBUhNc0
ckMc2VtQcYHcKrq0IAQz5njyocaBzh9vOPNAC18adaqCQziB6wc=
=zyKU
-----END PGP SIGNATURE-----

--WjXbV/mJbe9rlxvt--
