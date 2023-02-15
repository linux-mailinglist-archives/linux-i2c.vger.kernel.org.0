Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF0C69858E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 21:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBOU3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 15:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBOU3Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 15:29:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8044B1F924;
        Wed, 15 Feb 2023 12:29:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24B5C61D78;
        Wed, 15 Feb 2023 20:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E968DC433EF;
        Wed, 15 Feb 2023 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676492954;
        bh=yZ/5By9tvEsW6XI3GmLNgs/QMmv/j5Ks2b1xoz7Dz9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ww5sGy1cjgdgBkyz1KQtZfH4Mn8ciEDoS1pZtTyKbs8R0ETNs9rF5a+IxRk+HRNtk
         VMkGI4BQqQDWkhBpFUTBUSZdtXprVxteLK16WLx2GajxvQSkQl1m/HS4gB2Has1Ow4
         u9fKZwE1oe6Q5yGoNtP2bSsIhD23xNHbQvwfG4Va6w9ueiYj4LFPI7WcZsewimRQDP
         M2yOcNUhcKCMrOTGI1W5J66nNG7tIWfayTiehoW4ywwpgAAH0K1jMOhhARfcyP3lwS
         B2jViAmJ9LNb9Jjao71gdb74rzWuBqSxtuERktOF6TiybrrZtSwyQkz793gUhbMjaN
         eSkVaDfjl6G+g==
Date:   Wed, 15 Feb 2023 21:29:10 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: Re: [PATCH v4 1/5] i2c: hpe: Add GXP SoC I2C Controller
Message-ID: <Y+1Alvn3eepZ6yAC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, nick.hawkins@hpe.com,
        verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nqQ+3HpiGpskeQaK"
Content-Disposition: inline
In-Reply-To: <20230125184438.28483-2-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nqQ+3HpiGpskeQaK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e50f9603d189..8b3951e0ca5c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1457,4 +1457,11 @@ config I2C_VIRTIO
>            This driver can also be built as a module. If so, the module
>            will be called i2c-virtio.
> =20
> +config I2C_GXP
> +	tristate "GXP I2C Interface"
> +	depends on ARCH_HPE_GXP || COMPILE_TEST
> +	help
> +	  This enables support for GXP I2C interface. The I2C engines can be
> +	  either I2C master or I2C slaves.
> +

Shouldn't this be in the "I2C system bus drivers (mostly embedded /
system-on-chip)" section? (alphabetically sorted)

> +static bool i2c_global_init_done;

Can't we avoid this static by checking if i2cg_map is NULL/non-NULL?

