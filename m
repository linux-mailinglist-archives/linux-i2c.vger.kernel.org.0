Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C01214ABE
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jul 2020 08:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgGEG4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jul 2020 02:56:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgGEG4k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Jul 2020 02:56:40 -0400
Received: from localhost (p54b33111.dip0.t-ipconnect.de [84.179.49.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88F1420786;
        Sun,  5 Jul 2020 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593932199;
        bh=aAnhab5Td6gyYsvl9oPoynXib/ICM9SQvl8ML3UYUro=;
        h=Date:From:To:Cc:Subject:From;
        b=RDvNdu2b5k8bicUwG02dE1ms6AvTLCS0JRKGZaF4Tp4/JvMpardboWK3c7jbDsOWl
         FoA1SUsMNgWKf0qtisbCm6cmwvF7cSszu+iN1zBw1vmdf+8Wpr2jTcQ85kLKSWmxJ1
         /LjXMyCWdgRD8zxvjh48M49i6KJs6ByMFF4vM5eA=
Date:   Sun, 5 Jul 2020 08:56:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.8
Message-ID: <20200705065633.GA1175@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has some usual driver fixes and documentation updates.

Please pull.

Thanks,

   Wolfram


The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 597911287fcd13c3a4b4aa3e0a52b33d431e0a8e:

  i2c: mlxcpld: check correct size of maximum RECV_LEN packet (2020-07-04 0=
8:20:38 +0200)

----------------------------------------------------------------
Andy Shevchenko (1):
      i2c: eg20t: Load module automatically if ID matches

Chris Packham (1):
      i2c: algo-pca: Add 0x78 as SCL stuck low status for PCA9665

Ricardo Ribalda (1):
      i2c: designware: platdrv: Set class based on DMI

Wolfram Sang (3):
      i2c: slave-eeprom: update documentation
      i2c: add Kconfig help text for slave mode
      i2c: mlxcpld: check correct size of maximum RECV_LEN packet


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: designware: platdrv: Set class based on DMI
      (Rev.) i2c: algo-pca: Add 0x78 as SCL stuck low status for PCA9665

Geert Uytterhoeven (1):
      (Rev.) i2c: add Kconfig help text for slave mode

Luca Ceresoli (1):
      (Rev.) i2c: slave-eeprom: update documentation

Michael Shych (2):
      (Rev.) i2c: mlxcpld: check correct size of maximum RECV_LEN packet
      (Test) i2c: mlxcpld: check correct size of maximum RECV_LEN packet

Niklas S=C3=B6derlund (2):
      (Rev.) i2c: add Kconfig help text for slave mode
      (Rev.) i2c: slave-eeprom: update documentation

 Documentation/i2c/slave-eeprom-backend.rst  | 22 +++++++++++++++++-----
 drivers/i2c/Kconfig                         |  7 +++++++
 drivers/i2c/algos/i2c-algo-pca.c            |  3 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c | 15 ++++++++++++++-
 drivers/i2c/busses/i2c-eg20t.c              |  1 +
 drivers/i2c/busses/i2c-mlxcpld.c            |  4 ++--
 6 files changed, 43 insertions(+), 9 deletions(-)

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8BeZsACgkQFA3kzBSg
KbYlcg/+JoVj4W2jIPGKRpCznsQtnBxCFC2M4AZvk5lOM0coxKIlwVTcbLVS9NQT
pyYwt9ybrrMfl2XEC3xO2IBLg3YDRGk6/dqjJ5bBU+kZDRPA0r+90baulAcul2LD
BB7DcsLcf7TG0E0EnyYheqk1YxbpRtXhMv+BU7z3Gxc7FymgKyfQ2sBw+Tpjs9Mt
VlyIl5yjkStg0h44g7XOi2s28oHNSNVYuDRZRxWsZN+q2Wf6mHGQBg62fxTm58sZ
/hyvWaOcHDJBT3TX/SQjQ4i+imjKWPg5ST6OdmBpB8zLH1vS93OADLUFd2wlw/a7
vvBrP08OssCy9Z62Hjd9kMthU6zih3xdWOgdhtuxuKJaSyGVJ/kolSEMjDlwO3Tx
C2/RFtSS9iEPub8RuR23AZgZVyL7oEZJve3psM9WuCyxFae5TidyuQ/pByhgwLEd
akZ+jq8GkB9QEPjD6abvShrF/ZXNLbY9i057UmBkFF0ccHWOsBCJ5YR7K5HqawX5
vEaAakW3M+osd1MDA1ubKQ0uikPp+Fw02kZUqFyeHU+/ateVSkTAUhqWe5RGBt/2
bOtRXSfKibOuiobl9gdRRxfj0lTRUicj/br+WzPCDAQ5LOEHi1xxnco7Z6/jLjg0
tJhfNkxKOOTrAxxfpbgtfkaGu4S1dKNSRZsryD1rjAtiDoEo4JA=
=ezI0
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
