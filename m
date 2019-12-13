Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE8B11E694
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 16:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfLMPbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 10:31:42 -0500
Received: from sauhun.de ([88.99.104.3]:47680 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbfLMPbm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Dec 2019 10:31:42 -0500
Received: from localhost (p54B3318D.dip0.t-ipconnect.de [84.179.49.141])
        by pokefinder.org (Postfix) with ESMTPSA id 1D82F2C04D3;
        Fri, 13 Dec 2019 16:31:40 +0100 (CET)
Date:   Fri, 13 Dec 2019 16:31:39 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.5
Message-ID: <20191213153136.GA3396@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has some core changes this time. A removal of an old API where all
in-kernel users have been converted as of v5.5-rc1. A kdoc fix. And, a
new helper which ideally should have been added during the merge window.
I hope it is still okay because it will make dependencies for the next
API conversion a tad easier and it cannot cause regressions.

Thanks,

   Wolfram


The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

for you to fetch changes up to 8c9312a925ad859daefd0f443ef3b6dc7157d881:

  i2c: add helper to check if a client has a driver attached (2019-12-11 08=
:39:07 +0100)

----------------------------------------------------------------
Randy Dunlap (1):
      i2c: fix header file kernel-doc warning

Wolfram Sang (2):
      i2c: remove i2c_new_dummy() API
      i2c: add helper to check if a client has a driver attached


with much appreciated quality assurance from
----------------------------------------------------------------
Luca Ceresoli (2):
      (Test) i2c: remove i2c_new_dummy() API
      (Rev.) i2c: remove i2c_new_dummy() API

Niklas S=C3=B6derlund (1):
      (Rev.) i2c: remove i2c_new_dummy() API

 drivers/i2c/i2c-core-base.c | 23 -----------------------
 include/linux/i2c.h         | 12 ++++++------
 2 files changed, 6 insertions(+), 29 deletions(-)

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3zrtMACgkQFA3kzBSg
KbaM3A/+Jg208F340YKBZgoNpyP2iQxruScJma5aAkhrHTn0wSqzCSsJbyYdVf9c
MlnTMwmJFoLuOIrTNYKCYT7KZOtPWy8W2YiKWeILJtngl1wfQt25exKunnZ6V8KJ
9XRXzXtC1K/Mf4rR9QmQeSwIcd5/hWUoUFssl6N4Jaq/IUkac7NHfE45bj8ZpdxX
XzIDVpauGplL4o4G1eVgm6Z9159UzsbWBsxRXKsfRss3dA0mncq5rM99/NlTOwiF
ymyoBlJd5uOImr8w4vqEfSLNzjjFVPG/ohJuumWJ+ASLrDsUWevjf/RzIeomJCmT
DwCk8oHVQ56+XYtC2fP40hDgMg8ZCcvRNjZPHAw8n1ea8iSSTqwtSeFgKXi+k1S3
cgTteMPqy46Wo3bsYeSqtHo0OmbmZtRC0NSG8Uju/lXZiijIxcbl6KDR/xj4DJC0
eGIByzyBPseSRQQ1k9XozObRrcGtUeQP1GMWq/K3gk8hyATFEYlRmDMfkNZ66MZY
l++zQJNLYblxUT/mg3IgwWXe+iXKSFeJxq10KovvdkuOBIYCjwqOtoy5rfOLOvO5
U+BAJDiQhBy3z2dTi70WVlwq1TIJKeTfq/PMtgHw/j7V9eAtLsT5aphdY3AetPwI
qjNBIwoOftDxofPn/4rbFvAIU88d6g0r4pU2ZodNf9s2y5oVelM=
=UpLx
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
