Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE0760853B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Oct 2022 08:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJVGoz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Oct 2022 02:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiJVGow (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Oct 2022 02:44:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA1A50537;
        Fri, 21 Oct 2022 23:44:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 996A860A2C;
        Sat, 22 Oct 2022 06:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B249C433D7;
        Sat, 22 Oct 2022 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666421084;
        bh=EK0yzUQUw1OPp3kbTpRFSmCYwre9gKGrpKiZICVlC08=;
        h=Date:From:To:Cc:Subject:From;
        b=r4ZFBaRzlQzYwK2dwCkK+v0nwfcth57+ExEM1LaiqXClIDnSK/LlebduVkWo7xqnJ
         ai1RLPtrWXyCGutGXL2wBzRyiLyP+D6HitDgRHealxK6WAIccza9uCU42RdClbSRnn
         cz+occ/U5+UhWYFIsrkU4zkJp4vyb7T0l8oMTK2+qr9G+ixlMCMBFfB4wWJmNvzAgB
         WLmbdWQJR1UxsKnxzcLPml4gK+qHA+3xP2pf8JCFYspSjBVfVEBUXklJ4njZV993Ui
         7T/XNZB0voRJMGaQu1qPv+aNfMeQbLxW2wCo65MrdsuSG93+ahcJn2le3C5NmEdfqM
         DCKukyK0IEMCA==
Date:   Sat, 22 Oct 2022 08:44:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PULL REQUEST] i2c-for-6.1-rc2
Message-ID: <Y1ORTh8CnCi7flAW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="exfmy9s/c09RysEP"
Content-Disposition: inline
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--exfmy9s/c09RysEP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-=
6.1-rc2

for you to fetch changes up to 65d78b8d0405fcda02b69fd3c34327e4af5cd465:

  i2c: mlxbf: depend on ACPI; clean away ifdeffage (2022-10-21 07:59:35 +02=
00)

----------------------------------------------------------------
RPM fix for qcom-cci, platform module alias for xiic, build warning fix
for mlxbf, typo fixes in comments

----------------------------------------------------------------
Adam Borowski (1):
      i2c: mlxbf: depend on ACPI; clean away ifdeffage

Bryan O'Donoghue (1):
      i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter

Jiangshan Yi (1):
      i2c: fix spelling typos in comments

Martin T=C5=AFma (1):
      i2c: xiic: Add platform module alias


with much appreciated quality assurance from
----------------------------------------------------------------
Jean Delvare (1):
      (Rev.) i2c: fix spelling typos in comments

Robert Foss (1):
      (Rev.) i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapt=
er

Vladimir Zapolskiy (2):
      (Rev.) i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapt=
er
      (Test) i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapt=
er

 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-mlxbf.c    |  9 ---------
 drivers/i2c/busses/i2c-mlxcpld.c  |  2 +-
 drivers/i2c/busses/i2c-qcom-cci.c | 13 ++++++++-----
 drivers/i2c/busses/i2c-sis630.c   |  2 +-
 drivers/i2c/busses/i2c-xiic.c     |  1 +
 6 files changed, 12 insertions(+), 16 deletions(-)

--exfmy9s/c09RysEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNTkU4ACgkQFA3kzBSg
KbbsiA//asjcXrPY5bIr1xi05f/BljxbR5qz0k6gQB2GyruyKJgdrCCc+qxoiMp+
rGV1LQmq2+1FwQzueKOyTSMsmAu+AZNBSWLLaiGApGRyH+9J5l7tdn+SyQ3o3D6r
ObyLMvbscIO4S10SReuvFRC0Z5j0V5RWhYoLXaRs5xbXb8Ky/pphdM5zdie1Ow3x
kEw5ZiSiKXAMQwQCmdKNTxSOk2RY0x1FOh2eEbFoSKiFtVeP4OWKBQPn1Rp49k8T
4WZ9OnJuLpgzZV+UgHiPKYRR942cZV6RW/FeDJ7fzuuWLZiwbm4/R99XnK/6vHe0
i72BizJBMhvlALoT/LRlGUvO7cHcrVhJLQrSBgJtcrzQNtwyvfXepCQvoZZzKOL3
q0Ux+IE74wqIMfnHu93D1D7jZwKp0TNKEqAoGl6YOBeGDEnRKJnAcMm52EYcakFb
YRTPJh56NMlLG4PTCX+++I7J7n0qxoj+b9SuiHiRyCzYURY6njb9UUMaIBWFORSX
3mpThpfDLiq89424+JJBkjks3wXIdOuluOsI9K0fJ1Z6uVbcnfU0xc/W75iPZFdD
iAPYJRYdPssOKtlQS3oP4SDLA8byM3oORo2+V7HPaMOPowmjCwRFuEH67hOgHFG/
RJK166D2qGJY+wCeXQVBilP+X4SYxPHOYdNMv67gPRfjvmi1qPY=
=PuKK
-----END PGP SIGNATURE-----

--exfmy9s/c09RysEP--
