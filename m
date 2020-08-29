Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5912568D6
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 17:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgH2PxW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 11:53:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728375AbgH2PxP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 11:53:15 -0400
Received: from localhost (p5486cb47.dip0.t-ipconnect.de [84.134.203.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05D6820707;
        Sat, 29 Aug 2020 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598716392;
        bh=Qqj02Lv0IUCa5p5sPcWrTdOrlwUiunqaS/VUy5b1CQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=Nn7kzJ5P7WCaEJFao9Tcvqb6W7w3j9T9OJyhSqsrJsoGr1VhuH9gViNQD26nXuOs2
         2+mNS0G5nyhbmEpdwBRJ8an7qmIjeS4mifJy3VOAdxBJXfkQ6PG79j8GaQ1Y8N0YI4
         0r/eCU7t9OZHl2i8oXs9s5OBw2/TECwdSSomHxmg=
Date:   Sat, 29 Aug 2020 17:53:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.9
Message-ID: <20200829155302.GA1147@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a core fix for ACPI matching and two driver bugfixes.

Please pull.

Thanks,

   Wolfram


The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 0204081128d582965e9e39ca83ee6e4f7d27142b:

  i2c: iproc: Fix shifting 31 bits (2020-08-25 09:46:38 +0200)

----------------------------------------------------------------
Andy Shevchenko (2):
      i2c: core: Don't fail PRP0001 enumeration when no ID table exist
      i2c: acpi: Remove dead code, i.e. i2c_acpi_match_device()

Ray Jui (1):
      i2c: iproc: Fix shifting 31 bits

Wolfram Sang (1):
      i2c: rcar: in slave mode, clear NACK earlier


with much appreciated quality assurance from
----------------------------------------------------------------
Mika Westerberg (2):
      (Rev.) i2c: acpi: Remove dead code, i.e. i2c_acpi_match_device()
      (Rev.) i2c: core: Don't fail PRP0001 enumeration when no ID table exist

 drivers/i2c/busses/i2c-bcm-iproc.c |  4 ++--
 drivers/i2c/busses/i2c-rcar.c      |  1 +
 drivers/i2c/i2c-core-acpi.c        | 10 ----------
 drivers/i2c/i2c-core-base.c        |  2 +-
 drivers/i2c/i2c-core.h             |  9 ---------
 5 files changed, 4 insertions(+), 22 deletions(-)

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9KedoACgkQFA3kzBSg
KbaeSg//eewASwN0xa1Da5my5CE1Q77LLQKpdNq0cMAaXle+pqt9aEdD3KvAP1Th
5lBCN8CEcAcDPMjaiLoTAIc1RpFucT4dht6L8V49mXqRA/QfpRW7YGWBCGzxyi+H
/QGXCag6DuHmA5TP5+DF1/OUbDEKyfkOWRILnlhn0yorl+nOfxeoWGkjL/XrGKI8
3Aca65HhsHj2x9UXJy97IvPdD03zlKBuSC/I5TuPKuCMQvi7icbjhI40hgD4xLQM
NjLqCrXZC9Tak8uSIi71UhAMA9mIj6pcUKQdiyWE+lr7QmBFHstIxqzuuKq3evxf
fcqfIYDatGViMs4ofKFJooWzsNMr0Vt3o/LGxiXvKgq8lvT7zBOQTu7ZknctwB1J
tmsRBH7dQr/n6HMTrEHUyhurnNeH8jmDfQiPVh6LRzT+BrRAMOVgfUNbsftFtkjI
GQJgd5g6MB7nBDeBeR5fFzbSpiyaObMyNH43fIt0qaFcOdTsw06JuPDs602zw5BD
9XH4IfYzdxJbpDzv1Ku5VZRCo61iOLNiLz9++0WGvR3JaMY+2jQtVyg7YykMA97d
ORhn4ndAWGRGyRX/VEX3qsI8iy7JotBpMXyAAosPZuetUKBIsFToRnnK5vbP7iLl
g9oNY4/FoXYzvyNa6MzZDD8soumSnPFBkTgQ0ZfdcrwBMr+LS2M=
=bo2d
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
