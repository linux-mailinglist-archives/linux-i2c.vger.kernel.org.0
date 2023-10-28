Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7CD7DA8F5
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 21:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjJ1TgM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 15:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1TgM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 15:36:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1F5E0;
        Sat, 28 Oct 2023 12:36:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF41C433C8;
        Sat, 28 Oct 2023 19:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698521769;
        bh=AJ6ovljbj6MisbZ3hfwRo2Cpjpm1JHKytVq4TooG3mE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WJDMgbvKdfcVn4Am/PD5xyskObSaDktzj7IovTU0TDqVk5hpNNCIpg3ms17aIXhHH
         r67WG7+GBoqzU7scD58xAnGTA/eeoAqV4TsUYNKcdrnddbRqsclrvaC50tZxPKfXk2
         1HYfUrGLxi1ZU6tAjNTlchsMj2jVb7lXUVlIgAZpWECkxdYH+ebIAgrd0l6brIjUwy
         jCuuMsXHwFfXGWOOJV1bETUGVPM5DqwhAnPu2gIy/+YOGpbB/V0hjPhwEwLI5+yzdm
         pdvpnhLOUQ0TeCd+FsQ8XVT0sOjJKT/ynIRtBthwRhzUBYlDvOy/Smbixu+rnwVe9s
         7gNE6ZjkMiWjA==
Date:   Sat, 28 Oct 2023 21:36:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Move system PM hooks to the NOIRQ phase
Message-ID: <ZT1ipfs3XzrKChmi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230717203857.2626773-1-samuel.holland@sifive.com>
 <20231024202030.o3pyswa4css5lnwr@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GSjqUPDK1r46QXAL"
Content-Disposition: inline
In-Reply-To: <20231024202030.o3pyswa4css5lnwr@zenone.zhora.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GSjqUPDK1r46QXAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
> > the regmap-irq code must be able to perform I2C transactions during
> > suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
> > be suspended/resumed during the NOIRQ phase.
> >=20
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>=20
> I think this patch has failed to receive some comments, I'll go
> ahead and give it my blessing:
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

It needs to be rebased on top of 0ad93449b043 ("i2c: ocores: Remove
#ifdef guards for PM related functions"), though. This series did clean
this up for the whole subsystem. It also introduced using pm_sleep_ptr
which probably was missing here?


--GSjqUPDK1r46QXAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU9Yp0ACgkQFA3kzBSg
KbZHuxAAkAxotUygWyZRw5UqlHp3CMUnpxJMGt+ceCx22eOs8cp7P7oMB8crKacP
Ut0dgZiWzfb57/IPuRJ8NkzoP6OYsg9cfc1mnYu4YdEtdMTBVlavk4LAcS99ft+M
xo8hN9vNvK9sCOBijX6yR2z8bSJgXsmK8Y7QFHijhtlZLk0GnnIeJwDHF9Ihz0YS
5O900EiIefsRvYw3WghKIRkFcFeOkwnQRtg3RnYSosXtcuJ+8N4uKI4zS7ga4uLE
Wvif/SaciSsCVNO/r4NZ/K41bBuOCceEldxAv26/gjlzMvHL68G83tWlcN7Qf0MI
o1RXbcEKmOvR2mSksK4cvwjw0KZ3tSWX3mSDX5aOUBhRnd+7P+qHfg/NSzzuUBxR
rG9TElEQtNs5lO+xkCcAW2QTcRw2j/21ktfm97zdArDjt9qxN2Q5azFjPe3ExpEs
dK9MaOd+BxGgPCgCuMLUkcVm+GhzBmOIZKSJACeTos5fzwNPizPBb7iolxX6fvHx
8R7ZrlMiC0qx6S5arbY7Vov4HpQKUyU14FT9+eqGjTyWAcff4YzbPUzUjfy2N1D+
GKrgbauw4RmCwToVHs0Yfbf58hrqpzluohSIbDWT4YqRFGTxjfmUOH3DmwOuMf7x
wcJxDwHiXMdhfXhDZRvS4VIoFaGJQ8dqKcZegGJfd6QItt48FnU=
=91ge
-----END PGP SIGNATURE-----

--GSjqUPDK1r46QXAL--
