Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E98326D5E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Feb 2021 15:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhB0ONM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Feb 2021 09:13:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:33316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhB0ONL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Feb 2021 09:13:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C659364EBC;
        Sat, 27 Feb 2021 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614435149;
        bh=EG2dTmL+C79jw0ZfgsnTA+HlsmjYsm4eLiAQ+fjuRSM=;
        h=Date:From:To:Cc:Subject:From;
        b=ZSVdiuEgf2GenOlCRQnYHYBch2+5doJW13GbJPPOgSACzVTxCpzNSvp9T1arfrh0G
         1vzdYdrX9wEthuOe+loML5fo0C9RUsMcT2Q/wkbVEMSS7kM8egEvHpvlG35j3bGF78
         nwJdogFlfQHmRaCS6D5id8Eh7GqtxFjnNvLTdVdjs0KFwD6lWRVmG/4oaECrEYqemD
         wyWhp3O5QWD8ifgIhGX63BBzwYm8unrMk7LzMCqN0bXhuScjWxvdC/e7pPcvLJVIws
         nPiutSBKwfySnwDYbshO6YQBfh2lMAb3AE13zNlQhHisZ7YQRZ4Fmla1BkGQL5nHjj
         9ZE083rB0grPw==
Date:   Sat, 27 Feb 2021 15:12:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c fixes for v5.12
Message-ID: <20210227141223.GA3333@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has three more bugfixes and one revert for you. I accidently applied
one patch too early.

Please pull.

Thanks,

   Wolfram


The following changes since commit 2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b:

  Merge tag 'pwm/for-5.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel=
/git/thierry.reding/linux-pwm (2021-02-25 12:23:49 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to f4ff0104d4c807a7f96aa3358c03d694895ee8ea:

  i2c: exynos5: Preserve high speed master code (2021-02-26 11:47:42 +0100)

----------------------------------------------------------------
Liguang Zhang (1):
      i2c: designware: Get right data length

Maxime Ripard (1):
      i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition

M=C3=A5rten Lindahl (1):
      i2c: exynos5: Preserve high speed master code

Wolfram Sang (1):
      Revert "i2c: i2c-qcom-geni: Add shutdown callback for i2c"


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (1):
      (Rev.) i2c: designware: Get right data length

Krzysztof Kozlowski (2):
      (Rev.) i2c: exynos5: Preserve high speed master code
      (Test) i2c: exynos5: Preserve high speed master code

 drivers/i2c/busses/i2c-brcmstb.c           |  2 +-
 drivers/i2c/busses/i2c-designware-core.h   |  2 ++
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-exynos5.c           |  8 ++++++-
 drivers/i2c/busses/i2c-qcom-geni.c         | 34 --------------------------=
----
 5 files changed, 11 insertions(+), 37 deletions(-)

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA6U0MACgkQFA3kzBSg
KbZovA/8DUVirASR6oOaqS5NTv7jbc1om5LJjYoCTOododbxxQBInuF42GBLqg7q
xgtuari+SLuvVV8frHWLeVMFTwBuzk+IK/+vqRVmlNcJRjhnrFzvLHtMCaycFKY3
vQkNbYHH0vzhdxszmQb+T01C4ePEJT2iFrPwdpAZe4V1hiStos8gpjJJd3FX0gCN
d6GP/ILVe1Ev3sRyj7sGPHiCjqEIXEzhmUKGLBUuCFT4bQN7PCt74AlCwOHT1F93
YldDfwm9byzSnDSwW7GTHVlb0nOa895asej/ZHmFoyRdY7CxSflh1m50m+LJy680
6nSOnQO6fDJrCzVwDLD5fz1edkxawO6iocpCEz8uBYZtHbsYLQ4cB94a2J1T+f1B
HvivYA7fL0nC/b+XTA1+NmHrhire2+yObIAI3NOocAJ7yDm1IdB/96ruQ3CItXRg
kgW9JkKHxrL34426Oo+xs8CgBxTbSa6aRLQeoPv/BqDGNN7lbzNhSB+s/i3nkGfU
QTyQNVgO3ZGvbUekVfKnTujl3UbpMvLqWfmVD2sLJP71A9nMEk5gCXH/SV14O2f/
d7lZzzDoCqCxZi+rz4OE+BJzMGEfJIoI7Y10x6hQ23l6hYU11RRZ0u5dyhSMocHT
329OYYH8NaqcKwUryF7EhrsHfsVQuDJja2xKYkkMZsTWELlHPd0=
=LK0b
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
