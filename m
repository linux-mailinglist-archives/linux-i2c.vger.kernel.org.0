Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635A03B46B1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 17:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhFYPfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 11:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229962AbhFYPfH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 11:35:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAD4D6194B;
        Fri, 25 Jun 2021 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624635166;
        bh=ef9sYCB3WWpnC0ciBwdljsiP1VMYfnSEjTAWW4RBP7A=;
        h=Date:From:To:Cc:Subject:From;
        b=UdmRPm0IC5eSM6Kn0l+1N7CVKzNFUVyWo3FPIuz7aTRj/CLUo2Onp2eUNok3enV/s
         fvn8cI/dFi5+SX0TY0b2CTg8YFI+YgRCQGpiCBtrvVIA1cbGEMV0IpX7gcGcfJHtAa
         7wn6+OwJM4oMG8nbpvmlRSp6W89TKQ+WZjPV5fbLXHrhc8FYx1mwdNUCe7H9QpmLMg
         PfGsxVHNM+ZcrAB4hAPYBLW5lHuzDRn0TLE415nACv2/iLW2mH7upf90ztbdjn8qKb
         M9EJrVqoFte7qR8Rbjl5OQ+DmcI56Z4ShQ4X9ZqB7zd/Rk1OFs8XQs+my0Rx1dkmgr
         94gNyWCdlbeFQ==
Date:   Fri, 25 Jun 2021 17:32:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.13
Message-ID: <YNX3G9fQKWX+45gJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="omN8CTW261QYli/j"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--omN8CTW261QYli/j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has three more driver bugfixes and a annotation fix for the core.

Please pull.

Thanks,

   Wolfram


The following changes since commit 009c9aa5be652675a06d5211e1640e02bbb1c33d:

  Linux 5.13-rc6 (2021-06-13 14:43:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 4ca070ef0dd885616ef294d269a9bf8e3b258e1a:

  i2c: robotfuzz-osif: fix control-request directions (2021-06-24 22:08:00 =
+0200)

----------------------------------------------------------------
Andreas Hecht (1):
      i2c: dev: Add __user annotation

Dan Carpenter (1):
      i2c: cp2615: check for allocation failure in cp2615_i2c_recv()

Heiner Kallweit (1):
      i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when leaving i8=
01_access

Johan Hovold (1):
      i2c: robotfuzz-osif: fix control-request directions


with much appreciated quality assurance from
----------------------------------------------------------------
Bence Cs=C3=B3k=C3=A1s (1):
      (Rev.) i2c: cp2615: check for allocation failure in cp2615_i2c_recv()

Hector Martin (1):
      (Rev.) i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when lea=
ving i801_access

Jean Delvare (2):
      (Rev.) i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when lea=
ving i801_access
      (Test) i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when lea=
ving i801_access

 drivers/i2c/busses/i2c-cp2615.c         | 14 ++++++++++----
 drivers/i2c/busses/i2c-i801.c           |  3 +++
 drivers/i2c/busses/i2c-robotfuzz-osif.c |  4 ++--
 drivers/i2c/i2c-dev.c                   |  2 +-
 4 files changed, 16 insertions(+), 7 deletions(-)

--omN8CTW261QYli/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV9xsACgkQFA3kzBSg
KbZxthAApxvw6S1+g/W4zX6jdNd9HU7u5q33BYRpkeh80TDYblkMEgZkkaOwL2HB
DAfEO6gjk5BadkZIkYWReWUvXvKyTAFhnHSMhhBax5TQZwgRpEuHOuJq4cXBeTwY
9fGe2Z3J0lOcpmo9esoFOhYtf/zx1zzC1+H5ITm5dZaeXnDyKxGAZ2b+F0GY2rmj
fO+MhzRp9Y6qjvlaLu0XmEvE2HUdKBkrEfOp7gLLyxOXcSQfTfi50DWvFamn21ZK
f9csE5UNBvP5BBOjOBRPPxW61Wgp7C8E1xJNvEJeVPVYdeiQBXH6wXXRvpElNO37
HHDbIzCEIfX0IZkR/yAOBjvR3QnlVowk0Tmm+2OvuIVANECNHMmr33VT+rzkZds0
kIyDcsQfuhBUiFdYHRyNvvjoHP9NDkZNiGkH9SfCDTgCmH4E8psNG4k5QSSZqfq/
2528CA5vjfZaMmNPtf9Xv/zcvUCvdBrQgoPOXmfGpSQPwVwkWfxziYH4vJWuC8M+
mXTYtmge6d+8lV7o/wd0PEdE441j9NQSphibEpko4q2ztuWThXKDUl7uYkzIK2cj
mijunbDQo1IwV/7JmYlu1B4+rHIh2ykw5/BIDvWlyRBd1XLB5TUIxyBzx+sqHaLR
LZVpXyN+KIlcQI8eGGhhnPb7kR1ULJ9jqpE9cj3U5onYG0cg1sI=
=7FOx
-----END PGP SIGNATURE-----

--omN8CTW261QYli/j--
