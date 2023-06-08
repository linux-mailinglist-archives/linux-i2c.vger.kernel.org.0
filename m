Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4C728453
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 17:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjFHP4X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 11:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbjFHP4W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 11:56:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFF630CB;
        Thu,  8 Jun 2023 08:56:01 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so7673325e9.1;
        Thu, 08 Jun 2023 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686239758; x=1688831758;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd/7SuMOe8QIotQj9A6BFxgMvdeG20urdap0usX/c3E=;
        b=W8tPc9YrA6zvrCegwzbkGmQ6iwI6B+Sut/b/DrNwHArGfMIQnqaCjlEcCbXl+u6Fn9
         x7kGdl6FylRYS5oFou7KLSl+cO/kK2vmIhw0jmd8WT5sXdhl2La/zJXRgA5kXef7MzTD
         4wwxrwSo/5nnIUck1jJVaFqutp+apq9pxRSC6oPxN2Lnxw5V0RCQ97hPmmyGMoRy0RUr
         ARJVP58QEQ84l0JeKp49cc3iT8GIwm3jbTvAxP/exNPXEG4cO+3e6VuxLcHa+LZb5qJA
         5G/C9aHFFS5ZfDgd40ZsycJa58ckfy8FlkX1nqYo9uq/DJSWqONULn2h+z8HS5xF4Eke
         zW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686239758; x=1688831758;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd/7SuMOe8QIotQj9A6BFxgMvdeG20urdap0usX/c3E=;
        b=Hf0CXQwhnTB5+rMS9IsweDRmtQcJkTrKJityDJAW7rBzcqQFvra0VoYnte4XfjjxjZ
         zGIUg5XzP2Fc3QApETDQOLfBSS/9PnGacLunJiLXF07XDWTYh2bACuZHTqG/9YxW8kUx
         SdppKyombYs1DEWpcvtO/6N7simCrtYo4M9QR3GveViP6RftpvIKdiCv/5KkYgKWlWEp
         XYECqP9Tsi5IleRB/0oYxe5uU8OcQMOA1BEozPgZ5vU4gG9v60V/By9V1crqN7NxJfmq
         ls/eP3b0hy1KVK00mMqUQEea2dhPDNGxsyuYyTFfVnbB1JTS2eU8pCUcLpZfbyZiOsUx
         6DZA==
X-Gm-Message-State: AC+VfDyESth8GRsJRzRmAwmPV9P7oGLjCKj6+9ohwFC3idXF7ZsAmZsE
        7xaZaeM5zmZQqv52Gds/JCLxjCUqaAo=
X-Google-Smtp-Source: ACHHUZ7g+jSJzi+g/aKmMbvgL8JBbrRRHqVVQzdFu2pMsxFHG/BNW2CjsfzuKA4f7kSp9M/H8d5YDg==
X-Received: by 2002:a05:6000:1972:b0:309:3e77:6cac with SMTP id da18-20020a056000197200b003093e776cacmr6753279wrb.0.1686239757638;
        Thu, 08 Jun 2023 08:55:57 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906391100b009707fa1c316sm837680eje.213.2023.06.08.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 08:55:56 -0700 (PDT)
Date:   Thu, 8 Jun 2023 17:55:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <ZIH6CgW8-CgzEnJa@orome>
References: <20230608075606.3590744-1-thierry.reding@gmail.com>
 <20230608083905.youqz3wt27sqda2f@intel.intel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fc7W1EM7+Yul5GVX"
Content-Disposition: inline
In-Reply-To: <20230608083905.youqz3wt27sqda2f@intel.intel>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fc7W1EM7+Yul5GVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 10:39:05AM +0200, Andi Shyti wrote:
> Hi Thierry,
>=20
> On Thu, Jun 08, 2023 at 09:56:06AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the driver fails to obtain a DMA channel, it will initiate cleanup
> > and try to release the DMA channel that couldn't be retrieved. This will
> > cause a crash because the cleanup will try to dereference an ERR_PTR()-
> > encoded error code.
> >=20
> > However, there's nothing to clean up at this point yet, so we can avoid
> > this by simply propagating the error code.
> >=20
> > Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index f155e9028f94..0eab199900ae 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -458,10 +458,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev=
 *i2c_dev)
