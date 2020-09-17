Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFAC26DA38
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgIQLbJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 07:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgIQL3S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 07:29:18 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7178C06178A;
        Thu, 17 Sep 2020 04:28:56 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id w5so1659452wrp.8;
        Thu, 17 Sep 2020 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wne0WJCLcc/dHJqUUWNQM1s/g9SNjKh5aju9qPMBUW8=;
        b=VSwh2l8gAbo53bBx4GPf+Gjs18L3S4Z6B5S1Hmz6tmVktSAkX3F+QB1r4qkIxSXqeO
         ltVIPAvO45+AYv7+nlcdDXXoKBxcAKPyByp5f3aeMrQPtTv1sQ4L1cX7XLVz0jne+j1L
         3YdJMAI4L/y/Fm2ArsNRagzRRhVMKPYXxVZ50YapBnBmQ+g6yCvbrQZg7h7WFxg2zOGV
         t1AflVS5BgbKRIoeMVjY1sXY6Kkp4ancO4HUbls75chwV+6u3pjFmUuDEVP0/ATpnivN
         c0aXqx4fg5nmSqhfVkXOEtpgY7jXNxsxd5Y+yMpqFBz0XSHHgKEXy1PW1z/p0LnJsOPx
         NUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wne0WJCLcc/dHJqUUWNQM1s/g9SNjKh5aju9qPMBUW8=;
        b=N69E3tka3wpouN85eAE80Lql/8V1Y9pFM88Qtr5wVWS0a7ye707Q5aIwW+noXoJjNG
         D1bipn33oD7lBuqNgntyE+aWVzFpHD2A/ld9vQS5BxocNzpqcGop0e47fYmT1KRtuZPm
         ntPnnIJI1nW2THc1H+AYg9kf3v2T3H1U+RfZB6dmtZOpeRDz2kNMrfYnb463lezUw5Ac
         5PjbDXuJm2rbBCqLraDYYTFw5IhlZYgJqvQEv5LYpSUtZ3G8ec8hiTLreON2B6nZjgkJ
         Xnm6sphGl6ADPSA88MR64NTHKHWT4CBh8ss1ENzh7BpM++DWMm1veZtEk06umUPX2sfk
         k+xw==
X-Gm-Message-State: AOAM530fvcrgfzHb7gEOSHB4hyc6jzEY3gQlvh6tUGZPrs8kyu2I60EP
        +2Xg9EiAgbeqiU6sdcoln8c=
X-Google-Smtp-Source: ABdhPJzi1wu5FbjTXyo9AO8Z7R3NKsiJOwCYGMUL6Ey8CGEfcApubXdovS3Sw7b2DJArIaXqCRZbZA==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr32416170wre.275.1600342135633;
        Thu, 17 Sep 2020 04:28:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v9sm43239177wrv.35.2020.09.17.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:28:54 -0700 (PDT)
Date:   Thu, 17 Sep 2020 13:28:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/34] i2c: tegra: Remove error message used for
 devm_request_irq() failure
Message-ID: <20200917112852.GT3515672@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BfbbJsf3thGkpLcA"
Content-Disposition: inline
In-Reply-To: <20200908224006.25636-9-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BfbbJsf3thGkpLcA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 01:39:40AM +0300, Dmitry Osipenko wrote:
> The error message prints number of vIRQ, which isn't a useful information.
> In practice devm_request_irq() never fails, hence let's remove the bogus
> message in order to make code cleaner.
>=20
> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I think I have seen this fail occasionally when something's wrong in the
IRQ code, or when we are not properly configuring the IRQ in device tree
for example.

So I'd prefer if this error message stayed here. I agree that it's not a
terribly useful error message, so perhaps adding the error code to it
would make it more helpful?

Thierry

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index a52c72135390..b813c0976c10 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1807,10 +1807,8 @@ static int tegra_i2c_probe(struct platform_device =
*pdev)
> =20
>  	ret =3D devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
>  			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
> +	if (ret)
>  		goto release_dma;
> -	}
> =20
>  	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
>  	i2c_dev->adapter.owner =3D THIS_MODULE;
> --=20
> 2.27.0
>=20

--BfbbJsf3thGkpLcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jSHQACgkQ3SOs138+
s6EQPA//cqgGscSVoB4ZSvrGlXMpsipFhAxmGfMpIBFMhGW5Z+JioIHFc6CsVQ5z
9byRZoytT7bhvC7arnWk4lsVAT/xtf6/hmyJzSITsctOF4MqLztkwklqKmOAONwX
xFmR+uU9L61VgxBZ6KU7fUrj9Rl/isHoJ+3diNtRU3fwym2SurMgfC84hemKw9n9
KhijIbzztf4jMkdyKwNPCHp8XWgDLPpsS8/j6WC37iNfQ+ZRZjM9q+JOMq75q85q
WDMup12UU/OZpo1DlH5TwJAMoMDCyl4+RFgdLbumf7Da4jvXn7ppzRzBQZScYZ6L
0xR0lbv8+MJv7hfHh3TJuL/TqXG+H/D+Pb4Jc/8p1+ZFgKTPCO26ghCpGqZfGReJ
uPcEjoKuADFKrAiU6NEpJPyCOSDg7TQXRkvnYOQF61g6WOK1WZVWO+pUTxpoSNXk
2Yi2laFNbgAfw/M4oe6U9Z5tSi1Vsdbej9T6L4wUjnKd2YW55ynWSY3/pkcbRGP0
Exvd/OUVGFf8TRWVfwlA6qr6l+0/IXUpMMYphEEXWuxt//rklJW19Gv1RF2EBE1m
aGX756Yuyt+kfoeAyAm3edbJkCEezMFV66KoptEQMtDE+n298Psegivavumlcol4
/HxKi4BZC4Wba4iW/9UM20AqTbDN+K9K0BoiuJ+2g91gwL9ssYw=
=LsIW
-----END PGP SIGNATURE-----

--BfbbJsf3thGkpLcA--
