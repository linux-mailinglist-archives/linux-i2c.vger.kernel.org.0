Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD7A13216
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 18:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbfECQVp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 12:21:45 -0400
Received: from sauhun.de ([88.99.104.3]:35006 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfECQVp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 May 2019 12:21:45 -0400
Received: from localhost (p54B33153.dip0.t-ipconnect.de [84.179.49.83])
        by pokefinder.org (Postfix) with ESMTPSA id 0C7D52C2868;
        Fri,  3 May 2019 18:21:43 +0200 (CEST)
Date:   Fri, 3 May 2019 18:21:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.1
Message-ID: <20190503162138.GA7676@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here are I2C driver bugfixes and a MAINTAINERS update for you.

Please pull.

Thanks,

   Wolfram


The following changes since commit 085b7755808aa11f78ab9377257e1dad2e6fa4bb:

  Linux 5.1-rc6 (2019-04-21 10:45:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

for you to fetch changes up to 72bfcee11cf89509795c56b0e40a3785ab00bbdd:

  i2c: Prevent runtime suspend of adapter when Host Notify is required (2019-05-02 18:42:15 +0200)

----------------------------------------------------------------
Anson Huang (1):
      i2c: imx: correct the method of getting private data in notifier_call

Ard Biesheuvel (1):
      i2c: synquacer: fix enumeration of slave devices

Jarkko Nikula (1):
      i2c: Prevent runtime suspend of adapter when Host Notify is required

Wolfram Sang (2):
      i2c: designware: ratelimit 'transfer when suspended' errors
      MAINTAINERS: friendly takeover of i2c-gpio driver


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: ratelimit 'transfer when suspended' errors

Dong Aisheng (1):
      (Rev.) i2c: imx: correct the method of getting private data in notifier_call

Keijo Vaara (1):
      (Test) i2c: Prevent runtime suspend of adapter when Host Notify is required

skidnik (1):
      (Test) i2c: designware: ratelimit 'transfer when suspended' errors

 MAINTAINERS                                | 2 +-
 drivers/i2c/busses/i2c-designware-master.c | 3 +--
 drivers/i2c/busses/i2c-imx.c               | 4 ++--
 drivers/i2c/busses/i2c-synquacer.c         | 2 ++
 drivers/i2c/i2c-core-base.c                | 4 ++++
 5 files changed, 10 insertions(+), 5 deletions(-)

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzMao0ACgkQFA3kzBSg
Kbbjpw/9E3A3lvEj8FUzoo/MNGa20QlRyFg+ho91Td6FCuytM0ojNsygaNs7E9G1
Lmy+n/3WX7LKMuQCykHItyC0KARp9VRG0Y30etCYO/gTW6llIdAbbcB14QO3y4qz
5SfVCKBgzdODlKiVYlTc3+iM7Wu5FfUtd2qfO1wN/uXDSZduBYN+8p21M80AMOt/
ZiEklFNRwMSZfMeDTWX+uCBGQxvxiOrq3OwuuPrOEak8PxQ+JjO8eGszEJK3o4z3
YD+K3pfwNeC18HnMUoCXKNRUcRFueQxsL5M4w/PcEK+h13PpgyZupvH6iNnBrDqp
4M8LXH7mgX7395FjWnKQ60LW/SibbZLQCNs23SgpqnDz6LQsue/7aOMRrpbsjZmM
jrA2cf7yq72Y7UvQsO0vmvVfQUyWfRbEkKO3N0kE1nVWs0z6trxipbNfS0YDTeqj
rdHLfZEfXFemAxRTqj0TdjHCOp/4GGbL4AKaYYAlS/86Zo6G84N6IPj+DRV9sXEY
pMf8VePaS7VNR+cGOkiIQCEiiC2R6fsWSYLR+ap93ylmvSSi+D7zcDkZ3haEIXca
sL6vbHbmAxaevRmByF1VRWBsySq3/2ICmAq8Fx8XieXptafEMRYCIvVA3YWebukX
maSSI9VNKCcZay+lF6JUPGMi5lI9VVT7dmmWXm2cDI6PfR+g8Ic=
=sLYt
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
