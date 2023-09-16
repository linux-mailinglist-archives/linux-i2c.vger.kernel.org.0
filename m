Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712AA7A2F0F
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 11:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbjIPJwC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 05:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236177AbjIPJvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 05:51:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136F0CD0;
        Sat, 16 Sep 2023 02:51:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE713C433C8;
        Sat, 16 Sep 2023 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694857910;
        bh=ZeYVpQf9w9apII2mwFjEUPKNLRuO0rMX6CZC9OF9K2o=;
        h=Date:From:To:Cc:Subject:From;
        b=iWZQLYsDOqwqaFVO8JG34ooJkOLcK/rjkVN+X+RJwdqfI95yW6nUIMI3XuW+EYPJ7
         f1sFzH061WvUi07vVahYSL+4GY7Yo1zlL6Syo/QeXIOXiZnCb+x3l8JzFbyo/5fEKP
         hX8sbJl3HbxPeix2uC2iSGrI6O7ChREIz7gGx/jl+y3UCv4iHSt9fDMKaHSegyOQNf
         s7tw/AUI1KftNQl+7ZIoPkohnvo9uI4VAg2JkkkzDAweC7S0F/RtDh83bzcm0UU0Hg
         UvC+8egchf/UDYaGFb8uildnWWjv9nwAB/7Sg/o4TYyNB1hwX2r41p5Fh/LE+wav1z
         oOmoQPaiaxSxA==
Date:   Sat, 16 Sep 2023 11:51:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.6-rc2
Message-ID: <ZQV6s4ScLByb/gkD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y26t4o5Wkbpd60wd"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y26t4o5Wkbpd60wd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.6-rc2

for you to fetch changes up to 637f33a4fe864ac8636e22766d67210e801fcd0d:

  i2c: cadence: Fix the kernel-doc warnings (2023-09-13 11:10:49 +0200)

----------------------------------------------------------------
Main thing is the removal of 'probe_new' because all i2c client drivers
are converted now. Thanks Uwe, this marks the end of a long conversion
process. Other than that, we have a few Kconfig updates and driver
bugfixes.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      i2c: Make I2C_ATR invisible
      i2c: I2C_MLXCPLD on ARM64 should depend on ACPI

Shubhrajyoti Datta (1):
      i2c: cadence: Fix the kernel-doc warnings

Tommy Huang (1):
      i2c: aspeed: Reset the i2c controller when timeout occurs

Uwe Kleine-K=C3=B6nig (2):
      w1: ds2482: Switch back to use struct i2c_driver's .probe()
      i2c: Drop legacy callback .probe_new()


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (2):
      (Rev.) i2c: cadence: Fix the kernel-doc warnings
      (Rev.) i2c: aspeed: Reset the i2c controller when timeout occurs

Javier Martinez Canillas (1):
      (Rev.) i2c: Drop legacy callback .probe_new()

Jean Delvare (1):
      (Rev.) i2c: Drop legacy callback .probe_new()

Krzysztof Kozlowski (1):
      (Rev.) w1: ds2482: Switch back to use struct i2c_driver's .probe()

Luca Ceresoli (1):
      (Rev.) i2c: Make I2C_ATR invisible

Tomi Valkeinen (1):
      (Rev.) i2c: Make I2C_ATR invisible

 drivers/i2c/Kconfig              |  2 +-
 drivers/i2c/busses/Kconfig       |  4 ++--
 drivers/i2c/busses/i2c-aspeed.c  |  7 +++++--
 drivers/i2c/busses/i2c-cadence.c |  1 +
 drivers/w1/masters/ds2482.c      |  2 +-
 include/linux/i2c.h              | 11 +----------
 6 files changed, 11 insertions(+), 16 deletions(-)

--Y26t4o5Wkbpd60wd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUFerIACgkQFA3kzBSg
KbZgoQ//efW0w9QfqRolK0t8zRWz/I4gONZqjjFvyaDnKAPUZrMkR0PMiuF4FaAz
sScn2GvMqT/7OWiCMm7ml6VvXInKZ0YN3gCuhJNgzQ3ws+Nzhrvm0M5q4W2WEaRX
kRtDFX2a6LkYbGuiqyb2EhwBeSAlkF/1dNJtY7ejRVQvVRSdeHdFrgQNFiQTfWUe
/pX6hZX3elAcYRcQ08oRzuhx/p7BJe53TzxhJC8SHT3c4gmblejRTlb8lRcFxE4J
YWrS81M98ahuFHD0rGXKI3Y7gDSV8RRebNRqxSBhHvfb8p8ckWQYt24+9UBMDMHq
3wwG6n/NiajiyKzhV8YF5T03LlU6oekqVI7bjcJpMDGNWNT86pX4kU0QKvB2lBUh
m2dQlqQTZb2ZrhVll0SGzV5vsDt1IXkq2kX+EDL+gD93xpmmTki/W+qc5zgftsJe
M/zpv1ofLNqGg2/NY64ewhIjobpqDS1ZVUBjPBG0dIRIo3NbFM7VmDbTr42JJePx
ohYmlAg9kvxWuRitRibWOl9WCO83pPgzXsJHwmTY9lddO53KVQiISQXFZi/IzjBq
ypOCXYRhAlYMpS8kmvUMbE4r4VyUdMdbJxkGuHq6hR2JeL5fpUIh3vdMY4kDi2mh
Jhx/OHzlBVohl74JhdPdEoLf6LCxxMte8K53yod/hLwLcCkKHDY=
=2P6e
-----END PGP SIGNATURE-----

--Y26t4o5Wkbpd60wd--
