Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC01C73B530
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjFWKXx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjFWKXv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:23:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E11CE75
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:23:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33A206195E
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF6C433C8;
        Fri, 23 Jun 2023 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687515829;
        bh=v4OeSe1Q0oEwL3e2RwpD2rlKxgUsu7g4bo3mVlWjUPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJOui7DTSO9pQ/lGJ0QbJpf8qVsnv06aEHTEzgXukMt/muvs0fTdl3IgU+7h/cah1
         9DULVog4y/Wae8qgpiaaArMRmlhQfHQB0uOGLEmXs1wwqyH0SgXW+XXLCFqjlXqS5k
         sGAm+R5oLE+tuUiAa+Z2Pn42Fp7IKEnEva05OGw64/fsW/jiUbllPCygg0z2ZRDLX9
         Do0AaNYU3P2lP+ElKvJw6Bg8zPbkE2eN2x2UAm/hmeLPZjI0zFLgmDztitpvRkvAqy
         nlJm3cGpFyvAv/xxvlrh86XFjjGKH/oly8z8nXO4llNIAO4ZXFkaCWBkVIcWVWM7fb
         wQ1gM/GbqV69Q==
Date:   Fri, 23 Jun 2023 12:23:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 03/15] i2c: busses: at91-core: Use devm_clk_get_enabled()
Message-ID: <ZJVyspPOps73+BaO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-4-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7UcDaaXe3dyd1Kzx"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-4-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7UcDaaXe3dyd1Kzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:50AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>

Nicolas, did you find a new maintainer for this driver?


--7UcDaaXe3dyd1Kzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVcrIACgkQFA3kzBSg
KbYZMA//UDTn9pDdmWa4tXb6+/n3knEWmMc08oKQ//oGaU8Lc7kXguTlDT45sMdh
bgeOjYYmNdC62oRk9zJgwed0/OnowK+R+HghRf8aFFwrfue2c3K4/x48Vd4X/hgD
TtrQBJPmjaTBrkGWu5cuSxFmd2AA60iRguz+8jTRzJnSoXlq0dficd0ojeLFjET+
7c4v+TX3hwBbMGQveAT0KreFh1+DturPmp/o7HdJ8xIPPcm0mHfipYG3noQ5YTnx
OSFHOjLmGqhJqn8ndJktBRUS48frkfhGwzpNY8u2lz2RQlv8P4qXiFQlmAO4rySd
iIUZxXtZ2vNVjkm1gxYGWVhBZLklDZVmHKQLH/2Q4X3ejJRjvRD85qV8d3s2EFiB
I3DOc3ETLXB7zckSiO3EwomMEYWjiLST4Did3xECWaWqXBLwWrsoN+olmDiwti+a
UFO/5TMAKhRBs34Ua14AUzNswxNAP36DfYOc06ebqZIm/QfCRBftIr5F4V+EwRg3
dwsghPPYdjv5y3jJcJQ1Sk+Fy1dLSbXnp+1iL/JVjVASsWUmMPEdN6VI4QolJR7D
/hIuAOeguKb6/fAK3U33Lv8asBMYGv7DxxqFV8W85i/yxmlY0JZphAcxhP9oCgAW
yoN3+6EmGKmH0Giyc6eA+1rD5Zpdi9d//6RBvW6wp41HIn3m/1o=
=Xe1B
-----END PGP SIGNATURE-----

--7UcDaaXe3dyd1Kzx--
