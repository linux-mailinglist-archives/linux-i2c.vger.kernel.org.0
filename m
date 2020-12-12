Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F182D8946
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Dec 2020 19:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391064AbgLLSbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Dec 2020 13:31:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:47970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726237AbgLLSbd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 12 Dec 2020 13:31:33 -0500
Date:   Sat, 12 Dec 2020 19:30:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607797852;
        bh=DQO8Hh/sKBkHBIRSNOASCcwn+SVBegd3+zWyvflofFM=;
        h=From:To:Cc:Subject:From;
        b=sEVy/5DVmbZmdTqy1U4yVzCmE67dWXAlN/JMsOz9ApNM30rV2I7PX4aobOXxFurss
         TpVoRldSB05qADNlq8sw+TbFcB8b/XaNgBjhFiORc3q6oHLbz60NqzNGJYvKCO3G4m
         ZE4CzQISyiZhsr+Wu4XqWa0ApwN049oGDxBrhEeLsfuDi+2nlnFhIyAKkkRPVVhvBt
         J2W2qHc00FuxxTeUTvRcp7blwd9YGe7LMJzQ0iRApdo51LlpoOZ1tKtYvYN4KyOzSa
         pBuc9sL9sNhYXl1fS7D/F7NRQN2/gFCaY9kXrBttPiLxwWjZRhuBHjwW9MG5PJGJgX
         GQSrUTsvtloEw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.10
Message-ID: <20201212183046.GA8096@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

the AT24 EEPROM driver still needs a bugfix for 5.10.

Please pull.

Thanks,

   Wolfram


The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to e977aaf899a6d3b3d6658da66e262b6e307ae3a2:

  Merge tag 'at24-fixes-for-v5.10' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into i2c/for-current (2020-12-11 23:23:30 +0100)

----------------------------------------------------------------
Diego Santa Cruz (1):
      misc: eeprom: at24: fix NVMEM name with custom AT24 device name

Wolfram Sang (1):
      Merge tag 'at24-fixes-for-v5.10' of git://git.kernel.org/.../brgl/linux into i2c/for-current

 drivers/misc/eeprom/at24.c | 1 -
 1 file changed, 1 deletion(-)

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/VDFEACgkQFA3kzBSg
Kbag/w//XF+WHLkeHrjp0y3KJH2Q27Yy5IvdT2NlwidqdrdiyYnfNX1vPTo9O8Gj
AHCzYhN4X0MTJoHpJCVodbS86dSPW4wLe9FUFcMVUkvMIpsJ2z09hqNn+2dPO5ao
ofnjIXijbpwlb9i97j+RrP7bLyWwSE180oXqb5Cram4QL1G9+MdfOFJvL4vcgr0k
MdqYq9iU9WE3QXsoB0DaRprz5ZnDZ10pCkpxEaRTxWl44tLALLC7kdAmGNt4DEsI
LQVrDKBBTK+yblbwYqHNXr8EdSwMtiLE2aocIRr+v4s8srnNhGSllNlvYeNBPpKl
dn0ULzUhGw1ksucAUNLPQnFheih87kFd2X156KS1IAMr5rsVFneTif5y0dT9oYA5
rYzflALLENH0tUnFkpDd8rNK67g5Q4ufyvs/NhRY0IdvJzzZw2Y0yN2deD6nFlM+
oxjBTjhMhFvteXRMzLzyD5ZY9rDk5oMq1dle/oNF6EP16pRlwDcLMxymRlcrCsV/
4AfjjxoyxWOBgBI5J+qiQpFATCarHQQVF7jE0Qzz7+dhIYbsBx9hkXiwG9q7NZsg
YBE2iZw9eWH9iVZvbJtG+DHKyPczwkXkK8KOyW7f0ztkfQcvrA4Hc6zxVK8bX/91
VA76kvj3EqoLJRWldYfDh+o2F0JLoFsLxk7tDlEP82vYsEQL9ZY=
=GqTY
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
