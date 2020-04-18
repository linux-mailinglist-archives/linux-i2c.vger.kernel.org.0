Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1D91AEA60
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 08:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgDRGxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 02:53:51 -0400
Received: from sauhun.de ([88.99.104.3]:41048 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgDRGxv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 02:53:51 -0400
Received: from localhost (p5486CFBC.dip0.t-ipconnect.de [84.134.207.188])
        by pokefinder.org (Postfix) with ESMTPSA id 8B95E2C1FB0;
        Sat, 18 Apr 2020 08:53:48 +0200 (CEST)
Date:   Sat, 18 Apr 2020 08:53:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.7
Message-ID: <20200418065344.GA1880@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has some driver bugfixes and an old API removal this time.

Please pull.

Thanks,

   Wolfram


The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 8814044fe0fa182abc9ff818d3da562de98bc9a7:

  i2c: tegra: Synchronize DMA before termination (2020-04-15 18:27:31 +0200)

----------------------------------------------------------------
Dmitry Osipenko (2):
      i2c: tegra: Better handle case where CPU0 is busy for a long time
      i2c: tegra: Synchronize DMA before termination

Hans de Goede (1):
      i2c: designware: platdrv: Remove DPM_FLAG_SMART_SUSPEND flag on BYT and CHT

Wolfram Sang (2):
      i2c: altera: use proper variable to hold errno
      i2c: remove i2c_new_probed_device API


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: platdrv: Remove DPM_FLAG_SMART_SUSPEND flag on BYT and CHT

Thor Thayer (1):
      (Rev.) i2c: altera: use proper variable to hold errno

 drivers/i2c/busses/i2c-altera.c             |  9 ++++----
 drivers/i2c/busses/i2c-designware-platdrv.c | 14 +++++++----
 drivers/i2c/busses/i2c-tegra.c              | 36 +++++++++++++++++++----------
 drivers/i2c/i2c-core-base.c                 | 13 -----------
 include/linux/i2c.h                         |  6 -----
 5 files changed, 38 insertions(+), 40 deletions(-)

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6ao/QACgkQFA3kzBSg
KbbefQ/9GqRCRANJ01H6ICQnHIHhKV1vdhDW7WLwKxNRkjZkNmXa52R7hey5tGDM
Uz22YAyv5wOJWRjtGggLHCM3dn0nRmw2oQz++1d69mIdANvH9FsqR3T2GRkAOT18
fmAOeKihyYVS9dGRV1am7X2FiHvu4XOrOSbxAk0I8gl4Ka0JXSVbhMCYAuG2xdxv
gP3ejVg9YHYeyw1gkihxLFZpDXliOWa+SyndrVbf5eAuQO3/Nz/S5p+gj+YWiaUi
WiYcbyznoqjf1Qp7NnqiuAaSJ4qKxAjWtHaf+y3QWilulyJkWL0j1lzaehQ9OH/a
9pwy2MpSho56B3cymzEFImBXJK7pTi5f1bucV3r9x/3PLXHSAm1CnPqPiWHQRbt4
RSYbVk7hZPnPTzKZe9PLRZ/UvItPOrysCRJgprsU++woOW8dTr7hzMI8EAQoZqIJ
BlRFREBdp1fLYrNSxde9jd1NVQJzzX0IANLZC2tKBoijHr9nYIfDFbU2aP7U39dj
0cDqwypbP3iBDpBMqt+KrbXFmCrWUIl8itDF3Al3WAJ2jK6/9ri7+EqUQKt/oQV5
AYOSGecHfJG6CwNuktKCVZ1bTnrb00h78J2Sl7+dS4fp7JCJXV3gbpIpZUjiKzZ6
uzHq/KW/khvqPB1L0HuMSh5r8nLDUTIhm/t7N9lBPNKA2T/5IzI=
=iJfJ
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
