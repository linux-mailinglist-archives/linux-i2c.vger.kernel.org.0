Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6282A234B84
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 21:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730850AbgGaTQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 15:16:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730177AbgGaTQ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 15:16:57 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A897D21744;
        Fri, 31 Jul 2020 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596223017;
        bh=uZBsxMjv/LVf76C1qg/aXbjVQV+re7IP0Tfx88ohJqc=;
        h=Date:From:To:Cc:Subject:From;
        b=mp/3D3suDlIb1qj51uKmnlQPrBM0qHOQMvJ/qZvVS8K0sS+QhKee3/gMfS4EZMIlC
         mQ9hjU+9Tl9uEw+Gp6mN3xOq6Aye8NOcvFJWVCQR/C8UvNz2bBNyYyDXy3ZStocoGM
         UBUSe3jqszS5TzIg4PUqxiwoD3V1bcbcffP3lZtM=
Date:   Fri, 31 Jul 2020 21:16:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.8
Message-ID: <20200731191654.GA14800@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are some I2C core improvements to prevent NULL pointer usage and a
MAINTAINERS update.

Please pull.

Thanks,

   Wolfram


The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 8808981baf96e1b3dea1f08461e4d958aa0dbde1:

  i2c: slave: add sanity check when unregistering (2020-07-28 18:37:17 +0200)

----------------------------------------------------------------
Akash Asthana (1):
      MAINTAINERS: Update GENI I2C maintainers list

Wolfram Sang (3):
      i2c: also convert placeholder function to return errno
      i2c: slave: improve sanity check when registering
      i2c: slave: add sanity check when unregistering


with much appreciated quality assurance from
----------------------------------------------------------------
Alain Volmat (2):
      (Rev.) i2c: slave: add sanity check when unregistering
      (Rev.) i2c: slave: improve sanity check when registering

Andy Shevchenko (1):
      (Rev.) i2c: also convert placeholder function to return errno

 MAINTAINERS                  | 3 ++-
 drivers/i2c/i2c-core-slave.c | 7 ++++---
 include/linux/i2c.h          | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8kbiIACgkQFA3kzBSg
KbYt6RAAnqY3bxaqD7na5mS6hbXF4BpPnElXijeL8bdoglwCTFzTmVAVPUdEHq1J
xXm3jCXVUkgwKmdQngWktQQu0ivaeGFwBitFSccydjRUYAWm/PkQs8OPjw1MLhxa
WxTiAufcKvPqJ4tereUMWY7Xld2AEa2UfRwJ4O17jDmQKW2fhRw3/hSVzZIveSN7
4PGpbd5O5P2RjbjDit7lkyuE6A6OI7jqFNn8pszmfIYdDrke4TKvXop7MK4UdDVJ
c2j9WdHvd/I1hR1QQWtbMhFXxbHTIbwIC3TO+E86dBqqQLS7yWC16jgWeSX3qXWP
+0mhWYG/0jGb1LQKB4g5ESpb6vMDPw4lTJwDgEj3SG+vH8uOl3NWiNp6LTMuBBb4
ZleP3WyLrXbISfm+BYki1B4+tUNFPm4xMeXMieIc2i37vEPLzQqA4GSutB19aPVF
e74vjgJDbqDuxi1okwd8Qih3BusShRX+m16lpnjq6nE7QWLBp/1AwQCROlbLPpmi
0AMHd5WgszBgv4wam9a3/+6PD1Di00BDeELsIo9bTbmbo1DwzCrtlgqnFlFgB8AL
5ypQTmKnxsEMIf9euStR/9uG13Q8MJKJqU2XCch6K4EAFwLdkQY1Gy9Y7gTWjLQ1
0orvlgjcQFSZ0Y3xBO3QmUlYvqe0YLZYhDwYsXJ2Qc/zR74aLQI=
=/pKd
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
