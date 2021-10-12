Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F52842A9E6
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 18:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJLQt1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 12:49:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhJLQt1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Oct 2021 12:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00F006023D;
        Tue, 12 Oct 2021 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634057245;
        bh=5lti4xfeDEfSIml3z35sDZxLmq3CLvQlZRxdz0NiwmI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=NWZDwIGWlmbaZ412UoViC/PorRHoMRraxUv/bthF+/Ugc+g8Nr6fdLgEbvuR8aMrQ
         vYC3+s5fBFdx7zlU/wubRJiMIgfoi///I2HPkl6SZSsclpW5PFCA5tmaNSD52IVoxj
         KAm9HSloJAnN0lUE7YrVgabYd327JLTDjdfhk2O6NT5yPlFzVo0Gay8d7qCblCN1fs
         WjYT26OF9W+IIAtOkci4M7wMFS7VQHNx0VXU7/laOvviG/UCN5ardjKNwmrInT56KX
         cF/S/ZXDcLWUE1QO9+f7f1bL5TH9IPXozvqlYlOiFaHAdyrnPWomLGrlV/ff8+hxea
         xJFlrlkQwNlhA==
Message-ID: <4c6974280020118735644679f8498fe86748e648.camel@kernel.org>
Subject: Re: [PATCH 13/13] tpm: st33zp24: Make st33zp24_remove() return void
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Peter Huewe <peterhuewe@gmx.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Jason Gunthorpe <jgg@ziepe.ca>, kernel@pengutronix.de,
        linux-integrity@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Date:   Tue, 12 Oct 2021 19:47:22 +0300
In-Reply-To: <20211011132754.2479853-14-u.kleine-koenig@pengutronix.de>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
         <20211011132754.2479853-14-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-10-11 at 15:27 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Up to now st33zp24_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.

So, void is not a return value.


>=20
> Also the return value of i2c and spi remove callbacks is ignored anyway.
                           ~~~     ~~~
			   I2C     SPI

>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> =C2=A0drivers/char/tpm/st33zp24/i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +=
----
> =C2=A0drivers/char/tpm/st33zp24/spi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +=
----
> =C2=A0drivers/char/tpm/st33zp24/st33zp24.c | 3 +--
> =C2=A0drivers/char/tpm/st33zp24/st33zp24.h | 2 +-
> =C2=A04 files changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/=
i2c.c
> index 7c617edff4ca..3170d59d660c 100644
> --- a/drivers/char/tpm/st33zp24/i2c.c
> +++ b/drivers/char/tpm/st33zp24/i2c.c
> @@ -267,11 +267,8 @@ static int st33zp24_i2c_probe(struct i2c_client *cli=
ent,
> =C2=A0static int st33zp24_i2c_remove(struct i2c_client *client)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct tpm_chip *chip =3D=
 i2c_get_clientdata(client);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D st33zp24_remove(chip);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0st33zp24_remove(chip);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp24/=
spi.c
> index a75dafd39445..ccd9e42b8eab 100644
> --- a/drivers/char/tpm/st33zp24/spi.c
> +++ b/drivers/char/tpm/st33zp24/spi.c
> @@ -384,11 +384,8 @@ static int st33zp24_spi_probe(struct spi_device *dev=
)
> =C2=A0static int st33zp24_spi_remove(struct spi_device *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct tpm_chip *chip =3D=
 spi_get_drvdata(dev);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D st33zp24_remove(chip);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0st33zp24_remove(chip);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33=
zp24/st33zp24.c
> index 4ec10ab5e576..2b63654c38d6 100644
> --- a/drivers/char/tpm/st33zp24/st33zp24.c
> +++ b/drivers/char/tpm/st33zp24/st33zp24.c
> @@ -588,10 +588,9 @@ EXPORT_SYMBOL(st33zp24_probe);
> =C2=A0 * @param: tpm_data, the tpm phy.
> =C2=A0 * @return: 0 in case of success.
> =C2=A0 */
> -int st33zp24_remove(struct tpm_chip *chip)
> +void st33zp24_remove(struct tpm_chip *chip)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpm_chip_unregister(chip)=
;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(st33zp24_remove);
> =C2=A0
> diff --git a/drivers/char/tpm/st33zp24/st33zp24.h b/drivers/char/tpm/st33=
zp24/st33zp24.h
> index 6747be1e2502..b387a476c555 100644
> --- a/drivers/char/tpm/st33zp24/st33zp24.h
> +++ b/drivers/char/tpm/st33zp24/st33zp24.h
> @@ -34,5 +34,5 @@ int st33zp24_pm_resume(struct device *dev);
> =C2=A0
> =C2=A0int st33zp24_probe(void *phy_id, const struct st33zp24_phy_ops *ops=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, int irq, int io_lp=
cpd);
> -int st33zp24_remove(struct tpm_chip *chip);
> +void st33zp24_remove(struct tpm_chip *chip);
> =C2=A0#endif /* __LOCAL_ST33ZP24_H__ */

Even though this does not improve things at run-time, this does
help to understand what the code does, so in that sense I do
think that this a sane change to make.

With an appropriate commit message, this can be applied.

/Jarkko

