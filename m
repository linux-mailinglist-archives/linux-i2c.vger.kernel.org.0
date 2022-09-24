Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5BA5E8FB9
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 22:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIXUpp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 16:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiIXUpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 16:45:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFB031EFC;
        Sat, 24 Sep 2022 13:45:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6ECEFB80E93;
        Sat, 24 Sep 2022 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682E3C433D6;
        Sat, 24 Sep 2022 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664052339;
        bh=O4PbDKTtpy6qRBsB+BHtbJmVM+QtJb6NDgwWW8WotYo=;
        h=Date:From:To:Cc:Subject:From;
        b=kBc37i8aL3fstiHYnKPQciBNgD2LhPKHukDRAhkmjmvC6yv7mfAeiG5g9LSTtEMlJ
         Io+N1LA1Wzl67/FJKnDquKb/zOq5uHgrpn4GOmNYkkPDtjXveK55jSgd3uThuf3tis
         lMQ4nUb9FLwZT3t0tufI12Y61rewxqiHqXKL4YRTU3eNW4qPRCL4WrHwUc4AhdNcLC
         y9T9GsweyMDJN1JF7zQI8oO6qSgIfZdjD4UF+/2rN8bfMSJxVUtKY91vxiYK+p1Izg
         LEP3Hiw5rYji9hGKJuZWXeixUOSB7fNeaOLswcNwooKzuZec4J8PuZTdPmNbUngjSX
         x1ISqhgoQ6YbQ==
Date:   Sat, 24 Sep 2022 22:45:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.0-rc7
Message-ID: <Yy9sbyqEvO8OqESO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UkGlNBYXi8k9VDno"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UkGlNBYXi8k9VDno
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 80e78fcce86de0288793a0ef0f6acf37656ee4cf:

  Linux 6.0-rc5 (2022-09-11 16:22:01 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.0-rc7

for you to fetch changes up to b7af938f4379a884f15713319648a7653497a907:

  i2c: mux: harden i2c_mux_alloc() against integer overflows (2022-09-21 22=
:12:06 +0200)

----------------------------------------------------------------
I2C driver bugfixes for mlxbf and imx, a few documentation fixes after
the rework this cycle, and one hardening for the i2c-mux core

----------------------------------------------------------------
Asmaa Mnebhi (3):
      i2c: mlxbf: incorrect base address passed during io write
      i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transacti=
on()
      i2c: mlxbf: Fix frequency calculation

Dan Carpenter (1):
      i2c: mux: harden i2c_mux_alloc() against integer overflows

Uwe Kleine-K=C3=B6nig (1):
      i2c: imx: If pm_runtime_get_sync() returned 1 device access is possib=
le

Wolfram Sang (2):
      MAINTAINERS: remove Nehal Shah from AMD MP2 I2C DRIVER
      Documentation: i2c: fix references to other documents


with much appreciated quality assurance from
----------------------------------------------------------------
Gustavo A. R. Silva (1):
      (Rev.) i2c: mux: harden i2c_mux_alloc() against integer overflows

Khalil Blaiech (3):
      (Rev.) i2c: mlxbf: Fix frequency calculation
      (Rev.) i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_tr=
ansaction()
      (Rev.) i2c: mlxbf: incorrect base address passed during io write

Luca Ceresoli (2):
      (Rev.) Documentation: i2c: fix references to other documents
      (Test) Documentation: i2c: fix references to other documents

 Documentation/i2c/dev-interface.rst   |  2 +-
 Documentation/i2c/slave-interface.rst |  6 ++--
 Documentation/i2c/writing-clients.rst |  4 +--
 MAINTAINERS                           |  1 -
 drivers/i2c/busses/i2c-imx.c          |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c        | 68 ++++++++++++++-----------------=
----
 drivers/i2c/i2c-mux.c                 |  5 +--
 7 files changed, 37 insertions(+), 51 deletions(-)

--UkGlNBYXi8k9VDno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMvbG8ACgkQFA3kzBSg
KbZ5rhAAm9WUfoJEFjFfc5lrJx52WqxIqb9hL6HKcseMe/sxozVgO3XexZ9aZrVN
LvqZz7z1gil3kHJvDEQ0qHKpsCJDvLU/LdDLJV6u8tqPvFj8hB5nlF7mvOA3Lu0U
BxQT049uePB70JvTjYI8wW9QeAiNZsqBWK6m6CLo7jv2s4yzPDnOKS+AwDHPQWBX
g9YO60IEIE15ouu+XjpV/1601YDi1ZHcPyGeszHTd0cOYNPAxjj88mA5kGvEC9Rh
lXVAlm3kIGucz4MLP4b29RTZFH0pNnXJrZBkt1cHjpn0AYcarmnZydlo211wDUyv
u2AHFPSngX5CwgKzUfe+pvvZ/Lqia5NSwKLLYWVxdh7W5CWpYoabmLxMsx9dJDQ4
Xq7qcNEnX+9HxmLqfvQnXjKjPVtKKaxXIwqU7eu0WVjjgPhST41qOy7SUk5b4Jam
4P5uu01ymlvtbVhaFNQNlDqc2uVEQn6Xrk+31m/UpVaNlZrJpN1YmS9CHW5DfXvR
dynWtme2vEreHgnVK6xLr5cy1NYGTtbU1yxqvrt8AkGATSRC8vOtLtt0wboMrwPJ
eUSi7socSdK600HJ+U9bT7hU6mcDGPOQXVXePX+4VzENYJAKyMg9mr8qxNd/CvnB
33cjJJnvOlwUd/PDBFdWZDjNwW9eEKC1LIHyMGbpxA/xWxYc5j4=
=9PQi
-----END PGP SIGNATURE-----

--UkGlNBYXi8k9VDno--
