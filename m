Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF559B2CF
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Aug 2022 10:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiHUIlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Aug 2022 04:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiHUIlM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Aug 2022 04:41:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2A2220CD
        for <linux-i2c@vger.kernel.org>; Sun, 21 Aug 2022 01:41:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E989B60CF2
        for <linux-i2c@vger.kernel.org>; Sun, 21 Aug 2022 08:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844D7C433C1;
        Sun, 21 Aug 2022 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661071270;
        bh=U8y+cTgjFBPx8VFz01DC09GZ4QzDqKsT/XxObF6K9hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rskmP4Wvw3IYBHSc3WLOyZGvCSjzPYc0aRwKi7Kv2R4zxF6yGtuZ2onapy7MZPQ2e
         KKPQOFsrNNntbIQs0ubAvmMiZDtMH2gxgCTkcSeyz5+WVLQCP1iSxTSnlxseMa/IUD
         mWU99Nu+0dJ7libPnSelaQ3MqKKIUGKWDCD4fLCfmnP65sh+4ECK2mvxk3F6WxJC7h
         de/7ysu4XUxvTlbdcRHv+qp4aJZoCLfbgeTABe+aUXg/HWik8BS4WbeTaj97CSnwad
         lgvtd7hdlR2mPdTlbMwzFkkXT9ck+krt80a9AQFIYzC8C0g/A0rBVitHq7xL8OAvoH
         I1zJg6F7ZZ7TQ==
Date:   Sun, 21 Aug 2022 10:41:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Make sure to unregister adapter on remove()
Message-ID: <YwHvop0MH8BTjw4f@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
 <20220729042922.GD30201@pengutronix.de>
 <20220730231335.xwm3e5nbojztcpcw@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kxHRf+/ex58x/pmg"
Content-Disposition: inline
In-Reply-To: <20220730231335.xwm3e5nbojztcpcw@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kxHRf+/ex58x/pmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> That would be:
>=20
> Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the per=
formance")

FTR, I added the Fixes tag because I think this is a real bug despite
being unlikely to happen.


--kxHRf+/ex58x/pmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMB76IACgkQFA3kzBSg
KbbtCQ//Trj2HLiA3bD5B5R+p6s6Y7AJGbyicJRd7Y1U3YZUfTLaBtBMV16SuwCz
FkA87qFksQL29Z0rWn5Kkm1bICtvivvNoyLpS9SYMMIvyyYOFVZTU45JKkNsPCeS
kmHIOh4T3f/+154gn1+tccJ2n+1roFleoN6EA/+laWju3kWqjy0Xh53POS1r5xlz
XnthTP+vbGrPOcIm5KzfWlgydDm37HUglGuumDFLTjgk5fH61/liZEXUBKNo0rYM
QBsNXzoH0VNqQG4ePgFdcrVqcRpTikzBkRSkd3o4VeX9t4369ar+bJ/LbtHcYUQR
SwcEupzSqstcADy1mrq0ww3gysANojgolpAsibyRfANidOpOp1uPPJiAIaN0ki3m
0j/LgfCgMLiqSPJilJx/8B3qJJJKr0njGyHfVs/tKrx0jamOiJzlO2YrE6ElNqFI
w/sFzhudUrHUgyn6j/3u6BDoOP3q77WMBcQ2Qxk2Sm7Z3Hxe/qpokFtgY8+jlHPo
pBOqslWqN2SDeYlpjkHGzGd56jGYK6xmPwxignxVDOTqcCo2ESYs/kEzAhfxVxrj
nNsRVavSJF8oZg16LtwsR8lcXnYGLrRAQ6ws6mjTwzY4QB/Y+xIYmJL0wPPFbV59
mW6KL1QxH+iaRVFO9DVQKC217Ep1STADT95zJN7cu1STGo7uwis=
=n0dD
-----END PGP SIGNATURE-----

--kxHRf+/ex58x/pmg--
