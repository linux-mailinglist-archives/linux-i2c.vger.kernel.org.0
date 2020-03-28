Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935CA1968F8
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 20:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgC1TlG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 15:41:06 -0400
Received: from sauhun.de ([88.99.104.3]:58344 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgC1TlF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 15:41:05 -0400
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
        by pokefinder.org (Postfix) with ESMTPSA id DDE7A2C1F57;
        Sat, 28 Mar 2020 20:41:03 +0100 (CET)
Date:   Sat, 28 Mar 2020 20:41:03 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.6
Message-ID: <20200328194059.GA1632@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

I2C has three more driver bugfixes for you, and two doc improvements
fixing build warnings while we are here.

Please pull.

Thanks,

   Wolfram


The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 14c1fe699cad9cb0acda4559c584f136d18fea50:

  i2c: pca-platform: Use platform_irq_get_optional (2020-03-28 05:03:17 +0100)

----------------------------------------------------------------
Alain Volmat (1):
      i2c: st: fix missing struct parameter description

Chris Packham (1):
      i2c: pca-platform: Use platform_irq_get_optional

Chuhong Yuan (1):
      i2c: hix5hd2: add missed clk_disable_unprepare in remove

Kai-Heng Feng (1):
      i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()

Mauro Carvalho Chehab (1):
      i2c: fix a doc warning


with much appreciated quality assurance from
----------------------------------------------------------------
Ajay Gupta (2):
      (Rev.) i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()
      (Test) i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()

Andy Shevchenko (1):
      (Rev.) i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()

Patrice Chotard (1):
      (Rev.) i2c: st: fix missing struct parameter description

 drivers/i2c/busses/i2c-hix5hd2.c      |  1 +
 drivers/i2c/busses/i2c-nvidia-gpu.c   | 20 ++++++++------------
 drivers/i2c/busses/i2c-pca-platform.c |  2 +-
 drivers/i2c/busses/i2c-st.c           |  1 +
 include/linux/i2c.h                   |  4 ++--
 5 files changed, 13 insertions(+), 15 deletions(-)

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5/qEsACgkQFA3kzBSg
KbbiQg//UzpfE121KV3F7OUw3dwk1En3i69/9EIyJ8s/ivrVCntCMFJWAh38cHnL
tj+aclUL6I1+LJfhOGSQdCSSs7JT9vrRh7VlFdYRnckWeaPqpCURxAhseH970wT0
74cD6tS5lTCrgVl/Nvp35EJQrV827URkzM5wRhLnqehrB8PcZ+ZQ53iPe13nJNMO
AgEDw0jwrv9HfcjWVDIU4sIi8hIVoRoDa99tRmaLs+oXCK5tF5onibBNkPe9UkjI
zNfsoCUqvdN84RnCmr+wSQwA845Mlgre+yOx1KffFUddtfVbV14IMdhGtjGA7ZCx
TfReYxJfD4MP3Ara2iT1qZYExv5jakLCrneyzeW2P79M9JM8QU0XiSxvdKLQl8zQ
t2jOlua8jTkcEgRY87Mh2he+PZgy9KWY6Wp4Gm+0GJRcohLQWYlo6LRx2rzN87Hf
FbBehZHnbCYpReFIWCiWUJoIyyCYe2l0uUaZcvtdw5dbZZ9riknJjJfvhPNNJRwY
XBIUMBLpTcrsRv8Q4BX4msMb5Zu1iPwqYMJ37WDiQW0puJBCUC32RzXr+8sP+oIO
pUQla9UXLpC5HazV1llyYYot1D5rw9zHv+lYN9uLTLwYnjFzG2mkRGRhiqLZKKEO
YVwlU3hu7mPyeM16djrmdaRHYjgQKoFHzASSrbEK+djUMHjJRi4=
=1Pp0
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
