Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762006B5942
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 08:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjCKHUo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 02:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjCKHUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 02:20:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67CB1CF6F;
        Fri, 10 Mar 2023 23:20:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC566069A;
        Sat, 11 Mar 2023 07:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBD0C433D2;
        Sat, 11 Mar 2023 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678519240;
        bh=v/Ek6knmG/RzPhqXb4VCt1/S5iAnNtLwOaxGyO3VjBQ=;
        h=Date:From:To:Cc:Subject:From;
        b=m+kx1KuW8I4NYiyrNDxJEVRZTBvQWX4n2LD2TJ79DXW3HF1J4OaKX7YcDtyqyDyOG
         LPVgviIqgNYtSIvr7Hp/f+CFKBaSUa3EIv6ZB1utccnbTXnlgIz1txrrHyiyNnyHkn
         i797Xhcywbl4ERCP/xodGNVYaAnxgeySFtijwgjkZIyvGHbSwdjsBJtlt/WzBMTtTw
         /k+zg79+SmDIIPJiN6/nCAAqwFBxuUPJk2R5r9KEcvKeHslG81dqil+qcunfwix0Bk
         b+EpvI+TqikraKx2VIqhjpc1onlE66urlH/kxJPJ7Bg3DQ8t6qDtKP8P2UBh6lfJqM
         nsz8zCrlWODpg==
Date:   Sat, 11 Mar 2023 08:20:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>, ukl@pengutronix.de
Subject: [PULL REQUEST] i2c-for-6.3-rc2
Message-ID: <ZAwrxZSj84gsb7Ev@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        ukl@pengutronix.de
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nOn3No4VwGGAIx/e"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nOn3No4VwGGAIx/e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

this PR marks the end of a transition to let I2C have the same probe
semantics as other subsystems. Uwe took care that no drivers in the
current tree nor in -next use the deprecated .probe call. So, it is a
good time to switch to the new, standard semantics now. There is also a
regression fix in here. Please pull.

   Wolfram


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.3-rc2

for you to fetch changes up to 9e5f81f9a6e78ba411117146ecf324d0145ae89a:

  i2c: dev: Fix bus callback return values (2023-03-09 22:07:52 +0100)

----------------------------------------------------------------
* regression fix for the notifier handling of the I2C core
* final coversions of drivers away from deprecated .probe
* make .probe_new the standard probe and convert I2C core to use it

----------------------------------------------------------------
Geert Uytterhoeven (1):
      i2c: dev: Fix bus callback return values

Uwe Kleine-K=C3=B6nig (9):
      misc: ad525x_dpot-i2c: Convert to i2c's .probe_new()
      mtd: maps: pismo: Convert to i2c's .probe_new()
      serial: sc16is7xx: Convert to i2c's .probe_new()
      w1: ds2482: Convert to i2c's .probe_new()
      media: i2c: ov5695: convert to i2c's .probe_new()
      media: i2c: ov2685: convert to i2c's .probe_new()
      i2c: Switch .probe() to not take an id parameter
      i2c: mux: Convert all drivers to new .probe() callback
      i2c: Convert drivers to new .probe() callback


with much appreciated quality assurance from
----------------------------------------------------------------
Bartosz Golaszewski (1):
      (Rev.) i2c: dev: Fix bus callback return values

Greg Kroah-Hartman (1):
      (Rev.) serial: sc16is7xx: Convert to i2c's .probe_new()

Kieran Bingham (2):
      (Rev.) media: i2c: ov2685: convert to i2c's .probe_new()
      (Rev.) media: i2c: ov5695: convert to i2c's .probe_new()

 drivers/i2c/i2c-core-base.c         | 13 +++----------
 drivers/i2c/i2c-dev.c               | 24 ++++++++++++++++++------
 drivers/i2c/i2c-slave-eeprom.c      |  2 +-
 drivers/i2c/i2c-slave-testunit.c    |  2 +-
 drivers/i2c/i2c-smbus.c             |  2 +-
 drivers/i2c/muxes/i2c-mux-ltc4306.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c |  2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c |  2 +-
 drivers/media/i2c/ov2685.c          |  5 ++---
 drivers/media/i2c/ov5695.c          |  5 ++---
 drivers/misc/ad525x_dpot-i2c.c      |  6 +++---
 drivers/mtd/maps/pismo.c            |  5 ++---
 drivers/tty/serial/sc16is7xx.c      |  6 +++---
 drivers/w1/masters/ds2482.c         |  5 ++---
 include/linux/i2c.h                 | 18 +++++++++++-------
 15 files changed, 52 insertions(+), 47 deletions(-)

--nOn3No4VwGGAIx/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQMK8UACgkQFA3kzBSg
Kba18Q/6ArAkDrxyfyUPaL29Ucv1gIqAzYHIE72cwhsVujj5Oni9lly77h/x5HNK
oXTLmcSwpTYdLLfg5Y/81hIVBCPg0NhjGFe/2c+iqOrq3FnLUJL63p58P700vFKL
mhVhWYjEr7+fJ2N/rzk58SJJaqYaYsTKPa6jFRlrLsqctAxcpiKM7jG7UKGsNzW0
L2UBere0EX0eOdPSznpm2djqIJhKoCaU7NTavoqA/0NXXCmylP32TPQjMgBGRT/R
koFlFu5vgIZr17yigDPU2cCkV5IHsvCFfgwGe8TsTA4W2nVRQ7TVg8ctjYJcF2wm
xjqyzJVek7BEYCrZ5E7ls1tFX19R09eiwsbgAsGiFeZsxWtmQd5auRHlqsURxMYf
PvqKdoCNEnG5LBl7ettVx7dKRFKalMrbZYaFkC6xsB9czywkD6xBCMOn8GXMII7O
bddnJIhc/VGp1F6MlNPNW5JBvnP5jOcaCEP3kRHINwu3/LY0WWPWaNVJge3trWHy
FjK7Mrsi/AEk6LQPDzYhz9xp1CGDd9hAV32Wv77TJC/bg8RgBKhttZk+0aURwQNy
z/kKbaeprpw0mwJdVgM960X4FouT1Vx2zHjM5TnbPMZGkA0gnCNSwHNHEHQf3Wx+
fd1tSUZP7QnXBo2lZ9v8KVxqSI9hGm+t0MejMaYlqFQsktix9rc=
=Kn/f
-----END PGP SIGNATURE-----

--nOn3No4VwGGAIx/e--
