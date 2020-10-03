Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376C928219C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Oct 2020 07:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbgJCFcm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Oct 2020 01:32:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgJCFcl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 3 Oct 2020 01:32:41 -0400
Received: from localhost (p54b337f0.dip0.t-ipconnect.de [84.179.55.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCCAF206C3;
        Sat,  3 Oct 2020 05:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601703161;
        bh=ivPdo+afXcrBnRWmahPyp3SKVbAOjpAaMI2f+qq+UYc=;
        h=Date:From:To:Cc:Subject:From;
        b=HjyheEieSYiArv1ufpvKAuS+Q47TF7FBjKwsvlIO/ht7q2VzsDlnu8VVVgNo9EpFc
         zQW9VhiNivlQRtoMZZfaCxk/OzyBcqLDpXxP49Dc6+WJZ9cwL2J6k3hN1lVVh+bwSM
         d3Rszs6GbtYbZgLSd1XKUGCmrBS/TXU8/SQiD728=
Date:   Sat, 3 Oct 2020 07:32:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.9
Message-ID: <20201003053234.GA2550@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

some more driver fixes from I2C.

Please pull.

Thanks,

   Wolfram


The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to 8947efc077168c53b84d039881a7c967086a248a:

  i2c: npcm7xx: Clear LAST bit after a failed transaction. (2020-09-27 20:05:27 +0200)

----------------------------------------------------------------
Jean Delvare (1):
      i2c: i801: Exclude device from suspend direct complete optimization

Nicolas VINCENT (1):
      i2c: cpm: Fix i2c_ram structure

Tali Perry (1):
      i2c: npcm7xx: Clear LAST bit after a failed transaction.

 drivers/i2c/busses/i2c-cpm.c     | 3 +++
 drivers/i2c/busses/i2c-i801.c    | 1 +
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++++
 3 files changed, 13 insertions(+)

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl94DO0ACgkQFA3kzBSg
KbYaOg/8DNrKHEmaXW398wNKNBKhwF9JPBuTvGuxYH9AmtAULpu6oTMkipO/YiEs
WQ6Dr05Ayu+uztcetKywLql7mkQIJzsqdoYWqIXYF0B+zFY65pTonXCpU3JPiBs7
Lud4O6LF6rge35lNvBqfdr/4PtdI+I+HHJBQFPrDTo1N9xIx3ND319VVA01mgW2i
uXO1mwOZvnCG26ZvR7cweYFCaoGRQIIZcycoxepzVATqWjNhotQRTLAQu6a57LPQ
XTz4dpMwTexY0qLZHRMT9lA2Tn8S69oC+qQ5EsEKeB7z3E7f6XqpIxvd2WbcKbUq
clFsu5yTg0MsVpCAi53ohyznmrwoOvyGKn5qgvtk96Kps8QN1wms0I9vMCzDZOD3
J+Y9tjnbP285KYOX7+0+us+hy5XpGNHiQXB4GlLNv5CzpRi06Ya18+l0K+nH95gq
1OtpWi/FHlflCjOsD6cGYvzxCoEkY9Npj3xZh+hMrIlTGecV1FHA21mXLCwFTmq8
0eKMEVrm8I1R7ZR9D5RXGe7aMZDKeHwMPS3baxKxtSDNlpB9t2SYtKHZ28HTLITS
U573Yj9Fh81beTKOcj1D6eZ6ep1uJY8BeDzh6EX5uAcNqvJkWrVO6EyVJioAgsnD
1MkVkJPZdIQ2ilUeBG4U0/dU0/wgfr/xRWWfzhYyYHzUeiVlJZg=
=m4eH
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
