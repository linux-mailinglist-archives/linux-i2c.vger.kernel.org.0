Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AE372AE87
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 22:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjFJUFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 16:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjFJUFR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 16:05:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0628358E;
        Sat, 10 Jun 2023 13:05:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FD7260C25;
        Sat, 10 Jun 2023 20:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE21C433D2;
        Sat, 10 Jun 2023 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686427514;
        bh=VupPv2L+U3yNCwOQcFzd2ET7LJg70+iwJuBnIghA0Wg=;
        h=Date:From:To:Cc:Subject:From;
        b=kl4MzrRsCPzcsSDPtzBUR2YZiwrmZA0PZ9ONu4vcMSylF+iqiAKlJANu+0DPfmQrA
         rx1IzSlpghdJIvD33vWtJlAa+adwuhLLSd+IBnpp0e3sIyPcZnjAIZjq+4Si2U25Ie
         VNs9TPp/vl5MZjdO1mGrqf85fPzgQU00e6Rgw5UhTbMHSfJm3wxeSsMax33Fw9qxRh
         Z7YBEnpfyqNkPqpIWcvwtRhCKio6Kmw1xiJTe28Xtgt0rMFc5h7GnRnueEpoT0i+rM
         oy2Fqq7NLpPdEXI4Mhk41iAXTiGiF0br2yya+o/L2+mmBxS0wiaIzV13le2OSEbVyu
         ljmO6wEKQDraQ==
Date:   Sat, 10 Jun 2023 22:05:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.4-rc6
Message-ID: <ZITXbyXsKRMZtIaT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ycMUydAE0N8V52U0"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ycMUydAE0N8V52U0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.4-rc6

for you to fetch changes up to 33f36147be36c5fa0919d32d20d501ca97981d9a:

  Merge tag 'at24-fixes-for-v6.4-rc6' of git://git.kernel.org/pub/scm/linux=
/kernel/git/brgl/linux into i2c/for-current (2023-06-09 17:14:33 +0200)

----------------------------------------------------------------
Biggest news is that Andi Shyti steps in for maintaining the controller
drivers. Thank you very much! Other than that, one new driver maintainer
and the rest is usual driver bugfixes. at24 has a Kconfig dependecy fix.

----------------------------------------------------------------
Andi Shyti (1):
      MAINTAINERS: Add myself as I2C host drivers maintainer

Biju Das (1):
      MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver

Christian Heusel (1):
      i2c: img-scb: Fix spelling mistake "innacurate" -> "inaccurate"

David Zheng (1):
      i2c: designware: fix idx_write_cnt in read loop

Marek Beh=C3=BAn (1):
      i2c: mv64xxx: Fix reading invalid status value in atomic mode

Randy Dunlap (1):
      eeprom: at24: also select REGMAP

Simon Horman (1):
      i2c: mchp-pci1xxxx: Avoid cast to incompatible function type

Uwe Kleine-K=C3=B6nig (1):
      i2c: sprd: Delete i2c adapter in .remove's error path

Wolfram Sang (1):
      Merge tag 'at24-fixes-for-v6.4-rc6' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/brgl/linux into i2c/for-current


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: sprd: Delete i2c adapter in .remove's error path
      (Rev.) i2c: mchp-pci1xxxx: Avoid cast to incompatible function type

Horatiu Vultur (1):
      (Rev.) i2c: mchp-pci1xxxx: Avoid cast to incompatible function type

Tharun Kumar P (1):
      (Rev.) i2c: mchp-pci1xxxx: Avoid cast to incompatible function type

 MAINTAINERS                               | 11 ++++++++++-
 drivers/i2c/busses/i2c-designware-core.h  |  1 +
 drivers/i2c/busses/i2c-designware-slave.c |  4 ++++
 drivers/i2c/busses/i2c-img-scb.c          |  2 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c    |  6 ++++--
 drivers/i2c/busses/i2c-mv64xxx.c          | 11 +++++++++++
 drivers/i2c/busses/i2c-sprd.c             |  8 +++++---
 drivers/misc/eeprom/Kconfig               |  1 +
 8 files changed, 37 insertions(+), 7 deletions(-)

--ycMUydAE0N8V52U0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSE128ACgkQFA3kzBSg
KbasWBAAqoJ6JAc6wUVnWG8QTSeovTAeY2UKyLGLhEgti5hqqDgsS+qmwz6uzbYN
l9lU4rUFG0lE1JJS5l5C3cHH2yxKOZddv9VqhNjiNnLFXNWYz9gkXjN7/W+pdhSu
zrUVY+P+LOqzGvSRUQPc/MAwq+MN40gIp/lcrC/LtFijIlrKncVqhIXe+CxOdcbV
7/Bch7BbEFevJjkAbLXNu5qR8iOtTX/op4ytBffeQT9/s2O6y0Jb9r0Qnvi/W1M/
4VJWGYhP66c+zDk68KXKcjbNgJCpyy9UXCCnAo/sP2Fk3AnexpewOO1ptLyHL4Q/
CCM8p/6EV2BKZ2D4VemXy0QN77sZSBl4X3Dqp0+IuSQWs4r5Uc4seA2omyRrr3qP
AAS4cYVUlDCzSeuJrWcwv6cg0CjF1cjmNxqp5eXnxy992FJEjw6qgG49ZFtCrudw
dKzpLjir4RHRUWlZiHy7+m0Gzhe9DjcGP6PPuBPTv1EvISsVvkcRA5U1MWPWSGgv
EP7f3QQ+x7EByYLp0f1udxZiG67HCDvr4OSKpsDq0MJhaNZKxMqrQU0UvTfsqOHX
x8X0x8YWSSzyr/ieVTHdzCV0RgNTU+AxnH75BlL7KaHxSEZUxLmfCvIOyxz+B6ey
8hA/t2VaxtZsaCrEX4nCT5LV3u2X6vAu0NvOSFGBiHoy6MOZW+s=
=ROVt
-----END PGP SIGNATURE-----

--ycMUydAE0N8V52U0--
