Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AB739BEE
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 10:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfFHIyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 04:54:14 -0400
Received: from sauhun.de ([88.99.104.3]:50966 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbfFHIyN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 04:54:13 -0400
Received: from localhost (p5486CBCC.dip0.t-ipconnect.de [84.134.203.204])
        by pokefinder.org (Postfix) with ESMTPSA id 31C082C3637;
        Sat,  8 Jun 2019 10:54:11 +0200 (CEST)
Date:   Sat, 8 Jun 2019 10:54:10 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.2
Message-ID: <20190608085406.GA1746@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has a driver bugfix and a MAINTAINERS fix.

Please pull.

Thanks,

   Wolfram


The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 8f77293cca1f5116edc98d7a0e36c6da3917fc08:

  MAINTAINERS: Karthikeyan Ramasubramanian is MIA (2019-06-08 00:32:50 +0200)

----------------------------------------------------------------
Robert Hancock (1):
      i2c: xiic: Add max_read_len quirk

Wolfram Sang (1):
      MAINTAINERS: Karthikeyan Ramasubramanian is MIA


with much appreciated quality assurance from
----------------------------------------------------------------
Michal Simek (1):
      (Rev.) i2c: xiic: Add max_read_len quirk

 MAINTAINERS                   | 1 -
 drivers/i2c/busses/i2c-xiic.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz7d6kACgkQFA3kzBSg
KbbNzBAAkTwbbglUamLuV1jUGB9KzuTIyXY7XkQpYo02ksw8X2b66Ipdfc59KVfW
LJxm8efPLOVx+rlvZ/eB4J1vu7OQqHHvihV8G6GTM/9GAmSusnkITNLpGJ645Gc4
s9hy0Wbq2rrLMVNCJnxsr3njediP/y766RfzHQhxS7b9UtwQu05mr9cyrE+XQCs2
MdJNDEZeN+J6lbhjj3ErSBKiKenlrz6FAggKazP3fhD/5Yhv1Uh6InigL/b6XuEc
MbAbiNuwy7OPeMLZPi7AzP67yTRAd6NR7wI9Twx1llyqfcYakm+dFER4HHNEqdi3
j/SSPIfZeNJakz/CYr0xoKBPUwsHmdAe/vNmCDgsF6n5K3v9CXmPv52ycjmby1zy
Qq0WQWq12ELCoUZozxJPqjNDaAuXvyII57hJu6UciIE0shWqHUsClPvveZCR88kX
r+XHNiE+xSab1OfIIHNAqxKq4jvBcPyo40jQK1oWVrJWoJM4KUdspNWnAKnPHLoI
YgbbeOx+w8OlT2WNw8rywOvMmpqSSQS/qiIjdXe7PuKw9zBa42KQRwwxPKgNjccZ
ubI/nVv0Y+aSd+HOnoypkHCO8ZTdGEkt/MQ2leF02DWMfcNX/AUYJyMmd87lv7aA
jH06Eg/6+x9vAV87zPgrOqJOfkTO9Ygqa6Z+I0K9LNIBdVsTk4E=
=8khH
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