> +
> +enum {
> +	GXP_I2C_IDLE =3D 0,
> +	GXP_I2C_ADDR_PHASE,
> +	GXP_I2C_RDATA_PHASE,
> +	GXP_I2C_WDATA_PHASE,
> +	GXP_I2C_ADDR_NACK,
> +	GXP_I2C_DATA_NACK,
> +	GXP_I2C_ERROR,
> +	GXP_I2C_COMP
> +};
> +
> +struct gxp_i2c_drvdata {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct i2c_timings t;
> +	u32 engine;
> +	int irq;
> +	struct completion completion;
> +	struct i2c_adapter adapter;
> +	struct i2c_msg *curr_msg;
> +	int msgs_remaining;
> +	int msgs_num;
> +	u8 *buf;
> +	size_t buf_remaining;
> +	unsigned char state;
> +	struct i2c_client *slave;
> +	unsigned char stopped;
> +};
> +
> +static struct regmap *i2cg_map;
> +
> +static void gxp_i2c_start(struct gxp_i2c_drvdata *drvdata)
> +{
> +	u16 value;
> +
> +	drvdata->buf =3D drvdata->curr_msg->buf;
> +	drvdata->buf_remaining =3D drvdata->curr_msg->len;
> +
> +	/* Note: Address in struct i2c_msg is 7 bits */
> +	value =3D drvdata->curr_msg->addr << 9;
> +
> +	if (drvdata->curr_msg->flags & I2C_M_RD) {
> +		/* Read */
> +		value |=3D 0x05;
> +	} else {
> +		/* Write */
> +		value |=3D 0x01;
> +	}

I'd write it more concise as:

	value |=3D drvdata->curr_msg->flags & I2C_M_RD ? 0x05 : 0x01;

But this is a matter of taste.

> +
> +	drvdata->state =3D GXP_I2C_ADDR_PHASE;
> +	writew(value, drvdata->base + GXP_I2CMCMD);
> +}
> +
> +static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
> +			       struct i2c_msg *msgs, int num)
> +{
> +	int ret;
> +	struct gxp_i2c_drvdata *drvdata =3D i2c_get_adapdata(adapter);
> +	unsigned long time_left;
> +
> +	drvdata->msgs_remaining =3D num;
> +	drvdata->curr_msg =3D msgs;
> +	drvdata->msgs_num =3D num;
> +	reinit_completion(&drvdata->completion);
> +
> +	gxp_i2c_start(drvdata);
> +
> +	time_left =3D wait_for_completion_timeout(&drvdata->completion,
> +						adapter->timeout);
> +	ret =3D num - drvdata->msgs_remaining;
> +	if (time_left =3D=3D 0) {
> +		switch (drvdata->state) {
> +		case GXP_I2C_WDATA_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:write Data phase timeout at msg[%d]\n",
> +			ret);

Please don't write error message to the log on timeouts. They can
happen. Think of an EEPROM which is busy because it needs to erase a
page. Upper layers need to handle this correctly, the user doesn't need
to know about it.

> +			break;
> +		case GXP_I2C_RDATA_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:read Data phase timeout at msg[%d]\n",
> +			ret);
> +			break;
> +		case GXP_I2C_ADDR_PHASE:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:Addr phase timeout\n");
> +			break;
> +		default:
> +			dev_err(drvdata->dev,
> +				"gxp_i2c_start:i2c transfer timeout state=3D%d\n",
> +			drvdata->state);
> +			break;
> +		}
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (drvdata->state =3D=3D GXP_I2C_ADDR_NACK) {
> +		dev_err(drvdata->dev,
> +			"gxp_i2c_start:No ACK for address phase\n");
> +		return -EIO;
> +	} else if (drvdata->state =3D=3D GXP_I2C_DATA_NACK) {
> +		dev_err(drvdata->dev, "gxp_i2c_start:No ACK for data phase\n");
> +		return -EIO;

Same here for NACK. Otherwise i2cdetect will flood your logfile.

> +	}
> +
> +	return ret;
> +}
> +
> +static u32 gxp_i2c_func(struct i2c_adapter *adap)
> +{
> +	if (IS_ENABLED(CONFIG_I2C_SLAVE))
> +		return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SLAVE;
> +
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int gxp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct gxp_i2c_drvdata *drvdata =3D i2c_get_adapdata(slave->adapter);
> +
> +	if (drvdata->slave)
> +		return -EBUSY;
> +
> +	if (slave->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	drvdata->slave =3D slave;
> +
> +	writeb(slave->addr << 1, drvdata->base + GXP_I2COWNADR);
> +	writeb(0x69, drvdata->base + GXP_I2CSCMD);

Does it make sense to have #defines for the magic values for I2CSCMD?
BTW, is the datasheet public?

=2E..

> +static void gxp_i2c_init(struct gxp_i2c_drvdata *drvdata)
> +{
> +	drvdata->state =3D GXP_I2C_IDLE;
> +	writeb(2000000 / drvdata->t.bus_freq_hz,
> +	       drvdata->base + GXP_I2CFREQDIV);
> +	writeb(0x32, drvdata->base + GXP_I2CFLTFAIR);
> +	writeb(0x0a, drvdata->base + GXP_I2CTMOEDG);
> +	writeb(0x00, drvdata->base + GXP_I2CCYCTIM);
> +	writeb(0x00, drvdata->base + GXP_I2CSNPAA);
> +	writeb(0x00, drvdata->base + GXP_I2CADVFEAT);
> +	writeb(0xF0, drvdata->base + GXP_I2CSCMD);
> +	writeb(0x80, drvdata->base + GXP_I2CMCMD);
> +	writeb(0x00, drvdata->base + GXP_I2CEVTERR);
> +	writeb(0x00, drvdata->base + GXP_I2COWNADR);

Also here, lots of magic values. Can we do something about it?

> +}
> +
> +static int gxp_i2c_probe(struct platform_device *pdev)
> +{
> +	struct gxp_i2c_drvdata *drvdata;
> +	int rc;
> +	struct i2c_adapter *adapter;
> +
> +	if (!i2c_global_init_done) {
> +		i2cg_map =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							   "hpe,sysreg");
> +		if (IS_ERR(i2cg_map)) {
> +			return dev_err_probe(&pdev->dev, IS_ERR(i2cg_map),
> +					     "failed to map i2cg_handle\n");
> +		}
> +
> +		/* Disable interrupt */
> +		regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);
> +		i2c_global_init_done =3D true;
> +	}
> +
> +	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(*drvdata),
> +			       GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, drvdata);
> +	drvdata->dev =3D &pdev->dev;
> +	init_completion(&drvdata->completion);
> +
> +	drvdata->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drvdata->base))
> +		return PTR_ERR(drvdata->base);
> +
> +	/* Use physical memory address to determine which I2C engine this is. */
> +	drvdata->engine =3D ((u32)drvdata->base & 0xf00) >> 8;

