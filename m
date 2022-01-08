Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518E1488543
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 19:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiAHSKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 13:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbiAHSKx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 13:10:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB27BC06173F;
        Sat,  8 Jan 2022 10:10:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB773B80B46;
        Sat,  8 Jan 2022 18:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F032C36AE3;
        Sat,  8 Jan 2022 18:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641665450;
        bh=8ZiDhDQC+Di1SmCGY0f+43UowLJHZQnmiVTSMFASUbk=;
        h=Date:From:To:Cc:Subject:From;
        b=oyasuitI0WD77XvjJOiDrJjuN7CGucxmVR8FjO3lyreng0QN08HXemik4H3XI1xDp
         QvJq3O60qqvsCdsAg8HSE+nA8TzDCfU7iqEvx4ubgYVtIUtOHfmE0neh6yIfDc6Yjx
         l9mJaSAL7JgSVSuaf7t8ZtkOEKK9Ao8bZeCrAuqRH6fr8L591kekfqcLYu6lO0qKIG
         Q/2emmu4wHXojr7u6JpAS0CBWAXAYsnBrmiLTIijXfO80t26Ll0SVq1YvXuAnczGAo
         //5V0E8TnTvAG9ozMOFWZRhjWbmgHgATVWDsK50gmbkusMKPPl/aZ9Xfhwf1OUxqLE
         E4PkPEFxdYsiA==
Date:   Sat, 8 Jan 2022 19:10:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.16
Message-ID: <YdnToqh/UgE8NtXX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMMXKThljYKmVutZ"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qMMXKThljYKmVutZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

here is the I2C pull request fixing the regression with AMD GPU suspend
by reverting the handling of bus regulators in the I2C core. Also, there
is a fix for the MPC driver to prevent an out-of-bound-access.

Please pull.

Thanks,

   Wolfram


The following changes since commit c9e6606c7fe92b50a02ce51dda82586ebdf99b48:

  Linux 5.16-rc8 (2022-01-02 14:23:25 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

for you to fetch changes up to a19f75de73c220b4496d2aefb7a605dd032f7c01:

  Revert "i2c: core: support bus regulator controlling in adapter" (2022-01-07 21:27:15 +0100)

----------------------------------------------------------------
Chris Packham (1):
      i2c: mpc: Avoid out of bounds memory access

Wolfram Sang (1):
      Revert "i2c: core: support bus regulator controlling in adapter"


with much appreciated quality assurance from
----------------------------------------------------------------
"Tareque Md.Hanif" (1):
      (Test) Revert "i2c: core: support bus regulator controlling in adapter"

Konstantin Kharlamov (1):
      (Test) Revert "i2c: core: support bus regulator controlling in adapter"

 drivers/i2c/busses/i2c-mpc.c | 15 ++++---
 drivers/i2c/i2c-core-base.c  | 95 --------------------------------------------
 2 files changed, 9 insertions(+), 101 deletions(-)

--qMMXKThljYKmVutZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHZ054ACgkQFA3kzBSg
KbbcsBAAmCxNzwyS//LsUzfYCpt9caaHLLQB6IhEVUNdYjyOaW6cc1r1I4Y9huy4
3GHllXisokPkA0yCmVnPoFslpHesdACSn79MwevcuOu01w5e3RGKFvrImtcwAKPz
VSPSvp0uvD+D7VDa2ZEAt2QDVv6/PsVkp3IVqcEBBnAG9NDMW6tGuiZBNsph3H+g
3cvba0xxf+ZRHZ8f0axDj7POhEKHIJHONh0Kn/SaCJOu7w8+crN6L+1E6cHBRY81
cyWS6lYlWpunoB0EOg6yC2F4LK1g8yUZbuQmkyw/LSSP4xL5PUomrNb4ddzeR9hr
p/3efqb5QXYtHeb4jfgH7sgcQrLq14rrdrJQFEyl69n7SUy0xxltbUYaYSK/uTCW
kb6wMn1hZdeT404Lhj88FdVj1Ko5dctAaMtb4q2exFKXC+TKClu4RNiOhX63WX3t
UZrnIwhdOO830iSj5M0bICx1qwmcKRTsx9Wx3XvyE7g4DQ6I4fyWY0PFoEhQQsnd
zDc/mF9prQuin36CXL+bo4S+mzLIz/nVa53UT9tmrtihVO73MJcFUPVq4JeK+s7q
SsLCYz56f3BXcK8HAbrA7xoQRiiPE0oaySx3vNBvbIywLbFWWlyoQ2XXOFAWYFtR
D0dBpxFutzr8cJe6f8xG42GUVMXJNh0gh2f5g6W4DlohB4hOhNA=
=ybA2
-----END PGP SIGNATURE-----

--qMMXKThljYKmVutZ--
