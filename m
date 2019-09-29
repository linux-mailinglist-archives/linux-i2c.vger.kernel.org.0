Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 411C5C1438
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2019 12:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfI2Kj4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 06:39:56 -0400
Received: from sauhun.de ([88.99.104.3]:45488 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfI2Kj4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 29 Sep 2019 06:39:56 -0400
Received: from localhost (p5486CA3C.dip0.t-ipconnect.de [84.134.202.60])
        by pokefinder.org (Postfix) with ESMTPSA id 8C8682C01E8;
        Sun, 29 Sep 2019 12:39:54 +0200 (CEST)
Date:   Sun, 29 Sep 2019 12:39:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.4
Message-ID: <20190929103950.GA9497@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

this second pull request from I2C contains:

- make Lenovo Yoga C630 boot now that the dependencies are merged
- restore BlockProcessCall for i801, accidently removed in this merge
  window
- a bugfix for the riic driver
- an improvement to the slave-eeprom driver which should have been in
  the first pull request but sadly got lost in the process

And finally, my pull requests should be using utf-8 now.

Please pull.

Thanks,

   Wolfram


The following changes since commit aefcf2f4b58155d27340ba5f9ddbe9513da8286d:

  Merge branch 'next-lockdown' of git://git.kernel.org/pub/scm/linux/kernel=
/git/jmorris/linux-security (2019-09-28 08:14:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

for you to fetch changes up to 11af27f494086188620e7768e421894af93c126a:

  i2c: slave-eeprom: Add read only mode (2019-09-28 20:44:12 +0200)

----------------------------------------------------------------
Bj=C3=B6rn Ard=C3=B6 (1):
      i2c: slave-eeprom: Add read only mode

Chris Brandt (1):
      i2c: riic: Clear NACK in tend isr

Jarkko Nikula (1):
      i2c: i801: Bring back Block Process Call support for certain platforms

Lee Jones (1):
      i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630


with much appreciated quality assurance from
----------------------------------------------------------------
Alexander Sverdlin (1):
      (Rev.) i2c: i801: Bring back Block Process Call support for certain p=
latforms

Bjorn Andersson (1):
      (Test) i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630

 drivers/i2c/busses/i2c-i801.c      |  1 +
 drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++++++----
 drivers/i2c/busses/i2c-riic.c      |  1 +
 drivers/i2c/i2c-slave-eeprom.c     | 14 +++++++++++---
 4 files changed, 21 insertions(+), 7 deletions(-)

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2QifEACgkQFA3kzBSg
KbaqMg/+Icc3PCrKjMdaUaIMsJET5J4B1h8YBnCwuix4w29RbJfJsLCmYtMcrtkm
v6I2QRmKmvihaJ0ffPMthhVQby/6JJq7FP89gGWztt6y2kORrl3iXKVN0x5MhGsu
vIOx5WTF/Jq4599A9azewt4azydW8/Y3uHms80q7qGH1+tDgf0s9GJBxSe4avlXY
izgtTnjzJ77bpn2RGxJi8vf/NUfW5UjaY1Y7yKhk1EtKB46nMGRJ9BYBu6otJ9fQ
naqaLMBfVfigKQfiTHkyeR3g1IwcrRZoHGc//HB8dyTgMJSlYxLi55zg6aYr97/G
Ewedho7/+thaBuv5iJ2w69LhAve60ny7iwDBBAZC+i+KaSWjru3hL5v6nNig/oU6
lPjVKZiyOrKBj2LVY++q43+GG3LaadcX3Nz0kVh27jKe1SL0PznJHD6iRfwso6dr
HRVZIEg+mo19twOiwULK3iZWkmMZ/uCChWRO80EOsEVPEKa+ekExKV0MHICiwr0R
Oglm4oa94QP0PDLhvwv5CX9UMgK+b85/z15+AQzTsV2mF7Xc7gZ7FdpCL9YgQpSC
hy8XuWRlVLiZzWTGYLioKLwnI7xl5d9Nk+v506Cd1rl8YTeBjVuxlnRu7lLtmPsh
3qS62TrXOhlCU6kXb47fhLYmoXxm4bcA9ujerfbhptvQUYfqs7w=
=kJHR
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
