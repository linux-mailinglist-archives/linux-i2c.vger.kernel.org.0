Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D9B168EEF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 13:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgBVMsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 07:48:08 -0500
Received: from sauhun.de ([88.99.104.3]:53786 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVMsI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 07:48:08 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id F36AC2C1EC6;
        Sat, 22 Feb 2020 13:48:05 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:48:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Federico Fuga <fuga@studiofuga.com>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mv64xxx: Implement I2C_M_RECV_LEN and
 I2C_FUNC_SMBUS_READ_BLOCK_DATA
Message-ID: <20200222124805.GJ1716@kunai>
References: <20200118115820.9080-1-fuga@studiofuga.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P6YfpwaDcfcOCJkJ"
Content-Disposition: inline
In-Reply-To: <20200118115820.9080-1-fuga@studiofuga.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P6YfpwaDcfcOCJkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2020 at 12:58:20PM +0100, Federico Fuga wrote:
> The i2c_mv64xxx driver doesn't implement the I2C_M_REC_LEN function
> essential to allow blocks with variable length to be read from an i2c
>  slave.
> This is needed to implement the SMBus Read Block Data function.
>=20
> This patch implements the function by changing the bytes_left and
> msg len on the fly if the flag is specified.
>=20
> It has been successfully tested on Allwinner A33 with a special
> i2c chip that returns variable length blocks on reading.
>=20
> Signed-off-by: Federico Fuga <fuga@studiofuga.com>
> ---

Gregory, any comment? I can't say much about the implementation. In
general, this is a nice feature to have...

>  drivers/i2c/busses/i2c-mv64xxx.c | 67 +++++++++++++++++++++++++-------
>  1 file changed, 53 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
> index a5a95ea5b81a..cff9cb20bcc9 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -128,6 +128,7 @@ struct mv64xxx_i2c_data {
>  	u32			addr1;
>  	u32			addr2;
>  	u32			bytes_left;
> +	u32         effective_length;
>  	u32			byte_posn;
>  	u32			send_stop;
>  	u32			block;
> @@ -333,7 +334,18 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2=
c_data *drv_data)
>  {
>  	drv_data->msg =3D drv_data->msgs;
>  	drv_data->byte_posn =3D 0;
> -	drv_data->bytes_left =3D drv_data->msg->len;
> +
> +    /* If we should retrieve the length from the buffer, make sure */
> +	/* to read enough bytes to avoid sending the */
> +	/* STOP bit after the read if the first byte */
> +	if (drv_data->msg->flags & I2C_M_RECV_LEN) {
> +		drv_data->effective_length =3D -1;
> +		drv_data->bytes_left =3D 3;
> +	} else {
> +		drv_data->effective_length =3D drv_data->msg->len;
> +		drv_data->bytes_left =3D drv_data->msg->len;
> +	}
> +
>  	drv_data->aborting =3D 0;
>  	drv_data->rc =3D 0;
> =20
> @@ -342,6 +354,42 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2=
c_data *drv_data)
>  	       drv_data->reg_base + drv_data->reg_offsets.control);
>  }
> =20
> +static void
> +mv64xxx_i2c_do_send_stop(struct mv64xxx_i2c_data *drv_data)
> +{
> +	drv_data->cntl_bits &=3D ~MV64XXX_I2C_REG_CONTROL_INTEN;
> +	writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
> +		drv_data->reg_base + drv_data->reg_offsets.control);
> +	drv_data->block =3D 0;
> +	if (drv_data->errata_delay)
> +		udelay(5);
> +
> +	wake_up(&drv_data->waitq);
> +}
> +
> +static void
> +mv64xxx_i2c_do_read_data(struct mv64xxx_i2c_data *drv_data)
> +{
> +	u8 data;
> +
> +	data =3D readl(drv_data->reg_base + drv_data->reg_offsets.data);
> +	drv_data->msg->buf[drv_data->byte_posn++] =3D data;
> +
> +	if (drv_data->effective_length =3D=3D -1) {
> +		/* length=3D0 should not be allowed, but is indeed possible.
> +		 * To avoid locking the chip, we keep reading at least 2 bytes
> +		 */
> +		if (data < 1)
> +			data =3D 1;
> +		drv_data->effective_length =3D data+1;
> +		drv_data->bytes_left =3D data+1;
> +		drv_data->msg->len =3D data+1;
> +	}
> +
> +	writel(drv_data->cntl_bits,
> +		drv_data->reg_base + drv_data->reg_offsets.control);
> +}
> +
>  static void
>  mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>  {
> @@ -392,23 +440,13 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_=
data)
>  		break;
> =20
>  	case MV64XXX_I2C_ACTION_RCV_DATA:
> -		drv_data->msg->buf[drv_data->byte_posn++] =3D
> -			readl(drv_data->reg_base + drv_data->reg_offsets.data);
> -		writel(drv_data->cntl_bits,
> -			drv_data->reg_base + drv_data->reg_offsets.control);
> +	    mv64xxx_i2c_do_read_data(drv_data);
>  		break;
> =20
>  	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
>  		drv_data->msg->buf[drv_data->byte_posn++] =3D
>  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
> -		drv_data->cntl_bits &=3D ~MV64XXX_I2C_REG_CONTROL_INTEN;
> -		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
> -			drv_data->reg_base + drv_data->reg_offsets.control);
> -		drv_data->block =3D 0;
> -		if (drv_data->errata_delay)
> -			udelay(5);
> -
> -		wake_up(&drv_data->waitq);
> +	    mv64xxx_i2c_do_send_stop(drv_data);
>  		break;
> =20
>  	case MV64XXX_I2C_ACTION_INVALID:
> @@ -706,7 +744,8 @@ mv64xxx_i2c_can_offload(struct mv64xxx_i2c_data *drv_=
data)
>  static u32
>  mv64xxx_i2c_functionality(struct i2c_adapter *adap)
>  {
> -	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
> +	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR |
> +		I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_SMBUS_EMUL;
>  }
> =20
>  static int
> --=20
> 2.17.1
>=20

--P6YfpwaDcfcOCJkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RIwUACgkQFA3kzBSg
Kbb9yg//Rqhp0Z6hAdZVGZXJH23RT0oGX+hiA7epmxpS3i/mNSrudNpqxCLE59gF
2txUaQFM+bH3V7AYLI+S9v4ycS3y6sC/VJ7TdaLqkWIBgVYZwBMcBsK40kRetNgJ
VfoEvfrxphCJPJaAWrAxlyG6W5dCWi9W+rs6mRZ+pkCyIa8KFfMw4NDILoAdYaJE
oFiWW4dsZfOpSKG8lZhP9clWKi+QYwXVXWhh6EkfXBcL4mXMBd2hEx9YvDOBCAhD
ZU7UyNewDfxlLxmrd42cwB0/xO9gY6+CA44soojoBvgnFbSTC41TGOa+RKG+cSbA
sf6QvE1mFwins1Fx5/UY4ZgV4WWp3jgXpIJ7+ljR4pgwrWoO//5iy1fuC3CDmxlR
JFb/pN478eqJP+An8L4VWKYdIvCJ9r6LPEqFBMLGlPttVN4oTou7jzll0NdXD+8y
eYDfSw11B+xG84cjbIdXtBNt0tBlWSAneZcjv86tMD2KLFE/36LzYC8dkBdO4mVo
mIVc9nGNyU3gDvjlcZBC0oqhrgqS2EX/YfHm7a57HoMQE15FB6DSbZJQsPrcZ69t
nuNdr9hRU5Hp5Ron55QArc64NiesaJ6iJ50AtnlWZwJTrytX6ajjgccQqq848o0A
5cdC1DwrHo9D6QdIDR9dvrUq1DKfg6RQTVSTZlTaozpyyzckfW8=
=a1zP
-----END PGP SIGNATURE-----

--P6YfpwaDcfcOCJkJ--
