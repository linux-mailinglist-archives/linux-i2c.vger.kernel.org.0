Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC3252FC2E
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 13:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242466AbiEULqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 07:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236413AbiEULqW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 07:46:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8785344C5;
        Sat, 21 May 2022 04:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7617B60A6A;
        Sat, 21 May 2022 11:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07966C385A9;
        Sat, 21 May 2022 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653133579;
        bh=CiwFt7VwaGNXE7HhOxSW1RfgHLLIcdjkE3t/5fJE9yc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L9GfYgyMyihn+HV0P1nvTbSWJ97KUFMYaLzsgu4n1lRm8TyAoX57C8Hvee0R4G6SK
         GUXkKMYOX+iQ2N4xqBCr03qpxOMG3LCa6TqGOO+LD7tcdGXrlvKUvfloGNoPotyIa8
         9klewU2st2l9+710WND+EqZCAGpV5DvFCq8l5bU47ZlorFHPdQmN5x7/ncso2q9Au1
         a3B7bhm2xHuAnKzLoIXsoXNmZjOpDExSlbeJbdQDtHOWUMOEETV+cRTscHbLmDUcTR
         yfVThOFNUhEaQhWbGEgeqeln3e2js+2nRNJLQL3FC033qUO0/9+TpLMoSf1ah49ULT
         il8GtG4SG7d7A==
Date:   Sat, 21 May 2022 13:46:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Fix error handling in bcm2835_i2c_probe
Message-ID: <YojRB2043uYeV0XH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220403063310.7525-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fqvqwPXnJzjucWJX"
Content-Disposition: inline
In-Reply-To: <20220403063310.7525-1-linmq006@gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fqvqwPXnJzjucWJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 03, 2022 at 06:33:08AM +0000, Miaoqian Lin wrote:
> In the error handling path, the clk_prepare_enable() function
> call should be balanced by a corresponding 'clk_disable_unprepare()'
> call. And clk_set_rate_exclusive calls clk_rate_exclusive_get(),
> it should be balanced with call to clk_rate_exclusive_put().
> , as already done in the remove function.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Looking for a reviewer here, pretty please?

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bc=
m2835.c
> index 5149454eef4a..d794448866a7 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -454,18 +454,21 @@ static int bcm2835_i2c_probe(struct platform_device=
 *pdev)
>  	ret =3D clk_prepare_enable(i2c_dev->bus_clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Couldn't prepare clock");
> -		return ret;
> +		goto err_put_clk;
>  	}
> =20
>  	i2c_dev->irq =3D platform_get_irq(pdev, 0);
> -	if (i2c_dev->irq < 0)
> -		return i2c_dev->irq;
> +	if (i2c_dev->irq < 0) {
> +		ret =3D  i2c_dev->irq;
> +		goto err_disable_clk;
> +	}
> =20
>  	ret =3D request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
>  			  dev_name(&pdev->dev), i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Could not request IRQ\n");
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> +		goto err_disable_clk;
>  	}
> =20
>  	adap =3D &i2c_dev->adapter;
> @@ -489,8 +492,16 @@ static int bcm2835_i2c_probe(struct platform_device =
*pdev)
> =20
>  	ret =3D i2c_add_adapter(adap);
>  	if (ret)
> -		free_irq(i2c_dev->irq, i2c_dev);
> +		goto err_free_irq;
> +
> +	return ret;
> =20
> +err_free_irq:
> +	free_irq(i2c_dev->irq, i2c_dev);
> +err_disable_clk:
> +	clk_disable_unprepare(i2c_dev->bus_clk);
> +err_put_clk:
> +	clk_rate_exclusive_put(i2c_dev->bus_clk);
>  	return ret;
>  }
> =20
> --=20
> 2.17.1
>=20

--fqvqwPXnJzjucWJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKI0QcACgkQFA3kzBSg
KbbzGA/+JnWSmIYB4RtThQiFNUrXYmjr1A1EpprIzYNV0UAIzxwwNuhtlzbYk0k1
Z9FMCZF4huR7lKz2l8+XvbygLCQRAKgsn4jtgWcovZUDJt7S0kaR+yyNwWjUvKbe
k0A4gqzSJV8Jas/6v5CRibKo8e69avB/bSubTr/oUGje9QVzBhvtEDQJn2dpvy4S
m/ni1Fcog3Q/6oxXxZ1yVJY8tleXY2r+X9U03JDe4K+VQ+v0uGG6ZmdQgOjj+aFd
PO0FhwDb3JTzuDUfWF3o6r/khg/ewoP99E811azCvX9kV/nEPq1Al5TQLfUvXlYi
sBf8hYzW4ApHPgeNhlewEjzZZpSr+TKm40oA2wheM7cvw3MBcwutv8vF8inf4H31
icZhc5tL9cl2G3pSBJKj4b5hIDRbaDTJDTSp2S1OWfkqyvq71I4jxP3YTjbxlyK8
SLYQmSM1gDXKlAiYOolmc4vRyqkGMNjiwxwg1vxtRnALCD3/Ny3UkP/U7F8ixqC0
fK/ZZPj54s5P4aaGp32tagXbtCtjQNHQvOVJSvuUk0Z0T3KZil0VK8Ma6mAa7kBQ
p9qCjPPsTQS8+WC+sKyCy1hRDKtFLr1R3aVk0vTotnZZcfNUqMo3GLouBUhMxJ/3
46tyUk/JMPmSh2zK5uJnOd91sEhxp0HbxaiGul8SaZh4eI2uOKk=
=87x6
-----END PGP SIGNATURE-----

--fqvqwPXnJzjucWJX--
