Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D673A309BB5
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Jan 2021 12:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhAaLm2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Jan 2021 06:42:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:53460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231410AbhAaLlW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 31 Jan 2021 06:41:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D41C664E08;
        Sun, 31 Jan 2021 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612093230;
        bh=yPzrFyp0UP0I0YXBc+4d/DLMecTSDmLTl2aebYWTsY4=;
        h=Date:From:To:Cc:Subject:From;
        b=LuM6bODIKTpnD2Gg3bUxfSCAV/ekjAR4OadA33FCjHk38SaPVWDsZ8O8GZTz0iy10
         pQaEA5wGx06JMyRNqxbnlcpD+GeOxiakZITY1EjZh1iLAuYg7eQCFNp5BuXoktRPps
         M0x4tjJ9+ljEXdLc/iI3NYhoMvKc0BKoF+R3B3uRc2dCLMg/KmyiXVjKnptwTFbgln
         wygYnGozF68V7vA35SBRDvq2qlT8t1FD7jPq8YIU9fdlQjmMCIqEC0KsXGGT9dq7Dz
         zcaolziBDhNJ/a/wMErzmH8eRhqxTVGwFwDGgvM0HavP72kckzJaWkA8yfDoJSMe7/
         hzKx8alEn1Y3A==
Date:   Sun, 31 Jan 2021 12:40:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for 5.11
Message-ID: <20210131114017.GA1332@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

one I2C driver update this time.

Please pull.

Thanks,

   Wolfram


The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to de96c3943f591018727b862f51953c1b6c55bcc3:

  i2c: mediatek: Move suspend and resume handling to NOIRQ phase (2021-01-28 10:54:45 +0100)

----------------------------------------------------------------
Qii Wang (1):
      i2c: mediatek: Move suspend and resume handling to NOIRQ phase

 drivers/i2c/busses/i2c-mt65xx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAWlxwACgkQFA3kzBSg
Kba/og/+KX79uG+J78ouK2RldNzt8KsIS2KaHkhx73yWiMOzf6OPRAuqsqAg3B7E
amglZa509qllZOW+1ndTOs4CvsEPtuQKVxw4gTQeLBRIlC0B+fgfbaH6nk+CVdqV
gXwY9awqNjwu4/TcrWtb/9/6Ug19mB+jrfuTC+qQrxs2Mdrk70ybC47H+wov3DFl
hT44wyXanAx3DMXpC66PsxORcZtFJEV6kLgGZWPS2S4iUCqihDc8BWxgLheRedps
80rnPurldaiOhbJqfziZwuB+3Ui+ELT3VgYBCHc2rO2FUnXQSLrn/yIdazfh7JSc
WzzepIETzROaAGiE5ZkgXF5MtBV4JeZcqjeu65rTowvm+4/XhJSqWodCvbMPzCia
BLktABgjW4L+7Vxxniu5+GuGXyeBxYjYh71x4a597nXKLGaeM00dsVXulo0JvhSQ
0qymPU0jDKJsjNZGfvMPqFssI53FTRrIvZdfbzVNrweA3ri/yixflnIMtqGqE2pf
s7Tmd2/qDh2aDs76LgeicIOcVqguz9mMEdZ3quUNaiMFA6WSgO+oUytzPy+vEGFM
xorgd+1RcLthOjhDON/fQlRi6gHy67a62fR9p1P22PnPYq0gX5hI354fEruqPeeo
3tKCraYvk6i/7lJaXW6ixjdnyO5a39wHt+/99qWorOfT/469ppQ=
=Sq1r
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
