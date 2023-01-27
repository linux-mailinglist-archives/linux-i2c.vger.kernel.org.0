Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D9F67F025
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 22:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjA0VLS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 16:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjA0VLR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 16:11:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8CC88CC8;
        Fri, 27 Jan 2023 13:11:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6DC6861DB4;
        Fri, 27 Jan 2023 21:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D5C433D2;
        Fri, 27 Jan 2023 21:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674853875;
        bh=7T4qeVP2dtZ47hIaIUEq1TZ/Yqy2eguHoF5hB235DpQ=;
        h=Date:From:To:Cc:Subject:From;
        b=dGLrjOhTdR5aIoAAu0cqT6U06oAmfweqJ/8v2xgV3AxjoKEVeQzcAdHpc/aAirduF
         wR5nj+bPU+uuOAq8LNASnjakARv01DN/Ko/SCLkzV+bAKZw0oDuVlxCfyWa6C5u0x7
         t6T17cmpWP2CKaEXlBaiwcAzl6xC6dkW9Kio/A9YDOImqZLEIA2xkgpwN+vtL3HeZe
         xPlHI5Qc4n7b5cy/7HI0cBTI8sGcsWMeqd4Rg9GYvKBhs71oTbAlTvxA2GWzG3MV9/
         bdJRjm+i07Cx25C5CGFZTBE2cp8G4dgWb9Anc/bJBaehVoo5hFiiapyiJ3ZNlRtfJ8
         Ir2Q98vK4HKlQ==
Date:   Fri, 27 Jan 2023 22:11:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.2-rc6
Message-ID: <Y9Q9746CiVerOtHS@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WWwfnNJkwybATH4F"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WWwfnNJkwybATH4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

this pull request is a bit larger than usual for this time because I
sadly missed to send this earlier, twice. For rc3, I was sure to have
sent it out, but I didn't. For rc5, I planned to send it out on Saturday
which was too late. But now, here it is.

Please pull.

   Wolfram


The following changes since commit b7bfaa761d760e72a969d116517eaa12e404c262:

  Linux 6.2-rc3 (2023-01-08 11:49:43 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.2-rc6

for you to fetch changes up to 0582d984793d30442da88fe458674502bad1ad29:

  i2c: rk3x: fix a bunch of kernel-doc warnings (2023-01-20 10:18:51 +0100)

----------------------------------------------------------------
A bunch of driver fixes with a tiny bit of new IDs

----------------------------------------------------------------
Basavaraj Natikar (1):
      i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU

Fabrizio Castro (1):
      dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string

Lareine Khawaly (1):
      i2c: designware: use casting of u64 in clock multiplication to avoid overflow

Randy Dunlap (2):
      i2c: axxia: use 'struct' for kernel-doc notation
      i2c: rk3x: fix a bunch of kernel-doc warnings

Richard Fitzgerald (1):
      i2c: designware: Fix unbalanced suspended flag

Stefan Wahren (1):
      i2c: mxs: suppress probe-deferral error message


with much appreciated quality assurance from
----------------------------------------------------------------
Andy Shevchenko (2):
      (Rev.) i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
      (Rev.) i2c: designware: use casting of u64 in clock multiplication to avoid overflow

Fabio Estevam (1):
      (Rev.) i2c: mxs: suppress probe-deferral error message

Geert Uytterhoeven (1):
      (Rev.) dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string

Hans de Goede (1):
      (Rev.) i2c: designware: Fix unbalanced suspended flag

Krzysztof Kozlowski (1):
      (Rev.) dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string

Sanath S (1):
      (Test) i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU

 .../devicetree/bindings/i2c/renesas,rzv2m.yaml     |  4 +-
 drivers/i2c/busses/i2c-axxia.c                     |  2 +-
 drivers/i2c/busses/i2c-designware-common.c         |  9 +++--
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  2 +
 drivers/i2c/busses/i2c-designware-platdrv.c        | 20 +---------
 drivers/i2c/busses/i2c-mxs.c                       |  4 +-
 drivers/i2c/busses/i2c-rk3x.c                      | 44 +++++++++++-----------
 7 files changed, 37 insertions(+), 48 deletions(-)

--WWwfnNJkwybATH4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPUPe8ACgkQFA3kzBSg
KbbXKg//b0iSHWBrwgikITQXwsDVB3QqwRu0Si84lWrukCp4FHlq2GbrBbWiXStX
zhTPYWawa3InIwQUbVgiu4I9YxHsPs1PqNiujhS1Ifle1lZ3lIgot4eKXeZzZR6/
XN5tMgzOnqguzleYz3N+0FaM47Aw28UVFZ5QpHTcu1TmHQihGV76LgSZhbyiUtiX
c+rBhU9osCHeyWhlMHEcUUu15Wxnh3lGseevj8H+GVJTGLJdHqMa2Xl/oMdcqhvQ
POSWA24kdAXk+y+1z7GyhFw8gaE1ZTZFrxrBXcoCqUvVhEXBUN0ZmdZ7x7YGJmwT
XS87LiLS7kE4i+Cd6eTgztUwcZWFb/syhqbEBU+Ybc7eOl9SALIAS4rjCSpsY41c
Rv17qvNT3xyBo8vI3mlD7u9VApohlg01Fv7ORwykERtLQiG2YEEsb80c2xNRP6f3
gyajd80jNjbJSRTjRX/KX9gdBTunM/whZnOjb1EmbIWTiJjVf/uBTdxod8slhvJ2
Rc/81IHMtEc0uxSiQydq0idESSH8UclCK4yriRH3/573rxE3htO/MbH7s6FVQ8GU
NycJxF9WouTEgdKrpl4rc/jtDLURvRb1FmkIL705FMyIAjJu3yyuIAULX/6rBOAq
CvYMdcRzQ9fC7+UddSatCo/8EpwQHGDzIarxAOgyHZanug/cGYc=
=0POe
-----END PGP SIGNATURE-----

--WWwfnNJkwybATH4F--
