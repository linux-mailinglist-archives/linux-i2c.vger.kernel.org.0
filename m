Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500B0FF868
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2019 08:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfKQH2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Nov 2019 02:28:46 -0500
Received: from sauhun.de ([88.99.104.3]:60304 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbfKQH2q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Nov 2019 02:28:46 -0500
Received: from localhost (unknown [94.230.152.199])
        by pokefinder.org (Postfix) with ESMTPSA id 084602C01C5;
        Sun, 17 Nov 2019 08:28:43 +0100 (CET)
Date:   Sun, 17 Nov 2019 08:28:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.4
Message-ID: <20191117072838.GA1428@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Here is an I2C core fix to prevent a use-after-free in a rare error path
and an I2C ACPI addition to work around broken HW/firmware related to
touchscreens.

Please pull.

Thanks,

   Wolfram


The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to a4c2fec16f5e6a5fee4865e6e0e91e2bc2d10f37:

  i2c: core: fix use after free in of_i2c_notify (2019-11-15 22:01:13 +0100)

----------------------------------------------------------------
Hans de Goede (1):
      i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is present

Wen Yang (1):
      i2c: core: fix use after free in of_i2c_notify


with much appreciated quality assurance from
----------------------------------------------------------------
Jarkko Nikula (1):
      (Rev.) i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is present

youling 257 (1):
      (Test) i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is present

 drivers/i2c/i2c-core-acpi.c | 28 +++++++++++++++++++++++++++-
 drivers/i2c/i2c-core-of.c   |  4 ++--
 2 files changed, 29 insertions(+), 3 deletions(-)

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Q9qYACgkQFA3kzBSg
Kba1YBAAnuoNczP9ip7a7cP7XOPMYD62Wvq39XTvkTxEZ8soQswoSl9suw7V2L59
j5wsGhGasidouquuV/8Ah+Ri7NGxPyvWtms7d4SOBqXqRUqRZk19H35Zyzoa33z9
zhah9Au699nl0pz5ijfDTJ2herREyQ2BhQCyuS5QPkG0g64A6/I9+W5QvwB5haJc
8ebVr6+uNHilv6s60E8r/NBGaIIZjQKPL9tCzsX9TkKEmKaf4LlEGUnCm+jibQHU
moGAg7QgeVQY/43QPKby70z8TLhYJNksQz+ULAeyg+jexn+3fQjbCAQeUNLcelR/
CqkgZmQIAVkO6cbgB8VS6neN9poifrwADXwnUfhz5xmsAO4vH8rF0CzhoIuPEihO
/8K3tFH3OKSeUADYSXmu5Bwulo2dOT0BrOy9YJ+Khy1GtgDb5oLWasxXVM+w0rjr
R139gYFuD7XWAlmkQA9+4NL/+L7K855QTOyMxFrOdcMhmPvNUb/jBmz9dNR2ezX4
nwgnoR/Fe693vCOWtH/5toJqVUp7nSqS4twpyCqBK6pzn9XAXJx2GqzdnByRswEb
QUIph8jGLUiUtqoBZofKVH0CkIQCjmLSHgTkrg0ydyu/WZAO0MVbKXp3mrVZtvp5
Je+mKn2sNVYGb556RymKWaXUIA981onv21DjswQB5V4il+msag8=
=nyrg
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
