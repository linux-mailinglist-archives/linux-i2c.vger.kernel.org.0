Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1049F45EBD5
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 11:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376661AbhKZKnc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 05:43:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:37586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1376803AbhKZKlc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 05:41:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 159AB61041;
        Fri, 26 Nov 2021 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637923099;
        bh=4xdG1XjuMGv2R+XtUqKaNb5YEb8kRlTKPJERGNtwtO4=;
        h=Date:From:To:Cc:Subject:From;
        b=TXvwzwDZUogrxKQpWrdwPk3PMBEBmbpDtNdb5EXtFGLCgFkseVB26RKwC7s7RHVQv
         QVYjqI3lhB0jUwD7a6rltllh2LqOtiQoUY+OiIATpaNNtn1zoiwbXOOEZQOck+Gdbq
         +WkcOomVSfFD+i7eHQpYF8HYKIrfV+DGhMPXPlyl3n04ryA//n9JNVktLJ2NYRDUBD
         6tY/kAw40cJgSJfEFsLj48Khn/tjpKLhUPV9u/dfjCvwbs2B7fqZG2F5GF1YFeGtnP
         ApT/YjGxnAb1Z3cOE0v+q/X2sYabuwlhZWgojjJTT15SS7gptDw7ke/+ez5p/1XcAp
         ho1c8R3pKxpkA==
Date:   Fri, 26 Nov 2021 11:38:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YaC5FYorV4yyQnaE@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uGfK5BB4nqioyEtN"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uGfK5BB4nqioyEtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has an interrupt storm fix for the i801, better timeout handling for
the new virtio driver, and some documentation fixes this time.

Please pull.

Thanks,

   Wolfram


The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to bed68f4f4db429a0bf544887e64dc710e5a690ea:

  docs: i2c: smbus-protocol: mention the repeated start condition (2021-11-23 12:59:41 +0100)

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QM compatible matching

Jarkko Nikula (1):
      i2c: i801: Fix interrupt storm from SMB_ALERT signal

Jean Delvare (1):
      i2c: i801: Restore INTREN on unload

Miquel Raynal (1):
      docs: i2c: smbus-protocol: mention the repeated start condition

Vincent Whitchurch (1):
      i2c: virtio: disable timeout handling


with much appreciated quality assurance from
----------------------------------------------------------------
Jarkko Nikula (1):
      (Test) i2c: i801: Restore INTREN on unload

Jean Delvare (2):
      (Rev.) i2c: i801: Fix interrupt storm from SMB_ALERT signal
      (Test) i2c: i801: Fix interrupt storm from SMB_ALERT signal

Viresh Kumar (1):
      (Rev.) i2c: virtio: disable timeout handling

 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml     |  5 ++--
 Documentation/i2c/smbus-protocol.rst               | 14 ++++++----
 drivers/i2c/busses/i2c-i801.c                      | 32 +++++++++++++++++-----
 drivers/i2c/busses/i2c-virtio.c                    | 14 ++++------
 4 files changed, 41 insertions(+), 24 deletions(-)

--uGfK5BB4nqioyEtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGguREACgkQFA3kzBSg
KbZO7hAAkhmxgAaA+S4pjiST1Eud0AlW1omJH2aPUdY9Nypqbe7jmydrnx1VG86+
O1jwwVdeI0JxXRTpeYEA/ajPxdJKZTFqBlwhvRWxZ9fuRslrcj4X0cdUOA+luz75
gjeQ7zHYtcpx2jMhCYS3L/xgGR1sgQtS5IDl9fUEL1KLkeBFqSxDrpzFkmUBCn+B
OLw1J9tr+ItRvPd74pPuUWKnEax2CrKRxrAOMTx/4MMPN8B/6PONo8O5KOQrOYnJ
MACjzB+X4efMyeG8o0iwnTCeLOAD/KE9GWUXGnR8xiTvOlRmRA3EPBUM5BZY188T
Kh0Es1no8YoRWc1qYkQrvaz+PPnear4P4p0cLXf0IjTv9zmiIwa3cRBtl54w7+lG
iDBd6E0Dqb9XEey5rP3dySjHfNywymtOJdL8PG9YiLTYPUF6JqZXVSSmMHDi9JaM
y2PntHWsQUqy+VDC8TNPYPoEzscbMWTF4MmHegM9lqi3wpBjQB+paRHg1UsRJ8kx
+Elw+2ziiqltXXA5PDAkrbMg+ooMbBZeqAIPpXug0tQX14vUXIrrsm+Hz0WJiN1Z
38JWvok/QZvqCJeG/Md06nBVcuYFaZ+2qmlYZZPkxk59q6MBvDqP0pLJ2SSv5L1T
/pN3IxVU6RKGJLfAZKkUfou5wSxaPVQIhBUriUXLcvRV43t+1ko=
=EDSd
-----END PGP SIGNATURE-----

--uGfK5BB4nqioyEtN--
