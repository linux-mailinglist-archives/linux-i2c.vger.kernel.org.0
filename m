Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279024470AD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Nov 2021 22:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhKFVgK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Nov 2021 17:36:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235433AbhKFVgK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Nov 2021 17:36:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D314760724;
        Sat,  6 Nov 2021 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636234408;
        bh=yI6yAhrbonu/TpC6YaDkYO2ZGG1mkoTR/0hKn7S6Yis=;
        h=Date:From:To:Cc:Subject:From;
        b=mqxSuCFaRiRy4/E+4IUt5mN68Fik4Zb7ky5chzrvWOwasGSav8VtJvOjDJckceFDn
         WUuGknseOBDTn92LsygscyF5rt/GMHsn++7zcFIPxsQLyVJmegq5B/R+A82OtzHg9P
         i4CcAH5JQ1uYraUZjFok0cWPdyGnosP0Tc63WzVMYwo/ZjKame2ZRabg8LDG5h0Jf6
         RSl/JzfefD5ymY/Cip+2Zo9H5j81wjEdl5SVTJcW3OcQPVxz5ayIv9hLooVhyRzzi7
         rH6xRrNmM2ilV6/H74PbVCLrp4YJ8hsSacWoYfkluej6ejAwZ1YCGYOoXTatilp9UH
         rqi5IRSAravCg==
Date:   Sat, 6 Nov 2021 22:33:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YYb0pFqpL113nWdX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Xc486AukXbUQm0Kp"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Xc486AukXbUQm0Kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is a hot-fix for I2C fixing an issue which came in via the mailbox
tree.

It is based on your tree as of today. Please pull.

Thanks,

   Wolfram


The following changes since commit fe91c4725aeed35023ba4f7a1e1adfebb6878c23:

  Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi (2021-11-05 08:42:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to c80be257a4cd0f72c083e6056ff0ce2da871e9dc:

  i2c: xgene-slimpro: Fix wrong pointer passed to PTR_ERR() (2021-11-06 22:09:37 +0100)

----------------------------------------------------------------
Wei Yongjun (1):
      i2c: xgene-slimpro: Fix wrong pointer passed to PTR_ERR()


with much appreciated quality assurance from
----------------------------------------------------------------
Sudeep Holla (1):
      (Rev.) i2c: xgene-slimpro: Fix wrong pointer passed to PTR_ERR()

 drivers/i2c/busses/i2c-xgene-slimpro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--Xc486AukXbUQm0Kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGG9KQACgkQFA3kzBSg
KbZ0nw//YyrxIuvLKC7knYyDgwoe77UN9BzGJm/azYOh7Kqb1yto0B/Nqk7/2Ibg
r0w0s1yzv5GGNn5kxpRTJVfJhlTjY4UeM2Sw9Gw9hSYLXRoC9KWRuyP93I/TxGrx
u4l9YflGgwoPLKkqJn3A7QflxbVz5lO4sr8S5yavbB96Y52HP9TD+pd7I8lyoI4w
N7PkIrdVuZlznA1mDleEdz9fpT4nLpqavu9Hf2gmDfeqA5E2E+B1LdcIrpONjWFj
f/X8npGOYmyAuOxH+IJfa7unI+Varp2HoCVLZi7h+wtxyABki5yUJuZZv9dVyDQG
I6TqryduP7XIGkYrzP9JPJK91Fz8yfEN7eQ1gKLB8K5YUlobyi1i7uJsbA+K5bxg
yi68I2WDVBN6Qnxw7n3TprRYpa0+DkaP9rmfMzl1XKNi03lESfnVQmsChbgfZQTQ
KhFhpEAC53hpkfcqHEnN4vYOTK25W/IG30dPnHbQJOzvtYPODa1N/71vpvURDCFb
idVlG12JZlgB/qSpg/scJ65YId2UUZ2RhGryYy1LsZF1PQBra2wOyCDKWR5ztCuO
8ijsHEErx8+nvZkg+u9H8CBmQ/nogAXJaTWHceIqg4m6KMQ6cciPNRgSkJHPWNWn
XYILFgCFQC8BPD0Rkxe7sMdCMQaEiX4lDiMREeqav2QSTfya+Eg=
=GSzX
-----END PGP SIGNATURE-----

--Xc486AukXbUQm0Kp--
