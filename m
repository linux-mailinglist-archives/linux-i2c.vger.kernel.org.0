Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522E55391F9
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343744AbiEaNr0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbiEaNr0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:47:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9C12126F;
        Tue, 31 May 2022 06:47:24 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DEBE03200035;
        Tue, 31 May 2022 09:47:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 31 May 2022 09:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1654004840; x=1654091240; bh=s8b8COO5Yb
        Ga8xG5/i9yEEf+vE3uG78vIzviBYnAo1M=; b=N52hijfpV1UMRrhHBEsjZlBlof
        doLJ+cEEVuVC54JKFV3kw7tnE9v3C8cO1Wt+0t7wRVY1tYWZpyfKd8Caxr5vd6ec
        JpFTyqF8PYyiHrFnfJvcHYDB/Arzr9AFkaYy7gQsyrRi/0JT0GgCnlWydd9IagYJ
        qrwoFtG4Rm43CY2v6G39mNz/KfRzpFnhSKDPu9GSp2Cu54I8M/+3Pi14pUmePLi2
        wqN1CQuVTcplyDzrlS+tHZSS+oLdcpeOf6ABVntZE4MIA3WaQsJ75bJ58qlJT6Gw
        nHLBBoPweRyZA1ZCMiTq/jQJKl5v3vIGAQfAKW6U1wfCaNzGW/BAp3v8QEKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1654004840; x=1654091240; bh=s8b8COO5YbGa8xG5/i9yEEf+vE3u
        G78vIzviBYnAo1M=; b=y0LexLUkBrU37DxqXCaEEErb5ht+9N5MV5M4VfIMEV1b
        I+fn/jYy1h8qDjqRVfLUtTwm0pdnggWsfDmoww8Z5iU8+a+zPxlWdoNF/qTr6Y4w
        kYTr9b9GRJPJJfUuGeZ2FXDYhVPDsjtk9EY/Sa2YW+rjxcxON/PCMWkzcfTBK0zv
        NEyh4SKPZ3HWFlXmOu27SQdsIq/8HbZj8s3WkrcFf4O5K9PrjhczF9uSRtNlNfeQ
        u9A09CvdAO23kFYDtwDpZ0JxhfUn/f5GHGXa2O7+UT2JivzRGYakabBIo6XdMZPZ
        WBm1R0x2d2dAyQhnAy0KMueo7qoqdj9/ElTDgQJK6g==
X-ME-Sender: <xms:ZxyWYmY8Qh1VZxpOy26rSI2cJxMVFaaxDaDlTTfCq6BxWkJJ0jukZA>
    <xme:ZxyWYpZ3dWFBaiLd2xZBIXKgecGLJ-H5cSyk7vEcGcWABmRRgCxF6AXjkvhGBVkLr
    2zUgcJB1vuYGzdX4Dc>
X-ME-Received: <xmr:ZxyWYg8HHVL_n7RN5p0Vsi9JIzojqpAiBWubSVwHfH5RtKdv_H_zv7zsXOL_B7kcmJL5I4rdliXbvw8y6ffqftWqpFBUkVOz0Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ZxyWYornatPqLkQdmOBuIYSOEMpvBA4BGe1zPcfwo3qlrNwfG1Y39Q>
    <xmx:ZxyWYhpWBmzgnbEuaJZPfpxWtYftXt53l8cIHN-o0kau3LP1fT7vHw>
    <xmx:ZxyWYmSh7ByBNWghoeSCPk78S7TKf4VbwA9KxFTJkl3sN6BegI1D6g>
    <xmx:aByWYs3-kEv5BUqz_2o6XvkhLxXOEw6c1y-I_r7zMBTjXMGt6UyHbQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 09:47:19 -0400 (EDT)
Date:   Tue, 31 May 2022 08:47:18 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Potin Lai <potin.lai.pt@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Porin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] aspeed: i2c: add manual clock setup feature
Message-ID: <YpYcZn+Zsz3g7xl+@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220530114056.8722-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K2Ju2BjYugMc6h9r"
Content-Disposition: inline
In-Reply-To: <20220530114056.8722-1-potin.lai.pt@gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K2Ju2BjYugMc6h9r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 07:40:56PM +0800, Potin Lai wrote:
> From: Porin Lai <potin.lai.pt@gmail.com>
>=20
> Add properties for manual tuning i2c clock timing register.
>=20
> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setup
> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)

Do we need to add these to
Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml ?

>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 55 ++++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 67e8b97c0c95..1f4b5c4b5bf4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -898,6 +898,56 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus=
 *bus)
