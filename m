Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1313486B00
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 22:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390319AbfHHUCF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 16:02:05 -0400
Received: from sauhun.de ([88.99.104.3]:58380 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389883AbfHHUCF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 16:02:05 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id 9AAEE2C3112;
        Thu,  8 Aug 2019 22:02:02 +0200 (CEST)
Date:   Thu, 8 Aug 2019 22:02:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biwen Li <biwen.li@nxp.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurentiu.tudor@nxp.com
Subject: Re: i2c: imx: support slave mode for imx I2C driver
Message-ID: <20190808200202.GA6609@ninjato>
References: <20190808035343.34120-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20190808035343.34120-1-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 11:53:43AM +0800, Biwen Li wrote:
> The patch supports slave mode for imx I2C driver
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Wow, this is much simpler than the other approach flying around:

http://patchwork.ozlabs.org/patch/1124048/

Can this one be master and slave on the same bus, too?

CCing the author of the other patch.

> ---
>  drivers/i2c/busses/i2c-imx.c | 199 ++++++++++++++++++++++++++++++++---
>  1 file changed, 185 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b1b8b938d7f4..f7583a9fa56f 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -202,6 +202,9 @@ struct imx_i2c_struct {
>  	struct pinctrl_state *pinctrl_pins_gpio;
> =20
>  	struct imx_i2c_dma	*dma;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct i2c_client		*slave;
> +#endif /* CONFIG_I2C_SLAVE */
>  };
> =20
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata =3D {
> @@ -583,23 +586,40 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c=
_imx)
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
>  }
> =20
> -static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
> +/* Clear interrupt flag bit */
> +static void i2c_imx_clr_if_bit(struct imx_i2c_struct *i2c_imx)
>  {
> -	struct imx_i2c_struct *i2c_imx =3D dev_id;
> -	unsigned int temp;
> +	unsigned int status;
> =20
> -	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> -	if (temp & I2SR_IIF) {
> -		/* save status register */
> -		i2c_imx->i2csr =3D temp;
> -		temp &=3D ~I2SR_IIF;
> -		temp |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> -		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
> -		wake_up(&i2c_imx->queue);
> -		return IRQ_HANDLED;
> -	}
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	status &=3D ~I2SR_IIF;
> +	status |=3D (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
> +}
> +
> +/* Clear arbitration lost bit */
> +static void i2c_imx_clr_al_bit(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int status;
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	status &=3D ~I2SR_IAL;
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
> +}
> =20
> -	return IRQ_NONE;
> +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int status;
> +
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s>: master interrupt\n", __func__);
> +
> +	/* Save status register */
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	i2c_imx->i2csr =3D status | I2SR_IIF;
> +
> +	wake_up(&i2c_imx->queue);
> +
> +	return IRQ_HANDLED;
>  }
> =20
>  static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
> @@ -1043,11 +1063,162 @@ static u32 i2c_imx_func(struct i2c_adapter *adap=
ter)
>  		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>  }
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int temp;
> +
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
> +
> +	/* Set slave addr. */
> +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
> +
> +	/* Disable i2c module */
> +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode
> +			^ I2CR_IEN;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	/* Reset status register */
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
> +			  IMX_I2C_I2SR);
> +
> +	/* Enable module and enable interrupt from i2c module */
> +	temp =3D i2c_imx->hwdata->i2cr_ien_opcode
> +			| I2CR_IIEN;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	/* Wait controller to be stable */
> +	usleep_range(50, 150);
> +}
> +
> +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int status, ctl;
> +	u8 value;
> +
> +	if (!i2c_imx->slave) {
> +		dev_err(&i2c_imx->adapter.dev, "cannot deal with slave irq,i2c_imx->sl=
ave is null");
> +		return IRQ_NONE;
> +	}
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +	if (status & I2SR_IAL) { /* Arbitration lost */
> +		i2c_imx_clr_al_bit(i2c_imx);
> +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +
> +			/* Slave transimt */
> +			ctl |=3D I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +			/* Send data */
> +			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +		} else { /* Master wants to write to us */
> +			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> +			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +			/* Slave receive */
> +			ctl &=3D ~I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +			/* Dummy read */
> +			value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		}
> +	} else {
> +		if (!(ctl & I2CR_MTX)) { /* Receive mode */
> +			if (status & I2SR_IBB) { /* No STOP signal detected */
> +				ctl &=3D ~I2CR_MTX;
> +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +				value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +				i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
> +			} else { /* STOP signal is detected */
> +				dev_dbg(&i2c_imx->adapter.dev,
> +					"STOP signal detected");
> +				i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> +			}
> +		} else { /* Transmit mode */
> +			if (!(status & I2SR_RXAK)) {	/* Received ACK */
> +				ctl |=3D I2CR_MTX;
> +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +				i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED, &value);
> +
> +				imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +			} else { /* Received NAK */
> +				ctl &=3D ~I2CR_MTX;
> +				imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +				value =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +			}
> +		}
> +	}
> +	return IRQ_HANDLED;
> +}
> +
> +static int i2c_imx_reg_slave(struct i2c_client *client)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +
> +	if (i2c_imx->slave)
> +		return -EINVAL;
> +
> +	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
> +	i2c_imx->slave =3D client;
> +
> +	i2c_imx_slave_init(i2c_imx);
> +
> +	return 0;
> +}
> +
> +static int i2c_imx_unreg_slave(struct i2c_client *client)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D i2c_get_adapdata(client->adapter);
> +
> +	if (!i2c_imx->slave)
> +		return -EINVAL;
> +
> +	i2c_imx->slave =3D NULL;
> +
> +	return 0;
> +}
> +#endif /* CONFIG_I2C_SLAVE */
> +
>  static const struct i2c_algorithm i2c_imx_algo =3D {
>  	.master_xfer	=3D i2c_imx_xfer,
>  	.functionality	=3D i2c_imx_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave	=3D i2c_imx_reg_slave,
> +	.unreg_slave	=3D i2c_imx_unreg_slave,
> +#endif /* CONFIG_I2C_SLAVE */
>  };
> =20
> +static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D dev_id;
> +	unsigned int status, ctl;
> +	irqreturn_t irq_status =3D IRQ_NONE;
> +
> +	status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +
> +	if (status & I2SR_IIF) {
> +		i2c_imx_clr_if_bit(i2c_imx);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		if (ctl & I2CR_MSTA)
> +			irq_status =3D i2c_imx_master_isr(i2c_imx);
> +		else
> +			irq_status =3D i2c_imx_slave_isr(i2c_imx);
> +#else
> +		irq_status =3D i2c_imx_master_isr(i2c_imx);
> +
> +#endif /* CONFIG_I2C_SLAVE */
> +	}
> +
> +	return irq_status;
> +}
> +
>  static int i2c_imx_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *of_id =3D of_match_device(i2c_imx_dt_ids,
> --=20
> 2.17.1
>=20

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1Mf7UACgkQFA3kzBSg
KbbIdRAAmY+CmZvnxzaoFKgN0BZt09R2Y3W+z+3mpuJC4EC9WDc3zZxrLAJBtXKB
m5GiooGqY9tYfxKDEcZgnAbsg0+duHDCBi7Ky7qrgiyawIo8ZbhRCpa4LSzA0QRN
+FmL91PDIJcqxd4xIU6UKJRFrKCpWeR4iYOAVuF/3PtPlIpzgVRZvvi5/fFAaIHx
2gGvdGAx9eMtAs7HMA7/GMYalzex4EuGBuP+U5rXP6tUBNh+pSzJtqof9WFwGV/N
OmUBLCd6dVoLbJcT1F47gxqC4mEo8SKsgv2rMlYS5GQIInVU7/p6uER/Yr5zHERS
Z/phPdfMhqmATRIOBKdrgDRBPfAwHU9tuBep8glR0MpfjiejrZLWri4kTJ18nPy5
znVN0QiLU4rFNyHOn716AS9ykzmRd1a2ujs5nT8vRd6ccNxi9zLAT68VuYY62HLS
iWaVjx5kCgfx/W9GZMs0e++i+I3wca40LpeLMvP56wGjrBh+VfoMQVeKk3IONgYQ
6fECaczR3Fop5W3pYf8+n/rekOw9u1fEIFz4FDLxxb+Rjsiu60/5o99MgU+Zd8+C
z42/FHVuhdZE93Y9kfudirKPBen05s6qdnbEr98DZhMJZ0oT7RBCLsfRl5kIqWgH
mOYmOGy4u7m4h+CLHmlrYDdVOnBPj5JnAqvqJdyqm47YC1OgrvU=
=2lFt
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