> >  	 * with existing devicetrees.
> >  	 */
> >  	i2c_dev->dma_chan =3D dma_request_chan(i2c_dev->dev, "tx");
> > -	if (IS_ERR(i2c_dev->dma_chan)) {
> > -		err =3D PTR_ERR(i2c_dev->dma_chan);
> > -		goto err_out;
> > -	}
> > +	if (IS_ERR(i2c_dev->dma_chan))
> > +		return PTR_ERR(i2c_dev->dma_chan);
>=20
> Actually you are ignoring the case when the driver would use
> programmed i/o only as a backup plan.

Good point.

> I think a possible fix could be:
>=20
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -460,7 +460,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
>         i2c_dev->dma_chan =3D dma_request_chan(i2c_dev->dev, "tx");
>         if (IS_ERR(i2c_dev->dma_chan)) {
>                 err =3D PTR_ERR(i2c_dev->dma_chan);
> -               goto err_out;
> +               goto err_probe_defer;
>         }
> =20
>         i2c_dev->dma_dev =3D i2c_dev->dma_chan->device->dev;
> @@ -482,6 +482,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
> =20
>  err_out:
>         tegra_i2c_release_dma(i2c_dev);
> +err_probe_defer:
>         if (err !=3D -EPROBE_DEFER) {
>                 dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
>                 dev_err(i2c_dev->dev, "falling back to PIO\n");

I think it's even simpler. I'll send out a v2 that simply resets
i2c_dev->dma_chan to NULL when an error occurs. That way any subsequent
code will already know to ignore it. Another case where this could
happen is during regular cleanup (i.e. driver unbind), and resetting to
NULL should fix that as well.

>=20
> Thank you,
> Andi
>=20
> (BTW, those are not dev_err's but they should be either dev_info
> or dev_warn())

Yeah. I can send up a follow-up patch to change these to dev_warn(). I
think dev_info() is perhaps a bit too weak, since we really do want to
use DMA if at all possible. Any case where it can't be used would be a
configuration problem. I think I recall that we only have this in the
driver for backwards-compatibility with old device trees that may not
have had the DMA channels specified, so this serves as a reminder that
the DT should be updated.

Thierry

--fc7W1EM7+Yul5GVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSB+goACgkQ3SOs138+
s6EgyQ//dZkYSsomwC8ZJGzDCvN5bim4DHIEd3Pwl1qfBDSSS22D/EBbGDa6Xcz/
OAg+Bu3rg73E82Mu7IEW881oeNFujjdORmkHN17Vl3whd2kpprYxO7be1Y6odS+y
jvoPtllAh8bhI+tB8qZzgTFQ3fxqmbIdhWkMBQ15aCyIEQ4n2htvHVe1iIQq49LT
Oed6eDa4MibSYg2mdZlq7AGU3k1cSlWaAb8QZZAw0jEgdS6lqD5BbkESUJvyCZZ9
vK4mW/r+BFAj1dIjmadqqBQjoILvibXgx2dGE08ms6rhEoG0Z6pbqbQ/0fdLXykq
gMrKkQFo9xE4Ql8Z80zK0cc9uBRoZ/+Zly17hC6uZ6s9ktuD4OlB6Cyi//T4m0v1
WeBRlwke6OfOE88QSuYuZ0UtChiFfL50ehiwgXgF/ax5ee4ObClXfJWvKjrBgZ7a
HHGU5WvNPc/l9iKln7U0L3lc9ZM5U4dJz3Sfi6Wz0tlNkQE+9bcm9d44DebXcqkU
Xy/4YC82WBrq57QvZ8xwyXFd+avmMfjCnDlJ/KFatW3n0/venVZGpEYmkKrivcMN
0RSZ9TYITiiYwI0d8uf7/pgTq50e2w1PDqGU17BsFp7wtK8OmOYsuQUADDJme80w
MPqM1qJR4vpIApQ3Bt+QjDQcdyoyLmU0BFN9eQYHpF4cfT9mNEQ=
=qUJX
-----END PGP SIGNATURE-----

--fc7W1EM7+Yul5GVX--
