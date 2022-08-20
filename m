Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70E3E59ABD2
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 08:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244095AbiHTGre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 02:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243357AbiHTGrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 02:47:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4950BB6B9
        for <linux-i2c@vger.kernel.org>; Fri, 19 Aug 2022 23:47:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B87DB816D8
        for <linux-i2c@vger.kernel.org>; Sat, 20 Aug 2022 06:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DC3C433D6;
        Sat, 20 Aug 2022 06:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660978049;
        bh=QVjaJSiWu7HTI9i+Z9zlE7GtVPtDRnl/W7Gxfvld2HI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BAmKw19vajsD70tQ4Kg/FxlmZ9Z1Lc0YfiQD6EmMfumIKg6R0iS/FBBML/0YZv3qG
         zhHBlEilZ0rmVkvw6FAghuW0AI4m2/RYG4cOpjogLNg+v0tBaYTrHnkzUbnLkiPT29
         z5l5OYZ+HZQLlreyb6oeINtoiHumVKAb3I15J/CNxno/g8SrKQaTyKjSWlrtQ/mCEI
         4DBV2xJVJcE9C/LF+W9V/Q3nIPfvYP50D12zm6p2riIerY9XOg1c1649/wCsp+NBIm
         zyLRVOgk7bl+4IsUiURfsmVCyQyueyuCjfAnSaqXAHpwgfV4xs3+pvu0zzijwHMt2E
         OHtZFDuZrpoaQ==
Date:   Sat, 20 Aug 2022 08:47:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: Make sure to unregister adapter on remove()
Message-ID: <YwCDfWBuLuiRfMRL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YTQp0O8vMuWUe3XW"
Content-Disposition: inline
In-Reply-To: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YTQp0O8vMuWUe3XW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 05:09:33PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> If for whatever reasons pm_runtime_resume_and_get() fails and .remove() is
> exited early, the i2c adapter stays around and the irq still calls its
> handler, while the driver data and the register mapping go away. So if
> later the i2c adapter is accessed or the irq triggers this results in
> havoc accessing freed memory and unmapped registers.
>=20
> So unregister the software resources even if resume failed, and only skip
> the hardware access in that case.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-current, thanks!


--YTQp0O8vMuWUe3XW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMAg30ACgkQFA3kzBSg
Kba8Iw//SDM2LoesWrSCg6VaZxcT23FX1ot7PTkFoW7/qdoWaISFfP6bn9il7ey8
M38MCjvmn27EHJ8KdR/AYsa3V/49UlaqR4DQ0UCbP5q0/4QgEjeqreix7sErzSPZ
w6zAVUcBJcSMSWKS4bkryze/udl1nwEltkb4Qd+7kUoF6ItpDPLAqEqyHnHoAhlL
lM8QnkrZFdrCGXEMAvShulGtpb8DU9drPn05W6BCgqOfB5tjNvU50JTluv/oGz8y
n4czh1G3208LLcKmUyYB63ZqYhFLQu3MWLlPfgw1EI2qRYGx//In0DIVpoqzcc3a
Uc4jukvAlS0qrmcVRaOxLyRCnD+SN22OVL6HDqKrK9E9FSQmHf0znxCGuJj7GqZD
4eb2cu1YyNp3x4EuMim4wWZYLvbHXCmj61Nq+ZfjoHdwxdzh3JG/Ovy61JOuup0+
mHLIU9bhy9MeQiWHuJ0FJXzKi/69S5snwF/BdYdlWwzhtk6ZU8sZrLa3v6ik6Fpe
70EjS6r4WbB1+mmFjkXCcLerXyt/ukpWsPN4WxBmRrXgabnOyvclnV/j1/5UUmAz
eERgbDv13GattC/jFcceB1h6VNYkOcbqhjIg2Bx7Gp39tUeii94VJ7OtADk8Mez2
I3WZbyjY1BMxUzWI4JE2gyu4cGR5jaomnkAkQUoGRYJQb2oCPH4=
=q5mn
-----END PGP SIGNATURE-----

--YTQp0O8vMuWUe3XW--
