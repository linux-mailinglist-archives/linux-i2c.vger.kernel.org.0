Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 963A477BC85
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjHNPJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbjHNPJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:09:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44E1DE;
        Mon, 14 Aug 2023 08:08:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 525D763CBB;
        Mon, 14 Aug 2023 15:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0E1C433C7;
        Mon, 14 Aug 2023 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025736;
        bh=8Cv/BMHeQ7rKCMZngi9mR7iIQEdnNBrdmdHtORcWLrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GQ1sgyN6eXewx8s2DblbbkB/sc7g7kdGkBzZuwI42KIxIeeu0KgZxPN+gEvUZsu5y
         fW12GYcWspun0TPz1d6Q6zFm9/CCphmoV/CE00oqHRe8Iqd0z/YW2BNbLe+PV1vIG4
         k6zzNY+5jTo6WR38bTvo1J4+A7chC+ctr1x0OOsycEuBZxcnv1IaFSY8Ei2HU28Z75
         iV3Hw+KEMKw7/6oFN/N2RQHxXgu8WGubPlYYYqYTfzOr7qGzkYmIpAEhDwa+Z4QnNb
         b3/iG1n1J9kV8ZZx0vNXAiEA8XmzKgt0fPOTnsjcgAJr+9FlFw+gK6pEteqrDUVrCA
         hK0c3quqNWrEw==
Date:   Mon, 14 Aug 2023 17:08:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Clean up a call to request_irq()
Message-ID: <ZNpDhQCsQK4f9PjB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
 <169100562784.1919254.4818687788219395410.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8b6/iXORvNVy2AfX"
Content-Disposition: inline
In-Reply-To: <169100562784.1919254.4818687788219395410.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8b6/iXORvNVy2AfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:32PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Tue, 25 Jul 2023 09:50:55 +0300, Dan Carpenter wrote:
> > This is passing a NULL thread to request_threaded_irq().  So it's not
> > really a threaded IRQ at all.  It's more readable to call request_irq()
> > instead.
> >=20
> >=20
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--8b6/iXORvNVy2AfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaQ4UACgkQFA3kzBSg
KbapcBAAnYjsvZs2Zo/p953XEnqvE/tozYkPo9/U1JAUW5LDH+ikeBkI2dShvN6o
qwEbW9P9e1nTO8KcN3oJeA9GWRWiCBJOgxRimPJZ9BwNmADoVWiXrgKy/5gq2Fz1
OZRjaOPOPyOWKFSPNbzjtbWSJfx+CDPCVcyCmGpxcoR3NipavUzHKZJSp3bRj5pC
MZ3QXw5VWdf4+4upXC1zSgGK6MEdXa8HnVezB7aQabp08X2/KKOOTX27vuXgCSiy
pJ50uK9ilRds4r3DfkTTdn9THi5me30+hDkW4D0DAjdqONY0+RGjmFPyqSX5NEdj
MSNQxeHBgqtQ5Gka7SOlNaargWJIWEZa72weJAMj6xw0yHjoWrNP2j+0xh8EoxkG
TXhCCBRL9R/Y2ApWiyaWic9fFmW/d7wNdSyzpN9gnHP/mjHa6PBnKCKGftRRWNej
E2ulao6U46cngI/HjPlyK75JwH0xRa1bR1meWPrXL1Phf9/BNhZbHPe+ggXhmlzE
jYR51nC1YgFwpfHAYIUBtKXYkXhhdq11z51fnu6IgSAzlTpdYznkpEJ9EPle1SnR
zV/fRaqdrTN1r4rR3awh3f7CgqpxdiivpFcy4K9QNoAqkJVsheiqsv5QbkNMa32M
SiTCnDSvNEDrlYQxdv6YQcl1KvLtBuisPeAbrigI0kJwR7YHDfM=
=jned
-----END PGP SIGNATURE-----

--8b6/iXORvNVy2AfX--
