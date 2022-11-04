Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7D861A3F2
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Nov 2022 23:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKDWPF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Nov 2022 18:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKDWPD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Nov 2022 18:15:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E687429B8;
        Fri,  4 Nov 2022 15:15:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F17DB82FEE;
        Fri,  4 Nov 2022 22:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852B9C433D6;
        Fri,  4 Nov 2022 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667600099;
        bh=VW01bpiXVfIVafA9jeg060doi/YZQLDtAjzAykTx6pg=;
        h=Date:From:To:Cc:Subject:From;
        b=rAVJHTFAB/bRW5KGdrcKyJhDpq2OJOLf3a/niAC7RHG8ybFJlw/2RPnddKcz/gXi+
         Mn6cHNrUliVeBEf/jcUlbD+f078UrF+Mybvk/bnJCEwNZ10UWBEpfQelIs9ggITPO1
         JoixC/7hIx6B7KDCap3MbrcMqexCsdjstt5dyfMryTIUL7WnYHYRAak2rj/uWjWrfo
         Z9b9VrTtNlGVkf0oRar5CWy7DL4BULsCJpKLKkgoA7e/D7tdN0bYs9Q4TcGe8I5rC+
         EWDr52d2V2/unJ+/pfPAk5razHBRXP6gpHsZmjMtX1/x0sul0FBeK0pPFOkP5uqqIc
         YRiuVLSvysbyw==
Date:   Fri, 4 Nov 2022 23:14:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.1-rc4
Message-ID: <Y2WO1gSIY9CjCIU0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8wePXC1RGaGDKgPM"
Content-Disposition: inline
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8wePXC1RGaGDKgPM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 30a0b95b1335e12efef89dd78518ed3e4a71a763:

  Linux 6.1-rc3 (2022-10-30 15:19:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.1-rc4

for you to fetch changes up to 8e987f1f4da92d9f1dd020418bfab9fe04b1c54c:

  Documentation: devres: add missing I2C helper (2022-11-02 21:16:38 +0100)

----------------------------------------------------------------
A documentation fix and driver fixes for piix4, tegra, and i801

----------------------------------------------------------------
Chen Zhongjin (1):
      i2c: piix4: Fix adapter not be removed in piix4_remove()

Nam Cao (1):
      i2c: i801: add lis3lv02d's I2C address for Vostro 5568

Thierry Reding (1):
      i2c: tegra: Allocate DMA memory for DMA engine

Yang Yingliang (1):
      Documentation: devres: add missing I2C helper


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) Documentation: devres: add missing I2C helper

Jean Delvare (2):
      (Rev.) i2c: i801: add lis3lv02d's I2C address for Vostro 5568
      (Rev.) i2c: piix4: Fix adapter not be removed in piix4_remove()

Pali Roh=C3=A1r (1):
      (Rev.) i2c: i801: add lis3lv02d's I2C address for Vostro 5568

 Documentation/driver-api/driver-model/devres.rst |  1 +
 drivers/i2c/busses/i2c-i801.c                    |  1 +
 drivers/i2c/busses/i2c-piix4.c                   |  1 +
 drivers/i2c/busses/i2c-tegra.c                   | 16 ++++++++++------
 4 files changed, 13 insertions(+), 6 deletions(-)

--8wePXC1RGaGDKgPM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNljtYACgkQFA3kzBSg
KbZeWQ/8D7f5Ma5DmuMdQwOIf6QpB+nVc/DSb7hW7lXnT1ACyEkbeTQNOMfWBib3
eq24QwagwG6SRl3IYB7LT2PdKdFJBTP1Hu5khpBfP1d1sYjY56LtwpUOkVFAmWpa
mUar+eQpZAkgAnetUnUlO+8Hs8E2KyF0UlBBbVC6khbob9dw5Mxp77+gi8OHSoAW
XP2wvSGSenR+8IRt/QM+CZrWbr1gbFyD02d8HMfy4NRNqeSbxR0ol9JeRGviFjKM
lFVwdVjAwLqPRKl5bHKoGpzgtE9RLKi/GHw7UAKl5ePUTDOkQBEVShpSnmvKIUci
3lZuwaYMR84ieavtXcHcTNRw1nMdVA6H5L8PWCOrVOnZtcIKO0kzD0VKu9E2SQFo
xwVBzZGBZYO2LX1T9XFwo7HEwJ5UtqE1Sw0NnG9EeJ0ZTXaz+9M8lsOjYdzmSty1
7OjUaOTBBvXOy2WCFJtD2rozO1MQq+GQ4kX99UnB5OzW89KaPXfbRwUVWGcosD6q
/5+TKgdS62uDItRDWrZdiCPNe2cFfeu/Tr7pKbPlYLBnnfExWf18w7W+sk/PMOPM
E+bHxTZXVpGRVLyUsiMqfa19Xwevlc/M4kbOBmIvTWGgzOwshuQ0jAMONvikgKO3
XXaSymMZ06I+sr+75/KjqwFkmpFxQ3jVUk26PkwHTIPmcXVXW/c=
=uPJy
-----END PGP SIGNATURE-----

--8wePXC1RGaGDKgPM--
