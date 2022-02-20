Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551EF4BCF2F
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 15:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243949AbiBTO4L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 09:56:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243938AbiBTO4L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 09:56:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC4745AD8;
        Sun, 20 Feb 2022 06:55:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC1DF6117F;
        Sun, 20 Feb 2022 14:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD83C340F0;
        Sun, 20 Feb 2022 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645368949;
        bh=PlKZZcyXW93zu8PpshDlXr62B25AQPU+/7tw4jS8Zt4=;
        h=Date:From:To:Cc:Subject:From;
        b=QLsRPyAHbo4YrWfSOtGW4HWu2oJWTyFFmNzzs7sB4HT7a0bjWRsTUIMQS6TIhHENW
         i1aW4GzMAujVD/t3w5lSCJ1JEILcnxHdvYm24nJ1x5/VRrdtxq6OjnIzbAF6HR4a2+
         qBFwNj1KdJAp+5jkzZxbhtaObdDT5grGwLCKg4TMlzXjYGBlaoutV+dtDjkOpqXDbf
         ZD3O0PEkO67ZZfmJ1u13JfctPFr3TcCw5NkICtUPbfn46nvmOABFAjxGTmdc4FotQ3
         b4HRbn66DVHjuJSYUVg+xfO1EV4ybqXuijOpdGyKAGZgMTwfIt2XsiZNMgN5sMws0k
         wQBUi/fLQGdvA==
Date:   Sun, 20 Feb 2022 15:53:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c for v5.17
Message-ID: <YhJV69ApxgrGGBP6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xb9S8kNlQ3lH1JX"
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xb9S8kNlQ3lH1JX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Linus,

I2C has some driver updates, a MAINTAINERS fix, and additions to
COMPILE_TEST for you (so we won't miss build problems again).

Thanks,

   Wolfram


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-curre=
nt

for you to fetch changes up to 2428766e201565a5fa964d7461d9f6608eb04d7d:

  MAINTAINERS: remove duplicate entry for i2c-qcom-geni (2022-02-19 12:45:4=
1 +0100)

----------------------------------------------------------------
Eric Anholt (1):
      i2c: bcm2835: Avoid clock stretching timeouts

Rafa=C5=82 Mi=C5=82ecki (1):
      i2c: brcmstb: fix support for DSL and CM variants

Vladimir Zapolskiy (2):
      i2c: qcom-cci: don't delete an unregistered adapter
      i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()

Wolfram Sang (4):
      i2c: cadence: allow COMPILE_TEST
      i2c: imx: allow COMPILE_TEST
      i2c: qup: allow COMPILE_TEST
      MAINTAINERS: remove duplicate entry for i2c-qcom-geni


with much appreciated quality assurance from
----------------------------------------------------------------
Bjorn Andersson (2):
      (Rev.) i2c: qcom-cci: don't put a device tree node before i2c_add_ada=
pter()
      (Rev.) i2c: qcom-cci: don't delete an unregistered adapter

Robert Foss (2):
      (Rev.) i2c: qcom-cci: don't put a device tree node before i2c_add_ada=
pter()
      (Rev.) i2c: qcom-cci: don't delete an unregistered adapter

 MAINTAINERS                       |  8 --------
 drivers/i2c/busses/Kconfig        |  6 +++---
 drivers/i2c/busses/i2c-bcm2835.c  | 11 +++++++++++
 drivers/i2c/busses/i2c-brcmstb.c  |  2 +-
 drivers/i2c/busses/i2c-qcom-cci.c | 16 +++++++++++-----
 5 files changed, 26 insertions(+), 17 deletions(-)

--+xb9S8kNlQ3lH1JX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmISVecACgkQFA3kzBSg
Kba6CA//RQB8XLEIAA8RagZyPHBxz8tg7mqu4d7sD0NpHtOl6JfxsK/IYv7agqWv
5yaAlEnKK52OUJ5d7QEogNT4MDGinTbp22TQVsE4Ax/Z8uNh7kjswhKS1h1va3Z4
xRioITNAq1LmkntxsqTFDqP5+TLzq5thifgd5GoviklRaep6yXgg8FadiqSG5Ujv
Ae86DGpYBy+owpFrTQw4Nx73NsOCbNaaeVUIIlHX64EM17QjcUttAZCvhaymZHVw
m6v5zIIQUMt2df/Bnx/RPM+vV1ukyOSv6RJy5catcdrEJr+/1v/Ee4TIAJ1g0Onv
/YLmOYaKWVgIQv6l7tc+WqQ7n3OvJt/SPOrn920hVWbXRmImq0wZV45CQdlSiE0B
kDG8ll2Un5pX4ySQb/MmaXd8hXzZVpCRN44wUFVfcj1XXTuLtoZDYGqR08DdE+f5
v89MpxLzYZEvB/ts3PnTz+8M/5JYagCUzxD99kWex0xuebqVp6EvKRP6QpHE6J1G
EnVvIEQx/8YClTWa9Z6R4Ght/r+NfI31qtIKWp7gYp33M0CByKaysneQapVyy9vv
A87cMiMJo+Gb6sjTEhxnQyHEGl0E1/p2OhsQnOzOuoeUpiA4eLQ1WsHs+DpGPj3r
u/Ra5t6BPnGCf5Rvduj+O53kzdrI5UX3QwlY7IIRpT7s7D/O6jc=
=kd4U
-----END PGP SIGNATURE-----

--+xb9S8kNlQ3lH1JX--
