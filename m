Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEC87B3FCB
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Sep 2023 11:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbjI3J6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Sep 2023 05:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233981AbjI3J6S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Sep 2023 05:58:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CC3DD;
        Sat, 30 Sep 2023 02:58:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C17C433C8;
        Sat, 30 Sep 2023 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696067896;
        bh=Ldronimayk2hvSUPUidfoaAxA+pv148JulDGjjjeupg=;
        h=Date:From:To:Cc:Subject:From;
        b=NQdGS2EyNzKhiiCAfbTd3LtaJy1NnrVqfSjw2NmJNO8vX6ZJ2DrrGe/xyMBhcn3cZ
         DhruvskYQHH4u3wKeIDuVsqtiy9mLVeCCfOG5e55eEzH1c6nPLw6zkhbha/04V7sRD
         i30N4jFGVjCEzwqjR1HsD2alKSSbWbUmdh6MFIgFoRjfvFovUvGJIn5E8FtqW+ssyK
         8wwlMNkC0ABzl/sGnmWF6z0gCIgdK6ug4uTx1PuNa5qrAILUJucoMYNu++Vjg+7auV
         orYa07eJGgpYCTixEfVYxeL5hKlX5JbmnLpKEy4MuSWlHH7kEDS0AWaWbTacdcgLJ1
         Cb+fpk8yNnxJg==
Date:   Sat, 30 Sep 2023 11:58:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.6-rc4
Message-ID: <ZRfxMZNe8wiyX/nc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OS6/6Xv4W+tjJ9re"
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OS6/6Xv4W+tjJ9re
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc4

for you to fetch changes up to 92e73d807b68b2214fcafca4e130b5300a9d4b3c:

  i2c: npcm7xx: Fix callback completion ordering (2023-09-27 21:32:06 +0200)

----------------------------------------------------------------
Usual buisness: a driver fix, a DT fix, a minor core fix

----------------------------------------------------------------
Fabio Estevam (1):
      dt-bindings: i2c: mxs: Pass ref and 'unevaluatedProperties: false'

Heiner Kallweit (1):
      i2c: mux: Avoid potential false error message in i2c_mux_add_adapter

William A. Kennington III (1):
      i2c: npcm7xx: Fix callback completion ordering


with much appreciated quality assurance from
----------------------------------------------------------------
Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: mxs: Pass ref and 'unevaluatedProperties: false'

Tali Perry (1):
      (Rev.) i2c: npcm7xx: Fix callback completion ordering

 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml |  5 ++++-
 drivers/i2c/busses/i2c-npcm7xx.c                   | 17 +++++++----------
 drivers/i2c/i2c-mux.c                              |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

--OS6/6Xv4W+tjJ9re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUX8TEACgkQFA3kzBSg
KbYRdw/+I3swxAkWzLHAQnanmjVd890xsdDOzRE8I3VFo7fi0Bac7dowgVCrdDzo
cauEDCOXrY+RIMJ/TB65j6LnOI4NaEAjfOe4QlFo41MsPQLW7C0UIrHincGDgeOG
xVWvC4ayaq8PqTErcRpxOBY/ewGNgZ06Sa6sE9Q/knRqwC/4Bl4fputK2sx1HEQt
uJGADbtoY/2UpuE1WwOLT6dAu8cMTzkoVfxqfadvpeKVY7cewCm6C5y4jPdvzq0O
xY09WqAICkyfBzqshgo05zKiegr1qdIXbTY9mI70KcD74urHfN4oNYiuFhQB2fZP
cUUlFsUEwfINwQqzprcfJi5IQDfFglD6NMY1sD6vcW9koupF9RFvn7FkIvhs19fq
ZnovF+2mfBdWMdY0W0c1bMsv4UyHviEw58cGp7C30IrSIG8QeVo7bq95OJQ235uJ
8U6KFxEkukxKJGtgTVG7k58F12DQtnQvRP3ap0gJqY/ehBeuBbIqtevVjtd07Ms7
WbEpMsv7FJ+mLrdLamkZvhOhmlx5ZUPTMnCZUFh/DFXAScALJfTMIrsNzfK5aR/o
e8bKLjuIu4x2PwwCRMRldd++ywVeuzjp0KBCt2jA4U59TRXTvIOra68e/2QRbE2T
IlT7Mq9bHd5VrAB6YNnMlvr6rQgEADIlDiJ73oExR2fki9FXun8=
=dUYL
-----END PGP SIGNATURE-----

--OS6/6Xv4W+tjJ9re--
