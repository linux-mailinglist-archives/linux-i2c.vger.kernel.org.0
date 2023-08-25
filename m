Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B997789037
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 23:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjHYVLs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 17:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjHYVLc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 17:11:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A542114;
        Fri, 25 Aug 2023 14:11:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A991629A9;
        Fri, 25 Aug 2023 21:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD274C433C7;
        Fri, 25 Aug 2023 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692997886;
        bh=RBSgyBuUxIAYj4TgFSv8JYCOZ+La+l9UfA4Z2AWAvO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DhhSqusD9piaT2YQ5riv3BEuCgEHizE54oFohKUfT8js7XnVoNI2L31CUqy1UA0aU
         /0r1SBDp/6Ai15zPrBLJMlotavG5j/hCeEmlniHDiw1u3CgGX2+ZODFspEX1wC1r1D
         AWsW4A92KloGjWNIfejNAv1IBz+bfRXMPQTyz+5W8v/8JGgP2otefpOzM3fXR2vRJn
         hvm0PQhshVQu205D52UMH+LkkDvNmLAgEPztxZqhkAxHL1lHmxAQSo5scyorZ4Nh7n
         8DUms3JcICx+PBWKfKztz34yjJHLsD43wBPgdLkPxB6R9/CsDs6MyrOZFGGjLL8MHq
         lEQEKjytaA7RA==
Date:   Fri, 25 Aug 2023 23:11:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Michal Simek <michal.simek@amd.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] i2c: mv64xxx: devm_pinctrl_get() cannot return NULL
Message-ID: <ZOkY+elmZLZRi3jx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <yann@sionneau.net>,
        Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Michal Simek <michal.simek@amd.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230816200410.62131-1-yann@sionneau.net>
 <20230816200410.62131-2-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UNe3aTPicsJZLa4w"
Content-Disposition: inline
In-Reply-To: <20230816200410.62131-2-yann@sionneau.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UNe3aTPicsJZLa4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 10:04:07PM +0200, Yann Sionneau wrote:
> Remove unnecessary check against NULL for devm_pinctrl_get() return value.
>=20
> Signed-off-by: Yann Sionneau <yann@sionneau.net>

As discussed elsewhere, it can be NULL when pinctrl is not selected.


--UNe3aTPicsJZLa4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpGPkACgkQFA3kzBSg
Kbbbyg//ebs5Kd6CS2lCEQ2+5QzsOUzc80WCK+qQWifWNUX7M5Twu8iLo0BxblUm
Rd/OmKmDeF45EEje+NX/71guRlnHmLjq+1fgJCDaTE4VMmk69LUpiFktn1EX6QJj
0BYDBSqrVsyM7i1dtcqMD8TiGEtYfw+xeQScqTvaQJgb9YQ4i78mmP/U/+pKfQmY
iE7mBZ0Gij+dNgm2I2zCw8/t6fidmJgajeVWttiPLIZu+6ZUUO/0jkB8fj6KHuid
cb5ARkUX27J5sQOzU41d6Go+awCUEDoIL/WR5izNEOCTzfnOkMtp8HhD34EZHYAl
TKvJHyQs/0zUm07Ui7kMCWdITTtUbL9BL1M6NB4rCY4XIksGtaMivhOY+WZGn72M
9iRpyFwMLWclwkBGO0iPlTuG+9PdpfbQF30dbtyZCvO0K+ZQZynY6c1dhV+iK2ZD
Cz/iiTJ1+5LbbBfHnyFbr5bhPx9YOjENBNVfpjVyZOCME+RVZHjkkSkA3qTaSyLY
x9GFyzPnDNf5+V2qDDCuRAfYy6elF+KnriBLNGp8u095gfBCbBxK38NWvEnHgvu6
+Q2eNIE4PRFXDSAKFQC8T9WJSWM0z2EJ1OQziFW/SDciiaHXvlkG6uXrCC677Rvn
kNQF9qFucAwXHPsntvTZsVWsjx9Kg8QtxW8vvLnlC/HkFP3aB8Q=
=/aKP
-----END PGP SIGNATURE-----

--UNe3aTPicsJZLa4w--
