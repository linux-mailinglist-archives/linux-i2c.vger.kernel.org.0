Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD0C74B78D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jul 2023 21:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjGGT7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jul 2023 15:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjGGT7r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jul 2023 15:59:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D0619A5;
        Fri,  7 Jul 2023 12:59:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C97261A60;
        Fri,  7 Jul 2023 19:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DA8C433C7;
        Fri,  7 Jul 2023 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688759985;
        bh=Gj9r++PLp0gDGijn6hoj8s8BlnCK0mdoLOL3p3Jnr98=;
        h=Date:From:To:Cc:Subject:From;
        b=hBHgB6JvVfQTGLO1zfbzjIbcXefzNCpltyP33mOZdCg9mPKm7MP33r2N6vV/efIi0
         DXNKbavP4hX0NtEXhRH3D9FEFG9sTYHKfnxRUIr4BUFJ21hp5pWH/I4YpgGiN5LEol
         o4f8It+93g3gL1Vdnxbjldvsd3m5okeLQ9b8VkFYsYIxtA0jiH+5y5k24KyUCHGk4q
         ilng+P3LSNgtixKxaHunOIuJtkzMx0//bxCkuqhZipx655/9KhUuC2etdagBUhTSQx
         w3mhyV7hMFkXxd3kO3Ll+6W7Rn8QrIPa3owFFobUFbJD1Mee0234/O6ls2mxSfzsOG
         I6HaIOFaU6WTw==
Date:   Fri, 7 Jul 2023 21:59:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.5-rc1-part2
Message-ID: <ZKhup2kTPKNKm2sW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KEM5jhxXh644/gEK"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KEM5jhxXh644/gEK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7b82e90411826deee07c180ec35f64d31051d154:

  Merge tag 'asm-generic-6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic (2023-07-06 10:06:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.5-rc1-part2

for you to fetch changes up to 6537ed3904a3b3720e5e238dd5d542448fcf94c2:

  i2c: mpc: Drop unused variable (2023-07-06 21:45:05 +0200)

----------------------------------------------------------------
Part 2 of I2C patches for 6.5

* xiic patch should have been in part 1 but slipped through
* mpc patch fixes a build regression from part 1
* nomadik is a fix which needed a rebase after part 1

----------------------------------------------------------------
Christophe JAILLET (1):
      i2c: nomadik: Remove a useless call in the remove function

Guenter Roeck (1):
      i2c: mpc: Drop unused variable

Robert Hancock (1):
      i2c: xiic: Don't try to handle more interrupt events after error


with much appreciated quality assurance from
----------------------------------------------------------------
Andi Shyti (1):
      (Rev.) i2c: nomadik: Remove a useless call in the remove function

 drivers/i2c/busses/i2c-mpc.c     | 1 -
 drivers/i2c/busses/i2c-nomadik.c | 2 --
 drivers/i2c/busses/i2c-xiic.c    | 2 ++
 3 files changed, 2 insertions(+), 3 deletions(-)

--KEM5jhxXh644/gEK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSobqcACgkQFA3kzBSg
KbbjEQ//aHi0VWWPA/Vbwf32ha4HiKpl1uaKpRrZrT1erLmU6WYwNespxcc6YgfS
gFnoq3J+M9G9ZBmoRtpwu4f0IXopQSvBUhrgkq8tGvSpMJ9aLUiOdnsm/PrJ0tPE
aaiL2n++jKLVm+Du4bTamiph9bYAMV4DHcB8wXocvQvzDwUG0X9RY0CvvORbmPnu
95ZaGJmzNTQGiXOyf/gLM9NaPwmDtygTrG4c2/9qktkL3JxVlLVyk1q9B36nwioY
Hu7DbdN2wV5hD/RGPwsk7/tASkSUI9Jxpxcft8yvdL5DDNmceeAq7879BMbSLhYP
+qAKtPhsQYVmX4U9OJ+J2pmI8jQhBseKWUi1hgIdPkxmtvJd0pwOSeWOTxSupwgf
rjPeyDCKbn4bQBjWBkHAk6Vg7FlP3+18E2qSLG007MQQ77i9P+TbxWfBpFqLpcpB
yQowyiwpKoArrXAoBWpzxcWWpKGOUG5/SyBs3C3XTTk9u8zaOnRtb+zdbSa6NIhf
exksuSc6YvDPxvsfCNPu7WxizOyeJbLu8w4bcQeAE0D9IOIOlJq714UtR7DA0evm
vivyyLfPVMIcIZaOq4+jQ1aokfnwN00c2OZN+YbRiw0bRNVSJHnCEHVhus1xdBnJ
6ihtAzHFizw5VQcpbN7Ecgtx+93fIrbDKx+taZuXhYpt3o/GWLY=
=iong
-----END PGP SIGNATURE-----

--KEM5jhxXh644/gEK--
