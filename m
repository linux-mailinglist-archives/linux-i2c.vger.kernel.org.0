Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4C95F22EE
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 13:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJBL3m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 07:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJBL3l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 07:29:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229F2B94;
        Sun,  2 Oct 2022 04:29:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1B3C60EA9;
        Sun,  2 Oct 2022 11:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FA6C433D6;
        Sun,  2 Oct 2022 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664710174;
        bh=fy71kW7rrk1uK/MRKd3SWFSxGADZtmPjR9+a5izFAl8=;
        h=Date:From:To:Cc:Subject:From;
        b=aroHOWqwoG6YkxEe7Vr9H0LW37mj6u0cmRfieX+CqgyBLQbCDjtGN/ij59bENOePA
         C2pOcJw1znfWtBK1VFVk+796H8tEK1THk0DFcRT76rrSV6qda6hhRBTjrUDMXEM+rP
         Oy8baroivow+Uqz/xXMAZfsmUD/YRnGq8zLPtlxhXMCHIVpZcBgzoq9esN5FPkTuw/
         7hkGifbR+6zuC1/DUI9X8wItOxXU1aUmt9OblNtJNAcphJvnGtPfclTW0Cgv2Q6uXo
         orNsc0lUCAbuQSRRn4c0o/JZ3AlvCqL0wd6DRrBO3JmbufevgEA/cTkJAOBf140wCq
         Zk+XefK7MOe2w==
Date:   Sun, 2 Oct 2022 13:29:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.0-rc8
Message-ID: <Yzl2GRW4tCyFUJHl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AeorwXiU81WJMDSG"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AeorwXiU81WJMDSG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc8

for you to fetch changes up to e2062df704dea47efe16edcaa2316d7b5ecca64f:

  i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe (2022-10-02 00:46:42 +0200)

----------------------------------------------------------------
Add missing DT bindings for STM32 and a resource leak fix for DaVinci

----------------------------------------------------------------
Marek Vasut (2):
      dt-bindings: i2c: st,stm32-i2c: Document interrupt-names property
      dt-bindings: i2c: st,stm32-i2c: Document wakeup-source property

Zhang Qilong (1):
      i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe


with much appreciated quality assurance from
----------------------------------------------------------------
Bartosz Golaszewski (1):
      (Rev.) i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe

 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 7 +++++++
 drivers/i2c/busses/i2c-davinci.c                        | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

--AeorwXiU81WJMDSG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM5dhkACgkQFA3kzBSg
KbaZew//RQddtrYNKHHpcg9X3xEjU1rXr+D/jQrtYXofJ3Goy7g0FX+g7uzFVmta
gm0NWIEG2CZUUdnLJXW/D5SrUyyDAdLAeGfkrDI0g/T0KD3qJJdqkTXhoYO+v17i
V13s2r72TucFAg0nO8jHu6h9+oMKp4h8x1AipZMN54TLIKRTkQf+sdr6m9SqbG3G
w70hrKiCkIVIbcb46zjxHuLVuuGH5V+4ZqmdcMZOsD0dmzHou/wsFHkfNkMmimsh
aaLqUGP/H77uKM4/SG5K8vXM1LMTJhUxMfy0PiKJXInA5SYeJkultVTJUOPrrngL
qttEjXl8MEgfghxIgLL3wmtXEMpND/dKsD7waN57FlrHcSlMxibi4uCNSzRkFRbn
qLRrV6dZigXDZnrFSwr/An2vXMmpeF11OI7s5qg0s+H/nVmmaeAo9jDfITVmTHuK
7cxc5s1MJeASEriFrnGm8PuVMTY6MJo/XG6uLfNA1/ceFBxX/6L+PHsOsurg08ia
7cz2rzl5PL+KwHSRg6hjYdnSaDqWFe/6R7xkFModz4XyzXETbF7es+W8Va9hviCn
6/kSUx1FfIIdcz2ijABtQ5o1pey4UaRIgMjJIlrQQ8hKDcoslbDbGQAUiKekugMj
DscHDtgEXOtdDbKsc2XKgOdLf8dVQismmAdvpucMR5o2EtnKZFg=
=wu36
-----END PGP SIGNATURE-----

--AeorwXiU81WJMDSG--
