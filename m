Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABD61D9027
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 08:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgESGgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 02:36:19 -0400
Received: from sauhun.de ([88.99.104.3]:50420 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgESGgS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 02:36:18 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id 3FFC22C1FA8;
        Tue, 19 May 2020 08:36:16 +0200 (CEST)
Date:   Tue, 19 May 2020 08:36:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.8
Message-ID: <20200519063609.GA2141@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is the pull request which I missed last week. It contains a set of
driver and core fixes as well as MAINTAINER updates.

Please pull.

Thanks,

   Wolfram


The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:

  Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to efa7fb4c6c8e4171fd29a5935a9dc7a28e363278:

  MAINTAINERS: add maintainer for mediatek i2c controller driver (2020-05-15 11:40:54 +0200)

----------------------------------------------------------------
Alain Volmat (1):
      i2c: fix missing pm_runtime_put_sync in i2c_device_probe

Atsushi Nemoto (1):
      i2c: altera: Fix race between xfer_msg and isr thread

Christophe JAILLET (1):
      i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'

Codrin Ciubotariu (1):
      i2c: at91: Fix pinmux after devm_gpiod_get() for bus recovery

Gustavo A. R. Silva (1):
      i2c: mux: Replace zero-length array with flexible-array

Qii Wang (1):
      MAINTAINERS: add maintainer for mediatek i2c controller driver

Wolfram Sang (2):
      i2c: use my kernel.org address from now on
      i2c: algo-pca: update contact email

 .mailmap                              |  2 ++
 MAINTAINERS                           |  9 ++++++++-
 drivers/i2c/algos/i2c-algo-pca.c      |  2 +-
 drivers/i2c/busses/i2c-altera.c       | 10 +++++++++-
 drivers/i2c/busses/i2c-at91-master.c  | 20 +++++++++++++++++---
 drivers/i2c/i2c-core-base.c           | 24 +++++++++++++++++-------
 drivers/i2c/i2c-core-of.c             |  2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c |  1 +
 include/linux/i2c-mux.h               |  2 +-
 include/linux/i2c.h                   |  2 +-
 10 files changed, 58 insertions(+), 16 deletions(-)

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Dfk8ACgkQFA3kzBSg
KbbYGw//Q3qxp5Z7IJBeSHbJfiNwwa6YhbrJeUvfvXPlzC4c4yFZvfUIGimWeNt8
RLCwDfMJDefbcPm65d9iKmwiYJ04rNpC641vdBDXSHeDC5bbSUq6tsDN1uZdGHWp
MbeKeQNiSuOA1B9UJWkVpUksrHu3srHGPSzfXmf9DaVC31ZvOUQzpcrQvKP1Y/JH
lAz+YqzKtaw9Ms+znv0sKY/Jr89DxIC+L9rIVnYFQ5ozQCne+PNQ+JjuCaTvaSsf
vhUbTL1kThSHJC46p9nVDOOTsJw7hVNaOkPgfoc+9F8u3UASI2xLjEdJeQ0FKcMQ
m1UJSLDJaICtQPzwezLfS/LnjQ4Kfr6VY2kBe6pxtAYiPNdI50gsaR39csgHQFyF
Ip6B5CeKb+kZ+D0SplG2p7GUW61AQX8lzo/KkBDTSK2MkzyjOzJc9XdIP8KYDCCy
Bbv+AiSEeuZmSHFEEcaDbT9nwNh6xpCNYh0p1n6vrJKkK2aFSyiEyj93kC8TnOkM
5IlV9VTAQZHi44UMRpn3fha28Bmch1UO95wJEipw7YwROEnMk74dAFy7guB6pn9r
7fwZYgFx2wA+Nc4wzWKzuha4bjmgv9cAguF6xOf5XZ2GwRrK1IVkGrMxoeUMY16T
OTfvFsDWEtJ9lkeKp/uNjmxebOFV1BSUrQtZ6P1Bvljyd3D35ug=
=E0Rw
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
