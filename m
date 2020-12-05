Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CCE2CFF70
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 23:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgLEWMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 17:12:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:53512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbgLEWMa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Dec 2020 17:12:30 -0500
Date:   Sat, 5 Dec 2020 23:11:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607206309;
        bh=W1Z4lXzpl/mzTU1gqCX+BTGRrg5JG01UX3/uWd9MSA0=;
        h=From:To:Cc:Subject:From;
        b=LliTTurgg658ocNr12XjosWRJbp+p+EVdT6sWA+/qlxfv1+6Hbau0XKPW7RDOPm+e
         BBXQstDUCJgN5sceLQ9dbbx/K7iwcJic3t1eUKlKgn5qslP95fFsSAuWG/8eWZPa97
         Dekz80shO4f7QYDppzokxsOoBK12ezfl65uYY6gbCI4FjIyvB/d7uWnkPLU5HBWcCD
         hzBB9BA+33ZxaCD+SdaG7ifwSzRoCY/a01Lgri2jUWUi1zKKWD9pYBODdxgmr5+bHg
         fOWjMkndO4FIXvRrCRJLZg6YUR3Y20uvcHrfDBVaSTG0xp9HH/BZ8SEzbfr28IQf9H
         D82xWT5ms5Rog==
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.10
Message-ID: <20201205221143.GA19137@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

here are some more I2C driver updates. IMX updates are a tad bigger, but
not exceptionally big.

Please pull.

Thanks,

   Wolfram


The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 2bf9545626f8d09f552ab86d0047a415fe9a07a0:

  i2c: mlxbf: Fix the return check of devm_ioremap and ioremap (2020-12-05 =
14:52:35 +0100)

----------------------------------------------------------------
Arnd Bergmann (1):
      i2c: mlxbf: select CONFIG_I2C_SLAVE

Christian Eggers (3):
      i2c: imx: Fix reset of I2SR_IAL flag
      i2c: imx: Check for I2SR_IAL after every byte
      i2c: imx: Don't generate STOP condition if arbitration has been lost

Robert Foss (1):
      i2c: qcom: Fix IRQ error misassignement

Wang Xiaojun (1):
      i2c: mlxbf: Fix the return check of devm_ioremap and ioremap

Zhihao Cheng (1):
      i2c: qup: Fix error return code in qup_i2c_bam_schedule_desc()


with much appreciated quality assurance from
----------------------------------------------------------------
Bjorn Andersson (1):
      (Rev.) i2c: qup: Fix error return code in qup_i2c_bam_schedule_desc()

Krzysztof Kozlowski (2):
      (Test) i2c: imx: Don't generate STOP condition if arbitration has bee=
n lost
      (Test) i2c: imx: Check for I2SR_IAL after every byte

Manivannan Sadhasivam (1):
      (Rev.) i2c: qcom: Fix IRQ error misassignement

Uwe Kleine-K=C3=B6nig (1):
      (Rev.) i2c: imx: Fix reset of I2SR_IAL flag

 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-imx.c      | 44 ++++++++++++++++++++++++++++++++---=
----
 drivers/i2c/busses/i2c-mlxbf.c    | 12 +++++------
 drivers/i2c/busses/i2c-qcom-cci.c |  4 ++--
 drivers/i2c/busses/i2c-qup.c      |  3 ++-
 5 files changed, 47 insertions(+), 17 deletions(-)

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/MBZsACgkQFA3kzBSg
KbYi6Q/9FXYNJyphRY5mN6hSv+OuZ3QKFIuL5mkOafp4rNvNCOZxlJ/gojpC1pAg
5SwUlIm5dgQZKPdwXry3C+1d0pSITzE8SVLPO6GYSh6RcSDRjctu0Fu4kL7Pgk+m
Bh2Ek1zKfEKtTw3n8Lj/0tbKAxxlWHKYkblST/s1wxg2kWOMED1aUvbb98AsAj1N
chFqvqpSTviOvKaM+zwsrCrdVmNLf7WbxlOBHjfGdYgztZqbDdtnQuGf1wa3Vhyu
FfrBbx8gb/neJ2jMO9rdnggmuO/qP8BvPgK01BkehBVKSRt08E12c01Wpyoc6gyh
1gCUJNvVm25L8whdRyDlMQiJr5Fbz/HPbTelKW32m5NbqO+zhod0wrvBmkAjHE/g
F1YCLxi+JlQP0B6vZNtTfJEV8v9dpxJZq2z1zUZ1ESJ4fUmeB+9anF5mtmzpc5lr
ArIcMYQkjhYU7bkTIZQURYajMn2ymzRkG3qAoSfo4Uz98jtRo8A1B4zh7x4rPApt
XxsZI8pW9jOKisXPvAJf2dU6F4lYxPZnt18QThE6WsGmnaSNW/f0e64WQeTStgiv
CUY7W4fDAwtMVs9N5TJbhn3jmOSVfFqiI2UCAMrnltQTjoUOtUHG8wHF2EcmrSKc
bDRXoBnzc/1NePIWjqsViT3xZopu9au/OWmAN0svw29VSAgNdc4=
=SH4K
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
