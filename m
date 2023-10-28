Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3227DA549
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 08:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjJ1GYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 02:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjJ1GYP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 02:24:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5141F11B;
        Fri, 27 Oct 2023 23:24:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAF3C433C8;
        Sat, 28 Oct 2023 06:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698474252;
        bh=huMuC9eD6QFppqGFj2d2KbgVfFm/ibyW7QtYs7CXVjE=;
        h=Date:From:To:Cc:Subject:From;
        b=Ijwcilxu5csfY0vEjKFFyc18dKh4m0JPxe13OG1jiI1Kj3zWAcXwXDwX8HlDcwgAo
         XjVlN1yI8WwjejOJUlkSKgz5yLl0YyWmuS/8R9WdrFs0HW/jA7Dn5bpoZQUjUw34ay
         g37Dnh8jJ+wayTF5AWs2SsO/Q1jdnuCc/21YQd5zTiyvp/JksFagn7x3ecpotkMPxa
         Xlh0z3L7a3cysgY8njfbfKemsKLyXvLZwAdTF+Uyuwh4dI/bhFB979oSpsaJM92+CH
         R/pcYkFevSZjwuDTWuSZLKnJbWeIVOG/LdajAX6txTjErnrxwJ/UqPqYq+/Y9znIzG
         /qRl0uGFVWJPg==
Date:   Sat, 28 Oct 2023 08:24:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PULL REQUEST] i2c-for-6.6-rc8
Message-ID: <ZTypBKf7VqKqnTuG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eoPy7XQcgNvfdFmT"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eoPy7XQcgNvfdFmT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 94f6f0550c625fab1f373bb86a6669b45e9748b3:

  Linux 6.6-rc5 (2023-10-08 13:49:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc8

for you to fetch changes up to c896ff2dd8f30a6b0a922c83a96f6d43f05f0e92:

  i2c: stm32f7: Fix PEC handling in case of SMBUS transfers (2023-10-21 20:31:04 +0200)

----------------------------------------------------------------
Bugfixes for Axxia when it is a target and for PEC handling of stm32f7.
Plus, fixing an of node leak pattern in the mux subsystem.

----------------------------------------------------------------
Alain Volmat (1):
      i2c: stm32f7: Fix PEC handling in case of SMBUS transfers

Herve Codina (3):
      i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
      i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
      i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()

Jian Zhang (1):
      i2c: aspeed: Fix i2c bus hang in slave read


with much appreciated quality assurance from
----------------------------------------------------------------
Andrew Jeffery (2):
      (Test) i2c: aspeed: Fix i2c bus hang in slave read
      (Rev.) i2c: aspeed: Fix i2c bus hang in slave read

Jonathan Cameron (3):
      (Rev.) i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
      (Rev.) i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
      (Rev.) i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()

Pierre-Yves MORDRET (1):
      (Rev.) i2c: stm32f7: Fix PEC handling in case of SMBUS transfers

 drivers/i2c/busses/i2c-aspeed.c       | 3 ++-
 drivers/i2c/busses/i2c-stm32f7.c      | 9 ++++++---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 drivers/i2c/muxes/i2c-mux-gpmux.c     | 2 +-
 drivers/i2c/muxes/i2c-mux-pinctrl.c   | 2 +-
 5 files changed, 11 insertions(+), 7 deletions(-)

--eoPy7XQcgNvfdFmT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU8qQQACgkQFA3kzBSg
KbY60Q/9F4XvNPPADRy/0JKcXi3Y3RorEUExrSv3bw8++E/p0WVIJduI6Jj9dHAF
GF/u6uq2BnNT5oNq5/aHUeaMTVcLKQQDWWTU+LjP2B2zyMedTbwSLUUI5NOJceeS
shzIDf6TddM0KnZeQqgnVtwdjv+Jul2B/jKntWBLBeAIDA4g0I99f4R8s2f/cASA
u/ZkYf0+lepzI879OaXniq+XoAmGQOe7i+ZZ6ICSCKtnSSUmg/hFtKXhpIZGsb+m
dEOY4akPQEDy+nFUxUWeM8cZS7tK9t6cpbuHjakMY61uW3XUE+rVPEJqUXhb0UDy
a3QKeWUMyEre0Iya4ApHGhj5i53vZ4tYD3tHJIZ+MMygTpCkdF6zW3AUO5mSxSGB
iiBtrCym8n+/aHVy2hsSf1J81Ljjx+Y0NYwPFtW9wMtWtGRm6bMgOjqpyv7l09nl
0cRovyLrD+dw+vaN9iHYQgQtWwiGQiqnsCWkoVU0D61moOTFwGwgEO12dMxhZHIe
6mBwr2cNZmSdyuRfuLC0mxJZqqxEvEvaxzLk69TibLKX7oSMGvCTimpwVI1YtVPe
OKjQcFy12MPMrKcmrVR2xxqdm/Y7X7HPTP9upQr7Tx/qJ+O7Zwep6Ze7kKQPFN3B
LmbxG3bOmgeLEMJtxXS2T3pfIgi4SQHS+wfwM+8OVaDmbCDTKUA=
=E4mS
-----END PGP SIGNATURE-----

--eoPy7XQcgNvfdFmT--