This breaks on my 64-bit test-build, so it will also fail with
COMPILE_TEST.

drivers/i2c/busses/i2c-gxp.c: In function =E2=80=98gxp_i2c_probe=E2=80=99:
drivers/i2c/busses/i2c-gxp.c:533:28: error: cast from pointer to integer of=
 different size [-Werror=3Dpointer-to-int-cast]
  533 |         drvdata->engine =3D ((u32)drvdata->base & 0xf00) >> 8;

The rest looks good to me.

Except for removing the hardcoded values, the other fixes should be
fairly simple, I think. So, hardcoded values could be changed
incrementally maybe. If this is possible at all. I still plan to have
this driver in 6.3.

Happy hacking,

   Wolfram


--nqQ+3HpiGpskeQaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPtQJMACgkQFA3kzBSg
KbaiRg/7B7+j5VSNUwvt+2g72+RMDph/6OhEvJR93xI+AkJAAuaZpqVIRFVIb4Oe
/gGr6Uw86uRvHHM0yTr+9k9higpDujE5vw4sHiCOziODzPxAeRv/DyTiVtliGDfE
kRakXb2F07rHBDlg0DncaNNsL5RtrFQ2XG5RJbpzzhRlXeaOhSmDwfEftsZZBJ9X
/C4UI9P7cpVeRcuC67M+w48GNhEic6DipST+ZF2T2exz7qS3A7B1AnuT9cPXdSNm
8y0+7XepRhtpUBG0skA3NkxFvbTl+uH1GpoXTlV7tQ5RcZecK1RZSqXmhc51fMhm
u1UzW6DMEKghThr++jxBWTE6z+a38J9oGQ0LNb3CmRXkXCtKIR/gkWgr0lbaYqTi
ytVPTdWyUyR1e8yhG8ogjK3mmHnZfzFnvZUQ+OukNq5bTPK0Fxl/oxfdhg1U/lga
4vpYKvtsZryBuMfP5IDGKN4JrMmA1iC/7tFNRQ/tuLtynYfHuMathRIMpyv9FJc7
wuJwxfMPEf9a+ZrnvUAN4znL78dAimDaK6pw6BnnCjZeHwTw/uiuIrAq//sWfafH
bqhf8aG07dbfFWKvgJWVdzI9WljrvyCf2VeuBdHZDPpwnsuF8ZyIvXArHpyEc87x
RnmVmALU5hdPxulWpwWbIkAdX3MciIOTQ1Xi0pVxEz2DF4Ss1mo=
=aDr/
-----END PGP SIGNATURE-----

--nqQ+3HpiGpskeQaK--
