Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4478464CB
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 18:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfFNQp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 12:45:59 -0400
Received: from sauhun.de ([88.99.104.3]:54976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbfFNQp6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 12:45:58 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id A625C2CF690;
        Fri, 14 Jun 2019 18:45:54 +0200 (CEST)
Date:   Fri, 14 Jun 2019 18:45:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190614164549.GA6067@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has two simple but wanted driver fixes for you.

Please pull.

Thanks,

   Wolfram


The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:

  Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to a0cac264a86fbf4d6cb201fbbb73c1d335e3248a:

  i2c: pca-platform: Fix GPIO lookup code (2019-06-12 12:54:06 +0200)

----------------------------------------------------------------
Linus Walleij (1):
      i2c: pca-platform: Fix GPIO lookup code

Russell King (1):
      i2c: acorn: fix i2c warning


with much appreciated quality assurance from
----------------------------------------------------------------
Chris Packham (1):
      (Rev.) i2c: pca-platform: Fix GPIO lookup code

 drivers/i2c/busses/i2c-acorn.c        | 1 +
 drivers/i2c/busses/i2c-pca-platform.c | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0DzzgACgkQFA3kzBSg
Kba3eRAAj75yROtt+RiswrwgCX3rqNUMIjxEnXTBqs/yr9g+DvMtQ2nDd5t9al+e
2njvH5nCf5JU4cwgZhkfyYrDzYiZgvcb9+Womv816DHBw4tkFix6LLihEt/aNv2h
MGYB7ChfC+8iBGIONrjDGcOnSKh3vGZmjKpwRepDwpL+aXFFAr+LKG/CTUVY9cC3
qw0IWvc9Kr1dScxd2owjMTaUodMMS2CpsNKkazgC7/Czhf1PM+frcLcTSE2bXG2f
77Z2WZGgCENyulbeMFEs7XMWx6CnM88MchyQoRj+ReqXwaceCb0j/U8XT52zSZcY
BP4MrOx/5IvSmF5Q7HAXG9lc1eyZcnxWRiVnCH3MWA8BKkga8UOWe7QpSgGXt8nW
3bH3YWUHDyLkOP8BxO7tSSaSQEYgGAZA37yYOCVGaHEYqbGjM/uPEWYnd93WyY0A
K1LllsG+9VzXKNDOEBhQJ9U539slg13b7ZGbYhczxVCzEq9qYkIAcfWmPrc1iiC5
oz75ZwXozH9yXir6/V6p2qXp9/FGrQk7dMw1gzPClYGwlQkiwmuG/fMQIc8O/s7x
OxEoc4xm/VzxIOar7nFjWC0Tzq1JZuCxsWHGUB5ek6X6HOaRW1I62B2xwUYciOVs
jwV6/2L0tRl+UfY3KPmADTTrgXKKwGUwYKPDH9CCVMp297ubpVA=
=tPdC
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
