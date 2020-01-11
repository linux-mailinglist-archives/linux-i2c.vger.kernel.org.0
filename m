Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B289138375
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jan 2020 21:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbgAKUHO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Jan 2020 15:07:14 -0500
Received: from sauhun.de ([88.99.104.3]:47180 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731046AbgAKUHO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 11 Jan 2020 15:07:14 -0500
Received: from localhost (p54B3334B.dip0.t-ipconnect.de [84.179.51.75])
        by pokefinder.org (Postfix) with ESMTPSA id AA6E62C06AC;
        Sat, 11 Jan 2020 21:07:11 +0100 (CET)
Date:   Sat, 11 Jan 2020 21:07:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.5
Message-ID: <20200111200704.GA5308@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

=66rom I2C world, here are two driver bugfixes, a documentation fix, and a
removal of a spec violation for the bus recovery algorithm in the core.

Please pull.

Thanks,

   Wolfram


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to cf8ce8b80f8bf9669f6ec4e71e16668430febdac:

  i2c: fix bus recovery stop mode timing (2020-01-09 22:21:08 +0100)

----------------------------------------------------------------
Eugen Hristev (2):
      i2c: at91: fix clk_offset for sam9x60
      dt-bindings: i2c: at91: fix i2c-sda-hold-time-ns documentation for sa=
m9x60

Russell King (1):
      i2c: fix bus recovery stop mode timing

Stefan Wahren (1):
      i2c: bcm2835: Store pointer to bus clock


with much appreciated quality assurance from
----------------------------------------------------------------
Codrin Ciubotariu (1):
      (Rev.) i2c: at91: fix clk_offset for sam9x60

 Documentation/devicetree/bindings/i2c/i2c-at91.txt |  6 ++++--
 drivers/i2c/busses/i2c-at91-core.c                 |  2 +-
 drivers/i2c/busses/i2c-bcm2835.c                   | 17 ++++++++---------
 drivers/i2c/i2c-core-base.c                        | 13 ++++++++++---
 4 files changed, 23 insertions(+), 15 deletions(-)

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4aKuMACgkQFA3kzBSg
KbYAAg/+Ihepsp+HZa8Pjwu8DvfIOAKWINVVXObI/1oftlpqKwnEICzdvLc7/zJt
enIztwdaxXkPx51hwJXRQlATlAE5GkrBmG++NsM/ltiajFCcXyzYjHF1hwtiOGbS
ZDbKu7TGHrWZXDCgR3ZpymyvE1dgqXyxSBAJzf/iejTx0wWqdSRq2Bvxo+XsZnww
ye/zZbY8ToH1+94ruckgksx05yiB0YHXFgwuNapI79jJSgbKHUyVy11Ab6LPGOlu
5tsov6tmUnpOhiaXeEoDZwrPAsPMpgboui+lzQ9DdCVD0rWTsY3dwBuruRFHcYsp
bn8WcHEfmYgTMg3/RWxqQDGaZ4MBI+gX2Ld8has6p3/qu55ijgT6seXIDbbr5q2N
ifDAK5tEoUxVHXN4ZZhY1uVGkaWtmiP/ASmOyLad9kUWMj7IIUsEMfTuBSOum+q6
IEZB1EpOBN43fq09oyL9KeqeF9+/eL5gNECie8iie8VZ5vPd/fzNDA44iJzUI5Rp
+j8sWu3y6xB6ml1LZS0LiTMAqfVi1y0gKmr/MnoTFb8UILr8k+knhiQPvtaard8m
cj48SovVgRZ9GaCr8dG4Uc3BLboo8mwPJAFRUTXRPc84h/ed823+n2PzKixkLOZy
aGl8eZuxH2ZIQufEsheu6ICWBYCHsYyzz7LQPplwpboIERxs47g=
=nWNm
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
