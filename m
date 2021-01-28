Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB270307297
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbhA1JY5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:24:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:51952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232539AbhA1JWw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:22:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6711064DD1;
        Thu, 28 Jan 2021 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611825731;
        bh=ruB+cuYFcpOSpt/iG3Ocvmwf2Zx1+L94SacAJeQm1QM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NOvmYdFsLdE3C8AQHednz7ER/IbwKHAlvBUxU0X5RsTEStTVPTUJ8B/n5fH6Eowi7
         P9ceO/ukCoXxBuQabq2J5eAjMkGMihusqwY3/KO0Kufn4oUW5IeJiUzsVfQnL2Z+Yz
         P7XRT55/ohk4MvHyaO13oga6hKodB4HeXWbCMq6orznAn9j/cFIYU/T7x+2m8gHpcK
         taBBakuudZf/34Rqam15BW5gtZzOTD8TDDJb8YERGM4GviZ8evsX3AW0VQdmhD0xav
         yAIRPcrYueNC2XlCNB3kt5uu3E66HRp/hOTxpY/AfEr/loLhqh6bZ/6IyAs87awG4D
         pOpjKvq3KiEhw==
Date:   Thu, 28 Jan 2021 10:22:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ondrej Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] i2c: mv64xxx: Add runtime PM support
Message-ID: <20210128092208.GL963@ninjato>
References: <20210103105146.33835-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jtcAeju3WzRmRF+o"
Content-Disposition: inline
In-Reply-To: <20210103105146.33835-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jtcAeju3WzRmRF+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 04:51:46AM -0600, Samuel Holland wrote:
> To save power, gate the clock when the bus is inactive, during system
> sleep, and during shutdown. On some platforms, specifically Allwinner
> A13/A20, gating the clock implicitly resets the module as well. Since
> the module already needs to be reset after some suspend/resume cycles,
> it is simple enough to reset it during every runtime suspend/resume.
>=20
> Because the bus may be used by wakeup source IRQ threads, it needs to
> be functional as soon as IRQs are enabled. Thus, its system PM hooks
> need to run in the noirq phase.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Gregory, what do you think?

> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 120 ++++++++++++++++++++-----------
>  1 file changed, 78 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
> index 5cfe70aedced..b03c344323d1 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -18,6 +18,7 @@
>  #include <linux/mv643xx_i2c.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -717,6 +718,10 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2=
c_msg msgs[], int num)
>  	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
>  	int rc, ret =3D num;
> =20
> +	rc =3D pm_runtime_resume_and_get(&adap->dev);
> +	if (rc)
> +		return rc;
> +
>  	BUG_ON(drv_data->msgs !=3D NULL);
>  	drv_data->msgs =3D msgs;
>  	drv_data->num_msgs =3D num;
> @@ -732,6 +737,9 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c=
_msg msgs[], int num)
>  	drv_data->num_msgs =3D 0;
>  	drv_data->msgs =3D NULL;
> =20
> +	pm_runtime_mark_last_busy(&adap->dev);
> +	pm_runtime_put_autosuspend(&adap->dev);
> +
>  	return ret;
>  }
> =20
> @@ -828,7 +836,6 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>  		rc =3D PTR_ERR(drv_data->rstc);
>  		goto out;
>  	}
> -	reset_control_deassert(drv_data->rstc);
> =20
>  	/* Its not yet defined how timeouts will be specified in device tree.
>  	 * So hard code the value to 1 second.
> @@ -893,6 +900,32 @@ static int mv64xxx_i2c_init_recovery_info(struct mv6=
4xxx_i2c_data *drv_data,
>  	return 0;
>  }
> =20
> +static int
> +mv64xxx_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct mv64xxx_i2c_data *drv_data =3D dev_get_drvdata(dev);
> +
> +	reset_control_assert(drv_data->rstc);
> +	clk_disable_unprepare(drv_data->reg_clk);
> +	clk_disable_unprepare(drv_data->clk);
> +
> +	return 0;
> +}
> +
> +static int
> +mv64xxx_i2c_runtime_resume(struct device *dev)
> +{
> +	struct mv64xxx_i2c_data *drv_data =3D dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(drv_data->clk);
> +	clk_prepare_enable(drv_data->reg_clk);
> +	reset_control_reset(drv_data->rstc);
> +
> +	mv64xxx_i2c_hw_init(drv_data);
> +
> +	return 0;
> +}
> +
>  static int
>  mv64xxx_i2c_probe(struct platform_device *pd)
>  {
> @@ -920,18 +953,22 @@ mv64xxx_i2c_probe(struct platform_device *pd)
> =20
>  	/* Not all platforms have clocks */
>  	drv_data->clk =3D devm_clk_get(&pd->dev, NULL);
> -	if (PTR_ERR(drv_data->clk) =3D=3D -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> -	if (!IS_ERR(drv_data->clk))
> -		clk_prepare_enable(drv_data->clk);
> +	if (IS_ERR(drv_data->clk)) {
> +		if (PTR_ERR(drv_data->clk) =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		drv_data->clk =3D NULL;
> +	}
> =20
>  	drv_data->reg_clk =3D devm_clk_get(&pd->dev, "reg");
> -	if (PTR_ERR(drv_data->reg_clk) =3D=3D -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> -	if (!IS_ERR(drv_data->reg_clk))
> -		clk_prepare_enable(drv_data->reg_clk);
> +	if (IS_ERR(drv_data->reg_clk)) {
> +		if (PTR_ERR(drv_data->reg_clk) =3D=3D -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +		drv_data->reg_clk =3D NULL;
> +	}
> =20
>  	drv_data->irq =3D platform_get_irq(pd, 0);
> +	if (drv_data->irq < 0)
> +		return drv_data->irq;
> =20
>  	if (pdata) {
>  		drv_data->freq_m =3D pdata->freq_m;
> @@ -942,16 +979,12 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	} else if (pd->dev.of_node) {
>  		rc =3D mv64xxx_of_config(drv_data, &pd->dev);
>  		if (rc)
> -			goto exit_clk;
> -	}
> -	if (drv_data->irq < 0) {
> -		rc =3D drv_data->irq;
> -		goto exit_reset;
> +			return rc;
>  	}
> =20
>  	rc =3D mv64xxx_i2c_init_recovery_info(drv_data, &pd->dev);
>  	if (rc =3D=3D -EPROBE_DEFER)
> -		goto exit_reset;
> +		return rc;
> =20
>  	drv_data->adapter.dev.parent =3D &pd->dev;
>  	drv_data->adapter.algo =3D &mv64xxx_i2c_algo;
> @@ -962,7 +995,14 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	platform_set_drvdata(pd, drv_data);
>  	i2c_set_adapdata(&drv_data->adapter, drv_data);
> =20
> -	mv64xxx_i2c_hw_init(drv_data);
> +	pm_runtime_set_autosuspend_delay(&pd->dev, MSEC_PER_SEC);
> +	pm_runtime_use_autosuspend(&pd->dev);
> +	pm_runtime_enable(&pd->dev);
> +	if (!pm_runtime_enabled(&pd->dev)) {
> +		rc =3D mv64xxx_i2c_runtime_resume(&pd->dev);
> +		if (rc)
> +			goto exit_disable_pm;
> +	}
> =20
>  	rc =3D request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
>  			 MV64XXX_I2C_CTLR_NAME, drv_data);
> @@ -970,7 +1010,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  		dev_err(&drv_data->adapter.dev,
>  			"mv64xxx: Can't register intr handler irq%d: %d\n",
>  			drv_data->irq, rc);
> -		goto exit_reset;
> +		goto exit_disable_pm;
>  	} else if ((rc =3D i2c_add_numbered_adapter(&drv_data->adapter)) !=3D 0=
) {
>  		dev_err(&drv_data->adapter.dev,
>  			"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
> @@ -981,54 +1021,50 @@ mv64xxx_i2c_probe(struct platform_device *pd)
> =20
>  exit_free_irq:
>  	free_irq(drv_data->irq, drv_data);
> -exit_reset:
> -	reset_control_assert(drv_data->rstc);
> -exit_clk:
> -	clk_disable_unprepare(drv_data->reg_clk);
> -	clk_disable_unprepare(drv_data->clk);
> +exit_disable_pm:
> +	pm_runtime_disable(&pd->dev);
> +	if (!pm_runtime_status_suspended(&pd->dev))
> +		mv64xxx_i2c_runtime_suspend(&pd->dev);
> =20
>  	return rc;
>  }
> =20
>  static int
> -mv64xxx_i2c_remove(struct platform_device *dev)
> +mv64xxx_i2c_remove(struct platform_device *pd)
>  {
> -	struct mv64xxx_i2c_data		*drv_data =3D platform_get_drvdata(dev);
> +	struct mv64xxx_i2c_data		*drv_data =3D platform_get_drvdata(pd);
> =20
>  	i2c_del_adapter(&drv_data->adapter);
>  	free_irq(drv_data->irq, drv_data);
> -	reset_control_assert(drv_data->rstc);
> -	clk_disable_unprepare(drv_data->reg_clk);
> -	clk_disable_unprepare(drv_data->clk);
> +	pm_runtime_disable(&pd->dev);
> +	if (!pm_runtime_status_suspended(&pd->dev))
> +		mv64xxx_i2c_runtime_suspend(&pd->dev);
> =20
>  	return 0;
>  }
> =20
> -#ifdef CONFIG_PM
> -static int mv64xxx_i2c_resume(struct device *dev)
> +static void
> +mv64xxx_i2c_shutdown(struct platform_device *pd)
>  {
> -	struct mv64xxx_i2c_data *drv_data =3D dev_get_drvdata(dev);
> -
> -	mv64xxx_i2c_hw_init(drv_data);
> -
> -	return 0;
> +	pm_runtime_disable(&pd->dev);
> +	if (!pm_runtime_status_suspended(&pd->dev))
> +		mv64xxx_i2c_runtime_suspend(&pd->dev);
>  }
> =20
> -static const struct dev_pm_ops mv64xxx_i2c_pm =3D {
> -	.resume =3D mv64xxx_i2c_resume,
> +static const struct dev_pm_ops mv64xxx_i2c_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(mv64xxx_i2c_runtime_suspend,
> +			   mv64xxx_i2c_runtime_resume, NULL)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
>  };
> =20
> -#define mv64xxx_i2c_pm_ops (&mv64xxx_i2c_pm)
> -#else
> -#define mv64xxx_i2c_pm_ops NULL
> -#endif
> -
>  static struct platform_driver mv64xxx_i2c_driver =3D {
>  	.probe	=3D mv64xxx_i2c_probe,
>  	.remove	=3D mv64xxx_i2c_remove,
> +	.shutdown =3D mv64xxx_i2c_shutdown,
>  	.driver	=3D {
>  		.name	=3D MV64XXX_I2C_CTLR_NAME,
> -		.pm     =3D mv64xxx_i2c_pm_ops,
> +		.pm     =3D &mv64xxx_i2c_pm_ops,
>  		.of_match_table =3D mv64xxx_i2c_of_match_table,
>  	},
>  };
> --=20
> 2.26.2
>=20

--jtcAeju3WzRmRF+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgkAACgkQFA3kzBSg
Kbazlw//fVh8pNiVvWTo/Z8n+YDbOJieVqALDLg5Oh1/S44599DmPZg0cLvT+/rj
ncryTkSdHxMqqp+m+mm7KLih7pZgL8Ni35lYtETuQwIhmMnMv1xjKkR4fgy3MgHP
kCrmgqWTuC7svZH3lR+V/BuSdmU9qRoTM3rWmrWnk6T655HYFmQcr+iIPMi6aEJ4
g7WBPeCHtT35f8wHludLJW1830DFw2DfljBiP9MEBWomTYBreh/b6cL0/DMA+uyL
NWhHnsN9CHKvg5DM6eGtZk4/WJgBFbfgkf4rl3GzkMpucbyhBArl3f/G8/oYe+38
0jddS7W7TskorFkraegSm7llPDfIonDk4D+4L6k5s7BvwvWvPKG7Kdrx1Q0wgyfy
7GU2glHQVjyjvqLmlFRs+X/d/2wU7AZBDWmcyIphu41Wb0+J9jV61ntyix8tRoMd
fYpi2XGKZAa9XPqP1/aMQPDl8f+lVQtG9X28w2+8d+FPg6DKZIxeA0wPBoC8Ce12
UzyJZ6Tqsj1yKtlo8BjwVoc0VZ3lN3I6yiJCr+Pb5x0kNlHfwSY/CIG6kX/gZ8co
C4t5DOvUALXlG5TfaWs7G8fLuuYmR12hQSIDl7se/bVi6pTDyR9fGqES+UzkAnUC
2QP/WpyjCkxzF3TtTxq32a4nIPS2aBwrqwPIMBXChK1P/ReBfAE=
=8hBj
-----END PGP SIGNATURE-----

--jtcAeju3WzRmRF+o--
