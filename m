Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C443063FBBE
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 00:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLAXNO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 18:13:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiLAXMz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 18:12:55 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A22B2125A
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 15:12:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id EE8D2CE1DD9
        for <linux-i2c@vger.kernel.org>; Thu,  1 Dec 2022 23:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F5DC433D7;
        Thu,  1 Dec 2022 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669936369;
        bh=QJnYNYX/FxCDTAHwJ+5FDEozc6q/VwDgsRtOcGOkXec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NFXCLPaXTISK7IxzWk/cNFHyyQuKBnABdGJnQ21Ku6lE9PDKWYX6DDwuJzzO24LTv
         eFoAksT9HhhntZcqjAt2tRNUyGi57WHOWzSNWLao1/l+eEx3t+hgK5AO24JNDxWiAu
         ewE6r7zSgvSK3SJ/vZ6d4zvGT7aTTkDSnGx7BMLm+1tcnuyeF4aUwxUxqvXCRTy8ZK
         y1bvYl6dHTPLYaF6K8QzIpZbP/T3j59NGcMlbQMKLwDJeI0vrx9TW+nyAG5dOjGUHL
         soff6oogWI45jnIki0Jp/Izop4oZMlN8JrR7czlDMoQOp2LQgrm4iY4kmeMfFZ5V1D
         OmoQ2dOdJOM0g==
Date:   Fri, 2 Dec 2022 00:12:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-i2c@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
        kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set
Message-ID: <Y4k07gokheIv9bvX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
References: <20221109235902.468723-1-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DwiuW7TBOOfaRXxL"
Content-Disposition: inline
In-Reply-To: <20221109235902.468723-1-andrew@lunn.ch>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DwiuW7TBOOfaRXxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2022 at 12:59:02AM +0100, Andrew Lunn wrote:
> Recent changes to the DMA code has resulting in the IMX driver failing
> I2C transfers when the buffer has been vmalloc. Only perform DMA
> transfers if the message has the I2C_M_DMA_SAFE flag set, indicating
> the client is providing a buffer which is DMA safe.
>=20
> This is a minimal fix for stable. The I2C core provides helpers to
> allocate a bounce buffer. For a fuller fix the master should make use
> of these helpers.
>=20
> Fixes: 4544b9f25e70 ("dma-mapping: Add vmap checks to dma_map_single()")
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Applied to for-current, thanks!


--DwiuW7TBOOfaRXxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJNOkACgkQFA3kzBSg
KbY7jxAAh4XE3cPYZ02lsRPwyPNZuQLZspMld5zkoSQsPy91luwXP8tfeueUXBdw
DhcJ+ae6BBxNFj7dsYKjCkEQ3gKQ4tw/2kMUOpJXAxCRCrX1vdjM0yF6NLY9BzQb
XtrkxhWjj9TmHFrBT/YNuTJDR5Vyp1KaOjPloMuzaTNmMTTF1+tpBhvZ96PlZD08
6UgKbf1ALYVQUIyLHOYWkMKsbF6E2ZEcVgNnPtOQcFhu5GIEkBhIj3j+5tS4ln+0
XxiB9n2GlpIQ4lDpZV3y9KwwA6GA3NnYd+76UU7GF2yYMuwJSB7RL4aRU85v7bxR
4fbNwO0p5FsqBtvjcT9w0IDBzTfa3youNhjJokigUumvTzcjqBUB8qGF9kbBIu6r
tCgVygrt/ILcuip3lMKIRx4BQHN7wPvG/OASnQyN4LKBYfTV8vJ88y+Ke7zU6OGc
LWuyjWWABtXzPlguxH/RFU6/DA0u8Us9bHdlp2ww6msTLewY+mB7g2+HOiHcp7zk
Uh/FXizCcU07NuBr9eXAETa+gLwtqTwxlSyf+OaArg5FNJ3q43BQKZM0zxSo7gVp
qSCjsHtRXBebLzhrUV5YUM3aB7zT6Sbxmxxr9Hu71gA56FgxTeokiC0x8EjTyu5J
xwOfDdISWmL2z/ynXg4OeC06UIkkRETyQcQZSLAFrnx9P64vTBU=
=txrH
-----END PGP SIGNATURE-----

--DwiuW7TBOOfaRXxL--
