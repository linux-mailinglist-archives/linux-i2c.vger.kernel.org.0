Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B084AC163
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343976AbiBGOgl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385224AbiBGObv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:31:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52D2C0401C2;
        Mon,  7 Feb 2022 06:31:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9941CB81598;
        Mon,  7 Feb 2022 14:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BED3C340F1;
        Mon,  7 Feb 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644244308;
        bh=wzod6Dyf4Pjn7g62vKZJXz8+aqGlK2RqcGMJlGOO+gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pR/rc2IOnNVHXsjA16yCQxeIvQNGQ9bKuej1oyOXwsuyp2DR/7MM1/yyFk7LlKTCy
         CcKaqKT5aWwIsMUmb1sO3WSEzzfphNcMJ/7M1wPgIUNg+OaszixiNA8VoYl4NlguAG
         Mt7rHrip30pxe3c5m4Zr0JTiEDGKHm0P0i8Z/Csd4xpwEVGUd3K7ryiKAqnc8RJlUZ
         IvOtV01a9WEZa+AT5MbVZuH7mJj2RMzT75wyiFLK+Rad4r6AsG1kEJRekqehLFxbKN
         5zMhCmTNNEDjsMNAYYEr7bxG/eV8yYG5W3nQg6bxUaTODhhyl0w0fVNVq+qm0LAXCM
         7D/ITWViWm+2w==
Date:   Mon, 7 Feb 2022 15:31:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Remove useless DMA-32 fallback configuration
Message-ID: <YgEtUT7Dhntmidxy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
References: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yhVCcQgC/qrKuXoJ"
Content-Disposition: inline
In-Reply-To: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yhVCcQgC/qrKuXoJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 09, 2022 at 01:29:45PM +0100, Christophe JAILLET wrote:
> As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> dev->dma_mask is non-NULL.
> So, if it fails, the 32 bits case will also fail for the same reason.
>=20
>=20
> Simplify code and remove some dead code accordingly.
>=20
> [1]: https://lkml.org/lkml/2021/6/7/398
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seth, Neil, do you agree?

> ---
>  drivers/i2c/busses/i2c-ismt.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index f4820fd3dc13..951f3511afaa 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -920,11 +920,8 @@ ismt_probe(struct pci_dev *pdev, const struct pci_de=
vice_id *id)
> =20
>  	err =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>  	if (err) {
> -		err =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> -		if (err) {
> -			dev_err(&pdev->dev, "dma_set_mask fail\n");
> -			return -ENODEV;
> -		}
> +		dev_err(&pdev->dev, "dma_set_mask fail\n");
> +		return -ENODEV;
>  	}
> =20
>  	err =3D ismt_dev_init(priv);
> --=20
> 2.32.0
>=20

--yhVCcQgC/qrKuXoJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBLVEACgkQFA3kzBSg
KbZOARAAs6L96EgsUONwDrm0mCyNPdQYFIyNuoaGkRc8YFVgR5B8EjJjYb4pWOp6
kGF57f6ZKR04Wx0/6V7g865Kbs4oGloMA+xVWNJdMmFmZnBtRrMT3XDcfyBxQ1b1
YPtMMqXenj2LlBgV5nGf3jqUm7Uillzmkld7mZ/j4pcmW+B0xKbe4XXl20o/Prk8
OrpTwRyENhVWbiiAgyuVzrBvNe/Age4DnbekUQ+7g6MHgB8/EcnhUVE/WPJL+f84
mLi60VoLCvp7rjsBGcxE7BweEBKnoTnPPS9Gn/aHNx9uQjuv0DwnbAr6118qD5G9
szB+Llu7GHOV6NZQ/DB2SbMn6XjGS5QTv9+vuTKrdxOfnTyMEBJ7tThMyKcuu38U
90YuYWKTfg3IkUxrgcWmJzI+1o7QC/bQq0BYkfKbbsHuTKdiKrfroc7yxGQLKW+B
ni/Wc+SnmnpqKzoMB72lfX3RjpzvJABqASlY9VJa/p4xujcgWOgJzF5+I7pxDN8d
mauQny5kOriUGqnwk0qoukPlgH508GKSYQ9xR6vajhO6FDdJxONi5aayz5FmhSPQ
cronvGZDkgwATYs7whUEtnt7pupENNXzTZcCplQNp+6Ex3Wv5/BTdX3Gn0QqQviN
Ar3kr2OfpDceky/GhwZi8pg7mH1DgO2Pm7+PPPCfo61PcuYaZLQ=
=+skG
-----END PGP SIGNATURE-----

--yhVCcQgC/qrKuXoJ--
