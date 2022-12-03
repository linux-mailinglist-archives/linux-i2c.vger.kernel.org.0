Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AD0641787
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Dec 2022 16:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiLCPaR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Dec 2022 10:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLCPaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Dec 2022 10:30:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9821A23F;
        Sat,  3 Dec 2022 07:30:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E734B8069B;
        Sat,  3 Dec 2022 15:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1D9C433D6;
        Sat,  3 Dec 2022 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670081412;
        bh=w3/qCLnKVcJvobf7Qn2jeQfqnaTkhqtJnzoQ4USV6Sw=;
        h=Date:From:To:Cc:Subject:From;
        b=vQ05Af/kxudg5FPiiEJddwLBhIrBzdGgYU/U9dzhCDwd4bYUMfEYUhmB/a/Eqzc5n
         /iyq9LNyOY/QG/Vvd4oIBjV5F7om1QpT7xkONf+sA4id8p/YgN8Xr4slYH4wrVLd+U
         WaJLOZK2zN3efBv+aOuCBbmUetmTj8sytv/wmpb+mwZrZrpvhnnnohnXw960S/c0QF
         BoqLINR0Jo+TcszmKqUYT+pvXB0+i9gFJbexBp5ZlzSDa/fPB8YPjKQNUK7qyNiEm9
         igC1/4jv3hJljy7UHqHhae+AYU7NOSXcA7NZ/27PEUlRdgmVNr8fdwPvmHGpOk0Aql
         Haj8+ft9VUGZg==
Date:   Sat, 3 Dec 2022 16:30:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.1-rc8
Message-ID: <Y4treE3qPigo618I@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KvB4vfrgNoKGwBX2"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KvB4vfrgNoKGwBX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc8

for you to fetch changes up to d36678f7905cbd1dc55a8a96e066dafd749d4600:

  i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set (2022-12-02 00:12:25 +0100)

----------------------------------------------------------------
I2C has this time a power state fix in the core for ACPI devices, a
regression fix regarding bus recovery for the cadence driver, a DMA
handling fix for the imx driver, and two error path fixes (npcm7xx and
qcom-geni).

----------------------------------------------------------------
Andrew Lunn (1):
      i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set

Carsten Haitzler (1):
      i2c: cadence: Fix regression with bus recovery

Ricardo Ribalda (1):
      i2c: Restore initial power state if probe fails

Wang Yufen (1):
      i2c: qcom-geni: fix error return code in geni_i2c_gpi_xfer

Yuan Can (1):
      i2c: npcm7xx: Fix error handling in npcm_i2c_init()


with much appreciated quality assurance from
----------------------------------------------------------------
Hidenori Kobayashi (1):
      (Rev.) i2c: Restore initial power state if probe fails

Michael Grzeschik (1):
      (Rev.) i2c: cadence: Fix regression with bus recovery

Mika Westerberg (1):
      (Rev.) i2c: Restore initial power state if probe fails

Sakari Ailus (1):
      (Rev.) i2c: Restore initial power state if probe fails

Sergey Senozhatsky (1):
      (Rev.) i2c: Restore initial power state if probe fails

Shubhrajyoti Datta (1):
      (Rev.) i2c: cadence: Fix regression with bus recovery

Tali Perry (1):
      (Rev.) i2c: npcm7xx: Fix error handling in npcm_i2c_init()

Tommaso Merciai (1):
      (Rev.) i2c: qcom-geni: fix error return code in geni_i2c_gpi_xfer

 drivers/i2c/busses/i2c-cadence.c   | 11 ++++++++---
 drivers/i2c/busses/i2c-imx.c       |  6 ++++--
 drivers/i2c/busses/i2c-npcm7xx.c   | 11 ++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c |  1 -
 drivers/i2c/i2c-core-base.c        |  9 +++++----
 5 files changed, 27 insertions(+), 11 deletions(-)

--KvB4vfrgNoKGwBX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOLa3gACgkQFA3kzBSg
KbamhxAAm/ru9MW4lKLwfHpmdXX829ZypRXheQlE0OVNitHqwhf5EPDMwCW/c6XU
ZZV7Y+8qnUtuc6goGFTq7cL1+9bbzwIz112WohXaKmAa6VtvMRPYnLktvLsjIVcr
YQm4zfmnyIOrKhpleCNmCZzZnC/BHZmFiiDlEGF92h7n8Vdf4ctxO3X8Dv0mmrTG
/jCL/tvcqGGXcaJIGFrFhD+WEXk2ywFtiLNxUmLplGi8Qs+2sWJbxHgQtINPmZR/
7ttxqeqoLewb0pp8/km2Jpo5ImpsO4C2EofeYbqjKft1j2tTVZVPTHhqOzhqtzPa
FRot2fr0PArerta+MuUoP4FKtn0XBN1iSKI7eXJ71cXqVaJT7WZaCoRFzxADKnOy
PfKsVKzUW8m5xA3mCtLe5v+/7TRZ/qCPjpP47QVxg/fcIoSZf2ve9FmdP5vkMITN
6NjoTrNOzyNmXpULOnw0vZp8LD9+YJXtkQcIhwLEYbwHrVi7h9ad1X0lZOoEO9WU
cXtyHGcrn2rHxSfnNQLECZny48wwvDngM5UCmv26tntMCcBTsqAWUgIjWEOF6NG5
cDvTHe/X77YX3Q0RcTdZL3mpMJKf2C08tDw6xaSkMeBGBcOqbvivv/ZCmWJaCHJP
nR7uxJHLo2Vr8rHdexSCOaQ5J6+AgmQEwKzwB6bog9Ro8ubxuwQ=
=BaxW
-----END PGP SIGNATURE-----

--KvB4vfrgNoKGwBX2--
