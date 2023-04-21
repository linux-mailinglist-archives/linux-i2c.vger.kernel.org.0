Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5006EAC2C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjDUOAK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 10:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjDUOAG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 10:00:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6268E55
        for <linux-i2c@vger.kernel.org>; Fri, 21 Apr 2023 07:00:04 -0700 (PDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pprIo-0005xu-Ob; Fri, 21 Apr 2023 15:59:54 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 54D181B4D67;
        Fri, 21 Apr 2023 13:59:53 +0000 (UTC)
Date:   Fri, 21 Apr 2023 15:59:52 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Message-ID: <20230421-kinfolk-glancing-e185fd9c47b4-mkl@pengutronix.de>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
 <9272339.EvYhyI6sBW@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ixwc7u7twriofslc"
Content-Disposition: inline
In-Reply-To: <9272339.EvYhyI6sBW@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ixwc7u7twriofslc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21.04.2023 15:48:59, Alexander Stein wrote:
[...]
> Now lpi2c_runtime_resume will call into clk_prepare() which also calls=20
> clk_prepare_lock() (identical to clk_get_rate).

IIRC this is a general problem^w limitation of the clock framework,
clock providers cannot use clocks themselves in certain callback, e.g.
set_rate.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ixwc7u7twriofslc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRCltUACgkQvlAcSiqK
BOjeTAf+MQiPaYHFR1uULcuIXbV2XHiPm53lGdm5hp9wwSK166fJ17jq6knT8epB
HxkB1bn+Hl+tuF0ncFn1ip15GIlmFFxGkn/ZqAjKqC+Im0n1pFg1q5hfBx47YEZ+
X2ngxOrTelGlUZl7Aw3Q8rpia2IiLgxwArBMSOqg1B1dIAIPE9+iXuTevhONuHDy
HmeJ46SsI9IBV9+za6RBW8AhSLapLybAyZ157K03G2oCEHGj3G8zB9salQDsFYfF
lnCvyEDKLy1glmKBpJcCL8388/GWbiuO74ifWDAYtr67hn4TZ3BFT3ArWMTu45lG
uefuUneOirrPnBQsZIDeTRUpXU2Bqg==
=OK92
-----END PGP SIGNATURE-----

--ixwc7u7twriofslc--
