Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377552EFEA4
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 09:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbhAIIco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 03:32:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:42998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbhAIIcn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 03:32:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89F1B23A1C;
        Sat,  9 Jan 2021 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610181123;
        bh=jmrtNJNJni981ccFvX0GTmwlqG2gOrIRHUnzc2Nw3Iw=;
        h=Date:From:To:Cc:Subject:From;
        b=lUJnYvaFUDVaIU6iH6NR3a4tLglBRFCcAhnaUXRaVC+pFoVMPIjlSRAlN6VKvKNQM
         pc13cc0Oscqy/s/HJF4Zhd1or2TeczHhXmIo5IQA1NpWgX6DmnOv3Ug0IXMZuYI4pq
         8GOLLqysRAJiMjG8lZhBVQ25Y1jPOfavHdKKbaDYGJGVoWpUlakvh7eMRyCfsZrGUl
         x6uQgaF64rfJvC/8iZVTO7dNURRo+eYy+NWdLdj30aAao3yA/n9mbj7pL5MeLtfbKY
         UBSBd4pOe8egWxlAB2BnFkQeRfJ9++UT5Zonh5Gdy7vTlIZ/CsmPLYqkaWfSI/skH5
         tw2OfZtOFKMbg==
Date:   Sat, 9 Jan 2021 09:31:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.11
Message-ID: <20210109083156.GA2924@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are three driver bugfixes for I2C. Buisness as usual.

Please pull.

Thanks,

   Wolfram


The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 05f6f7271a38c482c5021967433f7b698e102c45:

  i2c: mediatek: Fix apdma and i2c hand-shake timeout (2021-01-05 10:54:37 +0100)

----------------------------------------------------------------
Chunyan Zhang (1):
      i2c: sprd: use a specific timeout to avoid system hang up issue

Hans de Goede (1):
      i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated

Qii Wang (1):
      i2c: mediatek: Fix apdma and i2c hand-shake timeout


with much appreciated quality assurance from
----------------------------------------------------------------
Linus Walleij (1):
      (Rev.) i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated

Mika Westerberg (1):
      (Rev.) i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated

 drivers/i2c/busses/i2c-i801.c   |  2 +-
 drivers/i2c/busses/i2c-mt65xx.c | 27 ++++++++++++++++++++++-----
 drivers/i2c/busses/i2c-sprd.c   |  8 +++++++-
 3 files changed, 30 insertions(+), 7 deletions(-)

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/5afgACgkQFA3kzBSg
KbbtZg//enU31i6SOCUXBX9NbVs14/mrheOURbR5uHceRMrgzA9Xgws7XWWFmL16
54mBDascn6LAJkhBbseojkr7DIcdSa3fvGC8o4Zdr83tn+Ku6p8hTilwrdczd6PU
M4o7iHvB/tzE7/iHDM7ZUCxsLW09R9k4UdRbpGM+kj99LETW+Y9ZpfcwuM2Vk2tE
XasCSJLz6igiY9J71lO/Gg1jkMNGF4RDkX2vqD9AmtFa+2cPnO4kMck0UDO0VhSi
PL7k+aQl2LSYR6m+pJhMgjG9X2n5NWYeUoQxlGdUhhwrTuQ/d0whEjhlr53Kp6iA
CGKYPAawiwtFDIycrUUSYV/Nl4VMNSuIl05XLjyoVgZkRzvbK1yN8AEiJ0F0X1sT
zDsd/KMX0uHynOiwm38jIn8c+H5pELR7YdOdaHCag19E/VoBxi8ICNqNq0huH9xS
lsnb1Ga8s30rUdi4wkLSRoawvN7fBRJU1S5btviPqI5O/WDIyHqLQQ+hUoAA/vPK
mmpugM9/3MM2a801yM1YXkWda1GnRWToAEqtKmTSxtqoU73u/eFWiEb8brzxWtn8
gwUALJaXi+vGJNxW5gTajm/0PFq1xjRRdgdsjK5U8eI3rgEiA+RR2sew+zIZrItw
sxntLITeM0+6b1uErwciH9ZPc0GafNHqjvoKyvvWzteqt6WwElE=
=haWZ
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
