Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B3F20C376
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jun 2020 20:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgF0SVF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Jun 2020 14:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbgF0SVF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Jun 2020 14:21:05 -0400
Received: from localhost (p5486ce85.dip0.t-ipconnect.de [84.134.206.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C444A20760;
        Sat, 27 Jun 2020 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593282064;
        bh=pzK053JxESKmHL36eDUmCVc40aMZUxcYIzQWVFw3hL0=;
        h=Date:From:To:Cc:Subject:From;
        b=Z+2cNzgoYeYltgKHqnZYVO2mbnVBY7KuDMyQ6tS0LOYPHgS2WpSe2Aq9cuwa7iulH
         l2KP/zjGzJQSg0GXK2sTLjxDz2h6VAkQZmJNuk0LC/U21s478xKYpl1oXoa1KihjOO
         wmv9optcdK2M8eMDNJ8O4h7zr5I3c7teDDvyYrQU=
Date:   Sat, 27 Jun 2020 20:20:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.8
Message-ID: <20200627182057.GA4356@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

This I2C pull request contains a 5.8 regression fix for the Designware
driver, a register bitfield fix for the fsi driver, and a missing sanity
check for the I2C core.

Please pull.

Thanks,

   Wolfram


The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

for you to fetch changes up to 40e05200593af06633f64ab0effff052eee6f076:

  i2c: core: check returned size of emulated smbus block read (2020-06-26 10:18:35 +0200)

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: designware: Adjust bus speed independently of ACPI

Eddie James (1):
      i2c: fsi: Fix the port number field in status register

Mans Rullgard (1):
      i2c: core: check returned size of emulated smbus block read


with much appreciated quality assurance from
----------------------------------------------------------------
John Stultz (1):
      (Test) i2c: designware: Adjust bus speed independently of ACPI

 drivers/i2c/busses/i2c-designware-common.c  | 25 +++++++++++++++++--------
 drivers/i2c/busses/i2c-designware-core.h    |  3 +--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 +-
 drivers/i2c/busses/i2c-fsi.c                |  2 +-
 drivers/i2c/i2c-core-smbus.c                |  7 +++++++
 6 files changed, 28 insertions(+), 13 deletions(-)

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIxBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl73jgUACgkQFA3kzBSg
Kbbg+g/w9a/+R1JHOq92KMkqn7Y7QjCpAOTKk7t5XvENzmMZFRyr01gDTI6cR/XW
ViV9/C4hygmDNpCiIFrguQKdDt7GVKARpKOWme/E3jl4LzlWIWEFHI6Bo1E+I8T+
cwHqLKHpXxHlig2GNydPtvTz7lO0tjDIdYwgoY/u/OEbLjCzgsxlLns5vS8gNBow
PokI93z83h0BQR6nBpuaa+y3JCF3BO5flKYVVB1dDroQWguvnLGGEgS7skKiQ0uI
Dzn8bcTwAYv5sV0c8JrfTH25/ayN92Mow6BBPDTld2gLpTOQ13ZXXPP5X/8WEZv5
xydQxOwELHURgmMqatPOf/Vf3BEtS6t1C/mhFAWBwtu7ZDNtf21fWCwhdBK8poS9
tVfLd0lJZi0hQzaYZc7PhtYAm7f8h90I6Z5d5vfjTvNn6h1YPXieZxCnylGAfGHw
AmgbjtwF6NOhoe+BId9fh5kCrEFsABq0Ngrb0TLlHbFI0rsub5dxxTSFoH4EG0vy
EFSkWSOr3cqcwHrs1XP2n4w5+jDRoEwF8XtpqaPOEAnc8/cksZ9ETLpLWbpFpxVz
HzXUuD/yFBGUlkaL/UyFhGA13ooyH2OZpJ7ULkoN+TNu1gqlukEQmxmrnWj3QlMd
qVCpa9oh6bkday24iI5JrXTohEPWC3Bv9zmZdM71SKqiAMsH
=pdhS
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