>  	return 0;
>  }
> =20
> +/* precondition: bus.lock has been acquired. */
> +static int aspeed_i2c_manual_clk_setup(struct aspeed_i2c_bus *bus)
> +{
> +	u32 divisor, clk_high, clk_low, clk_reg_val;
> +
> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-base-clk-div",
> +				     &divisor) !=3D 0) {
> +		dev_err(bus->dev, "Could not read aspeed,i2c-base-clk-div\n");
> +		return -EINVAL;
> +	} else if (divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> +		dev_err(bus->dev, "Invalid aspeed,i2c-base-clk-div: %u\n",
> +			divisor);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-high-cycle",
> +				     &clk_high) !=3D 0) {
> +		dev_err(bus->dev, "Could not read aspeed,i2c-clk-high-cycle\n");
> +		return -EINVAL;
> +	} else if (clk_high > ASPEED_I2CD_TIME_SCL_REG_MAX) {
> +		dev_err(bus->dev, "Invalid aspeed,i2c-clk-high-cycle: %u\n",
> +			clk_high);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-low-cycle",
> +				     &clk_low) !=3D 0) {
> +		dev_err(bus->dev, "Could not read aspeed,i2c-clk-low-cycle\n");
> +		return -EINVAL;
> +	} else if (clk_low > ASPEED_I2CD_TIME_SCL_REG_MAX) {
> +		dev_err(bus->dev, "Invalid aspeed,i2c-clk-low-cycle: %u\n",
> +			clk_low);
> +		return -EINVAL;
> +	}
> +
> +	clk_reg_val =3D readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
> +	clk_reg_val &=3D (ASPEED_I2CD_TIME_TBUF_MASK |
> +			ASPEED_I2CD_TIME_THDSTA_MASK |
> +			ASPEED_I2CD_TIME_TACST_MASK);
> +	clk_reg_val |=3D (divisor & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
> +			| ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
> +			   & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
> +			| ((clk_low << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
> +			   & ASPEED_I2CD_TIME_SCL_LOW_MASK);
> +	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
> +	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
> +
> +	return 0;
> +}
> +
>  /* precondition: bus.lock has been acquired. */
>  static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>  			     struct platform_device *pdev)
> @@ -908,7 +958,10 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bu=
s,
>  	/* Disable everything. */
>  	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> =20
> -	ret =3D aspeed_i2c_init_clk(bus);
> +	if (of_property_read_bool(pdev->dev.of_node, "aspeed,i2c-manual-clk"))
> +		ret =3D aspeed_i2c_manual_clk_setup(bus);
> +	else
> +		ret =3D aspeed_i2c_init_clk(bus);
>  	if (ret < 0)
>  		return ret;
> =20
> --=20
> 2.17.1
>=20

--=20
Patrick Williams

--K2Ju2BjYugMc6h9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKWHGYACgkQqwNHzC0A
wRmniw//ReljGNV+Q4CIui/96gQHz615me2pPG7mqsYlvAJHQDt4GDYYEcJzl0l4
KqYKK03DW5c7UGsk2MddvPOdHGLFt9Qxb8aqh+cTelPjzrezByNBYtuQC6zs+3Si
VLYNjz1cXsrRPuVnsKhgEgCMpALC+6Js3luUMDBpW1FpZ83FIwQFlLk7oit9oHN2
eZSQiQYlnsUx9ZV5BrI8VALrhNtbyfyC4sAMIeuIEtjCbgOv6LUIQl1PCFZOWM9O
fsaLJhuaulKfHHYPrumt6VlFgXT4M7Bn+KvOoHGK36HmByKZVjy7K9mFmhsxrUXq
6TeQzn0vixKO4myXxO/SbkVdRxquKCnFXicNT1BFt/P2M6HJ4GxjVaTbAptWNRHy
QXSmI8py77yctldXfk2mPGGfhQ+KkuiNCtHJVCARMY93CQA0nYhLLrDNRhWx9wjp
GGvCk/VZhmfr1TVeH15Lqxh1h+xVE3NItVumVYnu0xSccOwIRf5NOtDJc9MLXB1H
Q5F4bSJNd5wgb3V/ULVqaxpys62jo7p+Ks0TSULVE8hJ7FfC8YMqJP7z8oPvmLoU
u97WB7urZpQGjjTKZlPzFpPlSp1VjM3GV154FexUGKNMnASZZU8sdC5brXAotMsa
BtSeHG788WBtHi6PWqSuSaqy9tyqUCSm/Je90yJ5PvX4ULfhAh0=
=Z5+f
-----END PGP SIGNATURE-----

--K2Ju2BjYugMc6h9r--
