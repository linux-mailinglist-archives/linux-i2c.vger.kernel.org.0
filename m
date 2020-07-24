Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64D122CEA0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXT1g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:27:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:50964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgGXT1f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:27:35 -0400
Received: from localhost (p54b3305c.dip0.t-ipconnect.de [84.179.48.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8DF32065E;
        Fri, 24 Jul 2020 19:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595618855;
        bh=/QFFKRMPXEy/RS6QO4Qx7xWDkvksALTOfK1KEnYE0vo=;
        h=Date:From:To:Cc:Subject:From;
        b=mNdzlbkrDMGctDSw5nb1CNySUYdXR5WpA6RcNrtS2uTgfbe0CgNFR2QscHz0q4hvy
         dN2s6QRhKy8icfKJW06CjCIr5SQ3bjs/+2CDFml38Fi0BqPRgW2lvNTGxnx78S8ZRx
         RTfxqSLAUN07yEqFOGSwLtt0gfx83ufow5SrhyrE=
Date:   Fri, 24 Jul 2020 21:27:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.8
Message-ID: <20200724192728.GA1596@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has again some driver bugfixes and some documentation fixes.

Please pull.

And a question: can we have an additional rc this cycle because of the
holiday season? I was away and this extra week would help in my case.

Thanks,

   Wolfram


The following changes since commit ba47d845d715a010f7b51f6f89bae32845e6acb7:

  Linux 5.8-rc6 (2020-07-19 15:41:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 02b9aec59243c6240fc42884acc958602146ddf6:

  i2c: i2c-qcom-geni: Fix DMA transfer race (2020-07-23 22:26:44 +0200)

----------------------------------------------------------------
Douglas Anderson (1):
      i2c: i2c-qcom-geni: Fix DMA transfer race

Ludovic Desroches (1):
      MAINTAINERS: i2c: at91: handover maintenance to Codrin Ciubotariu

Randy Dunlap (1):
      i2c: drop duplicated word in the header file

Raviteja Narayanam (2):
      Revert "i2c: cadence: Fix the hold bit setting"
      i2c: cadence: Clear HOLD bit at correct time in Rx path

Wolfram Sang (1):
      i2c: rcar: always clear ICSAR to avoid side effects


with much appreciated quality assurance from
----------------------------------------------------------------
Akash Asthana (1):
      (Rev.) i2c: i2c-qcom-geni: Fix DMA transfer race

Mukesh Kumar Savaliya (1):
      (Rev.) i2c: i2c-qcom-geni: Fix DMA transfer race

Sai Prakash Ranjan (1):
      (Test) i2c: i2c-qcom-geni: Fix DMA transfer race

Stephen Boyd (1):
      (Rev.) i2c: i2c-qcom-geni: Fix DMA transfer race

 MAINTAINERS                        |  2 +-
 drivers/i2c/busses/i2c-cadence.c   | 28 ++++++++++++----------------
 drivers/i2c/busses/i2c-qcom-geni.c |  6 ++++--
 drivers/i2c/busses/i2c-rcar.c      |  3 +++
 include/linux/i2c.h                |  2 +-
 5 files changed, 21 insertions(+), 20 deletions(-)

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bNiAACgkQFA3kzBSg
Kbau5A//W54xo/1beYhiOR1o1JIgJ062pQVum2NqwVbhsa+nGZKkFIbCXSYDRAXE
Mb6nzT/VkuZXaBdPG6gGkzdCkmczxfxrC5g0CNgyBIH3aJKnc/vRN0Y3kwN7Hav9
xXNL6yQTkOzCU0t8SfDgRzVDD5WhVC0os61WXg5wW1r/Qf/fpeIop8BW9jNVnzIR
fO8v+uXPvX/GkKG9GbIe51Y3R37TtJMgw4depat8nbbV/LwLE1ULdfJO8kUoV7Dx
InoBQ+mlvQvAMGWMGLgjfeHkX8gbIfpOppJIyALqkUZng+27EQPjL38weOgD3C8q
kZmZKfFsxvl1ScMTbvHcPaOTzgYhtFV8EVhqZ3w28g3JjtD3pADLyDB11V5A6YyK
5Cmet4Fchtq59YDZCWWHi8varxmfvQjKkXqzJ+2Xiw7MqH6B6JIeFg4OIU82K1pJ
1dgHDH4NYTGBCI+k4zUR4kLxE1+nqJkOqfhpSt98aFtFfGKaaRtzWHQ1v1WWrVG9
mVxP6Wr/IX9QCDzf41a7foDQ96ul8/ptPJFJFSNZ1D3wPZntn4nhhmFItEkWB3+9
TDG9j5s6CQdVYDjTVcun+4dQqWocIbuLF71tII8EkLtCqsT6iCq3V6LtRA12LChq
lCYBMupqZBEyrdP0ubofdlCFsIoGG7GBlchIXRh8CrM7PC4dI98=
=4XIZ
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
