Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2AE56B02
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfFZNph (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:45:37 -0400
Received: from sauhun.de ([88.99.104.3]:56408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbfFZNph (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:45:37 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 00AF52C0114;
        Wed, 26 Jun 2019 15:45:35 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:45:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-stm32f7: Add I2C_SMBUS_I2C_BLOCK_DATA support
Message-ID: <20190626134535.GN801@ninjato>
References: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8MZM6zh5Bb05FW+3"
Content-Disposition: inline
In-Reply-To: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8MZM6zh5Bb05FW+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:20:51PM +0200, Fabrice Gasnier wrote:
> This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
> for the stm32f7 SMBUS Controller.
> Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
> hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
> Emulated transfer will fall back calling i2c transfer method where there's
> already support for DMAs for example.
> So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
> emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
> for such a case.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Maintainers?

> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index 48337be..68a751e 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_=
i2c_dev *i2c_dev,
>  		cr2 &=3D ~STM32F7_I2C_CR2_RD_WRN;
>  		f7_msg->read_write =3D I2C_SMBUS_READ;
>  		break;
> +	case I2C_SMBUS_I2C_BLOCK_DATA:
> +		/* Rely on emulated i2c transfer (through master_xfer) */
> +		return -EOPNOTSUPP;
>  	default:
>  		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
>  		return -EOPNOTSUPP;
> @@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *ada=
p)
>  		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>  		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>  		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
> -		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
> +		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
> +		I2C_FUNC_SMBUS_I2C_BLOCK;
>  }
> =20
>  static struct i2c_algorithm stm32f7_i2c_algo =3D {
> --=20
> 2.7.4
>=20

--8MZM6zh5Bb05FW+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Tdv8ACgkQFA3kzBSg
KbY34A/8CYpfe2MHsAqTGHO1tyGPc3Fuatefa6I/N/YHYLpWoSl3mpGia6mLK7s7
gpUm/ClB+7Sl5KKdUaQ2zbvDtBPKQHfpZ/2QAYgBIoTVpf+snQLYRv4I5EiDD9Hs
EAD+2gH3nxPCHu4q/J97lT/wq4o5IxeyzsLHxeRnnBB+Ziov+9Zoad5ug3f6jRTp
KcL9B7T1Is0CU4xlqO/m3sHiRgfzIjovv7l6UIWd4JgRCiXerqkDuaZ7kp/rin5h
4JQplk9UxamamgkjDexY/CE1Jk2ZN1NYLck574DAFO2J0CpGsYYu+ykC046A1H2i
1yPfuLWy6Ie3IHHmf0CWJOw9h0o0oxmZQkTiX8WoXwUAozrodjbHo5asLK8V+F+z
mjv8YhvXjbZRePtqpusnwtU7p4kXNhfi2skCNUPMqEQlAMgHecagto0+rDcfy6qI
icB1x3LegvBoO1wWRilTvjYAYC5/gFLSdqppZVYGF5kEEzmJ1Q/Tv+Ekb3fUbgEz
50riYWCnCoOdCs6S2XNb8/aSgHkU+6sjRNA7hCJCNNLPxcMobmUCk5V2R56GWjPW
4z30wWy4vO3eo4CtH7WDUsMDnxiNK4lxqMkiPZPXgcJRl+SDnIPsyWrQKN9CCNoq
c2br40VJ1gnvj0OX0TSKItNmxc5K4Q1iQWGiEwmA7DMumfDW9Kw=
=as2l
-----END PGP SIGNATURE-----

--8MZM6zh5Bb05FW+3--
